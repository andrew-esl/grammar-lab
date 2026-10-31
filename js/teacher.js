// ==================== КАБІНЕТ ВИКЛАДАЧА ====================
// Усе, що тут відбувається, бачить і дозволяє лише база (RLS):
// навіть якщо учень відкриє цю сторінку, він не отримає чужих даних.

let TOPICS = [];              // [{ id, slug, title, position }]
let EXERCISES = [];           // [{ id, topic_id, legacy_id, type, level, payload, student_id, source }]
let EX_BY_ID = {};
let STUDENTS = [];            // [{ id, full_name, email, note, created_at }]
let ASSIGN = {};              // student_id → { topic_id → { max_level, theory_visible } }
let HIDDEN = {};              // student_id → Set(exercise_id)
let ATTEMPTS = {};            // student_id → [{ exercise_id, answer, is_correct, created_at }]

let selectedId = null;
let currentTab = "access";
let expandedTopic = null;

const RANK = { elementary: 0, intermediate: 1, advanced: 2 };

// ---------- утиліти ----------
function esc(s) {
  return String(s ?? "").replace(/[&<>"']/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
}
function fmtDate(iso) {
  if (!iso) return "—";
  return new Date(iso).toLocaleString("uk-UA", { day: "2-digit", month: "2-digit", year: "2-digit", hour: "2-digit", minute: "2-digit" });
}
function studentName(s) { return s.full_name || s.email || "Без імені"; }
function flash(el, text = "Збережено") {
  if (!el) return;
  el.textContent = text;
  el.classList.remove("saved-flash"); void el.offsetWidth; el.classList.add("saved-flash");
}
function fail(e, what) {
  console.error(e);
  alert(`${what}: ${e.message || e}`);
}

// Пароль без схожих символів (0/O, 1/l/I), щоб його легко було продиктувати
function generatePassword(len = 10) {
  const abc = "abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  const buf = new Uint32Array(len);
  crypto.getRandomValues(buf);
  return Array.from(buf, n => abc[n % abc.length]).join("");
}

// Виклик серверної функції admin-users з людяним текстом помилки
async function invokeAdmin(body) {
  const { data, error } = await sb.functions.invoke("admin-users", { body });
  if (error) {
    let msg = error.message;
    try { msg = (await error.context.json()).error || msg; } catch (_) {}
    if (/Failed to send|fetch/i.test(msg)) {
      msg = "Серверна функція admin-users недоступна. Перевірте, що її розгорнуто в Supabase.";
    }
    throw new Error(msg);
  }
  return data;
}

// ---------- завантаження ----------
async function init() {
  const gate = document.getElementById("gate-text");
  let profile;
  try { profile = await apiLoadProfile(); } catch (e) { gate.textContent = "Помилка зʼєднання: " + e.message; return; }
  if (!profile) {
    gate.innerHTML = 'Спершу <a href="index.html" class="text-indigo-600 underline">увійдіть</a>.';
    return;
  }
  if (profile.role !== "teacher") {
    gate.innerHTML = 'Ця сторінка лише для викладача. <a href="index.html" class="text-indigo-600 underline">Повернутися до занять</a>.';
    return;
  }

  document.getElementById("teacher-name").textContent = profile.full_name || profile.email;
  gate.textContent = "Завантажуємо дані…";

  try {
    const [topics, exercises, students, assigns, overrides] = await Promise.all([
      fetchAll(() => sb.from("topics").select("id, slug, title, position").order("position").order("id")),
      fetchAll(() => sb.from("exercises").select("id, topic_id, legacy_id, type, level, payload, student_id, source").order("position").order("id")),
      fetchAll(() => sb.from("profiles").select("id, full_name, email, note, created_at").eq("role", "student").order("created_at").order("id")),
      fetchAll(() => sb.from("assignments").select("student_id, topic_id, max_level, theory_visible").order("id")),
      fetchAll(() => sb.from("exercise_overrides").select("student_id, exercise_id, hidden").order("exercise_id")),
    ]);
    TOPICS = topics;
    EXERCISES = exercises;
    EX_BY_ID = Object.fromEntries(exercises.map(e => [e.id, e]));
    STUDENTS = students;
    ASSIGN = {};
    for (const a of assigns) (ASSIGN[a.student_id] ||= {})[a.topic_id] = { max_level: a.max_level, theory_visible: a.theory_visible };
    HIDDEN = {};
    for (const o of overrides) if (o.hidden) (HIDDEN[o.student_id] ||= new Set()).add(o.exercise_id);
  } catch (e) {
    gate.textContent = "Не вдалося завантажити дані: " + (e.message || e);
    return;
  }

  document.getElementById("gate").classList.add("hidden");
  document.getElementById("cabinet").classList.remove("hidden");
  renderStudentList();
}

// ---------- список учнів ----------
function renderStudentList() {
  const q = (document.getElementById("student-search").value || "").toLowerCase().trim();
  const box = document.getElementById("student-list");
  const list = STUDENTS.filter(s => !q || studentName(s).toLowerCase().includes(q) || (s.email || "").toLowerCase().includes(q));

  if (!STUDENTS.length) {
    box.innerHTML = '<p class="text-xs text-slate-400 px-1">Учнів поки немає.</p>';
    return;
  }
  box.innerHTML = list.map(s => {
    const topics = Object.keys(ASSIGN[s.id] || {}).length;
    const active = s.id === selectedId;
    return `
      <button onclick="selectStudent('${s.id}')"
        class="w-full text-left px-3 py-2.5 rounded-xl border transition ${active ? "bg-indigo-50 border-indigo-200" : "bg-white border-slate-200 hover:border-indigo-300"}">
        <div class="text-sm font-semibold ${active ? "text-indigo-700" : "text-slate-800"} truncate">${esc(studentName(s))}</div>
        <div class="text-xs text-slate-500 truncate">${esc(s.email || "")}</div>
        <div class="text-[11px] text-slate-400 mt-0.5">Тем відкрито: ${topics}</div>
      </button>`;
  }).join("") || '<p class="text-xs text-slate-400 px-1">Нікого не знайдено.</p>';
}

function selectStudent(id) {
  selectedId = id;
  expandedTopic = null;
  renderStudentList();
  renderPanel();
}

function switchTab(tab) {
  currentTab = tab;
  renderPanel();
}

function renderPanel() {
  const s = STUDENTS.find(x => x.id === selectedId);
  const panel = document.getElementById("student-panel");
  if (!s) {
    panel.innerHTML = '<div class="bg-white border border-slate-200 rounded-2xl p-8 text-center text-slate-500 text-sm">Оберіть учня ліворуч або додайте нового.</div>';
    return;
  }
  const tab = (key, label) =>
    `<button onclick="switchTab('${key}')" class="px-5 py-2.5 text-sm font-semibold border-b-2 rounded-t-lg ${currentTab === key ? "tab-on" : "tab-off"}">${label}</button>`;

  panel.innerHTML = `
    <div class="mb-4">
      <h2 class="text-xl font-bold text-slate-900">${esc(studentName(s))}</h2>
      <p class="text-sm text-slate-500">${esc(s.email || "")} · з ${fmtDate(s.created_at).split(",")[0]}</p>
    </div>
    <div class="flex gap-1 border-b border-slate-200 mb-5">
      ${tab("access", "Доступ до тем")}${tab("results", "Результати")}${tab("account", "Акаунт")}
    </div>
    <div id="tab-body"></div>`;

  if (currentTab === "access") renderAccessTab(s);
  if (currentTab === "results") renderResultsTab(s);
  if (currentTab === "account") renderAccountTab(s);
}

// ---------- вкладка «Доступ» ----------

// Скільки вправ теми фактично побачить учень із поточними налаштуваннями
function visibleExercises(studentId, topicId) {
  const a = (ASSIGN[studentId] || {})[topicId];
  if (!a) return [];
  const hidden = HIDDEN[studentId] || new Set();
  return EXERCISES.filter(e =>
    e.topic_id === topicId &&
    (e.student_id === null || e.student_id === studentId) &&
    RANK[e.level] <= RANK[a.max_level] &&
    !(e.student_id === null && hidden.has(e.id)));
}

function renderAccessTab(s) {
  const body = document.getElementById("tab-body");
  const rows = TOPICS.map(t => {
    const a = (ASSIGN[s.id] || {})[t.id];
    const on = !!a;
    const total = EXERCISES.filter(e => e.topic_id === t.id && (e.student_id === null || e.student_id === s.id)).length;
    const vis = on ? visibleExercises(s.id, t.id).length : 0;
    const hiddenN = on ? [...(HIDDEN[s.id] || [])].filter(id => EX_BY_ID[id] && EX_BY_ID[id].topic_id === t.id).length : 0;
    return `
      <div class="border border-slate-200 rounded-xl bg-white ${on ? "" : "opacity-80"}">
        <div class="flex flex-wrap items-center gap-3 p-3">
          <label class="flex items-center gap-2 cursor-pointer flex-1 min-w-[200px]">
            <input type="checkbox" ${on ? "checked" : ""} onchange="toggleTopic('${t.id}', this.checked)" class="w-4 h-4 accent-indigo-600">
            <span class="text-sm font-semibold text-slate-800">${esc(t.title)}</span>
          </label>
          ${on ? `
            <select onchange="setTopicField('${t.id}', 'max_level', this.value)" class="text-xs border border-slate-300 rounded-lg px-2 py-1.5 bg-white">
              ${Object.entries(LEVEL_LABELS).map(([k, v]) => `<option value="${k}" ${a.max_level === k ? "selected" : ""}>до ${v}</option>`).join("")}
            </select>
            <label class="flex items-center gap-1.5 text-xs text-slate-600 cursor-pointer">
              <input type="checkbox" ${a.theory_visible ? "checked" : ""} onchange="setTopicField('${t.id}', 'theory_visible', this.checked)" class="accent-indigo-600">
              теорія
            </label>
            <button onclick="toggleExerciseList('${t.id}')" class="text-xs font-semibold text-indigo-600 hover:text-indigo-800 px-2 py-1 rounded hover:bg-indigo-50">
              Вправи: ${vis}/${total}${hiddenN ? ` · сховано ${hiddenN}` : ""} ${expandedTopic === t.id ? "▲" : "▼"}
            </button>` : `<span class="text-xs text-slate-400">закрито</span>`}
          <span id="saved-${t.id}" class="text-[11px] text-emerald-600 font-medium w-16 text-right"></span>
        </div>
        ${on && expandedTopic === t.id ? renderExerciseList(s.id, t.id, a) : ""}
      </div>`;
  }).join("");

  body.innerHTML = `
    <p class="text-xs text-slate-500 mb-3">Учень бачить лише відкриті теми, вправи й теорію не вище обраного рівня. Зміни зберігаються одразу.</p>
    <div class="space-y-2">${rows || '<p class="text-sm text-slate-500">У базі ще немає тем.</p>'}</div>`;
}

function renderExerciseList(studentId, topicId, a) {
  const hidden = HIDDEN[studentId] || new Set();
  const items = EXERCISES.filter(e => e.topic_id === topicId && (e.student_id === null || e.student_id === studentId));
  const groups = {};
  for (const e of items) (groups[e.type] ||= []).push(e);

  const html = Object.entries(groups).map(([type, list]) => `
    <div class="mt-3">
      <div class="flex items-center justify-between mb-1">
        <span class="text-xs font-bold uppercase tracking-wide text-slate-500">${TYPE_LABELS[type] || type} · ${list.length}</span>
        <span class="text-[11px] space-x-2">
          <button onclick="bulkHide('${topicId}', '${type}', false)" class="text-indigo-600 hover:underline">показати всі</button>
          <button onclick="bulkHide('${topicId}', '${type}', true)" class="text-slate-500 hover:underline">сховати всі</button>
        </span>
      </div>
      <div class="space-y-1">
        ${list.map(e => {
          const above = RANK[e.level] > RANK[a.max_level];
          const personal = e.student_id !== null;
          const isHidden = !personal && hidden.has(e.id);
          const t = exerciseText(e.type, e.payload);
          return `
            <label class="flex items-start gap-2 text-xs px-2 py-1.5 rounded-lg ${above ? "bg-slate-50 text-slate-400" : "hover:bg-slate-50"}">
              <input type="checkbox" ${!isHidden ? "checked" : ""} ${personal ? "disabled" : ""}
                onchange="setHidden('${e.id}', !this.checked)" class="mt-0.5 accent-indigo-600">
              <span class="flex-1">
                <span class="font-mono text-[10px] text-slate-400 mr-1">${esc(e.legacy_id || "")}</span>
                ${esc(t.question)}
                ${above ? `<span class="ml-1 text-[10px] font-semibold text-amber-600">вище рівня (${LEVEL_LABELS[e.level]})</span>` : ""}
                ${personal ? `<span class="ml-1 text-[10px] font-semibold text-violet-600">персональна</span>` : ""}
              </span>
            </label>`;
        }).join("")}
      </div>
    </div>`).join("");

  return `<div class="border-t border-slate-100 px-3 pb-3">${html}
    <p class="text-[11px] text-slate-400 mt-3">Зняти галочку — сховати вправу від цього учня. Вправи «вище рівня» він і так не бачить, доки не підвищите рівень.</p></div>`;
}

function toggleExerciseList(topicId) {
  expandedTopic = expandedTopic === topicId ? null : topicId;
  renderAccessTab(STUDENTS.find(x => x.id === selectedId));
}

async function toggleTopic(topicId, on) {
  const sid = selectedId;
  try {
    if (on) {
      const row = { student_id: sid, topic_id: topicId, max_level: "advanced", theory_visible: true };
      const { error } = await sb.from("assignments").upsert(row, { onConflict: "student_id,topic_id" });
      if (error) throw error;
      (ASSIGN[sid] ||= {})[topicId] = { max_level: row.max_level, theory_visible: true };
    } else {
      const { error } = await sb.from("assignments").delete().eq("student_id", sid).eq("topic_id", topicId);
      if (error) throw error;
      delete (ASSIGN[sid] || {})[topicId];
      if (expandedTopic === topicId) expandedTopic = null;
    }
  } catch (e) { fail(e, "Не вдалося змінити доступ"); }
  renderStudentList();
  renderPanel();
  flash(document.getElementById("saved-" + topicId));
}

async function setTopicField(topicId, field, value) {
  const sid = selectedId;
  const a = (ASSIGN[sid] || {})[topicId];
  if (!a) return;
  const prev = a[field];
  a[field] = value;
  const { error } = await sb.from("assignments").update({ [field]: value }).eq("student_id", sid).eq("topic_id", topicId);
  if (error) { a[field] = prev; fail(error, "Не вдалося зберегти"); }
  renderPanel();
  flash(document.getElementById("saved-" + topicId), error ? "" : "Збережено");
}

async function setHidden(exerciseId, hide) {
  const sid = selectedId;
  const set = (HIDDEN[sid] ||= new Set());
  try {
    if (hide) {
      const { error } = await sb.from("exercise_overrides")
        .upsert({ student_id: sid, exercise_id: exerciseId, hidden: true }, { onConflict: "student_id,exercise_id" });
      if (error) throw error;
      set.add(exerciseId);
    } else {
      const { error } = await sb.from("exercise_overrides").delete().eq("student_id", sid).eq("exercise_id", exerciseId);
      if (error) throw error;
      set.delete(exerciseId);
    }
  } catch (e) { fail(e, "Не вдалося змінити видимість вправи"); }
  const topicId = EX_BY_ID[exerciseId]?.topic_id;
  renderPanel();
  flash(document.getElementById("saved-" + topicId));
}

async function bulkHide(topicId, type, hide) {
  const sid = selectedId;
  const set = (HIDDEN[sid] ||= new Set());
  const ids = EXERCISES.filter(e => e.topic_id === topicId && e.type === type && e.student_id === null).map(e => e.id);
  try {
    if (hide) {
      const rows = ids.filter(id => !set.has(id)).map(id => ({ student_id: sid, exercise_id: id, hidden: true }));
      if (rows.length) {
        const { error } = await sb.from("exercise_overrides").upsert(rows, { onConflict: "student_id,exercise_id" });
        if (error) throw error;
      }
      ids.forEach(id => set.add(id));
    } else {
      const toShow = ids.filter(id => set.has(id));
      if (toShow.length) {
        const { error } = await sb.from("exercise_overrides").delete().eq("student_id", sid).in("exercise_id", toShow);
        if (error) throw error;
      }
      toShow.forEach(id => set.delete(id));
    }
  } catch (e) { fail(e, "Не вдалося змінити видимість"); }
  renderPanel();
  flash(document.getElementById("saved-" + topicId));
}

// ---------- вкладка «Результати» ----------
async function loadAttempts(sid, force = false) {
  if (ATTEMPTS[sid] && !force) return ATTEMPTS[sid];
  ATTEMPTS[sid] = await fetchAll(() =>
    sb.from("attempts").select("exercise_id, answer, is_correct, created_at")
      .eq("student_id", sid).order("created_at", { ascending: false }).order("id"));
  return ATTEMPTS[sid];
}

async function renderResultsTab(s) {
  const body = document.getElementById("tab-body");
  body.innerHTML = '<p class="text-sm text-slate-500">Завантажуємо спроби…</p>';
  let attempts;
  try { attempts = await loadAttempts(s.id, true); }
  catch (e) { body.innerHTML = `<p class="text-sm text-rose-600">Помилка: ${esc(e.message)}</p>`; return; }
  if (selectedId !== s.id || currentTab !== "results") return; // користувач уже перейшов деінде

  if (!attempts.length) {
    body.innerHTML = '<div class="bg-white border border-slate-200 rounded-xl p-6 text-sm text-slate-500">Учень ще не виконав жодної вправи.</div>';
    return;
  }

  const solved = new Set(attempts.filter(a => a.is_correct).map(a => a.exercise_id));
  const correctN = attempts.filter(a => a.is_correct).length;
  const acc = Math.round((correctN / attempts.length) * 100);

  // --- по темах ---
  const topicIds = new Set([
    ...Object.keys(ASSIGN[s.id] || {}),
    ...attempts.map(a => EX_BY_ID[a.exercise_id]?.topic_id).filter(Boolean),
  ]);
  const topicRows = TOPICS.filter(t => topicIds.has(t.id)).map(t => {
    const avail = visibleExercises(s.id, t.id);
    const tAtt = attempts.filter(a => EX_BY_ID[a.exercise_id]?.topic_id === t.id);
    const tSolved = avail.filter(e => solved.has(e.id)).length;
    const tAcc = tAtt.length ? Math.round(tAtt.filter(a => a.is_correct).length / tAtt.length * 100) : null;
    const pct = avail.length ? Math.round(tSolved / avail.length * 100) : 0;
    return `
      <tr class="border-t border-slate-100">
        <td class="py-2 pr-3 text-sm font-medium">${esc(t.title)}${(ASSIGN[s.id] || {})[t.id] ? "" : ' <span class="text-[10px] text-slate-400">(закрита)</span>'}</td>
        <td class="py-2 pr-3 text-sm">
          <div class="flex items-center gap-2">
            <div class="w-24 bg-slate-100 h-1.5 rounded-full overflow-hidden"><div class="bg-indigo-600 h-full" style="width:${pct}%"></div></div>
            <span class="text-xs text-slate-600">${tSolved}/${avail.length}</span>
          </div>
        </td>
        <td class="py-2 pr-3 text-xs text-slate-600">${tAtt.length}</td>
        <td class="py-2 pr-3 text-xs ${tAcc !== null && tAcc < 60 ? "text-rose-600 font-semibold" : "text-slate-600"}">${tAcc === null ? "—" : tAcc + "%"}</td>
        <td class="py-2 text-right">${tAtt.length ? `<button onclick="resetTopicProgress('${t.id}')" class="text-[11px] text-slate-400 hover:text-rose-600">скинути</button>` : ""}</td>
      </tr>`;
  }).join("");

  // --- найважчі вправи ---
  const byEx = {};
  for (const a of attempts) {
    const r = (byEx[a.exercise_id] ||= { wrong: 0, total: 0, answers: [] });
    r.total++;
    if (!a.is_correct) {
      r.wrong++;
      if (a.answer && r.answers.length < 3 && !r.answers.includes(a.answer)) r.answers.push(a.answer);
    }
  }
  const hard = Object.entries(byEx).filter(([, r]) => r.wrong > 0)
    .sort((x, y) => y[1].wrong - x[1].wrong).slice(0, 15);

  const hardRows = hard.map(([id, r]) => {
    const e = EX_BY_ID[id];
    if (!e) return "";
    const t = exerciseText(e.type, e.payload);
    const topic = TOPICS.find(x => x.id === e.topic_id);
    return `
      <div class="border border-slate-200 rounded-lg p-3 bg-white">
        <div class="flex items-start justify-between gap-3">
          <div class="text-sm text-slate-800">${esc(t.question)}</div>
          <span class="shrink-0 text-xs font-bold ${solved.has(id) ? "text-amber-600" : "text-rose-600"}">${r.wrong} помил. ${solved.has(id) ? "· потім вірно" : "· не здолано"}</span>
        </div>
        <div class="text-xs mt-1.5 text-slate-500">
          ${esc(topic?.title || "")} · ${TYPE_LABELS[e.type] || e.type}
        </div>
        <div class="text-xs mt-1.5"><span class="text-slate-500">Правильно:</span> <span class="text-emerald-700 font-medium">${esc(t.correct)}</span></div>
        ${r.answers.length ? `<div class="text-xs mt-0.5"><span class="text-slate-500">Відповідав:</span> <span class="text-rose-600">${r.answers.map(esc).join(" · ")}</span></div>` : ""}
      </div>`;
  }).join("");

  // --- останні помилки ---
  const recent = attempts.filter(a => !a.is_correct).slice(0, 30).map(a => {
    const e = EX_BY_ID[a.exercise_id];
    if (!e) return "";
    const t = exerciseText(e.type, e.payload);
    return `
      <tr class="border-t border-slate-100 align-top">
        <td class="py-1.5 pr-3 text-[11px] text-slate-400 whitespace-nowrap">${fmtDate(a.created_at)}</td>
        <td class="py-1.5 pr-3 text-xs text-slate-700">${esc(t.question)}</td>
        <td class="py-1.5 pr-3 text-xs text-rose-600">${esc(a.answer || "—")}</td>
        <td class="py-1.5 text-xs text-emerald-700">${esc(t.correct)}</td>
      </tr>`;
  }).join("");

  const card = (label, value, sub = "") => `
    <div class="bg-white border border-slate-200 rounded-xl p-4">
      <div class="text-xs text-slate-500">${label}</div>
      <div class="text-2xl font-bold text-slate-900 mt-1">${value}</div>
      ${sub ? `<div class="text-[11px] text-slate-400 mt-0.5">${sub}</div>` : ""}
    </div>`;

  body.innerHTML = `
    <div class="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-6">
      ${card("Зараховано вправ", solved.size)}
      ${card("Усього спроб", attempts.length)}
      ${card("Точність", acc + "%", "правильних спроб від усіх")}
      ${card("Остання активність", fmtDate(attempts[0].created_at).split(",")[0], fmtDate(attempts[0].created_at).split(",")[1] || "")}
    </div>

    <h3 class="text-sm font-bold text-slate-900 mb-2">По темах</h3>
    <div class="bg-white border border-slate-200 rounded-xl px-4 py-2 mb-6 overflow-x-auto">
      <table class="w-full">
        <thead><tr class="text-left text-[11px] uppercase tracking-wide text-slate-400">
          <th class="py-1.5 pr-3 font-semibold">Тема</th><th class="py-1.5 pr-3 font-semibold">Зроблено</th>
          <th class="py-1.5 pr-3 font-semibold">Спроб</th><th class="py-1.5 pr-3 font-semibold">Точність</th><th></th>
        </tr></thead>
        <tbody>${topicRows}</tbody>
      </table>
    </div>

    ${hard.length ? `
      <h3 class="text-sm font-bold text-slate-900 mb-2">Найважчі вправи</h3>
      <div class="space-y-2 mb-6">${hardRows}</div>` : ""}

    ${recent ? `
      <h3 class="text-sm font-bold text-slate-900 mb-2">Останні помилки</h3>
      <div class="bg-white border border-slate-200 rounded-xl px-4 py-2 overflow-x-auto">
        <table class="w-full">
          <thead><tr class="text-left text-[11px] uppercase tracking-wide text-slate-400">
            <th class="py-1.5 pr-3 font-semibold">Коли</th><th class="py-1.5 pr-3 font-semibold">Вправа</th>
            <th class="py-1.5 pr-3 font-semibold">Відповідь учня</th><th class="py-1.5 font-semibold">Правильно</th>
          </tr></thead>
          <tbody>${recent}</tbody>
        </table>
      </div>` : ""}`;
}

async function resetTopicProgress(topicId) {
  const s = STUDENTS.find(x => x.id === selectedId);
  const topic = TOPICS.find(t => t.id === topicId);
  if (!confirm(`Стерти всі спроби «${studentName(s)}» у темі «${topic.title}»?\nСтатистику помилок по цій темі буде втрачено.`)) return;
  const ids = EXERCISES.filter(e => e.topic_id === topicId).map(e => e.id);
  try {
    for (let i = 0; i < ids.length; i += 200) {
      const { error } = await sb.from("attempts").delete().eq("student_id", s.id).in("exercise_id", ids.slice(i, i + 200));
      if (error) throw error;
    }
  } catch (e) { return fail(e, "Не вдалося скинути"); }
  renderPanel();
}

// ---------- вкладка «Акаунт» ----------
function renderAccountTab(s) {
  const body = document.getElementById("tab-body");
  const input = "w-full px-3 py-2 text-sm border border-slate-300 rounded-lg focus:outline-none focus:border-indigo-600";
  body.innerHTML = `
    <div class="space-y-5 max-w-lg">
      <div class="bg-white border border-slate-200 rounded-xl p-5 space-y-3">
        <h3 class="text-sm font-bold text-slate-900">Дані учня</h3>
        <input id="acc-name" value="${esc(s.full_name || "")}" placeholder="Імʼя та прізвище" class="${input}">
        <textarea id="acc-note" rows="3" placeholder="Приватна нотатка (учень її не бачить)" class="${input}">${esc(s.note || "")}</textarea>
        <div class="flex items-center gap-3">
          <button onclick="saveStudentInfo()" class="text-sm font-semibold px-4 py-2 rounded-lg bg-slate-900 hover:bg-indigo-600 text-white">Зберегти</button>
          <span id="acc-saved" class="text-xs text-emerald-600 font-medium"></span>
        </div>
        <p class="text-[11px] text-slate-400">Пошта: ${esc(s.email || "—")}. Змінити її можна лише в панелі Supabase.</p>
      </div>

      <div class="bg-white border border-slate-200 rounded-xl p-5 space-y-3">
        <h3 class="text-sm font-bold text-slate-900">Новий пароль</h3>
        <div class="flex gap-2">
          <input id="acc-pass" placeholder="Від 8 символів" class="flex-1 px-3 py-2 text-sm border border-slate-300 rounded-lg focus:outline-none focus:border-indigo-600 font-mono">
          <button onclick="document.getElementById('acc-pass').value = generatePassword()" class="text-xs font-semibold px-3 rounded-lg border border-slate-300 hover:border-indigo-500">Згенерувати</button>
        </div>
        <div class="flex items-center gap-3">
          <button id="acc-pass-btn" onclick="changeStudentPassword()" class="text-sm font-semibold px-4 py-2 rounded-lg bg-slate-900 hover:bg-indigo-600 text-white disabled:opacity-60">Змінити пароль</button>
          <span id="acc-pass-msg" class="text-xs font-medium"></span>
        </div>
      </div>

      <div class="bg-white border border-rose-200 rounded-xl p-5 space-y-3">
        <h3 class="text-sm font-bold text-rose-700">Видалити учня</h3>
        <p class="text-xs text-slate-600">Акаунт, доступи, персональні вправи і вся історія спроб будуть видалені назавжди.</p>
        <button onclick="deleteStudent()" class="text-sm font-semibold px-4 py-2 rounded-lg border border-rose-300 text-rose-700 hover:bg-rose-50">Видалити</button>
      </div>
    </div>`;
}

async function saveStudentInfo() {
  const s = STUDENTS.find(x => x.id === selectedId);
  const full_name = document.getElementById("acc-name").value.trim() || null;
  const note = document.getElementById("acc-note").value.trim() || null;
  const { error } = await sb.from("profiles").update({ full_name, note }).eq("id", s.id);
  if (error) return fail(error, "Не вдалося зберегти");
  s.full_name = full_name;
  s.note = note;
  renderStudentList();
  renderPanel();
  flash(document.getElementById("acc-saved"));
}

async function changeStudentPassword() {
  const btn = document.getElementById("acc-pass-btn");
  const msg = document.getElementById("acc-pass-msg");
  const password = document.getElementById("acc-pass").value;
  btn.disabled = true;
  msg.className = "text-xs font-medium text-slate-500";
  msg.textContent = "Зберігаємо…";
  try {
    await invokeAdmin({ action: "set_password", student_id: selectedId, password });
    msg.className = "text-xs font-medium text-emerald-600";
    msg.textContent = "Пароль змінено. Передайте його учневі.";
  } catch (e) {
    msg.className = "text-xs font-medium text-rose-600";
    msg.textContent = e.message;
  } finally {
    btn.disabled = false;
  }
}

async function deleteStudent() {
  const s = STUDENTS.find(x => x.id === selectedId);
  const typed = prompt(`Щоб видалити учня назавжди, введіть його пошту:\n${s.email}`);
  if (typed === null) return;
  if (typed.trim().toLowerCase() !== (s.email || "").toLowerCase()) return alert("Пошта не збігається — видалення скасовано.");
  try {
    await invokeAdmin({ action: "delete_student", student_id: s.id });
  } catch (e) { return fail(e, "Не вдалося видалити"); }
  STUDENTS = STUDENTS.filter(x => x.id !== s.id);
  delete ASSIGN[s.id]; delete HIDDEN[s.id]; delete ATTEMPTS[s.id];
  EXERCISES = EXERCISES.filter(e => e.student_id !== s.id);
  EX_BY_ID = Object.fromEntries(EXERCISES.map(e => [e.id, e]));
  selectedId = null;
  renderStudentList();
  renderPanel();
}

// ---------- створення учня ----------
let lastCreds = "";

function openCreateModal() {
  ["new-name", "new-email"].forEach(id => document.getElementById(id).value = "");
  document.getElementById("new-password").value = generatePassword();
  document.getElementById("create-error").classList.add("hidden");
  document.getElementById("create-form-wrap").classList.remove("hidden");
  document.getElementById("create-done").classList.add("hidden");
  document.getElementById("create-modal").classList.remove("hidden");
  document.getElementById("new-name").focus();
}

function closeCreateModal() {
  document.getElementById("create-modal").classList.add("hidden");
  lastCreds = "";
}

async function submitCreateStudent() {
  const full_name = document.getElementById("new-name").value.trim();
  const email = document.getElementById("new-email").value.trim();
  const password = document.getElementById("new-password").value;
  const err = document.getElementById("create-error");
  const btn = document.getElementById("create-submit");
  err.classList.add("hidden");
  btn.disabled = true;
  btn.textContent = "Створюємо…";
  try {
    const res = await invokeAdmin({ action: "create_student", email, password, full_name });
    STUDENTS.push({ id: res.student_id, full_name: full_name || null, email: res.email, note: null, created_at: new Date().toISOString() });
    selectedId = res.student_id;
    currentTab = "access";
    renderStudentList();
    renderPanel();

    lastCreds = `Сайт: ${location.origin}${location.pathname.replace(/teacher\.html$/, "")}\nПошта: ${res.email}\nПароль: ${password}`;
    document.getElementById("created-creds").textContent = lastCreds;
    document.getElementById("create-form-wrap").classList.add("hidden");
    document.getElementById("create-done").classList.remove("hidden");
  } catch (e) {
    err.textContent = e.message;
    err.classList.remove("hidden");
  } finally {
    btn.disabled = false;
    btn.textContent = "Створити";
  }
}

async function copyCreds() {
  try {
    await navigator.clipboard.writeText(lastCreds);
    document.getElementById("copy-btn").textContent = "Скопійовано";
  } catch (_) {
    alert(lastCreds);
  }
}

window.addEventListener("DOMContentLoaded", init);

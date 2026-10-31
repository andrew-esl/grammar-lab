// ==================== РУШІЙ ====================
// Контент приходить із бази (js/api.js) у тому самому форматі,
// що раніше лежав у data/*.js. Цей файл не містить навчального
// матеріалу — правити його треба лише при зміні механік чи інтерфейсу.
let TOPICS_DATA = {};

let currentTopic = null;         // ставиться після завантаження: перша доступна тема
let currentMainTab = "theory";
let currentStudentLevel = "all"; // all, elementary, intermediate, advanced
let solvedState = {};
let orderState = {};
let gapDraft = {};   // чернетки введених, але ще не перевірених відповідей у gap-полях

// true  → рівень учня показує його рівень І ВСЕ, ЩО НИЖЧЕ (Advanced бачить усе)
// false → показується РІВНО обраний рівень (Advanced бачить тільки advanced)
const CUMULATIVE_LEVELS = true;

const GROUPS = [
  { type: "order",  title: "Порядок слів",      hint: "Склади речення з поданих слів" },
  { type: "choice", title: "Вибір у контексті", hint: "Обери правильний варіант" },
  { type: "gap",    title: "Розкрити дужки",    hint: "Впиши потрібну форму" },
  { type: "cross",  title: "Зайве слово",       hint: "Знайди слово, яке треба прибрати" },
  { type: "abcd",   title: "Граматичний тест",  hint: "Один правильний варіант із чотирьох" },
];

const LEVEL_RANK = { elementary: 0, intermediate: 1, advanced: 2 };
const LEVEL_SHORT = { elementary: "Elem", intermediate: "Inter", advanced: "Adv" };

// Завантажує контент і прогрес, після чого малює сторінку.
async function loadDataAndRender() {
  const [data, solvedUuids] = await Promise.all([apiLoadContent(), apiLoadSolved()]);
  TOPICS_DATA = data;

  solvedState = {};
  forEachExercise(item => {
    if (solvedUuids.has(item.__uuid)) solvedState[item.id] = true;
  });

  const keys = Object.keys(TOPICS_DATA);
  if (!keys.length) {
    document.getElementById("current-topic-title").textContent = "Тем поки не призначено";
    document.getElementById("theory-list").innerHTML = emptyCard(
      "Матеріалів поки немає",
      "Викладач ще не відкрив вам жодної теми. Напишіть йому, і вони зʼявляться тут.");
    return;
  }
  if (!currentTopic || !TOPICS_DATA[currentTopic]) currentTopic = keys[0];
  updateView();
}

function forEachExercise(fn) {
  for (const topic of Object.values(TOPICS_DATA)) {
    for (const arr of Object.values(topic.exercises || {})) arr.forEach(fn);
  }
}

function emptyCard(title, text) {
  return `<div class="bg-surface border border-border-default rounded-2xl p-8 text-center">
    <div class="text-heading-md font-semibold text-text-primary mb-1">${title}</div>
    <p class="text-body-base text-text-muted">${text}</p>
  </div>`;
}

// ==================== ІНТЕРФЕЙС ТА НАВІГАЦІЯ ====================
function toggleSidebar() {
  const drawer = document.getElementById("sidebar-drawer");
  const backdrop = document.getElementById("sidebar-backdrop");
  const isHidden = drawer.classList.contains("-translate-x-full");
  drawer.classList.toggle("-translate-x-full", !isHidden);
  backdrop.classList.toggle("hidden", !isHidden);
}

function changeStudentLevel(level) {
  currentStudentLevel = level;
  updateView();
}

function selectTopic(topicKey) {
  currentTopic = topicKey;
  toggleSidebar();
  window.scrollTo({ top: 0, behavior: "smooth" });
  updateView();
}

function switchMainTab(tab) {
  currentMainTab = tab;
  updateView();
}

// ==================== ГОЛОВНИЙ РЕНДЕР ====================
const TAB_ON = "flex items-center gap-2 px-5 py-3 text-body-semibold border-b-2 rounded-t-lg transition border-secondary text-secondary bg-surface";
const TAB_OFF = "flex items-center gap-2 px-5 py-3 text-body-semibold border-b-2 rounded-t-lg transition border-transparent text-text-muted hover:text-text-primary hover:bg-surface-subtle";

function updateView() {
  const topic = TOPICS_DATA[currentTopic];
  if (!topic) return;

  document.getElementById("current-topic-title").textContent = topic.title;

  const isTheory = currentMainTab === "theory";
  document.getElementById("section-theory").classList.toggle("hidden", !isTheory);
  document.getElementById("section-practice").classList.toggle("hidden", isTheory);
  // Неактивну вкладку спорожняємо: інакше одна вправа опинилась би
  // у DOM двічі (у дрилі й у списку) і перемальовування плуталося б.
  if (isTheory) {
    document.getElementById("exercises-list").innerHTML = "";
    document.getElementById("practice-aside").innerHTML = "";
  } else {
    document.getElementById("theory-list").innerHTML = "";
    document.getElementById("theory-aside").innerHTML = "";
    initStepSpy([]);
  }
  document.getElementById("tab-btn-theory").className = isTheory ? TAB_ON : TAB_OFF;
  document.getElementById("tab-btn-practice").className = isTheory ? TAB_OFF : TAB_ON;

  renderSidebar();
  if (isTheory) renderTheory(); else renderTopicExercises();
  updateProgressUI();

  const n = Object.keys(TOPICS_DATA).length;
  document.getElementById("footer-topic-count").textContent =
    `Доступно тем: ${n}`;
}

function renderSidebar() {
  const container = document.getElementById("sidebar-topics-list");
  container.innerHTML = Object.keys(TOPICS_DATA).map(key => {
    const topic = TOPICS_DATA[key];
    const active = key === currentTopic;
    const c = getTopicCounts(key);
    return `
      <button onclick="selectTopic('${key}')"
        class="w-full text-left px-3 py-2.5 rounded-xl transition border ${active
          ? "bg-interactive-subtle border-interactive-border"
          : "bg-surface border-transparent hover:bg-surface-subtle"}">
        <div class="flex items-center justify-between gap-2">
          <span class="text-body-semibold truncate ${active ? "text-secondary" : "text-text-primary"}">${topic.title}</span>
          <span id="nav-pct-${key}" class="text-micro font-semibold px-1.5 py-0.5 rounded-md shrink-0 ${active
            ? "bg-surface text-secondary" : "bg-surface-subtle text-text-muted"}">${c.pct}%</span>
        </div>
        <div class="mt-1.5 h-1 rounded-full bg-surface-muted overflow-hidden">
          <div class="h-full rounded-full ${active ? "bg-secondary" : "bg-text-tertiary"}" style="width:${c.pct}%"></div>
        </div>
      </button>`;
  }).join("");
}

// ---------- теорія ----------
function renderTheory() {
  const list = document.getElementById("theory-list");
  const aside = document.getElementById("theory-aside");
  const topic = TOPICS_DATA[currentTopic];
  const blocks = topic.theory.filter(b => shouldShowLevel(b.level));

  if (!blocks.length) {
    list.innerHTML = emptyCard("Теорії тут немає", "Для цієї теми викладач відкрив лише вправи.");
    aside.innerHTML = "";
    initStepSpy([]);
    return;
  }

  const stats = getTopicCounts(currentTopic);
  const page = renderTheoryPage(topic, blocks, stats);

  // Сторінка з кроками займає всю ширину, звичайна — дві колонки зі змістом.
  const wide = page.steps.length > 0;
  document.getElementById("section-theory").className =
    wide ? "block" : "grid grid-cols-1 lg:grid-cols-12 gap-6 items-start";
  list.className = wide ? "" : "lg:col-span-8 space-y-5";
  aside.className = wide ? "hidden" : "lg:col-span-4 lg:sticky lg:top-24";

  list.innerHTML = renderStepNav(page.steps) + page.html;
  aside.innerHTML = wide ? "" : renderTheoryToc(blocks);

  if (stats.total) mountDrill(topic);
  initStepSpy(page.steps);
}

function renderTheoryToc(blocks) {
  return `
    <div class="bg-surface border border-border-default rounded-2xl p-5 shadow-sm">
      <div class="flex items-center gap-2 mb-3">
        <svg class="w-4 h-4 text-secondary" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"/></svg>
        <h2 class="text-heading-md font-semibold text-text-primary">Зміст теми</h2>
      </div>
      <nav class="space-y-1">
        ${blocks.map((b, i) => `
          <a href="#th-${b.id}" class="flex items-start gap-2.5 px-2.5 py-2 rounded-lg hover:bg-surface-subtle transition group">
            <span class="text-caption-bold text-text-tertiary mt-0.5 group-hover:text-secondary">${i + 1}</span>
            <span class="text-body-sm text-text-secondary group-hover:text-text-primary leading-snug">${b.title}</span>
          </a>`).join("")}
      </nav>
      <button onclick="switchMainTab('practice')"
        class="w-full mt-4 flex items-center justify-center gap-2 bg-text-primary hover:bg-secondary text-text-inverse text-body-semibold py-2.5 rounded-xl transition shadow-sm">
        Перейти до вправ
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 18l6-6-6-6"/></svg>
      </button>
    </div>`;
}

function levelBadge(level) {
  const map = {
    elementary: "bg-success-surface text-success-emphasis",
    intermediate: "bg-interactive-subtle text-secondary",
    advanced: "bg-warning-surface text-warning",
  };
  return `<span class="shrink-0 text-micro font-semibold uppercase tracking-wider px-2 py-1 rounded-full ${map[level] || "bg-surface-subtle text-text-muted"}">${LEVEL_SHORT[level] || level}</span>`;
}

// ---------- вправи ----------
function renderTopicExercises() {
  const list = document.getElementById("exercises-list");
  const aside = document.getElementById("practice-aside");
  const exercises = TOPICS_DATA[currentTopic].exercises;
  list.innerHTML = "";

  const present = GROUPS
    .map(g => ({ ...g, items: (exercises[g.type] || []).filter(i => shouldShowLevel(i.level)) }))
    .filter(g => g.items.length);

  if (!present.length) {
    list.innerHTML = emptyCard("Вправ поки немає",
      "Для цієї теми викладач відкрив лише теорію.");
    aside.innerHTML = "";
    return;
  }

  for (const g of present) renderExerciseGroup(list, g);
  renderPracticeAside(aside, present);
}

function renderExerciseGroup(container, g) {
  const done = g.items.filter(i => solvedState[i.id]).length;
  const card = document.createElement("section");
  card.id = "ex-group-" + g.type;
  card.className = "bg-surface border border-border-default rounded-2xl shadow-sm overflow-hidden scroll-mt-24";
  card.innerHTML = `
    <div class="px-5 sm:px-6 py-4 border-b border-border-default flex items-center justify-between gap-3">
      <div>
        <h3 class="text-heading-md font-semibold text-text-primary">${g.title}</h3>
        <p class="text-caption-xs text-text-muted mt-0.5">${g.hint}</p>
      </div>
      <span class="shrink-0 text-caption-bold px-2.5 py-1 rounded-full ${done === g.items.length
        ? "bg-success-surface text-success-emphasis" : "bg-surface-subtle text-text-muted"}">${done}/${g.items.length}</span>
    </div>
    <div id="ex-body-${g.type}" class="p-4 sm:p-5 space-y-3"></div>`;
  container.appendChild(card);

  const body = card.querySelector(`#ex-body-${g.type}`);
  g.items.forEach(t => {
    const row = document.createElement("div");
    row.id = "row-" + t.id;
    fillRow(row, t, g.type);
    body.appendChild(row);
  });
}

function renderPracticeAside(aside, present) {
  const c = getTopicCounts(currentTopic);
  aside.innerHTML = `
    <div class="space-y-4">
      <div class="bg-surface border border-border-default rounded-2xl p-5 shadow-sm">
        <div class="flex items-center gap-2 mb-4">
          <svg class="w-4 h-4 text-secondary" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><circle cx="12" cy="12" r="5"/><circle cx="12" cy="12" r="1.5"/></svg>
          <h2 class="text-heading-md font-semibold text-text-primary">Прогрес теми</h2>
        </div>
        <div class="flex items-baseline gap-2 mb-2">
          <span class="text-display-title font-bold text-text-primary">${c.pct}%</span>
          <span class="text-body-sm text-text-muted">${c.solved} з ${c.total}</span>
        </div>
        <div class="w-full h-2 rounded-full bg-surface-muted overflow-hidden mb-4">
          <div class="h-full bg-secondary rounded-full transition-all duration-300" style="width:${c.pct}%"></div>
        </div>
        <nav class="space-y-1.5">
          ${present.map(g => {
            const d = g.items.filter(i => solvedState[i.id]).length;
            const full = d === g.items.length;
            return `
              <a href="#ex-group-${g.type}" class="flex items-center justify-between gap-2 px-2.5 py-2 rounded-lg hover:bg-surface-subtle transition group">
                <span class="text-body-sm text-text-secondary group-hover:text-text-primary">${g.title}</span>
                <span class="text-micro font-semibold px-1.5 py-0.5 rounded-md shrink-0 ${full
                  ? "bg-success-surface text-success-emphasis" : "bg-surface-subtle text-text-muted"}">${d}/${g.items.length}</span>
              </a>`;
          }).join("")}
        </nav>
      </div>

      <div class="bg-surface border border-border-default rounded-2xl p-5 shadow-sm">
        <h2 class="text-heading-md font-semibold text-text-primary mb-2.5">Як це працює</h2>
        <ul class="space-y-2 text-body-sm text-text-secondary">
          <li class="flex gap-2"><span class="text-secondary">•</span> Після перевірки зʼявляється пояснення правила.</li>
          <li class="flex gap-2"><span class="text-secondary">•</span> Помилка нічого не псує: пробуйте ще раз.</li>
          <li class="flex gap-2"><span class="text-secondary">•</span> Прогрес зберігається сам і доступний із будь-якого пристрою.</li>
        </ul>
      </div>
    </div>`;
}

// Перемальовує ОДНУ вправу, не чіпаючи решту сторінки.
// Саме це зберігає текст, уже введений учнем в інші поля.
function rerenderItem(itemId) {
  const found = findItemById(itemId);
  if (!found || !found.item) return;
  const row = document.getElementById("row-" + itemId);
  if (!row) return;
  fillRow(row, found.item, found.type);
  const g = GROUPS.find(x => x.type === found.type);
  if (g) refreshGroupCounter(g.type);
}

function refreshGroupCounter(type) {
  const items = (TOPICS_DATA[currentTopic].exercises[type] || []).filter(i => shouldShowLevel(i.level));
  const done = items.filter(i => solvedState[i.id]).length;
  const badge = document.querySelector(`#ex-group-${type} > div > span`);
  if (badge) {
    badge.textContent = `${done}/${items.length}`;
    badge.className = `shrink-0 text-caption-bold px-2.5 py-1 rounded-full ${done === items.length
      ? "bg-success-surface text-success-emphasis" : "bg-surface-subtle text-text-muted"}`;
  }
}

function fillRow(row, t, type) {
  if (type === "order") return fillOrderRow(row, t);
  if (type === "gap") return fillGapRow(row, t);
  if (type === "choice") return fillChoiceRow(row, t);
  if (type === "cross") return fillCrossRow(row, t);
  if (type === "abcd") return fillAbcdRow(row, t);
}

// Спільна «рамка» однієї вправи
function rowShell(t, inner) {
  const isDone = solvedState[t.id];
  const personal = t.__source && t.__source !== "book";
  return {
    cls: "rounded-xl border p-4 transition " + (isDone
      ? "bg-success-surface border-success-border"
      : "bg-surface-subtle border-transparent hover:border-border-default"),
    html: `
      <div class="flex items-start justify-between gap-3 mb-2.5">
        <div class="flex-1 min-w-0">${inner}</div>
        <div class="flex items-center gap-1.5 shrink-0">
          ${personal ? '<span class="text-micro font-semibold px-1.5 py-0.5 rounded-md bg-accent-personal-surface text-accent-personal">персональна</span>' : ""}
          ${isDone ? '<svg class="w-4 h-4 text-success-emphasis" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M20 6L9 17l-5-5"/></svg>' : ""}
        </div>
      </div>`,
  };
}

const BTN_CHECK = "shrink-0 bg-text-primary hover:bg-secondary text-text-inverse text-caption-bold px-4 py-2 rounded-lg transition shadow-sm";

// Банер відповіді. kind: ok | err | done
function feedbackHtml(id, kind, text) {
  const base = "text-caption-xs leading-relaxed rounded-lg px-3 py-2 mt-2.5 border flex items-start gap-2";
  const map = {
    ok: "bg-surface border-success-border text-success-emphasis",
    err: "bg-error-surface border-error-border text-error-emphasis",
    done: "bg-surface border-success-border text-text-secondary",
  };
  return `<div id="fb-${id}" class="${kind ? base + " " + map[kind] : "hidden"}">${text || ""}</div>`;
}

function setFeedback(id, kind, text) {
  const fb = document.getElementById("fb-" + id);
  if (!fb) return;
  const base = "text-caption-xs leading-relaxed rounded-lg px-3 py-2 mt-2.5 border flex items-start gap-2";
  const map = {
    ok: "bg-surface border-success-border text-success-emphasis",
    err: "bg-error-surface border-error-border text-error-emphasis",
  };
  fb.className = base + " " + map[kind];
  fb.textContent = text;
}

// ==================== МЕХАНІКИ ====================
function fillOrderRow(row, t) {
  if (!orderState[t.id]) orderState[t.id] = { selected: [], pool: [...t.scrambled] };
  const st = orderState[t.id];
  const isDone = solvedState[t.id];
  const shell = rowShell(t, `<span class="text-body-semibold text-text-primary">${t.prefix || ""}</span>`);
  row.className = shell.cls;

  row.innerHTML = `
    ${shell.html}
    <!-- Зона складеного речення -->
    <div class="p-3 sm:p-4 bg-interactive-subtle/50 border-2 border-dashed border-secondary/40 rounded-2xl min-h-[64px] flex flex-wrap items-center gap-2.5 mb-3">
      ${st.selected.length === 0
        ? `<span class="flex items-center gap-1.5 px-1 text-caption-bold text-secondary pointer-events-none select-none">
             <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 11V6a2 2 0 114 0v5m0 0V9a2 2 0 114 0v2m0 0a2 2 0 114 0v4a6 6 0 01-6 6h-2a6 6 0 01-6-6v-1a2 2 0 114 0"/></svg>
             Натискайте слова нижче, щоб скласти речення
           </span>`
        : st.selected.map((w, i) => `
          <button onclick="removeOrderWord('${t.id}', ${i})"
            class="word-chip flex items-center gap-2 px-3.5 py-2.5 rounded-xl bg-secondary hover:bg-interactive-hover text-text-inverse text-heading-md shadow-md">
            ${w}<svg class="w-4 h-4 opacity-75" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><circle cx="12" cy="12" r="9"/><path d="M9 9l6 6M15 9l-6 6"/></svg>
          </button>`).join("")}
    </div>

    ${st.pool.length ? `
    <!-- Банк слів -->
    <div class="p-3 sm:p-4 bg-surface border-2 border-border-default rounded-2xl shadow-sm mb-3">
      <div class="flex items-center justify-between gap-2 mb-2.5">
        <span class="flex items-center gap-1.5 text-caption-bold uppercase tracking-wider text-text-muted">
          <svg class="w-4 h-4 text-text-secondary" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><ellipse cx="12" cy="5" rx="9" ry="3"/><path d="M3 5v14c0 1.7 4 3 9 3s9-1.3 9-3V5M3 12c0 1.7 4 3 9 3s9-1.3 9-3"/></svg>
          Банк слів
        </span>
        <span class="text-micro text-text-muted">Натисніть, щоб додати</span>
      </div>
      <div class="flex flex-wrap items-center gap-2.5">
        ${st.pool.map((w, i) => `
          <button onclick="pickOrderWord('${t.id}', ${i})"
            class="word-chip px-3.5 py-2 rounded-xl bg-surface-subtle hover:bg-secondary hover:text-text-inverse text-text-primary text-heading-md border border-border-default hover:border-secondary shadow-sm transition-all">${w}</button>`).join("")}
      </div>
    </div>` : ""}

    <button onclick="checkOrderItem('${t.id}')" class="${BTN_CHECK}">Перевірити</button>
    ${feedbackHtml(t.id, isDone ? "done" : null, isDone ? "Правильно: " + t.answer : "")}`;
}

function pickOrderWord(itemId, pIdx) {
  const st = orderState[itemId];
  st.selected.push(st.pool.splice(pIdx, 1)[0]);
  rerenderItem(itemId);
}

function removeOrderWord(itemId, sIdx) {
  const st = orderState[itemId];
  st.pool.push(st.selected.splice(sIdx, 1)[0]);
  rerenderItem(itemId);
}

function checkOrderItem(itemId) {
  const { item } = findItemById(itemId);
  if (!item) return;
  const userStr = orderState[itemId].selected.join(" ");
  const ok = userStr === item.answer || (item.altAnswer && userStr === item.altAnswer);
  apiRecordAttempt(item.__uuid, userStr, ok);
  if (ok) {
    markSolved(itemId);
    rerenderItem(itemId);
    setFeedback(itemId, "ok", "Правильно! " + item.hint);
  } else {
    setFeedback(itemId, "err", "Порядок неправильний. Підказка: " + item.hint);
  }
}

function fillGapRow(row, t) {
  const isDone = solvedState[t.id];
  const shell = rowShell(t, `<label class="block text-body-medium text-text-primary leading-relaxed">${t.prompt}</label>`);
  row.className = shell.cls;
  row.innerHTML = `
    ${shell.html}
    <div class="flex flex-wrap gap-2">
      <input type="text" id="inp-${t.id}" value="${escapeAttr(isDone ? t.answers[0] : (gapDraft[t.id] || ""))}"
        placeholder="Впишіть відповідь…" oninput="gapDraft['${t.id}'] = this.value"
        onkeydown="if(event.key==='Enter') checkGapItem('${t.id}')"
        class="flex-1 min-w-[200px] max-w-sm px-3 py-2 text-body-base bg-surface border border-border-input rounded-lg text-text-primary placeholder:text-text-tertiary focus:outline-none focus:border-secondary transition">
      <button onclick="checkGapItem('${t.id}')" class="${BTN_CHECK} flex items-center gap-2">
        Перевірити
        <kbd class="hidden sm:inline px-1.5 py-0.5 rounded bg-surface/20 text-micro font-mono">↵</kbd>
      </button>
    </div>
    ${feedbackHtml(t.id, isDone ? "done" : null, isDone ? t.explanation : "")}`;
}

// Зводить різні апострофи й лапки до одного вигляду,
// щоб "doesn’t" з телефона чи Word зараховувалось нарівні з "doesn't".
function normalizeAnswer(s) {
  return String(s)
    .replace(/[‘’ʼ´`]/g, "'")
    .replace(/[–—]/g, "-")
    .trim().toLowerCase()
    .replace(/\s+/g, " ")
    .replace(/[.!?]+$/, "");
}

function escapeAttr(s) {
  return String(s).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/</g, "&lt;");
}

function checkGapItem(itemId) {
  const { item } = findItemById(itemId);
  if (!item) return;
  const raw = document.getElementById("inp-" + itemId).value;
  const ok = item.answers.map(normalizeAnswer).includes(normalizeAnswer(raw));
  apiRecordAttempt(item.__uuid, raw, ok);
  if (ok) {
    delete gapDraft[itemId];
    markSolved(itemId);
    rerenderItem(itemId);
    setFeedback(itemId, "ok", "Правильно! " + item.explanation);
  } else {
    setFeedback(itemId, "err", `Правильна відповідь: «${item.answers[0]}». ${item.explanation}`);
  }
}

// Якщо хвіст речення починається розділовим знаком (". ", ", "),
// не ставимо перед ним пробіл — інакше виходить «smoke here .»
function afterText(a) {
  const s = (a || "").trim();
  if (!s) return "";
  return /^[.,!?;:]/.test(s) ? s : " " + s;
}

function fillChoiceRow(row, t) {
  const isDone = solvedState[t.id];
  const shell = rowShell(t, `
    <p class="text-body-base text-text-body leading-loose">
      ${t.before || ""}<span class="inline-flex gap-1 mx-1 align-middle">${t.options.map(opt => `<button onclick="checkChoiceItem('${t.id}', '${opt.replace(/'/g, "\\'")}')" class="px-3 py-1.5 text-body-semibold rounded-xl border-2 transition-all ${isDone && opt === t.correct
        ? "bg-success-emphasis text-text-inverse border-success-emphasis shadow-sm"
        : "bg-surface text-text-secondary border-border-default hover:border-secondary hover:text-secondary hover:shadow-sm"}">${opt}</button>`).join("")}</span>${afterText(t.after)}
    </p>`);
  row.className = shell.cls;
  row.innerHTML = shell.html + feedbackHtml(t.id, isDone ? "done" : null, isDone ? t.explanation : "");
}

function checkChoiceItem(itemId, selected) {
  const { item } = findItemById(itemId);
  if (!item) return;
  const ok = selected === item.correct;
  apiRecordAttempt(item.__uuid, selected, ok);
  if (ok) {
    markSolved(itemId);
    rerenderItem(itemId);
    setFeedback(itemId, "ok", item.explanation);
  } else {
    setFeedback(itemId, "err", item.explanation);
  }
}

function fillCrossRow(row, t) {
  const isDone = solvedState[t.id];
  const shell = rowShell(t, `<span class="text-caption-bold uppercase tracking-wider text-text-muted">Приберіть зайве слово</span>`);
  row.className = shell.cls;
  row.innerHTML = `
    ${shell.html}
    <div class="flex flex-wrap items-center gap-1.5">
      ${t.words.map((w, i) => `
        <button onclick="checkCrossItem('${t.id}', ${i})"
          class="word-chip px-3 py-2 rounded-xl text-body-medium border-2 transition-all ${isDone && i === t.extraIndex
            ? "strike-word font-semibold"
            : "bg-surface border-border-default text-text-body hover:border-error hover:text-error hover:shadow-sm"}">${w}</button>`).join("")}
    </div>
    ${feedbackHtml(t.id, isDone ? "done" : null, isDone ? t.explanation : "")}`;
}

function checkCrossItem(itemId, wIdx) {
  const { item } = findItemById(itemId);
  if (!item) return;
  const ok = wIdx === item.extraIndex;
  apiRecordAttempt(item.__uuid, item.words[wIdx], ok);
  if (ok) {
    markSolved(itemId);
    rerenderItem(itemId);
    setFeedback(itemId, "ok", item.explanation);
  } else {
    setFeedback(itemId, "err", `Слово «${item.words[wIdx]}» тут потрібне. Пошукайте інше.`);
  }
}

function fillAbcdRow(row, t) {
  const isDone = solvedState[t.id];
  const shell = rowShell(t, `<p class="text-body-semibold text-text-primary leading-relaxed">${t.q}</p>`);
  row.className = shell.cls;
  row.innerHTML = `
    ${shell.html}
    <div class="grid sm:grid-cols-2 gap-2.5">
      ${t.options.map((opt, i) => {
        const right = isDone && i === t.correct;
        return `
        <button onclick="checkAbcdItem('${t.id}', ${i})"
          class="group flex items-start gap-3 text-left p-3.5 rounded-2xl border-2 transition-all ${right
            ? "bg-success-surface border-success-emphasis shadow-md"
            : "bg-surface border-border-default hover:border-secondary hover:shadow-md"}">
          <span class="flex items-center justify-center w-5 h-5 rounded-full shrink-0 mt-0.5 transition-colors ${right
            ? "bg-success-emphasis text-text-inverse"
            : "border-2 border-border-default group-hover:border-secondary"}">
            ${right ? '<svg class="w-3 h-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round"><path d="M20 6L9 17l-5-5"/></svg>' : ""}
          </span>
          <span class="text-body-medium ${right ? "text-success-emphasis font-semibold" : "text-text-secondary group-hover:text-text-primary"}">${opt}</span>
        </button>`;
      }).join("")}
    </div>
    ${feedbackHtml(t.id, isDone ? "done" : null, isDone ? t.explanation : "")}`;
}

function checkAbcdItem(itemId, oIdx) {
  const { item } = findItemById(itemId);
  if (!item) return;
  const ok = oIdx === item.correct;
  apiRecordAttempt(item.__uuid, item.options[oIdx], ok);
  if (ok) {
    markSolved(itemId);
    rerenderItem(itemId);
    setFeedback(itemId, "ok", item.explanation);
  } else {
    setFeedback(itemId, "err", item.explanation);
  }
}

// ==================== УТИЛІТИ ====================
function findItemById(itemId) {
  const exGroups = TOPICS_DATA[currentTopic].exercises;
  for (const type of Object.keys(exGroups)) {
    const found = exGroups[type].find(i => i.id === itemId);
    if (found) return { item: found, type };
  }
  return { item: null, type: null };
}

function shouldShowLevel(itemLvl) {
  if (currentStudentLevel === "all") return true;
  if (!(itemLvl in LEVEL_RANK)) return true;
  return CUMULATIVE_LEVELS
    ? LEVEL_RANK[itemLvl] <= LEVEL_RANK[currentStudentLevel]
    : itemLvl === currentStudentLevel;
}

function getTopicCounts(topicKey) {
  let total = 0, solved = 0;
  const exGroups = TOPICS_DATA[topicKey].exercises;
  Object.keys(exGroups).forEach(type => {
    exGroups[type].forEach(item => {
      if (shouldShowLevel(item.level)) {
        total++;
        if (solvedState[item.id]) solved++;
      }
    });
  });
  return { total, solved, pct: total ? Math.round((solved / total) * 100) : 0 };
}

function markSolved(itemId) {
  // Сам факт зарахування зберігається в базі як правильна спроба
  // (її вже записав apiRecordAttempt), тут лише оновлюємо екран.
  solvedState[itemId] = true;
  updateProgressUI();
  if (typeof drillRefresh === "function" && DRILL.items.some(x => x.item.id === itemId)) drillRefresh();
}

function updateProgressUI() {
  const cur = getTopicCounts(currentTopic);
  document.getElementById("progress-text").textContent = `${cur.pct}%`;
  document.getElementById("progress-bar").style.width = `${cur.pct}%`;

  Object.keys(TOPICS_DATA).forEach(k => {
    const c = getTopicCounts(k);
    const badge = document.getElementById("nav-pct-" + k);
    if (badge) badge.textContent = `${c.pct}%`;
  });

  if (currentMainTab === "practice") {
    const exercises = TOPICS_DATA[currentTopic].exercises;
    const present = GROUPS
      .map(g => ({ ...g, items: (exercises[g.type] || []).filter(i => shouldShowLevel(i.level)) }))
      .filter(g => g.items.length);
    const aside = document.getElementById("practice-aside");
    if (aside && present.length) renderPracticeAside(aside, present);
  }
}

// Доступно лише викладачеві (кнопку сховано для учнів у auth.js):
// стирає історію спроб, тож учень не може знищити статистику власних помилок.
async function resetProgress() {
  const topic = TOPICS_DATA[currentTopic];
  if (!topic) return;
  if (!confirm(`Скинути прогрес теми «${topic.title}»?\n(Інші теми залишаться без змін.)`)) return;

  const uuids = [];
  Object.values(topic.exercises).forEach(arr => arr.forEach(item => {
    uuids.push(item.__uuid);
    delete solvedState[item.id];
    delete orderState[item.id];
    delete gapDraft[item.id];
  }));

  try {
    await apiResetTopicProgress(uuids);
  } catch (e) {
    alert("Не вдалося скинути прогрес: " + (e.message || e));
    return;
  }
  if (currentMainTab === "practice") renderTopicExercises();
  updateProgressUI();
}

// ==================== РУШІЙ ====================
// Дані тем живуть у /data/*.js і реєструються у window.TOPICS_DATA.
// Цей файл не містить навчального контенту — правити його треба лише
// при зміні механік, фільтрів чи інтерфейсу.
const TOPICS_DATA = window.TOPICS_DATA || {};

let currentTopic = "adjectives"; // Початкова тема
let currentMainTab = "theory";
let currentStudentLevel = "all"; // all, elementary, intermediate, advanced
let solvedState = {};
let orderState = {};
let gapDraft = {};   // чернетки введених, але ще не перевірених відповідей у gap-полях

// true  → рівень учня показує його рівень І ВСЕ, ЩО НИЖЧЕ (Advanced бачить усе)
// false → показується РІВНО обраний рівень (Advanced бачить тільки advanced)
const CUMULATIVE_LEVELS = true;

try {
  solvedState = JSON.parse(localStorage.getItem("grammar_lab_v4_progress") || "{}");
} catch (e) {
  solvedState = {};
}

// ==================== ІНТЕРФЕЙС ТА НАВІГАЦІЯ ====================
function toggleSidebar() {
  const drawer = document.getElementById("sidebar-drawer");
  const backdrop = document.getElementById("sidebar-backdrop");
  const isHidden = drawer.classList.contains("-translate-x-full");
  if (isHidden) {
    drawer.classList.remove("-translate-x-full");
    backdrop.classList.remove("hidden");
  } else {
    drawer.classList.add("-translate-x-full");
    backdrop.classList.add("hidden");
  }
}

function changeStudentLevel(level) {
  currentStudentLevel = level;
  updateView();
}

function selectTopic(topicKey) {
  currentTopic = topicKey;
  toggleSidebar();
  updateView();
}

function switchMainTab(tab) {
  currentMainTab = tab;
  updateView();
}

// ==================== ГОЛОВНИЙ РЕНДЕР (Data-Driven) ====================
function updateView() {
  const topic = TOPICS_DATA[currentTopic];
  if (!topic) return;

  document.getElementById("current-topic-title").textContent = topic.title;

  const isTheory = currentMainTab === "theory";
  document.getElementById("section-theory").classList.toggle("hidden", !isTheory);
  document.getElementById("section-practice").classList.toggle("hidden", isTheory);

  document.getElementById("tab-btn-theory").className = isTheory
    ? "px-6 py-3 font-semibold text-sm rounded-t-xl border-b-2 border-indigo-600 text-indigo-600 bg-white"
    : "px-6 py-3 font-semibold text-sm rounded-t-xl border-b-2 border-transparent text-slate-500 hover:text-slate-800";
  document.getElementById("tab-btn-practice").className = !isTheory
    ? "px-6 py-3 font-semibold text-sm rounded-t-xl border-b-2 border-indigo-600 text-indigo-600 bg-white"
    : "px-6 py-3 font-semibold text-sm rounded-t-xl border-b-2 border-transparent text-slate-500 hover:text-slate-800";

  renderSidebar();
  if (isTheory) {
    renderTheory();
  } else {
    renderTopicExercises();
  }
  updateProgressUI();
}

function renderSidebar() {
  const container = document.getElementById("sidebar-topics-list");
  container.innerHTML = "";
  Object.keys(TOPICS_DATA).forEach(key => {
    const topic = TOPICS_DATA[key];
    const isActive = key === currentTopic;
    const btn = document.createElement("button");
    btn.onclick = () => selectTopic(key);
    btn.className = isActive 
      ? "w-full text-left px-3 py-2.5 rounded-xl font-semibold text-sm flex items-center justify-between transition bg-indigo-50 text-indigo-700" 
      : "w-full text-left px-3 py-2.5 rounded-xl font-semibold text-sm flex items-center justify-between transition text-slate-700 hover:bg-slate-100";
    
    const counts = getTopicCounts(key);
    btn.innerHTML = `
      <span class="truncate pr-2">${topic.title}</span>
      <span id="nav-pct-${key}" class="text-xs px-2 py-0.5 rounded-md flex-shrink-0 ${isActive ? 'bg-indigo-100 text-indigo-700' : 'bg-slate-100 text-slate-600'}">${counts.pct}%</span>
    `;
    container.appendChild(btn);
  });
}

function renderTheory() {
  const container = document.getElementById("section-theory");
  container.innerHTML = "";
  const theoryBlocks = TOPICS_DATA[currentTopic].theory;
  
  theoryBlocks.forEach(block => {
    if (!shouldShowLevel(block.level)) return;
    const div = document.createElement("div");
    div.className = "bg-white p-6 rounded-2xl shadow-sm border border-slate-200";
    div.innerHTML = `
      <div class="flex items-center gap-2 mb-4">
        <h2 class="text-lg sm:text-xl font-bold text-slate-900">${block.title}</h2>
      </div>
      ${block.contentHtml}
    `;
    container.appendChild(div);
  });
}

function renderTopicExercises() {
  const list = document.getElementById("exercises-list");
  list.innerHTML = "";
  const exercises = TOPICS_DATA[currentTopic].exercises;
  
  if (exercises.order) renderExerciseGroup(list, "Порядок слів", exercises.order, "order");
  if (exercises.choice) renderExerciseGroup(list, "Вибір у контексті", exercises.choice, "choice");
  if (exercises.gap) renderExerciseGroup(list, "Відкриття дужок", exercises.gap, "gap");
  if (exercises.cross) renderExerciseGroup(list, "Зайве слово", exercises.cross, "cross");
  if (exercises.abcd) renderExerciseGroup(list, "Граматичний тест", exercises.abcd, "abcd");
}

function renderExerciseGroup(container, title, items, type) {
  const visibleItems = items.filter(item => shouldShowLevel(item.level));
  if (visibleItems.length === 0) return;

  const card = document.createElement("div");
  card.className = "bg-white p-6 rounded-2xl shadow-sm border border-slate-200 mb-6";
  card.innerHTML = `
    <div class="mb-4 flex items-center justify-between">
      <h3 class="text-lg font-bold text-slate-900">${title}</h3>
      <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider">${visibleItems.length} items</span>
    </div>
    <div id="ex-body-${type}" class="space-y-3"></div>
  `;
  container.appendChild(card);
  const body = card.querySelector(`#ex-body-${type}`);

  visibleItems.forEach(t => {
    const row = document.createElement("div");
    row.id = "row-" + t.id;
    fillRow(row, t, type);
    body.appendChild(row);
  });
}

// Перемальовує ОДНУ вправу, не чіпаючи решту сторінки.
// Саме це зберігає текст, уже введений учнем в інші поля.
function rerenderItem(itemId) {
  const found = findItemById(itemId);
  if (!found || !found.item) return;
  const row = document.getElementById("row-" + itemId);
  if (!row) return;
  fillRow(row, found.item, found.type);
}

function fillRow(row, t, type) {
  if (type === "order") return fillOrderRow(row, t);
  if (type === "gap") return fillGapRow(row, t);
  if (type === "choice") return fillChoiceRow(row, t);
  if (type === "cross") return fillCrossRow(row, t);
  if (type === "abcd") return fillAbcdRow(row, t);
}

// ==================== РЕНДЕР ТА ЛОГІКА МЕХАНІК ====================
function fillOrderRow(row, t) {
  {
    if (!orderState[t.id]) {
      orderState[t.id] = { selected: [], pool: [...t.scrambled] };
    }
    const st = orderState[t.id];
    const isDone = solvedState[t.id];

    row.className = "p-4 rounded-xl border " + (isDone ? "bg-emerald-50/40 border-emerald-200" : "bg-slate-50 border-slate-200");
    row.innerHTML = `
      <div class="flex flex-wrap items-center gap-2 mb-2.5">
        <span class="font-bold text-sm text-slate-700">${t.prefix || ''}</span>
        <div class="flex flex-wrap gap-1.5 min-h-[36px] px-3 py-1 bg-white border border-dashed border-slate-300 rounded-lg items-center flex-1">
          ${st.selected.length === 0 ? '<span class="text-xs text-slate-400">Натискай на слова нижче...</span>' : ''}
          ${st.selected.map((w, wIdx) => `<button onclick="removeOrderWord('${t.id}', ${wIdx})" class="word-chip bg-indigo-600 text-white text-xs sm:text-sm px-2.5 py-1 rounded-md font-medium">${w} ✕</button>`).join('')}
        </div>
        <button onclick="checkOrderItem('${t.id}')" class="bg-slate-900 hover:bg-indigo-600 text-white text-xs font-semibold px-3.5 py-2 rounded-lg transition">Перевірити</button>
      </div>
      <div class="flex flex-wrap gap-1.5">
        ${st.pool.map((w, pIdx) => `<button onclick="pickOrderWord('${t.id}', ${pIdx})" class="word-chip bg-white border border-slate-300 hover:border-indigo-500 text-slate-700 text-xs sm:text-sm px-2.5 py-1 rounded-lg shadow-sm">${w}</button>`).join('')}
      </div>
      <div id="fb-${t.id}" class="text-xs mt-2 font-medium ${isDone ? 'text-emerald-700' : 'hidden'}">${isDone ? '✅ Правильно: ' + t.answer : ''}</div>
    `;
  }
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
  const fb = document.getElementById("fb-" + itemId);
  fb.classList.remove("hidden");
  if (userStr === item.answer || (item.altAnswer && userStr === item.altAnswer)) {
    fb.className = "text-xs mt-2 font-semibold text-emerald-600";
    fb.textContent = "✅ Правильно! " + item.hint;
    markSolved(itemId);
  } else {
    fb.className = "text-xs mt-2 font-semibold text-rose-600";
    fb.textContent = "❌ Помилка порядку. Підказка: " + item.hint;
  }
}

function fillGapRow(row, t) {
  {
    const isDone = solvedState[t.id];
    row.className = "p-3.5 rounded-xl border " + (isDone ? "bg-emerald-50/40 border-emerald-200" : "bg-slate-50 border-slate-200");
    row.innerHTML = `
      <label class="block text-sm font-medium text-slate-800 mb-2">${t.prompt}</label>
      <div class="flex flex-wrap gap-2">
        <input type="text" id="inp-${t.id}" value="${escapeAttr(isDone ? t.answers[0] : (gapDraft[t.id] || ''))}" placeholder="Впиши відповідь..."
          oninput="gapDraft['${t.id}'] = this.value"
          onkeydown="if(event.key==='Enter') checkGapItem('${t.id}')"
          class="flex-1 min-w-[200px] max-w-sm px-3 py-1.5 text-sm border border-slate-300 rounded-lg focus:outline-none focus:border-indigo-600 bg-white">
        <button onclick="checkGapItem('${t.id}')" class="bg-slate-900 hover:bg-indigo-600 text-white text-xs font-semibold px-4 py-1.5 rounded-lg transition">Перевірити</button>
      </div>
      <p id="fb-${t.id}" class="text-xs mt-2 ${isDone ? 'text-emerald-700 font-medium' : 'hidden'}">${isDone ? '✅ ' + t.explanation : ''}</p>
    `;
  }
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
  const val = normalizeAnswer(raw);
  const fb = document.getElementById("fb-" + itemId);
  fb.classList.remove("hidden");
  if (item.answers.map(normalizeAnswer).includes(val)) {
    fb.className = "text-xs mt-2 text-emerald-600 font-semibold";
    fb.textContent = "✅ Правильно! " + item.explanation;
    delete gapDraft[itemId];
    markSolved(itemId);
  } else {
    fb.className = "text-xs mt-2 text-rose-600 font-medium";
    fb.textContent = `❌ Правильна відповідь: "${item.answers[0]}". (${item.explanation})`;
  }
}

// Якщо хвіст речення починається розділовим знаком (". ", ", "),
// не ставимо перед ним пробіл — інакше виходить «smoke here .»
function afterText(a) {
  const s = (a || '').trim();
  if (!s) return '';
  return /^[.,!?;:]/.test(s) ? s : ' ' + s;
}

function fillChoiceRow(row, t) {
  {
    const isDone = solvedState[t.id];
    row.className = "p-3.5 rounded-xl border " + (isDone ? "bg-emerald-50/40 border-emerald-200" : "bg-slate-50 border-slate-200");
    row.innerHTML = `
      <p class="text-sm text-slate-800 leading-relaxed">
        ${t.before || ''}
        <span class="inline-flex gap-1 mx-1">${t.options.map(opt => `<button onclick="checkChoiceItem('${t.id}', '${opt.replace(/'/g, "\\'")}')" class="px-2.5 py-0.5 text-sm font-semibold rounded border transition ${isDone && opt === t.correct ? 'bg-emerald-600 text-white border-emerald-600' : 'bg-white text-slate-700 border-slate-300 hover:border-indigo-500'}">${opt}</button>`).join('')}</span>${afterText(t.after)}
      </p>
      <p id="fb-${t.id}" class="text-xs mt-1.5 ${isDone ? 'text-emerald-700 font-medium' : 'hidden'}">${isDone ? '✅ ' + t.explanation : ''}</p>
    `;
  }
}

function checkChoiceItem(itemId, selected) {
  const { item } = findItemById(itemId);
  if (!item) return;
  const fb = document.getElementById("fb-" + itemId);
  fb.classList.remove("hidden");
  if (selected === item.correct) {
    markSolved(itemId);
    rerenderItem(itemId);
  } else {
    fb.className = "text-xs mt-1.5 text-rose-600 font-medium";
    fb.textContent = "❌ Помилка. " + item.explanation;
  }
}

function fillCrossRow(row, t) {
  {
    const isDone = solvedState[t.id];
    row.className = "p-4 rounded-xl border " + (isDone ? "bg-emerald-50/40 border-emerald-200" : "bg-slate-50 border-slate-200");
    row.innerHTML = `
      <div class="flex flex-wrap items-center gap-1.5 mb-2">
        ${t.words.map((w, wIdx) => `
          <button onclick="checkCrossItem('${t.id}', ${wIdx})"
            class="px-2 py-1 rounded text-sm font-medium transition ${isDone && wIdx === t.extraIndex ? 'strike-word font-bold' : 'bg-white hover:bg-rose-50 border border-slate-200'}">
            ${w}
          </button>
        `).join('')}
      </div>
      <p id="fb-${t.id}" class="text-xs mt-2 ${isDone ? 'text-emerald-700 font-medium' : 'hidden'}">${isDone ? '✅ Знайдено зайве слово! ' + t.explanation : ''}</p>
    `;
  }
}

function checkCrossItem(itemId, wIdx) {
  const { item } = findItemById(itemId);
  if (!item) return;
  const fb = document.getElementById("fb-" + itemId);
  fb.classList.remove("hidden");
  if (wIdx === item.extraIndex) {
    markSolved(itemId);
    rerenderItem(itemId);
  } else {
    fb.className = "text-xs mt-2 text-rose-600 font-medium";
    fb.textContent = `❌ Слово "${item.words[wIdx]}" тут потрібне! Пошукай інше.`;
  }
}

function fillAbcdRow(row, t) {
  {
    const isDone = solvedState[t.id];
    row.className = "p-4 rounded-xl border " + (isDone ? "bg-emerald-50/40 border-emerald-200" : "bg-slate-50 border-slate-200");
    row.innerHTML = `
      <p class="font-semibold text-sm text-slate-900 mb-3">${t.q}</p>
      <div class="grid sm:grid-cols-2 gap-2">
        ${t.options.map((opt, oIdx) => `
          <button onclick="checkAbcdItem('${t.id}', ${oIdx})"
            class="text-left px-3 py-2 rounded-lg text-sm border font-medium transition ${isDone && oIdx === t.correct ? 'bg-emerald-600 text-white border-emerald-600' : 'bg-white hover:border-indigo-500 border-slate-200 text-slate-700'}">
            ${opt}
          </button>
        `).join('')}
      </div>
      <p id="fb-${t.id}" class="text-xs mt-2 ${isDone ? 'text-emerald-700 font-medium' : 'hidden'}">${isDone ? '✅ ' + t.explanation : ''}</p>
    `;
  }
}

function checkAbcdItem(itemId, oIdx) {
  const { item } = findItemById(itemId);
  if (!item) return;
  const fb = document.getElementById("fb-" + itemId);
  fb.classList.remove("hidden");
  if (oIdx === item.correct) {
    markSolved(itemId);
    rerenderItem(itemId);
  } else {
    fb.className = "text-xs mt-2 text-rose-600 font-medium";
    fb.textContent = "❌ Неправильно. " + item.explanation;
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

const LEVEL_RANK = { elementary: 0, intermediate: 1, advanced: 2 };

function shouldShowLevel(itemLvl) {
  if (currentStudentLevel === "all") return true;
  if (!(itemLvl in LEVEL_RANK)) return true;
  return CUMULATIVE_LEVELS
    ? LEVEL_RANK[itemLvl] <= LEVEL_RANK[currentStudentLevel]
    : itemLvl === currentStudentLevel;
}

function getTopicCounts(topicKey) {
  let total = 0;
  let solved = 0;
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
  solvedState[itemId] = true;
  try {
    localStorage.setItem("grammar_lab_v4_progress", JSON.stringify(solvedState));
  } catch (e) {}
  updateProgressUI();
}

function updateProgressUI() {
  const cur = getTopicCounts(currentTopic);
  document.getElementById("progress-text").textContent = `${cur.pct}% (${cur.solved}/${cur.total})`;
  document.getElementById("progress-bar").style.width = `${cur.pct}%`;

  Object.keys(TOPICS_DATA).forEach(k => {
    const c = getTopicCounts(k);
    const badge = document.getElementById("nav-pct-" + k);
    if (badge) badge.textContent = `${c.pct}%`;
  });
}

function resetProgress() {
  const topic = TOPICS_DATA[currentTopic];
  if (!confirm(`Скинути прогрес теми «${topic.title}»?\n(Інші теми залишаться без змін.)`)) return;
  const exGroups = topic.exercises;
  Object.keys(exGroups).forEach(type => {
    exGroups[type].forEach(item => {
      delete solvedState[item.id];
      delete orderState[item.id];
      delete gapDraft[item.id];
    });
  });
  try {
    localStorage.setItem("grammar_lab_v4_progress", JSON.stringify(solvedState));
  } catch (e) {}
  if (currentMainTab === 'practice') {
    renderTopicExercises();
  }
  updateProgressUI();
}

window.onload = function() {
  updateView();
};
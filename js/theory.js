// ==================== ТЕОРІЯ ====================
// Блок теорії має тип (kind). 'prose' — старий HTML як є, решта —
// структуровані дані з content_json, з яких малюється верстка кроку.
//
// Правило рівнів: elementary відкрито одразу, intermediate і advanced
// згорнуті у випадні блоки з позначкою рівня. Те, що вище дозволеного
// викладачем рівня, сюди взагалі не доходить — його відсікає база.

const THEORY_TONES = {
  opinion:  { chip: "bg-indigo-50 text-indigo-700 border-indigo-200", dot: "bg-indigo-500" },
  size:     { chip: "bg-sky-50 text-sky-700 border-sky-200",          dot: "bg-sky-500" },
  age:      { chip: "bg-teal-50 text-teal-700 border-teal-200",       dot: "bg-teal-500" },
  colour:   { chip: "bg-amber-50 text-amber-800 border-amber-200",    dot: "bg-amber-500" },
  origin:   { chip: "bg-rose-50 text-rose-700 border-rose-200",       dot: "bg-rose-500" },
  material: { chip: "bg-violet-50 text-violet-700 border-violet-200", dot: "bg-violet-500" },
  noun:     { chip: "bg-slate-100 text-slate-700 border-slate-300",   dot: "bg-slate-500" },
  neutral:  { chip: "bg-surface-subtle text-text-secondary border-border-default", dot: "bg-text-tertiary" },
};
const tone = t => THEORY_TONES[t] || THEORY_TONES.neutral;

const LEVEL_BADGE = {
  elementary:   { label: "Базовий",      cls: "bg-success-surface text-success-emphasis" },
  intermediate: { label: "Середній",     cls: "bg-interactive-subtle text-secondary" },
  advanced:     { label: "Поглиблений",  cls: "bg-warning-surface text-warning" },
};

function esc(s) {
  return String(s ?? "").replace(/[&<>"]/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]));
}

// Текст англійською можна прослухати голосом браузера.
function speak(text) {
  if (!("speechSynthesis" in window)) return;
  speechSynthesis.cancel();
  const u = new SpeechSynthesisUtterance(text);
  u.lang = "en-GB";
  u.rate = 0.9;
  speechSynthesis.speak(u);
}

function speakBtn(text) {
  return `<button onclick="speak(this.dataset.t)" data-t="${esc(text)}" title="Прослухати"
    class="shrink-0 w-7 h-7 rounded-lg bg-surface-subtle hover:bg-secondary hover:text-text-inverse text-text-muted flex items-center justify-center transition">
    <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 5L6 9H2v6h4l5 4V5zM15.5 8.5a5 5 0 010 7M19 5a9 9 0 010 14"/></svg>
  </button>`;
}

const sectionHeader = (kicker, title, lead) => `
  <div class="mb-5">
    ${kicker ? `<div class="text-caption-bold uppercase tracking-wider text-secondary mb-1.5">${esc(kicker)}</div>` : ""}
    <h2 class="text-display-title font-bold text-text-primary tracking-tight">${esc(title)}</h2>
    ${lead ? `<p class="text-body-base text-text-muted mt-1.5 max-w-2xl">${esc(lead)}</p>` : ""}
  </div>`;

// ---------- типи блоків ----------

function renderHero(b, topic, stats) {
  const d = b.data || {};
  const chips = (d.chips || []).map(c =>
    `<span class="text-micro font-semibold px-2.5 py-1 rounded-full bg-interactive-subtle text-secondary">${esc(c)}</span>`).join("");
  const diagram = (d.diagram || []).map((row, i) => `
    ${i ? '<div class="text-text-tertiary text-center text-caption-bold">+</div>' : ""}
    <div class="rounded-xl border ${tone(row.tone).chip} px-3 py-2 text-center">
      <div class="text-micro uppercase tracking-wider opacity-80">${esc(row.role || "")}</div>
      <div class="font-mono text-body-semibold">${esc(row.label)}</div>
    </div>`).join("");

  return `
    <section class="bg-surface border border-border-default rounded-2xl p-6 sm:p-8 shadow-sm mb-8">
      <div class="grid lg:grid-cols-2 gap-6 items-center">
        <div>
          <div class="flex flex-wrap gap-1.5 mb-3">${chips}</div>
          <h1 class="text-3xl sm:text-4xl font-bold text-text-primary tracking-tight leading-tight">${esc(d.title || topic.title)}</h1>
          <p class="text-body-base text-text-secondary mt-3 max-w-xl leading-relaxed">${d.lead || ""}</p>
          <div class="flex flex-wrap gap-2 mt-5">
            <button onclick="scrollToStep(0)" class="flex items-center gap-2 bg-text-primary hover:bg-secondary text-text-inverse text-body-semibold px-4 py-2.5 rounded-xl transition shadow-sm">
              Почати розбір
              <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
            </button>
            <button onclick="switchMainTab('practice')" class="bg-surface-subtle hover:bg-surface-muted text-text-primary text-body-semibold px-4 py-2.5 rounded-xl transition">
              Одразу до вправ${stats.total ? ` · ${stats.total}` : ""}
            </button>
          </div>
        </div>
        ${diagram ? `
        <div class="bg-surface-subtle rounded-2xl p-5 border border-border-default">
          <div class="text-caption-bold uppercase tracking-wider text-text-muted mb-3 text-center">${esc(d.diagramTitle || "Формула")}</div>
          <div class="flex flex-col gap-2">${diagram}</div>
          ${d.diagramNote ? `<p class="text-caption-xs text-text-muted text-center mt-3">${d.diagramNote}</p>` : ""}
        </div>` : ""}
      </div>
    </section>`;
}

function renderCases(b, idx, total) {
  const d = b.data || {};
  const cards = (d.cards || []).map(c => `
    <div class="bg-surface border border-border-default rounded-2xl p-5 hover:border-secondary/50 hover:shadow-md transition">
      <div class="w-9 h-9 rounded-xl bg-interactive-subtle text-secondary flex items-center justify-center mb-3 text-heading-md">${esc(c.icon || "•")}</div>
      <h3 class="text-heading-md font-semibold text-text-primary mb-1">${esc(c.title)}</h3>
      <p class="text-body-sm text-text-muted leading-relaxed mb-3">${c.text || ""}</p>
      ${c.example ? `
        <div class="flex items-center gap-2 bg-surface-subtle rounded-lg px-3 py-2">
          <code class="font-mono text-caption-xs text-text-primary flex-1">${c.example}</code>
          ${speakBtn(c.examplePlain || String(c.example).replace(/<[^>]+>/g, ""))}
        </div>` : ""}
    </div>`).join("");

  const axis = d.axis ? `
    <div class="bg-surface border border-border-default rounded-2xl p-5 mt-4">
      <div class="text-caption-bold uppercase tracking-wider text-text-muted mb-4">${esc(d.axis.title || "")}</div>
      <div class="relative">
        <div class="absolute left-0 right-0 top-[13px] h-0.5 bg-surface-muted"></div>
        <div class="relative grid" style="grid-template-columns: repeat(${d.axis.points.length}, minmax(0,1fr))">
          ${d.axis.points.map((p, i) => `
            <div class="flex flex-col items-center text-center px-1">
              <div class="w-3.5 h-3.5 rounded-full border-2 border-surface ${i === d.axis.points.length - 1 ? "bg-surface ring-2 ring-secondary" : "bg-secondary"} mb-2.5"></div>
              <div class="text-micro uppercase tracking-wider text-text-tertiary">${esc(p.label || "")}</div>
              <div class="text-caption-xs text-text-secondary mt-0.5 leading-snug">${p.text || ""}</div>
            </div>`).join("")}
        </div>
      </div>
      ${d.axis.note ? `<p class="text-caption-xs text-text-muted text-center mt-4 pt-3 border-t border-border-default">${d.axis.note}</p>` : ""}
    </div>` : "";

  return `
    ${sectionHeader(`Крок ${idx} / ${total} · ${d.kicker || "Базове розуміння"}`, b.title, d.lead)}
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-3">${cards}</div>
    ${axis}`;
}

function renderFormula(b, idx, total) {
  const d = b.data || {};
  const tiles = (d.tiles || []).map((t, i) => `
    ${i ? '<div class="flex items-center text-text-tertiary font-bold shrink-0">→</div>' : ""}
    <div class="rounded-xl border px-3 py-2 text-center shrink-0 ${tone(t.tone).chip}">
      <div class="text-micro uppercase tracking-wider opacity-80">${esc(t.role || "")}</div>
      <div class="font-mono text-body-semibold whitespace-nowrap">${esc(t.label)}</div>
    </div>`).join("");

  const examples = (d.examples || []).map(e => `
    <div class="flex items-center gap-2.5 bg-surface-subtle rounded-xl px-3.5 py-2.5">
      ${speakBtn(e.plain || String(e.text).replace(/<[^>]+>/g, ""))}
      <code class="font-mono text-body-sm text-text-primary flex-1 leading-relaxed">${e.text}</code>
      ${e.note ? `<span class="text-caption-xs text-text-muted hidden sm:block">${esc(e.note)}</span>` : ""}
    </div>`).join("");

  const legend = (d.legend || []).map(l =>
    `<span class="flex items-center gap-1.5 text-caption-xs text-text-secondary">
       <span class="w-2 h-2 rounded-full ${tone(l.tone).dot}"></span>${esc(l.label)}
     </span>`).join("");

  const tabsId = "tabs-" + b.id;
  const tabs = (d.tabs || []);
  const tabsHtml = tabs.length ? `
    <div class="mt-5" id="${tabsId}">
      <div class="flex flex-wrap gap-1 p-1 bg-surface-subtle rounded-xl mb-3">
        ${tabs.map((t, i) => `
          <button onclick="switchTheoryTab('${tabsId}', ${i})" data-tab="${i}"
            class="tab-pill px-3.5 py-2 rounded-lg text-caption-bold transition ${i === 0 ? "bg-surface text-secondary shadow-sm" : "text-text-muted hover:text-text-primary"}">${esc(t.title)}</button>`).join("")}
      </div>
      ${tabs.map((t, i) => `
        <div data-pane="${i}" class="${i === 0 ? "" : "hidden"} bg-surface border border-border-default rounded-2xl p-5">${t.html}</div>`).join("")}
    </div>` : "";

  return `
    ${sectionHeader(`Крок ${idx} / ${total} · ${d.kicker || "Архітектура"}`, b.title, d.lead)}
    <div class="bg-surface border border-border-default rounded-2xl p-5 sm:p-6">
      <div class="flex flex-wrap items-stretch gap-2 mb-4 overflow-x-auto pb-1">${tiles}</div>
      ${legend ? `<div class="flex flex-wrap gap-x-4 gap-y-1.5 mb-4 pb-4 border-b border-border-default">${legend}</div>` : ""}
      <div class="space-y-2">${examples}</div>
      ${d.note ? `
        <div class="flex items-start gap-2.5 mt-4 bg-interactive-subtle rounded-xl px-3.5 py-3">
          <svg class="w-4 h-4 text-secondary shrink-0 mt-0.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="9"/><path d="M12 16v-4M12 8h.01"/></svg>
          <p class="text-body-sm text-text-secondary leading-relaxed">${d.note}</p>
        </div>` : ""}
    </div>
    ${tabsHtml}`;
}

function switchTheoryTab(wrapId, idx) {
  const wrap = document.getElementById(wrapId);
  if (!wrap) return;
  wrap.querySelectorAll(".tab-pill").forEach((b, i) => {
    b.className = "tab-pill px-3.5 py-2 rounded-lg text-caption-bold transition " +
      (i === idx ? "bg-surface text-secondary shadow-sm" : "text-text-muted hover:text-text-primary");
  });
  wrap.querySelectorAll("[data-pane]").forEach((p, i) => p.classList.toggle("hidden", i !== idx));
}

function renderTraps(b, idx, total) {
  const d = b.data || {};
  const items = (d.items || []).map(t => `
    <div class="bg-surface border border-border-default rounded-2xl overflow-hidden">
      <div class="px-4 py-3 border-b border-border-default">
        <div class="text-body-semibold text-text-primary">${esc(t.title)}</div>
      </div>
      <div class="px-4 py-3 bg-error-surface border-b border-error-border">
        <div class="flex items-center gap-1.5 text-micro font-bold uppercase tracking-wider text-error mb-1">
          <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M6 6l12 12M18 6L6 18"/></svg>
          Калька
        </div>
        <code class="font-mono text-caption-xs text-error-emphasis line-through">${t.bad}</code>
      </div>
      <div class="px-4 py-3 bg-success-surface border-b border-success-border">
        <div class="flex items-center gap-1.5 text-micro font-bold uppercase tracking-wider text-success-emphasis mb-1">
          <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M20 6L9 17l-5-5"/></svg>
          Норма
        </div>
        <div class="flex items-center gap-2">
          <code class="font-mono text-caption-xs text-success-emphasis flex-1">${t.good}</code>
          ${speakBtn(t.goodPlain || String(t.good).replace(/<[^>]+>/g, ""))}
        </div>
      </div>
      <div class="px-4 py-3 bg-warning-surface">
        <span class="text-caption-xs text-text-secondary leading-relaxed"><b class="text-text-primary">Правило:</b> ${t.rule}</span>
      </div>
    </div>`).join("");

  return `
    ${sectionHeader(`Крок ${idx} / ${total} · ${d.kicker || "Типові помилки"}`, b.title, d.lead)}
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-3">${items}</div>`;
}

// Блок вищого рівня: згорнутий, з позначкою рівня.
function renderCollapsible(b) {
  const badge = LEVEL_BADGE[b.level] || LEVEL_BADGE.intermediate;
  return `
    <details class="group bg-surface border border-border-default rounded-2xl overflow-hidden transition hover:border-secondary/40">
      <summary class="flex items-center justify-between gap-3 px-5 py-4 cursor-pointer list-none">
        <div class="flex items-center gap-3 min-w-0">
          <svg class="w-4 h-4 text-text-tertiary shrink-0 transition-transform group-open:rotate-90" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M9 18l6-6-6-6"/></svg>
          <span class="text-heading-md font-semibold text-text-primary truncate">${esc(b.title)}</span>
        </div>
        <span class="shrink-0 text-micro font-semibold px-2 py-1 rounded-full ${badge.cls}">${badge.label}</span>
      </summary>
      <div class="px-5 pb-5 pt-1 border-t border-border-default theory-body">${b.contentHtml || ""}</div>
    </details>`;
}

function renderProse(b) {
  return `
    <article class="bg-surface border border-border-default rounded-2xl p-6 shadow-sm">
      <h2 class="text-heading-lg font-bold text-text-primary mb-4">${esc(b.title)}</h2>
      <div class="theory-body">${b.contentHtml || ""}</div>
    </article>`;
}

// ---------- збірка сторінки ----------

let THEORY_STEPS = [];

function scrollToStep(i) {
  const el = document.getElementById("step-" + i);
  if (el) el.scrollIntoView({ behavior: "smooth", block: "start" });
}

function renderTheoryPage(topic, blocks, stats) {
  const hero = blocks.find(b => b.kind === "hero");
  const rich = blocks.filter(b => b.kind !== "hero" && b.kind !== "prose");
  // Блоки вище базового рівня йдуть у «Глибше» як випадні списки.
  const deeper = blocks.filter(b => b.kind === "prose" && b.level !== "elementary");
  const plain = blocks.filter(b => b.kind === "prose" && b.level === "elementary");

  // Якщо тема ще не переписана у новий формат — показуємо як було,
  // але з випадними блоками для вищих рівнів.
  if (!hero && !rich.length) {
    return {
      html: plain.map(renderProse).join('<div class="h-5"></div>') +
        (deeper.length ? `<div class="mt-8">${sectionHeader("", "Глибше", "Матеріал вищих рівнів — розгорніть, коли база засвоєна.")}
          <div class="space-y-2.5">${deeper.map(renderCollapsible).join("")}</div></div>` : ""),
      steps: [],
    };
  }

  const steps = [];
  const parts = [];
  if (hero) parts.push(renderHero(hero, topic, stats));

  const totalSteps = rich.length + (stats.total ? 1 : 0) + (deeper.length ? 1 : 0);
  let n = 0;

  for (const b of rich) {
    const d = b.data || {};
    const i = n++;
    steps.push({ i, label: d.step || b.title });
    const body = b.kind === "cases" ? renderCases(b, i + 1, totalSteps)
      : b.kind === "formula" ? renderFormula(b, i + 1, totalSteps)
      : b.kind === "traps" ? renderTraps(b, i + 1, totalSteps)
      : renderProse(b);
    parts.push(`<section id="step-${i}" class="scroll-mt-36 mb-10">${body}</section>`);
  }

  if (plain.length) parts.push(plain.map(renderProse).join('<div class="h-5"></div>'));

  if (stats.total) {
    const i = n++;
    steps.push({ i, label: "Практика" });
    parts.push(`<section id="step-${i}" class="scroll-mt-36 mb-10">${renderDrillShell(i + 1, totalSteps)}</section>`);
  }

  if (deeper.length) {
    const i = n++;
    steps.push({ i, label: "Глибше" });
    parts.push(`
      <section id="step-${i}" class="scroll-mt-36 mb-10">
        ${sectionHeader(`Крок ${i + 1} / ${totalSteps} · Тонкощі та винятки`, "Глибше: коли база вже засвоєна",
          "Матеріал вищих рівнів. Розгорніть те, що потрібно саме зараз.")}
        <div class="space-y-2.5">${deeper.map(renderCollapsible).join("")}</div>
      </section>`);
  }

  return { html: parts.join(""), steps };
}

// Липка навігація кроками
function renderStepNav(steps) {
  if (!steps.length) return "";
  return `
    <div class="sticky top-16 z-20 -mx-4 sm:-mx-6 px-4 sm:px-6 py-2.5 bg-background/90 backdrop-blur-md mb-6">
      <div class="flex gap-1.5 overflow-x-auto pb-0.5">
        ${steps.map(s => `
          <button onclick="scrollToStep(${s.i})" data-step="${s.i}"
            class="step-pill shrink-0 flex items-center gap-2 px-3.5 py-2 rounded-xl text-caption-bold border transition
                   bg-surface border-border-default text-text-secondary hover:border-secondary hover:text-secondary">
            <span class="w-4 h-4 rounded-full bg-surface-subtle text-text-muted flex items-center justify-center text-micro">${s.i + 1}</span>
            ${esc(s.label)}
          </button>`).join("")}
      </div>
    </div>`;
}

// Підсвічує крок, який зараз на екрані
function initStepSpy(steps) {
  if (window.__stepSpy) window.removeEventListener("scroll", window.__stepSpy);
  if (!steps.length) return;
  const onScroll = () => {
    const y = window.scrollY + 180;
    let active = steps[0].i;
    for (const s of steps) {
      const el = document.getElementById("step-" + s.i);
      if (el && el.offsetTop <= y) active = s.i;
    }
    document.querySelectorAll(".step-pill").forEach(b => {
      const on = Number(b.dataset.step) === active;
      b.className = "step-pill shrink-0 flex items-center gap-2 px-3.5 py-2 rounded-xl text-caption-bold border transition " +
        (on ? "bg-text-primary border-text-primary text-text-inverse"
            : "bg-surface border-border-default text-text-secondary hover:border-secondary hover:text-secondary");
      const num = b.querySelector("span");
      if (num) num.className = "w-4 h-4 rounded-full flex items-center justify-center text-micro " +
        (on ? "bg-text-inverse/20 text-text-inverse" : "bg-surface-subtle text-text-muted");
    });
  };
  window.__stepSpy = onScroll;
  window.addEventListener("scroll", onScroll, { passive: true });
  onScroll();
}

// ---------- міні-дриль із реальних вправ теми ----------
// Бере вправи з бази, показує по одній, відповіді записуються
// у статистику так само, як на вкладці «Вправи».

let DRILL = { items: [], idx: 0 };

function pickDrillItems(topic, limit = 4) {
  const order = ["choice", "abcd", "gap", "cross", "order"];
  const all = [];
  for (const type of order) {
    for (const it of (topic.exercises[type] || [])) {
      if (shouldShowLevel(it.level)) all.push({ item: it, type });
    }
  }
  // спершу нерозвʼязані й простіші
  const rank = { elementary: 0, intermediate: 1, advanced: 2 };
  all.sort((a, b) =>
    (solvedState[a.item.id] ? 1 : 0) - (solvedState[b.item.id] ? 1 : 0) ||
    rank[a.item.level] - rank[b.item.level]);
  return all.slice(0, limit);
}

function renderDrillShell(step, total) {
  return `
    <div class="bg-text-primary rounded-2xl p-5 sm:p-7 shadow-lg">
      <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-5">
        <div>
          <div class="text-caption-bold uppercase tracking-wider text-text-inverse/50 mb-1">Крок ${step} / ${total} · Інтерактивна перевірка</div>
          <h2 class="text-heading-xl font-bold text-text-inverse">Дриль по гарячих слідах</h2>
        </div>
        <div class="flex items-center gap-4">
          <div class="flex gap-1.5" id="drill-dots"></div>
          <div class="text-right">
            <div class="text-caption-bold text-text-inverse/60 mb-1" id="drill-score">0 / 0</div>
            <div class="w-24 h-1.5 rounded-full bg-text-inverse/15 overflow-hidden">
              <div id="drill-bar" class="h-full bg-emerald-400 rounded-full transition-all duration-300" style="width:0%"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="bg-surface rounded-2xl p-4 sm:p-5">
        <div class="flex flex-wrap items-center gap-2 mb-3" id="drill-head"></div>
        <div id="drill-slot"></div>
      </div>
      <div class="flex items-center justify-between gap-3 mt-4">
        <button onclick="drillGo(DRILL.idx - 1)" class="text-caption-bold text-text-inverse/60 hover:text-text-inverse px-3 py-2 rounded-lg transition">← Попередня</button>
        <button onclick="switchMainTab('practice')" class="text-caption-bold text-text-inverse/60 hover:text-text-inverse px-3 py-2 rounded-lg transition">Усі вправи теми →</button>
        <button onclick="drillGo(DRILL.idx + 1)" class="flex items-center gap-1.5 bg-text-inverse hover:bg-emerald-400 text-text-primary text-caption-bold px-4 py-2 rounded-xl transition">
          Наступна
          <svg class="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
        </button>
      </div>
    </div>`;
}

function mountDrill(topic) {
  DRILL = { items: pickDrillItems(topic), idx: 0 };
  if (!DRILL.items.length) return;
  drillGo(0);
}

function drillGo(i) {
  if (!DRILL.items.length) return;
  DRILL.idx = (i + DRILL.items.length) % DRILL.items.length;
  const slot = document.getElementById("drill-slot");
  if (!slot) return;
  const { item, type } = DRILL.items[DRILL.idx];
  const row = document.createElement("div");
  row.id = "row-" + item.id;
  fillRow(row, item, type);
  // всередині дриля вправа вже лежить на білій картці — прибираємо другу рамку
  row.classList.remove("bg-surface-subtle", "border-transparent", "border", "p-4");
  row.classList.add("p-0");
  slot.innerHTML = "";
  slot.appendChild(row);

  const head = document.getElementById("drill-head");
  if (head) {
    const g = GROUPS.find(x => x.type === type) || {};
    head.innerHTML = `
      <span class="text-micro font-bold uppercase tracking-wider px-2.5 py-1 rounded-full bg-interactive-subtle text-secondary">${esc(g.title || type)}</span>
      <span class="text-caption-xs text-text-muted">${esc(g.hint || "")}</span>
      <span class="ml-auto text-caption-xs text-text-tertiary">${DRILL.idx + 1} з ${DRILL.items.length}</span>`;
  }
  drillRefresh();
}

function drillRefresh() {
  const dots = document.getElementById("drill-dots");
  const score = document.getElementById("drill-score");
  const bar = document.getElementById("drill-bar");
  if (!dots) return;
  const done = DRILL.items.filter(x => solvedState[x.item.id]).length;
  dots.innerHTML = DRILL.items.map((x, i) => {
    const ok = solvedState[x.item.id];
    const cur = i === DRILL.idx;
    return `<button onclick="drillGo(${i})" title="Вправа ${i + 1}"
      class="w-7 h-7 rounded-lg text-caption-bold transition ${ok ? "bg-emerald-400 text-text-primary"
        : cur ? "bg-text-inverse text-text-primary" : "bg-text-inverse/15 text-text-inverse/70 hover:bg-text-inverse/25"}">${i + 1}</button>`;
  }).join("");
  if (score) score.textContent = `${done} / ${DRILL.items.length}`;
  if (bar) bar.style.width = (done / DRILL.items.length * 100) + "%";
}

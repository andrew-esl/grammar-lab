// ==================== СИСТЕМА ОФОРМЛЕННЯ ====================
// Токени дизайн-системи «Ocean Mist» (Google Stitch): кольори, шрифти, розміри.
// Підключається ОДРАЗУ ПІСЛЯ скрипта Tailwind і до решти наших скриптів.
// Стандартна палітра Tailwind (slate, indigo…) лишається доступною,
// бо ми тільки розширюємо тему — старі класи в теорії з бази не ламаються.

// Усі кольори — це CSS-змінні (--c-назва = "r g b"), значення яких задає обрана палітра
// з js/palettes.js. Тому перемикання палітри не потребує жодної правки верстки,
// а класи з прозорістю (bg-secondary/40 тощо) далі працюють.
const cv = n => `rgb(var(--c-${n}) / <alpha-value>)`;

tailwind.config = {
  darkMode: "class",
  theme: {
    extend: {
      colors: {
        // поверхні
        background: cv("background"),
        surface: cv("surface"),
        "surface-subtle": cv("surface-subtle"),
        "surface-muted": cv("surface-muted"),
        "surface-container": cv("surface-container"),
        "surface-high": cv("surface-high"),

        // текст
        "text-primary": cv("text-primary"),
        "text-body": cv("text-primary"),
        "text-secondary": cv("text-secondary"),
        "text-muted": cv("text-muted"),
        "text-tertiary": cv("text-tertiary"),
        "text-inverse": "#ffffff",

        // головний акцент палітри (заливка кнопок: білий текст на ній ≥ 4,5:1)
        secondary: cv("primary"),
        "interactive-hover": cv("interactive-hover"),
        "interactive-subtle": cv("interactive-subtle"),
        "interactive-border": cv("interactive-border"),
        "interactive-text": cv("interactive-text"),

        // додаткові акценти (категорії слів у формулах); у кожній палітрі гармонізовані із зерном
        seafoam: cv("seafoam"), "seafoam-surface": cv("seafoam-surface"), "seafoam-text":  cv("seafoam-text"), "seafoam-border":  cv("seafoam-border"),
        sage: cv("sage"), "sage-surface": cv("sage-surface"), "sage-text":  cv("sage-text"), "sage-border":  cv("sage-border"),
        lilac: cv("lilac"), "lilac-surface": cv("lilac-surface"), "lilac-text":  cv("lilac-text"), "lilac-border":  cv("lilac-border"),
        sand: cv("sand"), "sand-surface": cv("sand-surface"), "sand-text":  cv("sand-text"), "sand-border":  cv("sand-border"),

        // стани
        "success-surface": cv("success-surface"),
        "success-border": cv("success-border"),
        "success-emphasis": cv("success-emphasis"),
        error: cv("error"),
        "error-surface": cv("error-surface"),
        "error-border": cv("error-border"),
        "error-emphasis": cv("error-emphasis"),
        warning: cv("warning"),
        "warning-surface": cv("warning-surface"),
        "warning-border": cv("warning-border"),

        // викреслене слово у вправах «зайве слово»
        "strike-surface": cv("strike-surface"),
        "strike-border": cv("strike-border"),
        "strike-text": cv("strike-text"),

        // персональні вправи учня
        "accent-personal": cv("lilac"),
        "accent-personal-surface": cv("lilac-surface"),

        "border-default": cv("border-default"),
        "border-input": cv("border-input"),

        // Старі блоки теорії в базі написані класами indigo-*. Ця шкала завжди
        // дорівнює головному кольору обраної палітри, тож вони вписуються без правок у базі.
        indigo: {
          50: cv("i50"), 100: cv("i100"), 200:  cv("i200"), 300:  cv("i300"), 400:  cv("i400"),
          500: cv("i500"), 600: cv("i600"), 700:  cv("i700"), 800:  cv("i800"), 900:  cv("i900"),
        },
      },
      borderRadius: { DEFAULT: "0.5rem", lg: "0.75rem", xl: "1rem", "2xl": "1.5rem", "3xl": "2rem", full: "9999px" },
      boxShadow: {
        // м'які розсіяні тіні з відтінком палітри, без різких країв
        sm: "0 1px 2px rgb(var(--c-shadow) / .04), 0 2px 8px -2px rgb(var(--c-shadow) / .05)",
        md: "0 8px 24px -4px rgb(var(--c-shadow) / .07), 0 4px 12px -2px rgb(var(--c-shadow) / .04)",
        float: "0 12px 32px -6px rgb(var(--c-glow) / .18)",
      },
      fontFamily: {
        // Plus Jakarta Sans не має основної кирилиці, тому українські літери
        // автоматично беруться з Manrope: обидва шрифти геометричні й добре поєднуються.
        sans: ["Manrope", "system-ui", "sans-serif"],
        display: ["Plus Jakarta Sans", "Manrope", "system-ui", "sans-serif"],
        mono: ["JetBrains Mono", "ui-monospace", "monospace"],
      },
      fontSize: {
        micro: ["11px", { lineHeight: "16px", letterSpacing: "0.03em", fontWeight: "600" }],
        "caption-xs": ["12px", { lineHeight: "16px", letterSpacing: "0.01em", fontWeight: "500" }],
        "caption-bold": ["12px", { lineHeight: "16px", letterSpacing: "0.05em", fontWeight: "700" }],
        "body-sm": ["13px", { lineHeight: "19px", letterSpacing: "0", fontWeight: "400" }],
        "body-base": ["14px", { lineHeight: "22px", letterSpacing: "0", fontWeight: "400" }],
        "body-medium": ["14px", { lineHeight: "22px", letterSpacing: "0", fontWeight: "500" }],
        "body-semibold": ["14px", { lineHeight: "22px", letterSpacing: "0.005em", fontWeight: "600" }],
        "heading-md": ["16px", { lineHeight: "24px", letterSpacing: "0", fontWeight: "600" }],
        "heading-lg": ["18px", { lineHeight: "26px", letterSpacing: "-0.01em", fontWeight: "700" }],
        "heading-xl": ["20px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "700" }],
        "display-title": ["26px", { lineHeight: "34px", letterSpacing: "-0.015em", fontWeight: "700" }],
        "code-mono": ["12px", { lineHeight: "16px", letterSpacing: "0", fontWeight: "500" }],
      },
    },
  },
};

// Іконки вбудовані як SVG, а не шрифтом: інакше до завантаження шрифту
// учень бачить замість значків слова, та й зайвих ~200 КБ не треба.
const ICONS = {
  menu: '<path d="M4 6h16M4 12h16M4 18h16"/>',
  close: '<path d="M6 6l12 12M18 6L6 18"/>',
  check: '<path d="M20 6L9 17l-5-5"/>',
  book: '<path d="M4 19.5A2.5 2.5 0 016.5 17H20M4 19.5V5a2 2 0 012-2h14v14M4 19.5A2.5 2.5 0 016.5 22H20v-5"/>',
  pencil: '<path d="M12 20h9M16.5 3.5a2.1 2.1 0 013 3L7 19l-4 1 1-4z"/>',
  chevronRight: '<path d="M9 18l6-6-6-6"/>',
  chevronDown: '<path d="M6 9l6 6 6-6"/>',
  reset: '<path d="M3 2v6h6M3.5 13a9 9 0 103-7.7L3 8"/>',
  logout: '<path d="M9 21H5a2 2 0 01-2-2V5a2 2 0 012-2h4M16 17l5-5-5-5M21 12H9"/>',
  user: '<path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"/><circle cx="12" cy="7" r="4"/>',
  sparkle: '<path d="M12 3l1.9 5.1L19 10l-5.1 1.9L12 17l-1.9-5.1L5 10l5.1-1.9z"/>',
  target: '<circle cx="12" cy="12" r="9"/><circle cx="12" cy="12" r="5"/><circle cx="12" cy="12" r="1.5"/>',
  list: '<path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"/>',
};

function icon(name, cls = "w-4 h-4") {
  return `<svg class="${cls}" viewBox="0 0 24 24" fill="none" stroke="currentColor"
    stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">${ICONS[name] || ""}</svg>`;
}


// ==================== ПАЛІТРИ (перемикач кольорів) ====================
// Палітри лежать у js/palettes.js (генеруються з одного «зерна» кольору за принципами
// Material You). Тут вони перетворюються на CSS-змінні й застосовуються до сторінки.
const PALETTE_KEY = "gl-palette";
const hexToRgb = h => [1, 3, 5].map(i => parseInt(h.slice(i, i + 2), 16)).join(" ");

(function injectPalettes() {
  if (typeof PALETTES === "undefined") return;
  const block = id => Object.entries(PALETTES[id].vars).map(([k, h]) => `--c-${k}:${hexToRgb(h)};`).join("");
  const css = `:root{${block("ocean")}}` + Object.keys(PALETTES).map(id => `[data-palette="${id}"]{${block(id)}}`).join("");
  const st = document.createElement("style");
  st.id = "palette-vars";
  st.textContent = css;
  document.head.appendChild(st);
  let saved = "ocean";
  try { saved = localStorage.getItem(PALETTE_KEY) || "ocean"; } catch (e) {}
  document.documentElement.dataset.palette = PALETTES[saved] ? saved : "ocean";
})();

function currentPalette() { return document.documentElement.dataset.palette || "ocean"; }

function setPalette(id) {
  if (typeof PALETTES === "undefined" || !PALETTES[id]) return;
  document.documentElement.dataset.palette = id;
  try { localStorage.setItem(PALETTE_KEY, id); } catch (e) {}
  document.querySelectorAll("[data-palette-switcher]").forEach(renderPaletteSwitcher);
}

// Ряд круглих «зерен»: клік перемикає палітру. Малюється в будь-який контейнер.
function renderPaletteSwitcher(el) {
  if (!el || typeof PALETTES === "undefined") return;
  el.setAttribute("data-palette-switcher", "");
  const cur = currentPalette();
  el.innerHTML = Object.entries(PALETTES).map(([id, p]) => {
    const on = id === cur;
    const sw = p.vars.i500;
    return `<button type="button" onclick="setPalette('${id}')" title="${p.label}" aria-label="Палітра: ${p.label}" aria-pressed="${on}"
      class="group flex flex-col items-center gap-1 focus:outline-none">
      <span class="w-9 h-9 rounded-full grid place-items-center border-2 transition ${on ? "border-text-primary" : "border-transparent group-hover:border-border-input"}">
        <span class="w-7 h-7 rounded-full" style="background:conic-gradient(${sw} 0 50%, ${p.vars.seafoam} 50% 75%, ${p.vars.lilac} 75% 100%)"></span>
      </span>
      <span class="text-micro ${on ? "text-text-primary" : "text-text-muted"}">${p.label}</span>
    </button>`;
  }).join("");
}

document.addEventListener("DOMContentLoaded", () => {
  const box = document.getElementById("palette-switcher");
  if (box) renderPaletteSwitcher(box);
});

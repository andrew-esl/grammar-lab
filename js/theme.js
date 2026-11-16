// ==================== СИСТЕМА ОФОРМЛЕННЯ ====================
// Токени дизайн-системи «Ocean Mist» (Google Stitch): кольори, шрифти, розміри.
// Підключається ОДРАЗУ ПІСЛЯ скрипта Tailwind і до решти наших скриптів.
// Стандартна палітра Tailwind (slate, indigo…) лишається доступною,
// бо ми тільки розширюємо тему — старі класи в теорії з бази не ламаються.

tailwind.config = {
  darkMode: "class",
  theme: {
    extend: {
      colors: {
        // поверхні (Ocean Mist: холодний туман, морський камінь)
        background: "#f1f5f7",
        surface: "#ffffff",
        "surface-subtle": "#f4f8fa",
        "surface-muted": "#e2e9ef",
        "surface-container": "#edf2f6",
        "surface-high": "#d4dfe7",

        // текст
        "text-primary": "#1e293b",
        "text-body": "#1e293b",
        "text-secondary": "#334155",
        "text-muted": "#526072",
        "text-tertiary": "#8a98a8",
        "text-inverse": "#ffffff",

        // акцент: океанічний блакитний. Заливка кнопок темніша за #3b82a6 із макета,
        // щоб білий текст на ній читався (контраст ≥ 4,5:1).
        secondary: "#347c9f",
        "interactive-hover": "#0c6385",
        "interactive-subtle": "#e0f2fe",
        "interactive-border": "#bfdcec",
        "interactive-text": "#0c6385",

        // додаткові акценти: бірюза, шавлія, баклажан, коралово-рожевий
        seafoam: "#5ea8a7",
        "seafoam-surface": "#d5efee",
        "seafoam-text": "#136968",
        sage: "#94a89a",
        "sage-surface": "#dbe4dc",
        "sage-text": "#3f6350",
        lilac: "#7c6a85",
        "lilac-surface": "#eae4ee",
        "lilac-text": "#51415a",
        sand: "#c99a2e",
        "sand-surface": "#fbf0cf",
        "sand-text": "#7a5a12",

        // стани
        "success-surface": "#e6eee8",
        "success-border": "#c3d3c8",
        "success-emphasis": "#3f6350",
        error: "#b85450",
        "error-surface": "#f9e6e6",
        "error-border": "#ecc4c4",
        "error-emphasis": "#93403d",
        warning: "#b7791f",
        "warning-surface": "#fdf6e3",
        "warning-border": "#f1e0b0",

        // викреслене слово у вправах «зайве слово»
        "strike-surface": "#f9dede",
        "strike-border": "#e6a9a9",
        "strike-text": "#b85450",

        // персональні вправи учня
        "accent-personal": "#7c6a85",
        "accent-personal-surface": "#eae4ee",

        "border-default": "#dde5ec",
        "border-input": "#c0cad3",

        // Старі блоки теорії в базі написані класами indigo-*. Перефарбовуємо цю шкалу
        // на океанічний блакитний, щоб вони вписались у нову палітру без правок у базі.
        indigo: {
          50: "#eef6fb", 100: "#e0f2fe", 200: "#bfdcec", 300: "#8ccff6", 400: "#5c9bb7",
          500: "#3b82a6", 600: "#347c9f", 700: "#0c6385", 800: "#1e405b", 900: "#163b4f",
        },
      },
      borderRadius: { DEFAULT: "0.5rem", lg: "0.75rem", xl: "1rem", "2xl": "1.5rem", "3xl": "2rem", full: "9999px" },
      boxShadow: {
        // м'які розсіяні тіні з холодним відтінком, без різких країв
        sm: "0 1px 2px rgba(30,41,59,.04), 0 2px 8px -2px rgba(30,41,59,.05)",
        md: "0 8px 24px -4px rgba(30,41,59,.07), 0 4px 12px -2px rgba(30,41,59,.04)",
        float: "0 12px 32px -6px rgba(59,130,166,.18)",
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

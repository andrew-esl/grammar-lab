// ==================== СИСТЕМА ОФОРМЛЕННЯ ====================
// Токени з макета, зробленого в Google Stitch: кольори, шрифти, розміри.
// Підключається ОДРАЗУ ПІСЛЯ скрипта Tailwind і до решти наших скриптів.
// Стандартна палітра Tailwind (slate, indigo…) лишається доступною,
// бо ми тільки розширюємо тему — старі класи в теорії з бази не ламаються.

tailwind.config = {
  darkMode: "class",
  theme: {
    extend: {
      colors: {
        // поверхні
        background: "#f7f9fb",
        surface: "#ffffff",
        "surface-subtle": "#f1f5f9",
        "surface-muted": "#e2e8f0",
        "surface-container": "#eceef0",

        // текст
        "text-primary": "#0f172a",
        "text-body": "#1e293b",
        "text-secondary": "#475569",
        "text-muted": "#64748b",
        "text-tertiary": "#94a3b8",
        "text-inverse": "#ffffff",

        // акцент
        secondary: "#4b41e1",
        "interactive-hover": "#4338ca",
        "interactive-subtle": "#eef2ff",
        "interactive-border": "#e0e7ff",

        // стани
        "success-surface": "#ecfdf5",
        "success-border": "#a7f3d0",
        "success-emphasis": "#047857",
        error: "#e11d48",
        "error-surface": "#fff1f2",
        "error-border": "#fecdd3",
        "error-emphasis": "#be123c",
        warning: "#d97706",
        "warning-surface": "#fffbeb",
        "warning-border": "#fef3c7",

        // викреслене слово у вправах «зайве слово»
        "strike-surface": "#fee2e2",
        "strike-border": "#fca5a5",
        "strike-text": "#ef4444",

        // персональні вправи учня
        "accent-personal": "#7c3aed",
        "accent-personal-surface": "#f5f3ff",

        "border-default": "#e2e8f0",
        "border-input": "#cbd5e1",
      },
      borderRadius: { DEFAULT: "0.25rem", lg: "0.5rem", xl: "0.75rem", full: "9999px" },
      fontFamily: {
        sans: ["Inter", "system-ui", "sans-serif"],
        mono: ["JetBrains Mono", "ui-monospace", "monospace"],
      },
      fontSize: {
        micro: ["11px", { lineHeight: "14px", letterSpacing: "0.02em", fontWeight: "500" }],
        "caption-xs": ["12px", { lineHeight: "16px", letterSpacing: "0", fontWeight: "500" }],
        "caption-bold": ["12px", { lineHeight: "16px", letterSpacing: "0.04em", fontWeight: "700" }],
        "body-sm": ["13px", { lineHeight: "18px", letterSpacing: "0", fontWeight: "400" }],
        "body-base": ["14px", { lineHeight: "22px", letterSpacing: "0", fontWeight: "400" }],
        "body-medium": ["14px", { lineHeight: "22px", letterSpacing: "0", fontWeight: "500" }],
        "body-semibold": ["14px", { lineHeight: "22px", letterSpacing: "0", fontWeight: "600" }],
        "heading-md": ["16px", { lineHeight: "24px", letterSpacing: "0", fontWeight: "600" }],
        "heading-lg": ["18px", { lineHeight: "26px", letterSpacing: "-0.01em", fontWeight: "700" }],
        "heading-xl": ["20px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "700" }],
        "display-title": ["24px", { lineHeight: "32px", letterSpacing: "-0.02em", fontWeight: "700" }],
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

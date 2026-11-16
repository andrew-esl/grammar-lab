// Генератор палітр Material You (HCT) для Grammar Lab.
// Запуск:  npm i --no-save @material/material-color-utilities
//          node scripts/gen-palettes.mjs > js/palettes.js
// Одне «зерно» (seed) → тональні палітри → усі токени сайту. Щоб додати палітру,
// допишіть рядок у SEEDS і перегенеруйте файл.
import {
  argbFromHex, hexFromArgb, Hct, TonalPalette, Blend, CorePalette,
} from "@material/material-color-utilities";

const SEEDS = [
  { id: "sage",   label: "Шавлія",  seed: "#4f8a6c" },
  { id: "lilac",  label: "Лаванда", seed: "#7566b5" },
  { id: "clay",   label: "Теракота", seed: "#c0694a" },
  { id: "slate",  label: "Графіт",  seed: "#5d6b7e", chroma: 5 },
];

// Океан — ручна палітра з DESIGN.md (Stitch), лишається типовою.
const OCEAN = {
  background: "#f1f5f7", surface: "#ffffff", "surface-subtle": "#f4f8fa", "surface-muted": "#e2e9ef",
  "surface-container": "#edf2f6", "surface-high": "#d4dfe7",
  "text-primary": "#1e293b", "text-secondary": "#334155", "text-muted": "#526072", "text-tertiary": "#8a98a8",
  primary: "#347c9f", "interactive-hover": "#0c6385", "interactive-subtle": "#e0f2fe",
  "interactive-border": "#bfdcec", "interactive-text": "#0c6385",
  seafoam: "#5ea8a7", "seafoam-surface": "#d5efee", "seafoam-text": "#136968", "seafoam-border": "#a9d9d7",
  sage: "#94a89a", "sage-surface": "#dbe4dc", "sage-text": "#3f6350", "sage-border": "#bfd0c4",
  lilac: "#7c6a85", "lilac-surface": "#eae4ee", "lilac-text": "#51415a", "lilac-border": "#d5c8dc",
  sand: "#c99a2e", "sand-surface": "#fbf0cf", "sand-text": "#7a5a12", "sand-border": "#ecd48a",
  "success-surface": "#e6eee8", "success-border": "#c3d3c8", "success-emphasis": "#3f6350",
  "border-default": "#dde5ec", "border-input": "#c0cad3", "shadow": "#1e293b", "glow": "#3b82a6",
  i50: "#eef6fb", i100: "#e0f2fe", i200: "#bfdcec", i300: "#8ccff6", i400: "#5c9bb7",
  i500: "#3b82a6", i600: "#347c9f", i700: "#0c6385", i800: "#1e405b", i900: "#163b4f",
};

// Кольори, що не залежать від палітри (помилка, попередження) — однакові скрізь.
const FIXED = {
  error: "#b85450", "error-surface": "#f9e6e6", "error-border": "#ecc4c4", "error-emphasis": "#93403d",
  warning: "#b7791f", "warning-surface": "#fdf6e3", "warning-border": "#f1e0b0",
  "strike-surface": "#f9dede", "strike-border": "#e6a9a9", "strike-text": "#b85450",
};

const t = (pal, tone) => hexFromArgb(pal.tone(tone));

function fromSeed({ seed, chroma }) {
  const src = argbFromHex(seed);
  const hct = Hct.fromInt(src);
  const P = TonalPalette.fromHueAndChroma(hct.hue, Math.max(hct.chroma, 36));
  const PL = TonalPalette.fromHueAndChroma(hct.hue, 20);            // світлі тони: пастельні, без «неону»
  const N = TonalPalette.fromHueAndChroma(hct.hue, chroma ?? 2.5);  // нейтральна: майже без кольору
  const NV = TonalPalette.fromHueAndChroma(hct.hue, (chroma ?? 2.5) * 2);
  // Додаткові акценти (категорії слів у формулах) гармонізуються із зерном — принцип M3
  const accent = hex => {
    const h = Hct.fromInt(Blend.harmonize(argbFromHex(hex), src));
    return h.hue;
  };
  const out = {
    background: t(N, 96), surface: "#ffffff", "surface-subtle": t(N, 98), "surface-muted": t(N, 92),
    "surface-container": t(N, 95), "surface-high": t(N, 88),
    "text-primary": t(N, 15), "text-secondary": t(N, 25), "text-muted": t(NV, 38), "text-tertiary": t(NV, 60),
    primary: t(P, 45), "interactive-hover": t(P, 36), "interactive-subtle": t(PL, 92),
    "interactive-border": t(PL, 82), "interactive-text": t(P, 36),
    "border-default": t(NV, 90), "border-input": t(NV, 78), shadow: t(N, 15), glow: t(P, 50),
    i50: t(PL, 96), i100: t(PL, 92), i200: t(PL, 86), i300: t(PL, 78), i400: t(P, 64),
    i500: t(P, 52), i600: t(P, 45), i700: t(P, 36), i800: t(P, 28), i900: t(P, 20),
  };
  for (const [name, base] of Object.entries({ seafoam: OCEAN.seafoam, sage: OCEAN.sage, lilac: OCEAN.lilac, sand: OCEAN.sand })) {
    const hue = accent(base);
    const ac = c => TonalPalette.fromHueAndChroma(hue, c);
    out[name] = t(ac(30), 60); out[`${name}-surface`] = t(ac(12), 92); out[`${name}-text`] = t(ac(32), 32); out[`${name}-border`] = t(ac(20), 82);
  }
  out["success-surface"] = out["sage-surface"]; out["success-border"] = out["sage-border"]; out["success-emphasis"] = out["sage-text"];
  return out;
}

const palettes = { ocean: { label: "Океан", seed: "#3b82a6", vars: { ...OCEAN, ...FIXED } } };
for (const s of SEEDS) palettes[s.id] = { label: s.label, seed: s.seed, vars: { ...fromSeed(s), ...FIXED } };

console.log("// ЗГЕНЕРОВАНО scripts/gen-palettes.mjs — не редагуйте вручну.");
console.log("// Палітри Material You: одне «зерно» кольору → усі токени сайту.");
console.log("const PALETTES = " + JSON.stringify(palettes, null, 1).replace(/\n\s+/g, " ").replace(/\{ "label"/g, '{\n  "label"') + ";");

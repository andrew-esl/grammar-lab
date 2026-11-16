// Короткий текстовий опис вправи для кабінету викладача:
// що питали і яка правильна відповідь. Працює з payload будь-якого типу.

function exerciseText(type, p) {
  p = p || {};
  switch (type) {
    case "order":
      return {
        question: `${p.prefix ? p.prefix + " " : ""}[${(p.scrambled || []).join(" / ")}]`,
        correct: `${p.prefix ? p.prefix + " " : ""}${p.answer || ""}`,
      };
    case "choice":
      return {
        question: `${p.before || ""} [${(p.options || []).join(" / ")}] ${p.after || ""}`.trim(),
        correct: p.correct || "",
      };
    case "gap":
      if (Array.isArray(p.blanks) && p.blanks.length)
        return { question: p.prompt || "", correct: p.blanks.map(b => b[0]).join(" · ") };
      return { question: p.prompt || "", correct: (p.answers || []).join(" / ") };
    case "cross":
      return {
        question: (p.words || []).join(" "),
        correct: `зайве: «${(p.words || [])[p.extraIndex] ?? "?"}»`,
      };
    case "abcd":
      return { question: p.q || "", correct: (p.options || [])[p.correct] || "" };
    case "translate":
      return {
        question: String(p.ua || p.src || "").replace(/\[\[|\]\]/g, "").trim(),
        correct: (p.answers || [])[0] || "",
      };
    default:
      return { question: JSON.stringify(p).slice(0, 120), correct: "" };
  }
}

const TYPE_LABELS = {
  order: "Порядок слів",
  choice: "Вибір",
  gap: "Пропуск",
  cross: "Зайве слово",
  abcd: "Тест",
  translate: "Переклад / письмо",
};

const LEVEL_LABELS = {
  elementary: "Elementary",
  intermediate: "Intermediate",
  advanced: "Advanced",
};

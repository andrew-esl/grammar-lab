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
      return { question: p.prompt || "", correct: (p.answers || []).join(" / ") };
    case "cross":
      return {
        question: (p.words || []).join(" "),
        correct: `зайве: «${(p.words || [])[p.extraIndex] ?? "?"}»`,
      };
    case "abcd":
      return { question: p.q || "", correct: (p.options || [])[p.correct] || "" };
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
};

const LEVEL_LABELS = {
  elementary: "Elementary",
  intermediate: "Intermediate",
  advanced: "Advanced",
};

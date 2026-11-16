// Запуск: node --test tests/translate.test.js
const test = require("node:test");
const assert = require("node:assert");
const TR = require("../js/translate.js");

const item = (answers, extra = {}) => ({ kind: "translate", answers, tense: ["past_perf"], ...extra });

test("точна відповідь і скорочення приймаються", () => {
  const it = item(["He had not finished the work."]);
  assert.ok(TR.check("He had not finished the work.", it).ok);
  assert.ok(TR.check("He hadn't finished the work", it).ok);
});

test("порожня відповідь не приймається", () => {
  assert.ok(TR.check("  ", item(["I saw him."])).empty);
});

test("помилка в реченні дає пояснення", () => {
  const r = TR.check("He finished the work yesterday before she came", item(["He had finished the work before she came."]));
  assert.equal(r.ok, false);
  assert.ok(r.notes.length > 0);
});

test("fix: незмінене речення не вважається виправленим", () => {
  const it = { kind: "fix", src: "She have just left.", answers: ["She has just left."], tense: ["pres_perf"] };
  const r = TR.check("She have just left.", it);
  assert.equal(r.ok, false);
  assert.ok(r.unchanged);
  assert.ok(TR.check("She has just left.", it).ok);
});

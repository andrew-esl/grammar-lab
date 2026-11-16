// ==================== ПЕРЕВІРКА РЕЧЕНЬ ====================
// Чиста логіка без DOM. Порівнює речення учня з еталонами, показує різницю слово
// за словом і пояснює типові помилки часів. Працює в браузері (глобальний TR)
// і в Node (module.exports) — для тестів.
//
// Як перевіряється відповідь:
//   1. Обидва тексти розбиваються на слова; скорочення розгортаються (don't = do not,
//      I'll = I will), регістр і розділові знаки не мають значення.
//   2. Якщо слова збігаються з будь-яким еталоном із item.answers — відповідь вірна.
//   3. Інакше береться найближчий еталон, будується вирівнювання (що зайве, чого бракує,
//      що замінено), а далі кожна різниця пояснюється: узгодження have/has, форма дієслова
//      після допоміжного, for/since, порядок слів у питанні, написання тощо.
//   4. Окремо шукаються типові «кальки» з української (am knowing, did went, has been 5 years…).
//   5. Якщо від еталона відрізняються лише повнозначні слова за тієї ж граматики (синонім),
//      це «м'який» збіг: учень сам вирішує, чи зарахувати.
(function (root) {
  "use strict";

  // ---------- словники ----------
  const W = s => new Set(s.split(/\s+/).filter(Boolean));
  const AUX = W("am is are was were be been being have has had do does did will would shall should can could may might must");
  const MODAL = W("will would shall should can could may might must");
  const NEG = W("not never no");
  const PRON = W("i you he she it we they me him her us them my your his its our their mine yours hers ours theirs myself yourself himself herself itself ourselves themselves this that these those there here");
  const WH = W("what who whom whose which where when why how");
  const DET = W("a an the some any every each all both another other much many few little more most");
  const PREP = W("in on at for since by to of with from about before after during until till ago into onto over under between through along towards toward near around across up down out off against among without within");
  const CONJ = W("and but or because if while as so than although though unless whether then");
  const TIMEW = W("already yet just ever always usually often sometimes seldom rarely now today tonight yesterday tomorrow still soon lately recently once twice");
  const FUNC = new Set([...AUX, ...NEG, ...PRON, ...WH, ...DET, ...PREP, ...CONJ, ...TIMEW, "'s", "'d"]);
  const SUBJ = W("i you he she it we they");

  // ---------- часи: назви та формули (для підказок і пояснень) ----------
  const TENSES = {
    pres_simple:    { name: "Present Simple",             formula: "V / V-s (do/does + V у запереченні й питанні)" },
    pres_cont:      { name: "Present Continuous",         formula: "am/is/are + V-ing" },
    pres_perf:      { name: "Present Perfect",            formula: "have/has + V3" },
    pres_perf_cont: { name: "Present Perfect Continuous", formula: "have/has been + V-ing" },
    past_simple:    { name: "Past Simple",                formula: "V2 (did + V у запереченні й питанні; was/were для to be)" },
    past_cont:      { name: "Past Continuous",            formula: "was/were + V-ing" },
    past_perf:      { name: "Past Perfect",               formula: "had + V3" },
    past_perf_cont: { name: "Past Perfect Continuous",    formula: "had been + V-ing" },
    fut_simple:     { name: "Future Simple",              formula: "will + V" },
    be_going_to:    { name: "be going to",                formula: "am/is/are going to + V" },
    fut_cont:       { name: "Future Continuous",          formula: "will be + V-ing" },
    fut_perf:       { name: "Future Perfect",             formula: "will have + V3" },
    fut_perf_cont:  { name: "Future Perfect Continuous",  formula: "will have been + V-ing" },
  };

  // ---------- неправильні дієслова: base:past:pp ----------
  const IRR_SRC = "be:was/were:been become:became:become begin:began:begun bite:bit:bitten blow:blew:blown break:broke:broken bring:brought:brought build:built:built buy:bought:bought catch:caught:caught choose:chose:chosen come:came:come cost:cost:cost cut:cut:cut dig:dug:dug do:did:done draw:drew:drawn drink:drank:drunk drive:drove:driven eat:ate:eaten fall:fell:fallen feed:fed:fed feel:felt:felt fight:fought:fought find:found:found fly:flew:flown forget:forgot:forgotten get:got:got give:gave:given go:went:gone grow:grew:grown hang:hung:hung have:had:had hear:heard:heard hide:hid:hidden hit:hit:hit hold:held:held hurt:hurt:hurt keep:kept:kept know:knew:known lay:laid:laid lead:led:led leave:left:left lend:lent:lent let:let:let lie:lay:lain light:lit:lit lose:lost:lost make:made:made mean:meant:meant meet:met:met pay:paid:paid put:put:put read:read:read ride:rode:ridden ring:rang:rung rise:rose:risen run:ran:run say:said:said see:saw:seen sell:sold:sold send:sent:sent set:set:set shine:shone:shone shoot:shot:shot show:showed:shown shut:shut:shut sing:sang:sung sit:sat:sat sleep:slept:slept speak:spoke:spoken spend:spent:spent spread:spread:spread stand:stood:stood steal:stole:stolen swim:swam:swum take:took:taken teach:taught:taught tear:tore:torn tell:told:told think:thought:thought throw:threw:thrown understand:understood:understood wake:woke:woken wear:wore:worn win:won:won write:wrote:written";
  const IRR = {};            // lemma → {past:[..], pp:[..]}
  const IRR_PAST = {};       // форма → [lemma]
  const IRR_PP = {};
  for (const e of IRR_SRC.split(" ")) {
    const [l, p, pp] = e.split(":");
    IRR[l] = { past: p.split("/"), pp: pp.split("/") };
    for (const f of IRR[l].past) (IRR_PAST[f] ||= []).push(l);
    for (const f of IRR[l].pp) (IRR_PP[f] ||= []).push(l);
  }
  const STATIVE = W("know understand want like love hate need believe belong own prefer seem mean contain cost depend matter mind remember recognize suppose");

  // ---------- нормалізація й розбиття на слова ----------
  const CONTR = { "won't": ["will", "not"], "can't": ["can", "not"], "cannot": ["can", "not"], "shan't": ["shall", "not"], "let's": ["let", "us"], "gonna": ["going", "to"] };

  function clean(s) {
    return String(s == null ? "" : s)
      .replace(/[‘’ʼ´`]/g, "'").replace(/[–—]/g, "-").replace(/[“”«»]/g, '"')
      .replace(/\s+/g, " ").trim();
  }

  // Повертає {tokens, map, raw}: tokens — слова для порівняння, map[i] — індекс «сирого» слова,
  // з якого вийшов токен (щоб показати учневі його власні слова, а не розгорнуті).
  function tokenize(input) {
    const raw = clean(input).split(" ").filter(Boolean);
    const tokens = [], map = [];
    raw.forEach((w0, ri) => {
      let w = w0.toLowerCase()
        .replace(/\b([ap])\.m\.?/g, "$1m")
        .replace(/^[("'«]+|[)"'»]+$/g, "");           // лапки навколо слова
      if (/^o'clock[.,;:!?]*$/.test(w)) { tokens.push("o'clock"); map.push(ri); return; }
      w = w.replace(/[.,;:!?]+$/g, "").replace(/^[.,;:!?]+/g, "");
      if (!w || w === "-") return;
      const push = t => { if (t) { tokens.push(t); map.push(ri); } };
      if (CONTR[w]) { CONTR[w].forEach(push); return; }
      let m;
      if ((m = w.match(/^(.+)n't$/))) { push(m[1]); push("not"); return; }
      if ((m = w.match(/^(.+)'m$/))) { push(m[1]); push("am"); return; }
      if ((m = w.match(/^(.+)'re$/))) { push(m[1]); push("are"); return; }
      if ((m = w.match(/^(.+)'ve$/))) { push(m[1]); push("have"); return; }
      if ((m = w.match(/^(.+)'ll$/))) { push(m[1]); push("will"); return; }
      if ((m = w.match(/^(.+)'s$/))) { push(m[1]); push("'s"); return; }
      if ((m = w.match(/^(.+)'d$/))) { push(m[1]); push("'d"); return; }
      if (!/^\d+[.:]\d+$/.test(w)) w = w.replace(/[.,;:!?]/g, "");
      push(w);
    });
    return { tokens, map, raw };
  }

  // «'s» може бути is/has або присвійним, «'d» — had/would
  function eqTok(a, b) {
    if (a === b) return true;
    if (a === "'s") return b === "is" || b === "has";
    if (b === "'s") return a === "is" || a === "has";
    if (a === "'d") return b === "had" || b === "would";
    if (b === "'d") return a === "had" || a === "would";
    return false;
  }
  function sameTokens(a, b) {
    if (a.length !== b.length) return false;
    for (let i = 0; i < a.length; i++) if (!eqTok(a[i], b[i])) return false;
    return true;
  }
  // для gap-вправ: чи збігаються два тексти з точністю до регістру, апострофів і скорочень
  function same(a, b) { return sameTokens(tokenize(a).tokens, tokenize(b).tokens); }

  // ---------- вирівнювання (редакційна відстань на словах) ----------
  function align(a, b) {
    const n = a.length, m = b.length;
    const D = Array.from({ length: n + 1 }, () => new Array(m + 1).fill(0));
    for (let i = 0; i <= n; i++) D[i][0] = i;
    for (let j = 0; j <= m; j++) D[0][j] = j;
    for (let i = 1; i <= n; i++) for (let j = 1; j <= m; j++) {
      D[i][j] = Math.min(D[i - 1][j - 1] + (eqTok(a[i - 1], b[j - 1]) ? 0 : 1), D[i - 1][j] + 1, D[i][j - 1] + 1);
    }
    const ops = [];
    let i = n, j = m;
    while (i > 0 || j > 0) {
      if (i > 0 && j > 0 && D[i][j] === D[i - 1][j - 1] + (eqTok(a[i - 1], b[j - 1]) ? 0 : 1)) {
        ops.push(eqTok(a[i - 1], b[j - 1]) ? { t: "ok", i: i - 1, j: j - 1 } : { t: "sub", i: i - 1, j: j - 1 });
        i--; j--;
      } else if (i > 0 && D[i][j] === D[i - 1][j] + 1) { ops.push({ t: "del", i: i - 1 }); i--; }
      else { ops.push({ t: "ins", j: j - 1 }); j--; }
    }
    ops.reverse();
    return { dist: D[n][m], ops };
  }

  function lev(a, b) {
    const D = [];
    for (let i = 0; i <= a.length; i++) { D[i] = [i]; }
    for (let j = 1; j <= b.length; j++) D[0][j] = j;
    for (let i = 1; i <= a.length; i++) for (let j = 1; j <= b.length; j++)
      D[i][j] = Math.min(D[i - 1][j - 1] + (a[i - 1] === b[j - 1] ? 0 : 1), D[i - 1][j] + 1, D[i][j - 1] + 1);
    return D[a.length][b.length];
  }

  // ---------- морфологія дієслів ----------
  const VOW = /[aeiou]/;
  function undouble(s) { return s.length > 2 && s[s.length - 1] === s[s.length - 2] && !VOW.test(s[s.length - 1]) ? s.slice(0, -1) : null; }

  // Повертає можливі розбори слова: [{lemma, form}], form ∈ base|s|past|pp|ing
  function analyze(w) {
    const out = [];
    const add = (lemma, form) => { if (lemma && lemma.length > 1) out.push({ lemma, form }); };
    if (IRR[w]) { add(w, "base"); }
    for (const l of (IRR_PAST[w] || [])) add(l, "past");
    for (const l of (IRR_PP[w] || [])) add(l, "pp");
    if (w === "being") add("be", "ing");
    if (w === "has") add("have", "s"); else if (w === "does") add("do", "s"); else if (w === "goes") add("go", "s"); else if (w === "is") add("be", "s");
    if (/ing$/.test(w) && w.length > 4) {
      const st = w.slice(0, -3);
      add(st, "ing"); add(st + "e", "ing"); add(undouble(st), "ing");
      if (w.endsWith("ying") && w.length > 5) add(w.slice(0, -4) + "ie", "ing");
    }
    if (/ed$/.test(w) && w.length > 3) {
      const st = w.slice(0, -2);
      add(st, "past"); add(st, "pp"); add(w.slice(0, -1), "past"); add(w.slice(0, -1), "pp");
      const u = undouble(st); if (u) { add(u, "past"); add(u, "pp"); }
      if (/i$/.test(st)) { add(st.slice(0, -1) + "y", "past"); add(st.slice(0, -1) + "y", "pp"); }
    }
    if (/s$/.test(w) && w.length > 2) {
      if (/ies$/.test(w)) add(w.slice(0, -3) + "y", "s");
      if (/(ch|sh|ss|x|o|z)es$/.test(w)) add(w.slice(0, -2), "s");
      if (!/ss$/.test(w)) add(w.slice(0, -1), "s");
    }
    add(w, "base");
    return out;
  }
  // Чи це різні форми одного дієслова. prev — попереднє слово еталона (щоб відрізнити
  // дієслово від іменника: friend/friends). Повертає {lemma, uf, rf} або null.
  const SLOT = new Set([...SUBJ, ...AUX, "not", "to", "'s", "'d", "never", "always", "often", "just", "already", "also", "usually", "sometimes", "still", "ever", "seldom", "rarely", "only"]);
  const SKIP = new Set([...SUBJ, "not", "never", "ever", "just", "already", "yet", "still", "always", "often", "also"]);
  // яке допоміжне стоїть перед словом у еталоні: визначає, якої форми дієслова очікуємо
  function lookBack(rT, j) {
    for (let k = j - 1, n = 0; k >= 0 && n < 4; k--, n++) {
      const t = rT[k];
      if (t === "do" || t === "does" || t === "did") return { form: "base", aux: t };
      if (MODAL.has(t) || t === "to") return { form: "base", aux: t };
      if (t === "been") return { form: "ing", aux: t };
      if (t === "have" || t === "has" || t === "had") return { form: "pp", aux: t };
      if (t === "am" || t === "is" || t === "are" || t === "was" || t === "were" || t === "be" || t === "being") return { form: "ing", aux: t };
      if (!SKIP.has(t)) break;
    }
    return { form: null, aux: null };
  }
  function sameLemma(u, r, prev, want) {
    const A = analyze(u);
    let B = analyze(r);
    if (want && B.some(b => b.form === want)) B = B.filter(b => b.form === want);
    for (const a of A) for (const b of B) {
      if (a.lemma !== b.lemma || (a.form === b.form && u === r)) continue;
      if (a.form === "base" && b.form === "base") continue;
      const irregular = !!IRR[a.lemma];
      const tensey = ["past", "pp", "ing"].includes(a.form) || ["past", "pp", "ing"].includes(b.form);
      if (irregular || tensey || SLOT.has(prev)) return { lemma: a.lemma, uf: a.form, rf: b.form };
    }
    return null;
  }
  const FORM_DESC = { base: "початкова форма дієслова (без -s, -ed, -ing)", s: "форма з -s (для he/she/it)", past: "минула форма (V2)", pp: "третя форма (V3)", ing: "форма з -ing" };
  const irrNote = (lemma, forms) => IRR[lemma] && (IRR[lemma].past[0] !== lemma || IRR[lemma].pp[0] !== lemma) && forms.some(f => f === "past" || f === "pp") ? ` Неправильне дієслово: ${lemma} – ${IRR[lemma].past[0]} – ${IRR[lemma].pp[0]}.` : "";

  // ---------- пояснення різниць ----------
  const PAIR_TIPS = {
    "have|has": "have — з I/you/we/they, has — з he/she/it.",
    "was|were": "was — з I/he/she/it, were — з you/we/they.",
    "do|does": "do — з I/you/we/they, does — з he/she/it.",
    "am|is": "am — лише з I, is — з he/she/it.", "am|are": "am — лише з I, are — з you/we/they.", "are|is": "is — з he/she/it, are — з you/we/they.",
    "for|since": "for + тривалість (for two hours), since + момент початку (since 5 o'clock).",
    "ago|before": "ago — від теперішнього моменту (two days ago), before — від іншого моменту в минулому.",
    "at|in": "at — з точним часом (at 6 o'clock), in — з частинами доби, місяцями, роками.",
    "in|on": "on — з днями (on Monday), in — з місяцями, роками, частинами доби.",
    "at|on": "at — з точним часом, on — з днями тижня й датами.",
    "by|until": "by — «не пізніше ніж до» (дія завершиться до цього моменту), until — «аж до» (дія триває до цього моменту).",
    "by|till": "by — «не пізніше ніж до», till — «аж до».",
    "when|while": "while — коли дві дії тривають одночасно, when — коли одна дія перериває іншу або йдуть одна за одною.",
    "as|while": "while / as — одночасні тривалі дії.",
    "already|yet": "already — у ствердженні, yet — у запереченні й питанні (в кінці речення).",
    "ever|never": "never уже містить заперечення; ever — у питаннях і з перевагою «найкращий/перший».",
    "just|yet": "just — «щойно» (у ствердженні), yet — «ще/вже» (у запереченні й питанні).",
  };
  function pairTip(a, b) { return PAIR_TIPS[a + "|" + b] || PAIR_TIPS[b + "|" + a] || null; }

  function tenseTip(codes) {
    const t = (codes || []).map(c => TENSES[c]).filter(Boolean);
    return t.length ? t : [];
  }
  function formulaFor(tok, codes) {
    for (const c of (codes || [])) { const t = TENSES[c]; if (t && new RegExp("\\b" + tok + "\\b").test(t.formula)) return t; }
    return null;
  }

  function diagnose(ops, uT, rT, item) {
    const notes = [];
    const codes = item.tense || [];
    const add = (k, t) => { if (!notes.some(n => n.t === t)) notes.push({ k, t }); };
    let hard = false, softOnly = true;
    for (const op of ops) {
      if (op.t === "ok") continue;
      if (op.t === "sub") {
        const u = uT[op.i], r = rT[op.j];
        const prev = op.j > 0 ? rT[op.j - 1] : null;
        if (AUX.has(u) && AUX.has(r)) {
          hard = true; softOnly = false;
          const tip = pairTip(u, r);
          if (tip) add("aux", `«${u}» → «${r}». ${tip}`);
          else {
            const f = formulaFor(r, codes);
            add("aux", `Тут потрібне «${r}», а не «${u}».` + (f ? ` ${f.name} = ${f.formula}.` : ""));
          }
          continue;
        }
        const lb = lookBack(rT, op.j);
        const sl = sameLemma(u, r, prev, lb.form);
        if (sl && !AUX.has(u) && !AUX.has(r)) {
          hard = true; softOnly = false;
          let ctx;
          const ax = lb.aux;
          if (ax === "do" || ax === "does" || ax === "did") ctx = `Після do/does/did дієслово стоїть у початковій формі: «${r}».`;
          else if (ax && (MODAL.has(ax) || ax === "to")) ctx = `Після «${ax}» дієслово стоїть у початковій формі, без -s, -ed, -ing: «${r}».`;
          else if (sl.rf === "pp" && ax) ctx = `Після have/has/had потрібна третя форма (V3): «${r}».`;
          else if (sl.rf === "ing" && ax === "been") ctx = `Після have/has/had been потрібна форма з -ing: «${r}».`;
          else if (sl.rf === "ing" && ax) ctx = `Після «${ax}» тут потрібна форма з -ing (Continuous): «${r}».`;
          else ctx = `Тут потрібна ${FORM_DESC[sl.rf]}: «${r}», а у вашій відповіді «${u}».`;
          add("form", ctx + irrNote(sl.lemma, [sl.uf, sl.rf]));
          continue;
        }
        const tip = pairTip(u, r);
        if (tip) { hard = true; softOnly = false; add("marker", `«${u}» → «${r}». ${tip}`); continue; }
        if (!FUNC.has(u) && !FUNC.has(r) && Math.min(u.length, r.length) >= 4 && lev(u, r) <= 2) {
          hard = true; softOnly = false; add("spell", `Перевірте написання: «${u}» → «${r}».`); continue;
        }
        if (FUNC.has(u) || FUNC.has(r)) {
          hard = true; softOnly = false;
          const f = AUX.has(r) ? formulaFor(r, codes) : null;
          add(AUX.has(r) ? "aux" : "word", `Замість «${u}» тут потрібне «${r}».` + (f ? ` ${f.name} = ${f.formula}.` : ""));
          continue;
        }
        add("word", `Слово «${u}» відрізняється від еталона («${r}»).`);
        continue;
      }
      if (op.t === "del") {
        const u = uT[op.i];
        hard = true; softOnly = false;
        if (u === "to" || u === "the" || u === "a" || u === "an") add("extra", `Зайве слово «${u}».`);
        else if (AUX.has(u)) add("extra", `Зайве «${u}»: у цій конструкції допоміжне дієслово не потрібне.`);
        else add("extra", `Зайве слово «${u}».`);
        continue;
      }
      if (op.t === "ins") {
        const r = rT[op.j];
        hard = true; softOnly = false;
        if (r === "not") add("missing", "Бракує заперечення «not» (n't).");
        else if (AUX.has(r)) { const f = formulaFor(r, codes); add("missing", `Бракує «${r}».` + (f ? ` ${f.name} = ${f.formula}.` : "")); }
        else if (FUNC.has(r)) add("missing", `Бракує слова «${r}».`);
        else add("missing", `Бракує слова «${r}».`);
      }
    }
    // кілька «бракує допоміжного» підряд = одна конструкція часу, говоримо про неї цілком
    const auxNotes = notes.filter(n => n.k === "aux" || n.k === "missing");
    const ts = tenseTip(codes);
    if (auxNotes.length >= 2 && ts.length) {
      const first = notes.indexOf(auxNotes[0]);
      const msg = { k: "aux", t: `Потрібна інша конструкція: ${ts.map(x => `${x.name} = ${x.formula}`).join("; ")}.` };
      const rest = notes.filter(n => !auxNotes.includes(n));
      rest.splice(Math.min(first, rest.length), 0, msg);
      return { notes: rest, hard, softOnly };
    }
    return { notes, hard, softOnly };
  }

  // ---------- типові помилки (кальки з української та хрестоматійні) ----------
  const DAYS = "monday|tuesday|wednesday|thursday|friday|saturday|sunday";
  const STATIVE_ING = "knowing|understanding|wanting|liking|loving|hating|needing|believing|belonging|owning|preferring|seeming|meaning|containing|costing|depending|mattering|minding|remembering|recognizing|supposing";
  const NOT_NOUN_ING = /^(thing|something|nothing|anything|everything|morning|evening|king|ring|spring|string|wing|swing|ceiling|building|meeting|feeling|wedding|clothing|painting|training|beginning|dining)$/;
  // чи це розпізнана НЕ початкова форма дієслова (went, seen, working, asked…)
  function nonBase(w) {
    if (IRR_PAST[w] && !IRR[w]) return true;
    if (IRR_PP[w] && !IRR[w]) return true;
    if (/^[a-z]{3,}ing$/.test(w) && !NOT_NOUN_ING.test(w)) return true;
    if (/^[a-z]{3,}ed$/.test(w) && w.length >= 5) return true;
    return /^(goes|does|has|watches|studies|makes|takes|works|plays|knows|likes|wants|needs|comes|gets|says|sees)$/.test(w);
  }
  function baseOf(w) { const a = analyze(w).filter(x => x.form !== "base"); const irr = a.find(x => IRR[x.lemma]); return (irr || a[0] || { lemma: w }).lemma; }
  function ingOf(w) { return /e$/.test(w) && !/ee$/.test(w) ? w.slice(0, -1) + "ing" : w + "ing"; }
  function ppWrong(w) {
    for (const l of (IRR_PAST[w] || [])) if (!IRR[l].pp.includes(w)) return { lemma: l, past: w, pp: IRR[l].pp[0] };
    return null;
  }
  const COMMON = [
    { re: new RegExp("\\b(am|is|are|was|were)( not)? (" + STATIVE_ING + ")\\b"),
      t: "Дієслова стану (know, want, like, love, need, understand…) не вживаються в Continuous: потрібен Simple (I know, he wants)." },
    { vf: 1, re: /\b(do|does|did)( not)?( (i|you|he|she|it|we|they))? ([a-z]+)\b/, test: m => !FUNC.has(m[5]) && nonBase(m[5]),
      t: m => `Після do/does/did дієслово стоїть у початковій формі: не «${m[5]}», а «${baseOf(m[5])}».` },
    { vf: 1, re: /\b(will|would|shall|should|can|could|may|might|must)( not)?( (i|you|he|she|it|we|they))? ([a-z]+)\b/, test: m => !FUNC.has(m[5]) && nonBase(m[5]),
      t: m => `Після will і модальних дієслів — початкова форма без -s, -ed, -ing: не «${m[5]}», а «${baseOf(m[5])}».` },
    { re: /\b(he|she|it) (have|do|are|were)\b/, t: "З he/she/it: has, does, is, was (а не have, do, are, were)." },
    { re: /\b(you|we|they) (was|is|has|does)\b/, t: "З you/we/they: were, are, have, do (а не was, is, has, does)." },
    { re: /\bi (is|are|has|does)\b/, t: "З I: am, have, do (I am, I have, I do)." },
    { re: new RegExp("\\b(have|has)( not)?( (just|already|ever|never|still|always))? .*\\b(yesterday|ago|last (night|week|month|year|summer|winter|" + DAYS + ")|in (19|20)\\d\\d)\\b"),
      test: (m, s) => !/\b(since|until|till|by|for) (the )?(last|yesterday)\b/.test(s),
      t: "Present Perfect не вживається з точним минулим часом (yesterday, … ago, last week): тут потрібен Past Simple." },
    { vf: 1, re: /\b(have|has|had)( not)?( (never|ever|just|already|yet|still))? ((i|you|he|she|it|we|they) )?([a-z]+)\b/, test: m => !!ppWrong(m[7]),
      t: m => { const x = ppWrong(m[7]); return `Після have/has/had потрібна третя форма (V3): не «${m[7]}», а «${x.pp}» (${x.lemma} – ${x.past} – ${x.pp}).`; } },
    { re: /\bsince (\d+|a|an|two|three|four|five|six|seven|eight|nine|ten|half an|several|many) (second|minute|hour|day|week|month|year)s?\b/,
      test: (m, s) => !/\bsince (\w+ ){0,2}ago\b/.test(s),
      t: "Since + момент початку (since 5 o'clock, since Monday), а тривалість — з for (for two hours)." },
    { re: new RegExp("\\bfor (\\d{1,2} o'clock|" + DAYS + "|childhood|morning|yesterday|\\d{4})\\b"),
      t: "For + тривалість (for two hours), а момент початку — з since (since Monday, since 1998)." },
    { re: /\b(am|is|are) ([a-z]+ing)\b.*\b(since|for (an?|\d+|two|three|four|five|six|seven|ten|twenty|half an) ?(hour|minute|day|week|month|year)s?)\b/,
      test: (m, s) => !/\b(have|has) been\b/.test(s) && !/\b(going to|leaving|arriving|coming|flying|starting)\b/.test(s),
      t: "Дія почалась у минулому і триває досі (since / for + тривалість): потрібен Present Perfect (Continuous), а не Present Continuous." },
    { vf: 1, re: /\b(have|has|had) been ([a-z]+)\b/, test: m => !!IRR[m[2]] && !IRR[m[2]].pp.includes(m[2]) && m[2] !== "be",
      t: m => `Після have/has/had been — дієслово з -ing (Perfect Continuous): «${m[2]}» → «${ingOf(m[2])}».` },
  ];

  function common(raw, tokens, item) {
    const s = tokens.join(" ");
    const out = [];
    for (const c of COMMON) {
      const m = s.match(c.re);
      if (!m) continue;
      if (c.test && !c.test(m, s)) continue;
      out.push({ k: "common", vf: !!c.vf, t: typeof c.t === "function" ? c.t(m) : c.t });
    }
    // порядок слів у запитанні: «Where he is?»
    if (/\?\s*$/.test(String(raw)) || item.kind === "question") {
      if (/^(what|where|when|why|how|who|whom|whose|which)( (many|much|long|often|old|far|big|time|[a-z]+s))? (i|you|he|she|it|we|they) (am|is|are|was|were|do|does|did|will|have|has|had|can|could|would|should)\b/.test(s))
        out.push({ k: "common", t: "У питанні допоміжне дієслово стоїть перед підметом: питальне слово + допоміжне + підмет + дієслово (Where is he? What did she do?)." });
    }
    for (const tr of (item.traps || [])) {
      try { if (new RegExp(tr.re, "i").test(s)) out.push({ k: "trap", t: tr.msg }); } catch (e) { /* поганий regexp у даних */ }
    }
    return out;
  }

  // «скелет» речення: службові слова лишаються, повнозначні стискаються в «*»
  function skeleton(tokens) {
    const out = [];
    for (const t of tokens) {
      const x = FUNC.has(t) || /^\d/.test(t) ? t : "*";
      if (x === "*" && out[out.length - 1] === "*") continue;
      out.push(x);
    }
    return out.join(" ");
  }

  // ---------- головна перевірка ----------
  // item: { answers: [рядки], tense?: [коди часів], traps?: [{re, msg}], kind?: ... }
  function check(raw, item) {
    const user = tokenize(raw);
    const refs = (item.answers || []).map(a => ({ text: a, ...tokenize(a) }));
    if (!user.tokens.length) return { ok: false, empty: true, notes: [{ k: "empty", t: "Спершу впишіть речення." }] };
    for (const r of refs) if (sameTokens(user.tokens, r.tokens)) return { ok: true, ref: r.text };
    if (item.kind === "fix" && item.src && sameTokens(user.tokens, tokenize(item.src).tokens))
      return { ok: false, unchanged: true, ref: refs[0] ? refs[0].text : "", notes: [{ k: "empty", t: "Ви не змінили речення. У ньому є помилка: знайдіть її й виправте." }] };

    // найближчий еталон
    let best = null;
    for (const r of refs) {
      const al = align(user.tokens, r.tokens);
      if (!best || al.dist < best.al.dist) best = { r, al };
    }
    if (!best) return { ok: false, notes: [], ref: "" };
    const { r, al } = best;

    const notes = [];
    let soft = false;
    const sortedEq = [...user.tokens].sort().join(" ") === [...r.tokens].sort().join(" ");
    if (sortedEq) {
      const q = AUX.has(r.tokens[0]) || WH.has(r.tokens[0]);
      notes.push({ k: "order", t: q
        ? "Слова правильні, але порядок інший. У питанні допоміжне дієслово стоїть перед підметом: [питальне слово] + допоміжне + підмет + дієслово."
        : "Слова правильні, але порядок інший. Пам'ятайте: підмет + (допоміжне) + дієслово + доповнення + обставини (спочатку місце, потім час)." });
    } else {
      const d = diagnose(al.ops, user.tokens, r.tokens, item);
      notes.push(...d.notes);
      const grammarish = notes.some(n => ["form", "aux", "marker", "spell", "order"].includes(n.k));
      if (!grammarish && (d.softOnly || skeleton(user.tokens) === skeleton(r.tokens))) {
        soft = true;
        notes.length = 0;     // замість «бракує/зайве» — одне повідомлення в інтерфейсі
      }
    }
    const extra = common(raw, user.tokens, item).filter(c => !(c.vf && notes.some(n => n.k === "form")));
    if (extra.length) soft = false;
    for (const c of extra) if (!notes.some(n => n.t === c.t)) notes.unshift(c);

    // якщо нічого конкретного сказати не вдалося — нагадуємо формулу часу
    if (!soft && !notes.some(n => n.k !== "word" && n.k !== "extra" && n.k !== "missing")) {
      const t = tenseTip(item.tense);
      if (t.length) notes.push({ k: "tense", t: `Перевірте часову форму: ${t.map(x => `${x.name} = ${x.formula}`).join("; ")}.` });
    }
    return { ok: false, soft, ref: r.text, notes, marks: marks(al.ops, user, r) };
  }

  // Розмітка для показу: слова учня (bad/missing) і слова еталона (diff).
  function marks(ops, user, ref) {
    const u = user.raw.map(w => ({ w, bad: false, before: [] }));
    const r = ref.raw.map(w => ({ w, diff: false }));
    let cursor = 0;                     // індекс першого непройденого токена учня
    for (const op of ops) {
      if (op.t === "ok") { cursor = op.i + 1; continue; }
      if (op.t === "sub") { u[user.map[op.i]].bad = true; r[ref.map[op.j]].diff = true; cursor = op.i + 1; }
      else if (op.t === "del") { u[user.map[op.i]].bad = true; cursor = op.i + 1; }
      else if (op.t === "ins") {
        r[ref.map[op.j]].diff = true;
        const at = cursor < user.tokens.length ? user.map[cursor] : -1;
        const word = ref.tokens[op.j];
        if (at === -1) (u.tail ||= []).push(word); else u[at].before.push(word);
      }
    }
    // слово еталона могло дати кілька токенів (don't) — позначаємо слово цілком
    return { user: u, ref: r, tail: u.tail || [] };
  }

  root.TR = { check, same, tokenize, align, analyze, sameLemma, TENSES, IRR, FUNC };
  if (typeof module !== "undefined" && module.exports) module.exports = root.TR;
})(typeof window !== "undefined" ? window : globalThis);

// Тема: adjectives
// Додається у глобальний реєстр TOPICS_DATA. Порядок підключення у index.html = порядок у меню.
window.TOPICS_DATA = window.TOPICS_DATA || {};
window.TOPICS_DATA["adjectives"] = {
    id: "adjectives",
    title: "Прикметники (Adjectives)",
    description: "Прикметники: позиція в реченні, порядок прикметників, складні форми.",
    theory: [
      {
        id: "th_1",
        title: "Прикметник: що це і де він стоїть",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Прикметники описують іменники. В англійській вони <strong>не змінюються</strong> за числом (одна форма для однини й множини) і стоять <strong>перед іменником</strong> або <strong>після дієслів-зв'язок</strong>.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> Adjective + Noun &nbsp;|&nbsp; Subject + be/look/smell/sound/feel/taste/seem/appear/become/get/stay + Adjective
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>a small house</em> — маленький будинок (перед іменником)</li>
            <li>• <em>two small houses</em> — прикметник НЕ має форми множини (НЕ <s>smalls</s>)</li>
            <li>• <em>She is beautiful.</em> / <em>They seem unhappy.</em> — після дієслова-зв'язки</li>
            <li>• <em>It's a cold day. The people are skiing on the crisp white snow.</em></li>
          </ul>
        `
      },
      {
        id: "th_2",
        title: "Opinion vs Fact: два типи прикметників",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Прикметники поділяються на <strong>оцінні (opinion)</strong> — те, що людина думає, і <strong>фактичні (fact)</strong> — об'єктивна інформація про вік, розмір, колір, походження, матеріал.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Ключ:</strong> Opinion завжди стоїть ПЕРЕД Fact
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>Opinion:</strong> <em>boring, exciting, lovely, beautiful, delicious, ugly, fantastic</em></li>
            <li>• <strong>Fact:</strong> <em>tall, thin, new, old, red, Swiss, wooden, round</em></li>
            <li>• <em>a lovely old-fashioned wooden table</em> — спочатку думка, потім факти</li>
          </ul>
        `
      },
      {
        id: "th_3",
        title: "Повний порядок прикметників (OSASCOMP)",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Коли перед іменником стоять два і більше прикметники, вони шикуються у строгому порядку.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> Opinion → Size → Age → Shape → Colour → Origin → Material → Used for → NOUN
          </div>
          <div class="overflow-x-auto mb-3">
            <table class="w-full text-xs border-collapse">
              <thead>
                <tr class="bg-amber-50">
                  <th class="border p-1">opinion</th><th class="border p-1">size</th><th class="border p-1">age</th><th class="border p-1">shape</th><th class="border p-1">colour</th><th class="border p-1">origin</th><th class="border p-1">material</th><th class="border p-1">used for</th><th class="border p-1">noun</th>
                </tr>
              </thead>
              <tbody>
                <tr class="text-center">
                  <td class="border p-1">fantastic</td><td class="border p-1">small</td><td class="border p-1">new</td><td class="border p-1">round</td><td class="border p-1">red</td><td class="border p-1">Swiss</td><td class="border p-1">plastic</td><td class="border p-1">alarm</td><td class="border p-1">clock</td>
                </tr>
              </tbody>
            </table>
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>a beautiful blue lace handkerchief</em> — opinion → colour → material</li>
            <li>• Порядкові числівники (first, second) стоять ПЕРЕД кількісними: <em>the first two weeks</em> (НЕ <s>the two first weeks</s>)</li>
            <li>• <strong>Common Mistake:</strong> не ставте більше 2–3 прикметників перед одним іменником — <em>a beautiful blue evening dress</em></li>
          </ul>
        `
      },
      {
        id: "th_4",
        title: "Складні прикметники (compound adjectives)",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Складні прикметники пишуться через дефіс і утворюються за кількома моделями.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формули:</strong> number + noun (однина!) &nbsp;|&nbsp; adverb + Participle II &nbsp;|&nbsp; adjective/adverb + Participle I
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>a never-ending journey</em> — Participle I</li>
            <li>• <em>a broken-down washing machine</em> — Participle II</li>
            <li>• <em>a three-hour delay</em> — числівник + іменник в ОДНИНІ (НЕ <s>a three-hours delay</s>)</li>
            <li>• <em>well-behaved children, badly-made furniture</em> — well/badly + Participle II</li>
            <li>• <strong>Common Mistake:</strong> <s>a ten-minutes walk</s> → <em>a ten-minute walk</em></li>
          </ul>
        `
      },
      {
        id: "th_5",
        title: "Іменник у ролі прикметника + gold/golden, silk/silky, stone/stony",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Іменник може стояти перед іншим іменником і працювати як прикметник. У такій позиції він <strong>НЕ має множини</strong>.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> Noun (singular) + Noun → <em>morning paper / morning papers</em>, <em>coffee table / coffee tables</em>
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>gold</strong> = зроблений із золота (<em>a gold ring</em>) / <strong>golden</strong> = золотистого кольору (<em>the golden sand</em>)</li>
            <li>• <strong>silk</strong> = зі шовку (<em>a silk blouse</em>) / <strong>silky</strong> = на дотик як шовк (<em>silky hair</em>)</li>
            <li>• <strong>stone</strong> = з каменю (<em>the stone path</em>) / <strong>stony</strong> = холодний, як камінь (<em>a stony look</em>)</li>
            <li>• Так само: <em>wood → wooden</em> (матеріал), <em>wool → woollen</em> (матеріал)</li>
          </ul>
        `
      },
      {
        id: "th_6",
        title: "The + adjective = група людей",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Деякі прикметники з артиклем <strong>the</strong> перетворюються на іменник і позначають <strong>усю групу людей загалом</strong> (дієслово — у множині).</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> the + adjective = люди загалом &nbsp;|&nbsp; the + adjective + people = конкретна група
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• Список: <em>elderly, middle-aged, old, young, blind, dead, deaf, disabled, living, sick, homeless, hungry, poor, rich, strong, unemployed, weak</em></li>
            <li>• <em>The young <strong>have</strong> a lot of energy.</em> — молодь загалом</li>
            <li>• <em>The young <strong>people</strong> of our town are organising a concert.</em> — конкретна група</li>
            <li>• Про одну людину: <em>a/the young man, a/the blind woman</em></li>
          </ul>
        `
      },
      {
        id: "th_7",
        title: "Прикметники з обмеженою позицією (afraid, asleep / chief, elder)",
        level: "advanced",
        contentHtml: `
          <p class="text-slate-600 mb-3">Частина прикметників вживається <strong>тільки після дієслова</strong> (predicative), інша — <strong>тільки перед іменником</strong> (attributive).</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Тільки після дієслова:</strong> afraid, alike, alive, alone, ashamed, asleep, awake, content, glad, ill, pleased<br>
            <strong>Тільки перед іменником:</strong> chief, elder, eldest, former, indoor, inner, main, only, outdoor, outer, principal, upper
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>The man was alive.</em> ✓ &nbsp; <s>the alive man</s> ✗</li>
            <li>• <em>Karen is ill today.</em> ✓ &nbsp; <s>an ill woman</s> ✗ (кажуть <em>a sick woman</em>)</li>
            <li>• <em>This is my elder son.</em> ✓ &nbsp; <s>My son is elder.</s> ✗ (кажуть <em>older</em>)</li>
          </ul>
        `
      }
    ],
    exercises: {
      order: [
        { id: "ord_1", level: "elementary", prefix: "It's a(n)", scrambled: ["stone", "small", "cottage"], answer: "small stone cottage", hint: "Size → Material → Noun" },
        { id: "ord_2", level: "elementary", prefix: "It's a(n)", scrambled: ["wooden", "English", "huge", "wardrobe"], answer: "huge English wooden wardrobe", hint: "Size → Origin → Material → Noun" },
        { id: "ord_3", level: "intermediate", prefix: "It's a(n)", scrambled: ["Chinese", "old", "amazing", "story"], answer: "amazing old Chinese story", hint: "Opinion → Age → Origin → Noun" },
        { id: "ord_4", level: "intermediate", prefix: "It's a(n)", scrambled: ["American", "exciting", "new", "film"], answer: "exciting new American film", hint: "Opinion → Age → Origin → Noun" },
        { id: "ord_5", level: "intermediate", prefix: "It's a pair of", scrambled: ["reading", "old", "wire", "glasses"], answer: "old wire reading glasses", hint: "Age → Material → Used for → Noun" },
        { id: "ord_6", level: "intermediate", prefix: "It's a(n)", scrambled: ["old-fashioned", "wooden", "lovely", "table"], answer: "lovely old-fashioned wooden table", hint: "Opinion → Age → Material → Noun" },
        { id: "ord_7", level: "advanced", prefix: "It's a(n)", scrambled: ["Irish", "tablecloth", "linen", "white"], answer: "white Irish linen tablecloth", hint: "Colour → Origin → Material → Noun" },
        { id: "ord_8", level: "intermediate", prefix: "It's a", scrambled: ["large", "chocolate", "cake", "delicious"], answer: "delicious large chocolate cake", hint: "Opinion → Size → Material → Noun" },
        { id: "ord_9", level: "intermediate", prefix: "It's a(n)", scrambled: ["velvet", "ugly", "sofa", "orange"], answer: "ugly orange velvet sofa", hint: "Opinion → Colour → Material → Noun" },
        { id: "ord_10", level: "intermediate", prefix: "For the bedroom I got a(n)", scrambled: ["round", "antique", "mirror", "large"], answer: "large antique round mirror", hint: "Size → Age → Shape → Noun" },
        { id: "ord_11", level: "intermediate", prefix: "I found some", scrambled: ["tall", "silver", "beautiful", "candlesticks"], answer: "beautiful tall silver candlesticks", hint: "Opinion → Size → Material → Noun" },
        { id: "ord_12", level: "intermediate", prefix: "I also bought some", scrambled: ["cotton", "thick", "soft", "towels"], answer: "soft thick cotton towels", hint: "Opinion → Size → Material → Noun" },
        { id: "ord_13", level: "advanced", prefix: "I bought a", scrambled: ["woollen", "green", "rug", "square"], answer: "square green woollen rug", hint: "Shape → Colour → Material → Noun" },
        { id: "ord_14", level: "advanced", prefix: "I bought a(n)", scrambled: ["oak", "English", "table", "fabulous"], answer: "fabulous English oak table", hint: "Opinion → Origin → Material → Noun" }
      ],
      choice: [
        { id: "ch_1", level: "elementary", before: "When she looked inside, she found a doll wrapped in", options: ["silk", "silky"], after: "paper.", correct: "silky", explanation: "Папір не може бути ЗРОБЛЕНИЙ із шовку, він лише на дотик як шовк — тому silky." },
        { id: "ch_2", level: "elementary", before: "The doll had", options: ["gold", "golden"], after: "hair.", correct: "golden", explanation: "Волосся лише кольору золота, а не з золота — golden." },
        { id: "ch_3", level: "elementary", before: "She was wearing a long", options: ["woollen", "wool"], after: "coat.", correct: "woollen", explanation: "Матеріал передається прикметником woollen (зроблений із вовни)." },
        { id: "ch_4", level: "intermediate", before: "She sat down on the cold", options: ["stony", "stone"], after: "floor.", correct: "stone", explanation: "Підлога справді зроблена з каменю — stone. Stony означає «холодний, як камінь» (про погляд)." },
        { id: "ch_5", level: "intermediate", before: "She was wearing a real", options: ["gold", "golden"], after: "necklace.", correct: "gold", explanation: "Справжнє намисто з золота — gold necklace." },
        { id: "ch_6", level: "intermediate", before: "Underneath the coat, she had a", options: ["silky", "silk"], after: "dress.", correct: "silk", explanation: "Сукня пошита зі шовку — silk dress." }
      ],
      gap: [
        { id: "gap_1", level: "intermediate", prompt: "It is important to look after ______ (elderly), especially in winter.", answers: ["the elderly"], explanation: "The + adjective позначає групу людей ЗАГАЛОМ, без слова people." },
        { id: "gap_2", level: "intermediate", prompt: "Ambulances took ______ (injured) to hospitals in the area.", answers: ["the injured"], explanation: "The injured = «постраждалі» як група; дієслово узгоджується з множиною." },
        { id: "gap_3", level: "advanced", prompt: "______ (old) in the village are upset about the new road.", answers: ["the old people"], explanation: "Йдеться про конкретну групу (саме в цьому селі), тому додаємо people." },
        { id: "gap_4", level: "intermediate", prompt: "They are changing the building to make it easier for ______ (disabled) to get around.", answers: ["the disabled"], explanation: "Загальна категорія людей — the + adjective." },
        { id: "gap_5", level: "advanced", prompt: "______ (young) in the audience cheered loudly at the end of the concert.", answers: ["the young people"], explanation: "Конкретна група (та, що була в залі) — the + adjective + people." },
        { id: "gap_6", level: "advanced", prompt: "______ (poor) of our town receive help from the council.", answers: ["the poor people"], explanation: "Уточнення «of our town» робить групу конкретною, тому потрібне people." },
        { id: "gap_7", level: "intermediate", prompt: "Christine is a nurse who looks after ______ (sick).", answers: ["the sick"], explanation: "Хворі загалом — the sick." },
        { id: "gap_8", level: "advanced", prompt: "______ (strong) in the group carried the heavy equipment.", answers: ["the strong people"], explanation: "Конкретна група («у цій групі») — додаємо people." },
        { id: "gap_9", level: "intermediate", prompt: "______ (rich) can afford to live in luxury.", answers: ["the rich"], explanation: "Багаті як суспільна категорія — the rich." },
        { id: "gap_10", level: "elementary", prompt: "A story which is written well is a ______ story. (well / write)", answers: ["well-written", "well written"], explanation: "Compound adjective: well + Participle II через дефіс." },
        { id: "gap_11", level: "elementary", prompt: "A building which has twelve storeys is a ______ building. (twelve / storey)", answers: ["twelve-storey", "twelve storey"], explanation: "Після числівника іменник стоїть в ОДНИНІ: twelve-storey." },
        { id: "gap_12", level: "intermediate", prompt: "A train which moves fast is a ______ train. (fast / move)", answers: ["fast-moving", "fast moving"], explanation: "Прислівник/прикметник + Participle I: fast-moving." },
        { id: "gap_13", level: "intermediate", prompt: "A student who works hard is a ______ student. (hard / work)", answers: ["hard-working", "hard working"], explanation: "hard + working — класичний compound adjective." },
        { id: "gap_14", level: "advanced", prompt: "An office which has good lighting is a ______ office. (well / light)", answers: ["well-lit", "well lit"], explanation: "Good lighting передається як well-lit (Participle II від light)." },
        { id: "gap_15", level: "elementary", prompt: "A holiday which lasts two weeks is a ______ holiday. (two / week)", answers: ["two-week", "two week"], explanation: "Два тижні → two-week, іменник без -s." },
        { id: "gap_16", level: "elementary", prompt: "A report which has ten pages is a ______ report. (ten / page)", answers: ["ten-page", "ten page"], explanation: "Числівник + іменник в однині: ten-page report." }
      ]
    }
  };

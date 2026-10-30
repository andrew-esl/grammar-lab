// Тема: nouns
// Додається у глобальний реєстр TOPICS_DATA. Порядок підключення у index.html = порядок у меню.
window.TOPICS_DATA = window.TOPICS_DATA || {};
window.TOPICS_DATA["nouns"] = {
    id: "nouns",
    title: "Іменники (Nouns)",
    description: "Іменник: множина, злічувані/незлічувані, узгодження з дієсловом.",
    theory: [
      {
        id: "th_1",
        title: "Іменник: типи, рід, відмінки",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Іменник — самостійна частина мови, яка називає предмет чи явище і відповідає на питання <strong>хто? що?</strong></p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Відмінків — 2:</strong> Nominative (називний) і Possessive (присвійний)<br>
            <strong>Родів — 3:</strong> чоловічий, жіночий, середній
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>concrete nouns</strong> — конкретні: <em>a pen, a book, a knife, a bottle</em></li>
            <li>• <strong>abstract nouns</strong> — абстрактні: <em>love, hate, knowledge</em></li>
            <li>• <strong>collective nouns</strong> — збірні: <em>team, family, crowd, group</em></li>
            <li>• Більшість іменників — середнього роду, окрім назв кораблів, транспортних засобів та країн (жіночий рід) і родовидових понять: <em>man – woman, bull – cow, duke – duchess</em></li>
          </ul>
        `
      },
      {
        id: "th_2",
        title: "Множина: основні правила",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Множина більшості іменників утворюється додаванням <strong>-s</strong>, але є чотири важливі винятки за правописом.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> Noun + -s &nbsp;|&nbsp; після s, ss, sh, ch, x, o → <strong>-es</strong>
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>a pen – pens, a phone – phones</em></li>
            <li>• <strong>SHCHO<sup>x</sup></strong> (s, sh, ch, o, x) → -es: <em>bush – bushes, church – churches, box – boxes, tomato – tomatoes</em></li>
            <li>• <strong>АЛЕ:</strong> <em>piano – pianos, radio – radios, zoo – zoos, hippo – hippos, video – videos, photo – photos</em></li>
            <li>• приголосний + <strong>-y</strong> → <strong>-ies</strong>: <em>city – cities, baby – babies</em></li>
            <li>• голосний + <strong>-y</strong> → <strong>-s</strong>: <em>toy – toys, boy – boys, day – days</em></li>
            <li>• <strong>-f/-fe</strong> → <strong>-ves</strong>: <em>wolf – wolves, knife – knives, life – lives, leaf – leaves, half – halves, shelf – shelves, calf – calves</em></li>
            <li>• <strong>АЛЕ:</strong> <em>chief – chiefs, roof – roofs, handkerchief – handkerchiefs, dwarf – dwarfs, proof – proofs, cliff – cliffs</em></li>
          </ul>
        `
      },
      {
        id: "th_3",
        title: "Неправильні форми множини",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Ці форми треба просто вивчити напам'ять — вони не підпорядковуються жодному правилу.</p>
          <div class="overflow-x-auto mb-3">
            <table class="w-full text-xs border-collapse">
              <thead><tr class="bg-amber-50"><th class="border p-1">singular</th><th class="border p-1">plural</th><th class="border p-1">singular</th><th class="border p-1">plural</th></tr></thead>
              <tbody class="text-center">
                <tr><td class="border p-1">man</td><td class="border p-1">men</td><td class="border p-1">ox</td><td class="border p-1">oxen</td></tr>
                <tr><td class="border p-1">woman</td><td class="border p-1">women</td><td class="border p-1">tooth</td><td class="border p-1">teeth</td></tr>
                <tr><td class="border p-1">goose</td><td class="border p-1">geese</td><td class="border p-1">child</td><td class="border p-1">children</td></tr>
                <tr><td class="border p-1">foot</td><td class="border p-1">feet</td><td class="border p-1">person</td><td class="border p-1">people</td></tr>
                <tr><td class="border p-1">mouse</td><td class="border p-1">mice</td><td class="border p-1">louse</td><td class="border p-1">lice</td></tr>
                <tr><td class="border p-1">deer</td><td class="border p-1">deer</td><td class="border p-1">sheep</td><td class="border p-1">sheep</td></tr>
                <tr><td class="border p-1">fish</td><td class="border p-1">fish</td><td class="border p-1">fruit</td><td class="border p-1">fruit</td></tr>
              </tbody>
            </table>
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>peoples</em> = народи (не «люди»)</li>
            <li>• <em>fishes / fruits</em> вживають, коли йдеться про РІЗНІ види риби чи фруктів</li>
            <li>• <em>mouses</em> — лише про комп'ютерні миші</li>
          </ul>
        `
      },
      {
        id: "th_4",
        title: "Запозичені та складені іменники у множині",
        level: "advanced",
        contentHtml: `
          <p class="text-slate-600 mb-3">Слова з латини й грецької часто зберігають оригінальну множину, а складені іменники мають чотири моделі.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>У складених іменниках -s отримує ГОЛОВНЕ слово:</strong> editor<strong>s</strong>-in-chief, passer<strong>s</strong>-by
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>phenomenon – phenomena, datum – data, crisis – crises, stimulus – stimuli, formula – formulae, index – indices, antenna – antennae, basis – bases, analysis – analyses, criterion – criteria, nucleus – nuclei, series – series</em></li>
            <li>• У розмовній мові трапляються англійські форми: <em>formulas, indexes</em></li>
            <li>• <strong>a)</strong> -s до головного слова: <em>editors-in-chief, brothers-in-law, lookers-on</em></li>
            <li>• <strong>b)</strong> -s до останнього елемента: <em>lady-birds, hotel-keepers, housewives, postmen</em></li>
            <li>• <strong>c)</strong> man/woman на початку → обидва слова у множині: <em>men-servants, women-doctors</em></li>
            <li>• <strong>d)</strong> немає іменникової основи → -s в кінці: <em>forget-me-nots, merry-go-rounds</em></li>
          </ul>
        `
      },
      {
        id: "th_5",
        title: "Злічувані та незлічувані іменники",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Головна різниця: злічувані можна порахувати (<em>one book, two books</em>), незлічувані — ні.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Countable:</strong> a/an/the, присвійні займенники, some/any/many/few<br>
            <strong>Uncountable:</strong> тільки the, some/any/much/little, дієслово в ОДНИНІ
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>їжа:</strong> rice, buckwheat, flour, butter, sugar, meat, bread</li>
            <li>• <strong>рідини:</strong> milk, water, wine, beer</li>
            <li>• <strong>матеріали:</strong> carbon, metal, wood, paper</li>
            <li>• <strong>абстрактні:</strong> knowledge, love, help, justice, patience, experience, education</li>
            <li>• <strong>Запам'ятай!</strong> luggage, baggage, hair, <strong>advice</strong>, news, <strong>furniture</strong>, equipment, <strong>money</strong>, information, accommodation, machinery, rubbish, applause</li>
            <li>• <strong>Common Mistake:</strong> <s>The furniture are new.</s> → <em>The furniture <strong>is</strong> new.</em></li>
          </ul>
        `
      },
      {
        id: "th_6",
        title: "Іменники ТІЛЬКИ в однині",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Ці іменники закінчуються на -s, але дієслово після них стоїть в <strong>однині</strong>.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> Noun + <strong>is / was / does</strong>
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>шкільні предмети:</strong> physics, economics, mathematics (maths)</li>
            <li>• <strong>спорт:</strong> gymnastics, athletics</li>
            <li>• <strong>ігри:</strong> darts, billiards, dominoes</li>
            <li>• <strong>хвороби:</strong> measles, mumps, chickenpox</li>
            <li>• <strong>news:</strong> <em>The news was unexpected.</em></li>
            <li>• <strong>збірні поняття грошей, часу, відстані:</strong> <em>2 million dollars <strong>was</strong> given to the military. 3 hours <strong>is</strong> enough to do this job.</em></li>
          </ul>
        `
      },
      {
        id: "th_7",
        title: "Іменники ТІЛЬКИ у множині",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Ці іменники не мають форми однини, тому дієслово після них — у <strong>множині</strong>.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> Noun + <strong>are / were / do</strong>
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>предмети з двох частин:</strong> scissors, shoes, boots, trousers, pyjamas, glasses, binoculars, pliers, scales, stairs</li>
            <li>• <strong>police, people, surroundings, clothes, wages, goods</strong></li>
            <li>• <em>The police <strong>are</strong> coming to the rescue. / These trousers <strong>are</strong> terribly unflattering.</em></li>
            <li>• Щоб порахувати: <em>a pair of scissors, two pairs of trousers</em></li>
          </ul>
        `
      }
    ],
    exercises: {
      order: [
        { id: "ord_12_nouns", level: "advanced", prefix: "My two", scrambled: ["coming", "are", "sisters-in-law", "tomorrow."], answer: "sisters-in-law are coming tomorrow.", hint: "У складених іменниках -s бере головне слово" },
        { id: "ord_13_nouns", level: "advanced", prefix: "Both", scrambled: ["meeting.", "at", "editors-in-chief", "the", "were"], answer: "editors-in-chief were at the meeting.", hint: "editor — головне слово, тому editors-in-chief" },
        { id: "ord_14_nouns", level: "advanced", prefix: "Several", scrambled: ["stopped", "passers-by", "helped.", "and"], answer: "passers-by stopped and helped.", hint: "passer — головне слово" }
      ],
      choice: [
        { id: "ch_1_nouns", level: "intermediate", before: "Chemistry", options: ["are", "is"], after: "my least favourite subject.", correct: "is", explanation: "Назви шкільних предметів на -s (chemistry, physics, maths) вживаються з дієсловом в однині." },
        { id: "ch_2_nouns", level: "intermediate", before: "Your bathroom scales", options: ["is", "are"], after: "not very accurate.", correct: "are", explanation: "Scales — предмет із двох частин, тому тільки множина." },
        { id: "ch_3_nouns", level: "advanced", before: "£2000", options: ["is", "are"], after: "far too expensive for that stereo.", correct: "is", explanation: "Сума грошей сприймається як одне ціле — дієслово в однині." },
        { id: "ch_4_nouns", level: "elementary", before: "Table tennis", options: ["is", "are"], after: "sometimes referred to as ping-pong.", correct: "is", explanation: "Назви видів спорту — однина." },
        { id: "ch_5_nouns", level: "intermediate", before: "The police", options: ["is", "are"], after: "coming to the rescue.", correct: "are", explanation: "Police вживається тільки у множині." },
        { id: "ch_6_nouns", level: "elementary", before: "Paper", options: ["is", "are"], after: "made from wood.", correct: "is", explanation: "Матеріали — незлічувані іменники, дієслово в однині." },
        { id: "ch_7_nouns", level: "elementary", before: "Children", options: ["likes", "like"], after: "playing games.", correct: "like", explanation: "Children — неправильна форма множини від child." },
        { id: "ch_8_nouns", level: "intermediate", before: "The scissors", options: ["don't", "doesn't"], after: "work very well.", correct: "don't", explanation: "Scissors складаються з двох частин — тільки множина." },
        { id: "ch_9_nouns", level: "elementary", before: "These trousers", options: ["is", "are"], after: "terribly unflattering.", correct: "are", explanation: "Trousers — завжди множина (these trousers)." },
        { id: "ch_10_nouns", level: "intermediate", before: "Education", options: ["are", "is"], after: "considered to be very important by almost everyone.", correct: "is", explanation: "Абстрактний незлічуваний іменник — однина." },
        { id: "ch_11_nouns", level: "intermediate", before: "Most people", options: ["worry", "worries"], after: "about the effect of pollution on the environment.", correct: "worry", explanation: "People — множина від person, тому дієслово без -s." },
        { id: "ch_12_nouns", level: "elementary", before: "Water", options: ["is", "are"], after: "necessary for plants to grow.", correct: "is", explanation: "Рідини — незлічувані, дієслово в однині." },
        { id: "ch_13_nouns", level: "intermediate", before: "In the summer my hair", options: ["becomes", "become"], after: "dry.", correct: "becomes", explanation: "Hair у значенні «волосся на голові» — незлічуваний іменник." },
        { id: "ch_14_nouns", level: "intermediate", before: "The rubbish", options: ["has", "have"], after: "been taken away.", correct: "has", explanation: "Rubbish — незлічуваний іменник." },
        { id: "ch_15_nouns", level: "intermediate", before: "The information", options: ["is", "are"], after: "inaccurate.", correct: "is", explanation: "Information ніколи не має множини." },
        { id: "ch_16_nouns", level: "intermediate", before: "Binoculars", options: ["is", "are"], after: "needed to see that far.", correct: "are", explanation: "Прилад із двох частин — тільки множина." },
        { id: "ch_17_nouns", level: "intermediate", before: "His luggage", options: ["was", "were"], after: "left on the platform.", correct: "was", explanation: "Luggage — незлічуваний (порівняй: two pieces of luggage)." },
        { id: "ch_18_nouns", level: "intermediate", before: "The stairs", options: ["is", "are"], after: "very dangerous.", correct: "are", explanation: "Stairs вживається у множині." },
        { id: "ch_19_nouns", level: "advanced", before: "Mumps", options: ["is", "are"], after: "contagious.", correct: "is", explanation: "Назви хвороб на -s (mumps, measles) — однина." },
        { id: "ch_20_nouns", level: "intermediate", before: "The news", options: ["was", "were"], after: "unexpected.", correct: "was", explanation: "News — незлічуваний іменник в однині, попри -s." },
        { id: "ch_21_nouns", level: "advanced", before: "His experience of travel", options: ["is", "are"], after: "limited.", correct: "is", explanation: "Experience у значенні «досвід» — незлічуваний." }
      ],
      gap: [
        { id: "gap_1_nouns", level: "elementary", prompt: "toe – ______", answers: ["toes"], explanation: "Звичайне правило: іменник + -s." },
        { id: "gap_2_nouns", level: "elementary", prompt: "city – ______", answers: ["cities"], explanation: "Приголосний + -y → -ies." },
        { id: "gap_3_nouns", level: "elementary", prompt: "hero – ______", answers: ["heroes"], explanation: "Після -o додаємо -es." },
        { id: "gap_4_nouns", level: "intermediate", prompt: "piano – ______", answers: ["pianos"], explanation: "Виняток: музичні терміни на -o беруть лише -s." },
        { id: "gap_5_nouns", level: "intermediate", prompt: "calf – ______", answers: ["calves"], explanation: "-f → -ves." },
        { id: "gap_6_nouns", level: "intermediate", prompt: "cliff – ______", answers: ["cliffs"], explanation: "Виняток: cliff зберігає -f і бере просто -s." },
        { id: "gap_7_nouns", level: "intermediate", prompt: "chief – ______", answers: ["chiefs"], explanation: "Виняток із правила -f → -ves." },
        { id: "gap_8_nouns", level: "elementary", prompt: "stitch – ______", answers: ["stitches"], explanation: "Після -ch додаємо -es." },
        { id: "gap_9_nouns", level: "intermediate", prompt: "bath – ______", answers: ["baths"], explanation: "Після -th додаємо просто -s." },
        { id: "gap_10_nouns", level: "intermediate", prompt: "life – ______", answers: ["lives"], explanation: "-fe → -ves." },
        { id: "gap_11_nouns", level: "intermediate", prompt: "shelf – ______", answers: ["shelves"], explanation: "-f → -ves." },
        { id: "gap_12_nouns", level: "elementary", prompt: "berry – ______", answers: ["berries"], explanation: "Приголосний + -y → -ies." },
        { id: "gap_13_nouns", level: "elementary", prompt: "valley – ______", answers: ["valleys"], explanation: "Голосний + -y → просто -s." },
        { id: "gap_14_nouns", level: "intermediate", prompt: "roof – ______", answers: ["roofs"], explanation: "Виняток: roof бере -s, а не -ves." },
        { id: "gap_15_nouns", level: "elementary", prompt: "pen – ______", answers: ["pens"], explanation: "Звичайне правило: + -s." },
        { id: "gap_16_nouns", level: "elementary", prompt: "window – ______", answers: ["windows"], explanation: "Після голосного + -o додаємо -s." },
        { id: "gap_17_nouns", level: "elementary", prompt: "library – ______", answers: ["libraries"], explanation: "Приголосний + -y → -ies." },
        { id: "gap_18_nouns", level: "elementary", prompt: "watch – ______", answers: ["watches"], explanation: "Після -ch додаємо -es." },
        { id: "gap_19_nouns", level: "elementary", prompt: "dress – ______", answers: ["dresses"], explanation: "Після -ss додаємо -es." },
        { id: "gap_20_nouns", level: "elementary", prompt: "country – ______", answers: ["countries"], explanation: "Приголосний + -y → -ies." },
        { id: "gap_21_nouns", level: "elementary", prompt: "glass – ______", answers: ["glasses"], explanation: "Після -ss додаємо -es." },
        { id: "gap_22_nouns", level: "elementary", prompt: "day – ______", answers: ["days"], explanation: "Голосний + -y → просто -s." },
        { id: "gap_23_nouns", level: "elementary", prompt: "party – ______", answers: ["parties"], explanation: "Приголосний + -y → -ies." },
        { id: "gap_24_nouns", level: "intermediate", prompt: "leaf – ______", answers: ["leaves"], explanation: "-f → -ves." },
        { id: "gap_25_nouns", level: "elementary", prompt: "fox – ______", answers: ["foxes"], explanation: "Після -x додаємо -es." },
        { id: "gap_26_nouns", level: "intermediate", prompt: "half – ______", answers: ["halves"], explanation: "-f → -ves." },
        { id: "gap_27_nouns", level: "elementary", prompt: "eye – ______", answers: ["eyes"], explanation: "Звичайне правило: + -s." },
        { id: "gap_28_nouns", level: "elementary", prompt: "language – ______", answers: ["languages"], explanation: "Звичайне правило: + -s." },
        { id: "gap_29_nouns", level: "elementary", prompt: "place – ______", answers: ["places"], explanation: "Звичайне правило: + -s." },
        { id: "gap_30_nouns", level: "elementary", prompt: "ray – ______", answers: ["rays"], explanation: "Голосний + -y → просто -s." },
        { id: "gap_31_nouns", level: "elementary", prompt: "bush – ______", answers: ["bushes"], explanation: "Після -sh додаємо -es." },
        { id: "gap_32_nouns", level: "intermediate", prompt: "mouth – ______", answers: ["mouths"], explanation: "Після -th додаємо просто -s." },
        { id: "gap_33_nouns", level: "elementary", prompt: "journey – ______", answers: ["journeys"], explanation: "Голосний + -y → просто -s." },
        { id: "gap_34_nouns", level: "intermediate", prompt: "photo – ______", answers: ["photos"], explanation: "Виняток: photo бере лише -s." },
        { id: "gap_35_nouns", level: "elementary", prompt: "foot – ______", answers: ["feet"], explanation: "Неправильна форма множини." },
        { id: "gap_36_nouns", level: "elementary", prompt: "boot – ______", answers: ["boots"], explanation: "Правильна форма: boot + -s (не плутати з foot)." },
        { id: "gap_37_nouns", level: "intermediate", prompt: "ox – ______", answers: ["oxen"], explanation: "Архаїчне закінчення -en." },
        { id: "gap_38_nouns", level: "elementary", prompt: "man – ______", answers: ["men"], explanation: "Неправильна форма: зміна голосного." },
        { id: "gap_39_nouns", level: "elementary", prompt: "woman – ______", answers: ["women"], explanation: "Пишеться women, а читається [ˈwɪmɪn]." },
        { id: "gap_40_nouns", level: "elementary", prompt: "month – ______", answers: ["months"], explanation: "Правильна форма: + -s." },
        { id: "gap_41_nouns", level: "elementary", prompt: "mouse – ______", answers: ["mice"], explanation: "Неправильна форма (mouses — лише про комп'ютерні миші)." },
        { id: "gap_42_nouns", level: "elementary", prompt: "child – ______", answers: ["children"], explanation: "Неправильна форма із закінченням -ren." },
        { id: "gap_43_nouns", level: "elementary", prompt: "ship – ______", answers: ["ships"], explanation: "Правильна форма: + -s." },
        { id: "gap_44_nouns", level: "intermediate", prompt: "goose – ______", answers: ["geese"], explanation: "Неправильна форма: зміна голосного." },
        { id: "gap_45_nouns", level: "intermediate", prompt: "deer – ______", answers: ["deer"], explanation: "Форма множини збігається з одниною." },
        { id: "gap_46_nouns", level: "intermediate", prompt: "sheep – ______", answers: ["sheep"], explanation: "Форма множини збігається з одниною." },
        { id: "gap_47_nouns", level: "advanced", prompt: "crisis – ______", answers: ["crises"], explanation: "Грецьке закінчення -is → -es." },
        { id: "gap_48_nouns", level: "advanced", prompt: "phenomenon – ______", answers: ["phenomena"], explanation: "Грецьке -on → -a." },
        { id: "gap_49_nouns", level: "advanced", prompt: "datum – ______", answers: ["data"], explanation: "Латинське -um → -a." },
        { id: "gap_50_nouns", level: "advanced", prompt: "nucleus – ______", answers: ["nuclei"], explanation: "Латинське -us → -i." },
        { id: "gap_51_nouns", level: "advanced", prompt: "basis – ______", answers: ["bases"], explanation: "Закінчення -is → -es." },
        { id: "gap_52_nouns", level: "advanced", prompt: "criterion – ______", answers: ["criteria"], explanation: "Грецьке -on → -a." },
        { id: "gap_53_nouns", level: "advanced", prompt: "series – ______", answers: ["series"], explanation: "Форма не змінюється." },
        { id: "gap_54_nouns", level: "advanced", prompt: "analysis – ______", answers: ["analyses"], explanation: "Закінчення -is → -es." },
        { id: "gap_55_nouns", level: "advanced", prompt: "formula – ______", answers: ["formulae", "formulas"], explanation: "У науці — formulae, у розмовній мові — formulas." },
        { id: "gap_56_nouns", level: "intermediate", prompt: "room-mate – ______", answers: ["room-mates", "room mates"], explanation: "-s додається до останнього елемента." },
        { id: "gap_57_nouns", level: "intermediate", prompt: "fellow-worker – ______", answers: ["fellow-workers", "fellow workers"], explanation: "-s до останнього елемента." },
        { id: "gap_58_nouns", level: "advanced", prompt: "court-martial – ______", answers: ["courts-martial"], explanation: "Головне слово court, тому courts-martial." },
        { id: "gap_59_nouns", level: "advanced", prompt: "man-of-war – ______", answers: ["men-of-war"], explanation: "Головне слово man → men-of-war." },
        { id: "gap_60_nouns", level: "intermediate", prompt: "boy-messenger – ______", answers: ["boy-messengers", "boy messengers"], explanation: "-s до останнього елемента." },
        { id: "gap_61_nouns", level: "intermediate", prompt: "onlooker – ______", answers: ["onlookers"], explanation: "Це одне слово, тому просто + -s." },
        { id: "gap_62_nouns", level: "advanced", prompt: "passer-by – ______", answers: ["passers-by"], explanation: "Головне слово passer → passers-by." },
        { id: "gap_63_nouns", level: "advanced", prompt: "sister-in-law – ______", answers: ["sisters-in-law"], explanation: "Головне слово sister → sisters-in-law." },
        { id: "gap_64_nouns", level: "intermediate", prompt: "postman – ______", answers: ["postmen"], explanation: "Елемент man у кінці → men." },
        { id: "gap_65_nouns", level: "advanced", prompt: "son-in-law – ______", answers: ["sons-in-law"], explanation: "Головне слово son → sons-in-law." },
        { id: "gap_66_nouns", level: "intermediate", prompt: "fisherman – ______", answers: ["fishermen"], explanation: "Елемент man у кінці → men." },
        { id: "gap_67_nouns", level: "elementary", prompt: "schoolgirl – ______", answers: ["schoolgirls"], explanation: "Одне слово, тому + -s." },
        { id: "gap_68_nouns", level: "intermediate", prompt: "text-book – ______", answers: ["text-books", "text books"], explanation: "-s до останнього елемента." },
        { id: "gap_69_nouns", level: "intermediate", prompt: "statesman – ______", answers: ["statesmen"], explanation: "Елемент man у кінці → men." },
        { id: "gap_70_nouns", level: "advanced", prompt: "editor-in-chief – ______", answers: ["editors-in-chief"], explanation: "Головне слово editor → editors-in-chief." },
        { id: "gap_71_nouns", level: "intermediate", prompt: "Making mistakes ______ (be) only natural.", answers: ["is"], explanation: "Герундій як підмет вимагає дієслова в однині." },
        { id: "gap_72_nouns", level: "intermediate", prompt: "Maths ______ (not/interest) me very much.", answers: ["doesn't interest", "does not interest"], explanation: "Назви предметів на -s — однина." },
        { id: "gap_73_nouns", level: "intermediate", prompt: "All of our furniture ______ (be) brand new.", answers: ["is"], explanation: "Furniture — незлічуваний іменник." },
        { id: "gap_74_nouns", level: "elementary", prompt: "Sugar ______ (damage) your teeth.", answers: ["damages"], explanation: "Незлічуваний іменник → дієслово з -s." },
        { id: "gap_75_nouns", level: "elementary", prompt: "Snow rarely ______ (fall) in this part of the country.", answers: ["falls"], explanation: "Snow — незлічуваний іменник в однині." },
        { id: "gap_76_nouns", level: "intermediate", prompt: "The applause ______ (be) very loud.", answers: ["was", "is"], explanation: "Applause — незлічуваний іменник, тому однина." },
        { id: "gap_77_nouns", level: "intermediate", prompt: "The news they brought us ______ (be) good.", answers: ["was", "is"], explanation: "News має -s, але вживається в однині." },
        { id: "gap_78_nouns", level: "intermediate", prompt: "Your trousers ______ (not/match) your shirt.", answers: ["don't match", "do not match"], explanation: "Trousers — завжди множина." },
        { id: "gap_79_nouns", level: "advanced", prompt: "The team ______ (discuss) strategy before every game.", answers: ["discusses", "discuss"], explanation: "Збірний іменник: в однині — як ціле, у множині — як окремі люди (британський варіант)." },
        { id: "gap_80_nouns", level: "advanced", prompt: "Chickenpox ______ (give) you an itchy rash.", answers: ["gives"], explanation: "Назви хвороб на -s — однина." },
        { id: "gap_81_nouns", level: "intermediate", prompt: "Billiards ______ (be) his favourite game.", answers: ["is"], explanation: "Назви ігор на -s — однина." },
        { id: "gap_82_nouns", level: "intermediate", prompt: "The accommodation here ______ (seem) very expensive.", answers: ["seems"], explanation: "Accommodation — незлічуваний іменник." },
        { id: "gap_83_nouns", level: "intermediate", prompt: "The pliers ______ (be) in the tool box.", answers: ["are"], explanation: "Інструмент із двох частин — тільки множина." },
        { id: "gap_84_nouns", level: "intermediate", prompt: "Knowledge of other languages ______ (help) people in business.", answers: ["helps"], explanation: "Підмет — knowledge (незлічуваний), а не languages." },
        { id: "gap_85_nouns", level: "advanced", prompt: "Ten minutes ______ (be) too little time to finish this report.", answers: ["is"], explanation: "Відрізок часу сприймається як одне ціле — однина." },
        { id: "gap_86_nouns", level: "intermediate", prompt: "Every time I travel, some of my luggage ______ (get) damaged.", answers: ["gets"], explanation: "Luggage — незлічуваний іменник." },
        { id: "gap_87_nouns", level: "intermediate", prompt: "Welsh ______ (be) difficult to learn.", answers: ["is"], explanation: "Назви мов — однина." },
        { id: "gap_88_nouns", level: "advanced", prompt: "The staff ______ (be) happy with the pay rise.", answers: ["are", "is"], explanation: "Staff — збірний іменник; у британському варіанті частіше are." },
        { id: "gap_89_nouns", level: "intermediate", prompt: "Sophisticated machinery ______ (cost) a lot of money.", answers: ["costs"], explanation: "Machinery — незлічуваний іменник." },
        { id: "gap_90_nouns", level: "advanced", prompt: "They are teaching Physics in room 2A. → Physics ______ (teach) in room 2A.", answers: ["is being taught"], explanation: "Physics — однина, тому is being taught." },
        { id: "gap_91_nouns", level: "advanced", prompt: "Craftsmen have used the best wood. → The best wood ______ (use) by craftsmen.", answers: ["has been used"], explanation: "Wood — незлічуваний, тому has been used." },
        { id: "gap_92_nouns", level: "intermediate", prompt: "You need to have experience. → Experience ______ (need) if you wish to apply.", answers: ["is needed"], explanation: "Experience — незлічуваний іменник, дієслово в однині." },
        { id: "gap_93_nouns", level: "intermediate", prompt: "Rangers protect the woods. → The woods ______ (protect) by rangers.", answers: ["are protected"], explanation: "Woods — множина, тому are protected." },
        { id: "gap_94_nouns", level: "intermediate", prompt: "He tore his trousers in the fight. → His trousers ______ (tear) in the fight.", answers: ["were torn"], explanation: "Trousers — множина, тому were torn." },
        { id: "gap_95_nouns", level: "intermediate", prompt: "We give exam advice at the end of the course. → Exam advice ______ (give) at the end of the course.", answers: ["is given"], explanation: "Advice — незлічуваний іменник в однині." },
        { id: "gap_96_nouns", level: "intermediate", prompt: "He classified the information as 'Top Secret'. → The information ______ (classify) as 'Top Secret'.", answers: ["was classified"], explanation: "Information — однина." },
        { id: "gap_97_nouns", level: "intermediate", prompt: "A security guard protects our property. → Our property ______ (protect) by a security guard.", answers: ["is protected"], explanation: "Property — незлічуваний іменник." },
        { id: "gap_98_nouns", level: "advanced", prompt: "That shop is selling wedding dresses at half price. → Wedding dresses ______ (sell) at half price.", answers: ["are being sold"], explanation: "Dresses — множина, тому are being sold." },
        { id: "gap_99_nouns", level: "intermediate", prompt: "We need new members for our tennis club. → Our tennis club ______ (need) new members.", answers: ["needs"], explanation: "Club — однина, тому дієслово з -s." },
        { id: "gap_100_nouns", level: "advanced", prompt: "You can always find cheap silver jewellery in Portugal. → Cheap silver jewellery ______ (can/find) in Portugal.", answers: ["can be found"], explanation: "Jewellery — незлічуваний іменник у пасиві." },
        { id: "gap_101_nouns", level: "intermediate", prompt: "One doesn't need money to be happy. → Money ______ (not/need) to be happy.", answers: ["isn't needed", "is not needed"], explanation: "Money — незлічуваний іменник в однині." }
      ],
      cross: [
        { id: "cr_22_nouns", level: "advanced", words: ["He", "gave", "me", "a", "useful", "advice."], extraIndex: 3, explanation: "Advice — незлічуваний іменник, тому артикль a/an неможливий: He gave me useful advice (або a useful piece of advice)." },
        { id: "cr_23_nouns", level: "intermediate", words: ["The", "police", "is", "investigating", "the", "crime."], extraIndex: 2, explanation: "Police вживається у множині: the police are." },
        { id: "cr_24_nouns", level: "advanced", words: ["She", "bought", "two", "new", "furnitures", "yesterday."], extraIndex: 4, explanation: "Furniture не має множини; правильно — two pieces of furniture." }
      ],
      abcd: [
        { id: "abcd_1_nouns", level: "elementary", q: "1. I need ______ to finish this report.", options: ["A) an information", "B) informations", "C) some information", "D) a few information"], correct: 2, explanation: "Information — незлічуваний іменник: без a/an і без -s, але можливе some." },
        { id: "abcd_2_nouns", level: "elementary", q: "2. The plural of 'knife' is ______.", options: ["A) knifes", "B) knives", "C) knifies", "D) knive"], correct: 1, explanation: "Іменники на -fe утворюють множину через -ves." },
        { id: "abcd_3_nouns", level: "elementary", q: "3. There ______ six children in the garden.", options: ["A) is", "B) are", "C) was", "D) has"], correct: 1, explanation: "Children — множина, тому are." },
        { id: "abcd_4_nouns", level: "intermediate", q: "4. The news ______ very disappointing.", options: ["A) were", "B) are", "C) was", "D) have been"], correct: 2, explanation: "News — незлічуваний іменник в однині, попри закінчення -s." },
        { id: "abcd_5_nouns", level: "intermediate", q: "5. Where ______ my trousers? I can't find them.", options: ["A) is", "B) are", "C) was", "D) does"], correct: 1, explanation: "Trousers — предмет із двох частин, тільки множина." },
        { id: "abcd_6_nouns", level: "intermediate", q: "6. Mathematics ______ my favourite subject at school.", options: ["A) are", "B) were", "C) is", "D) have been"], correct: 2, explanation: "Назви предметів на -s вживаються з дієсловом в однині." },
        { id: "abcd_7_nouns", level: "advanced", q: "7. The plural of 'passer-by' is ______.", options: ["A) passer-bys", "B) passers-by", "C) passers-bys", "D) passer-bies"], correct: 1, explanation: "У складених іменниках -s отримує головне слово (passer)." },
        { id: "abcd_8_nouns", level: "advanced", q: "8. The plural of 'phenomenon' is ______.", options: ["A) phenomenons", "B) phenomenas", "C) phenomena", "D) phenomeni"], correct: 2, explanation: "Грецьке закінчення -on змінюється на -a." },
        { id: "abcd_34_nouns", level: "intermediate", q: "34. £5000 ______ a lot of money for a second-hand car.", options: ["A) are", "B) were", "C) is", "D) have been"], correct: 2, explanation: "Сума грошей сприймається як одне ціле — однина." },
        { id: "abcd_35_nouns", level: "advanced", q: "35. The staff ______ very helpful when we visited the office.", options: ["A) was being", "B) were", "C) is", "D) has"], correct: 1, explanation: "Staff — збірний іменник; у британському варіанті частіше вживається у множині." },
        { id: "abcd_36_nouns", level: "advanced", q: "36. Mumps ______ a common childhood illness.", options: ["A) are", "B) were", "C) is", "D) have been"], correct: 2, explanation: "Назви хвороб на -s вживаються з дієсловом в однині." }
      ]
    }
  };

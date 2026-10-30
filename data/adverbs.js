// Тема: adverbs
// Додається у глобальний реєстр TOPICS_DATA. Порядок підключення у index.html = порядок у меню.
window.TOPICS_DATA = window.TOPICS_DATA || {};
window.TOPICS_DATA["adverbs"] = {
    id: "adverbs",
    title: "Прислівники (Adverbs)",
    description: "Утворення прислівників, fairly/quite/rather/pretty, позиція в реченні.",
    theory: [
      {
        id: "th_8",
        title: "Прислівник: що описує і які бувають типи",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Прислівник описує <strong>дієслово, прикметник, інший прислівник або все речення</strong>. Це може бути одне слово (<em>carefully</em>) або словосполучення (<em>in the morning</em>).</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>5 типів:</strong> manner (як?) · place (де?) · time (коли?) · frequency (як часто?) · degree (наскільки?)
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>He drives <strong>carefully</strong>.</em> — manner</li>
            <li>• <em>Your bag is <strong>here</strong>.</em> — place</li>
            <li>• <em>They'll leave <strong>tomorrow</strong>.</em> — time</li>
            <li>• <em>He <strong>sometimes</strong> goes fishing.</em> — frequency</li>
            <li>• <em>She is <strong>very</strong> polite.</em> — degree</li>
          </ul>
        `
      },
      {
        id: "th_9",
        title: "Утворення прислівників (-ly)",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Більшість прислівників утворюється додаванням <strong>-ly</strong> до прикметника, але є кілька правил правопису.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> Adjective + -ly → Adverb
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• звичайний випадок: <em>serious → seriously</em>, <em>quick → quickly</em></li>
            <li>• <strong>-le</strong> → викидаємо -e, додаємо -y: <em>gentle → gently</em></li>
            <li>• приголосний + <strong>-y</strong> → -ily: <em>happy → happily</em></li>
            <li>• <strong>-l</strong> → -ly (дві l): <em>awful → awfully</em>, <em>careful → carefully</em></li>
            <li>• <strong>-ic</strong> → -ally: <em>dramatic → dramatically</em> &nbsp;<strong>АЛЕ:</strong> <em>public → publicly</em></li>
            <li>• <strong>-e</strong> → -ely: <em>polite → politely</em> &nbsp;<strong>АЛЕ:</strong> <em>true → truly</em></li>
          </ul>
        `
      },
      {
        id: "th_10",
        title: "Пастка: слова на -ly, які є прикметниками",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Не кожне слово на <strong>-ly</strong> — прислівник. Деякі з них насправді прикметники, і прислівник від них утворюється описово.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> in a + adjective + way/manner
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• Прикметники на -ly: <em>elderly, cowardly, friendly, likely, deadly, lively, lonely, silly, ugly, lovely</em></li>
            <li>• <em>She's a lively child.</em> (прикметник)</li>
            <li>• <em>She greeted me <strong>in a friendly way/manner</strong>.</em> (НЕ <s>friendlily</s>)</li>
            <li>• <em>loud(ly), cheap(ly), quick(ly), tight(ly), fair(ly), slow(ly)</em> — у розмовній мові часто без -ly: <em>Come here quick!</em></li>
          </ul>
        `
      },
      {
        id: "th_11",
        title: "Прислівники з двома формами та різним значенням",
        level: "advanced",
        contentHtml: `
          <p class="text-slate-600 mb-3">Деякі прислівники мають дві форми — <strong>без -ly</strong> (пряме, фізичне значення) і <strong>з -ly</strong> (переносне). Плутати їх — типова помилка рівня B2–C1.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Увага:</strong> hard = наполегливо, але hardly = майже не (негативне значення!)
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>deep</strong> = глибоко (фізично) / <strong>deeply</strong> = дуже, глибоко (емоційно)</li>
            <li>• <strong>free</strong> = безкоштовно / <strong>freely</strong> = без обмежень</li>
            <li>• <strong>high</strong> = високо (фізично) / <strong>highly</strong> = дуже, високо (оцінка)</li>
            <li>• <strong>late</strong> = пізно / <strong>lately</strong> = останнім часом</li>
            <li>• <strong>most</strong> = найбільше / <strong>mostly</strong> = здебільшого</li>
            <li>• <strong>near</strong> = близько / <strong>nearly</strong> = майже</li>
            <li>• <strong>pretty</strong> = досить / <strong>prettily</strong> = гарно</li>
            <li>• <strong>hard</strong> = важко, наполегливо / <strong>hardly</strong> = майже не</li>
            <li>• <em>Hardly</em> вживається з <em>any, anyone, anywhere, anything, ever</em>.</li>
          </ul>
        `
      },
      {
        id: "th_12",
        title: "Однакова форма прикметника і прислівника",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Низка слів має <strong>однакову форму</strong> для прикметника і прислівника. Визначаємо за роллю в реченні: описує іменник — прикметник, описує дієслово — прислівник.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Список:</strong> hard, fast, free, high, low, deep, early, late, long, near, straight, right, wrong + hourly, daily, weekly, monthly, yearly
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>The lake is <strong>deep</strong>.</em> (adj) — <em>They went <strong>deep</strong> into the forest.</em> (adv)</li>
            <li>• <em>These biscuits are very <strong>hard</strong>.</em> (adj) — <em>He tried <strong>hard</strong>.</em> (adv)</li>
            <li>• <em>'Bella Donna' is a <strong>weekly</strong> magazine.</em> (adj) — <em>It comes out <strong>weekly</strong>.</em> (adv)</li>
            <li>• <strong>Common Mistake:</strong> <s>Dad works hardly.</s> → <em>Dad works hard.</em></li>
          </ul>
        `
      },
      {
        id: "th_13",
        title: "Позиція та порядок прислівників",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Прислівники зазвичай стоять <strong>після дієслова</strong>, але <strong>перед прикметником</strong>, іншим прислівником чи дієприкметником.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> MANNER → PLACE → TIME<br>
            <strong>З дієсловами руху (go, come, leave):</strong> PLACE → MANNER → TIME
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>Manner:</strong> перед основним дієсловом, після допоміжного або в кінці — <em>She easily passed the exam. / We are eagerly waiting.</em></li>
            <li>• <strong>Degree</strong> (absolutely, completely, totally, extremely, very, quite, rather): перед прикметником/прислівником, але після допоміжного — <em>This is totally unacceptable. / I don't quite understand.</em></li>
            <li>• <strong>Frequency:</strong> після допоміжних і <em>to be</em>, перед основним дієсловом — <em>He is always ready to help. / Sam often complains.</em></li>
            <li>• <strong>Place і Time:</strong> у кінці — <em>There is a café nearby. / I'll meet you tomorrow.</em></li>
            <li>• <em>soon, now, then</em> — перед основним дієсловом: <em>She then told him what had happened.</em></li>
            <li>• <em>The baby slept quietly in his cot all night long.</em> (manner–place–time)</li>
            <li>• <em>He came to work by bus this morning.</em> (place–manner–time)</li>
          </ul>
        `
      },
      {
        id: "th_14",
        title: "Fairly – Quite – Rather – Pretty",
        level: "advanced",
        contentHtml: `
          <p class="text-slate-600 mb-3">Чотири прислівники ступеня, що різняться силою: <strong>fairly &lt; quite &lt; rather/pretty &lt; very</strong>.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формули:</strong> a/an + fairly · quite + a/an · rather + a/an АБО a/an + rather · a/an + pretty
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>fairly</strong> = досить, але не дуже (позитив слабкий): <em>This is a fairly good CD, but it's not the best.</em></li>
            <li>• <strong>quite</strong> = достатньо: <em>This is quite a good CD. You ought to buy it.</em></li>
            <li>• <strong>quite</strong> + абсолютні прикметники (horrible, ridiculous, brilliant, amazing, useless, impossible, true, exhausted, certain) = повністю: <em>This machine is quite useless.</em></li>
            <li>• <strong>rather</strong> = більше, ніж очікувалось (часто негативно або зі здивуванням): <em>I expected the book to be boring, but it was rather interesting.</em></li>
            <li>• <strong>rather</strong> + comparative/too: <em>Ted is rather more experienced than Alec. / She spends rather too much money.</em></li>
            <li>• <strong>pretty</strong> = розмовний відповідник rather: <em>He had a pretty nasty accident.</em></li>
            <li>• <strong>Common Mistake:</strong> <s>He is a quite tall man.</s> → <em>He is quite a tall man.</em></li>
          </ul>
        `
      }
    ],
    exercises: {
      order: [
        { id: "ord_15", level: "elementary", prefix: "Joanne has been writing", scrambled: ["day.", "letters", "her", "to", "all", "friends"], answer: "letters to her friends all day.", hint: "Прислівник часу (all day) — у кінці речення" },
        { id: "ord_16", level: "intermediate", prefix: "He has been working", scrambled: ["day.", "office", "all", "in", "his"], answer: "in his office all day.", hint: "PLACE → TIME" },
        { id: "ord_17", level: "intermediate", prefix: "We placed the box", scrambled: ["table.", "carefully", "the", "on"], answer: "carefully on the table.", hint: "MANNER → PLACE" },
        { id: "ord_18", level: "intermediate", prefix: "They bought some fruit", scrambled: ["yesterday.", "the", "at", "market"], answer: "at the market yesterday.", hint: "PLACE → TIME" },
        { id: "ord_19", level: "advanced", prefix: "He walked", scrambled: ["film.", "the", "quietly", "of", "room", "the", "during", "out"], answer: "out of the room quietly during the film.", hint: "Дієслово руху: PLACE → MANNER → TIME" },
        { id: "ord_20", level: "elementary", prefix: "The party was", scrambled: ["amazing.", "utterly"], answer: "utterly amazing.", hint: "Прислівник ступеня — перед прикметником" },
        { id: "ord_21", level: "elementary", prefix: "We were", scrambled: ["lost.", "completely"], answer: "completely lost.", hint: "Прислівник ступеня — перед дієприкметником" },
        { id: "ord_22", level: "intermediate", prefix: "Jenny has been reading her magazine", scrambled: ["morning.", "garden", "all", "the", "in"], answer: "in the garden all morning.", hint: "PLACE → TIME" },
        { id: "ord_23", level: "advanced", prefix: "They", scrambled: ["match.", "knew", "the", "then", "they", "had", "lost"], answer: "then knew they had lost the match.", hint: "then — перед основним дієсловом" },
        { id: "ord_24", level: "intermediate", prefix: "They have been talking", scrambled: ["hours.", "hall", "the", "for", "in"], answer: "in the hall for hours.", hint: "PLACE → TIME" },
        { id: "ord_25", level: "intermediate", prefix: "She", scrambled: ["clothes.", "quickly", "her", "changed"], answer: "quickly changed her clothes.", hint: "Прислівник способу дії — перед основним дієсловом" },
        { id: "ord_26", level: "elementary", prefix: "I was", scrambled: ["tired.", "extremely", "feeling"], answer: "feeling extremely tired.", hint: "Degree-прислівник — безпосередньо перед прикметником" },
        { id: "ord_27", level: "intermediate", prefix: "He is doing his homework", scrambled: ["bedroom.", "quietly", "his", "in"], answer: "quietly in his bedroom.", hint: "MANNER → PLACE" },
        { id: "ord_28", level: "intermediate", prefix: "We watched a film", scrambled: ["night.", "cinema", "last", "the", "at"], answer: "at the cinema last night.", hint: "PLACE → TIME" },
        { id: "ord_30", level: "advanced", prefix: "She is", scrambled: ["girl.", "a", "pretty", "quite"], answer: "quite a pretty girl.", hint: "quite + a/an + adjective + noun" },
        { id: "ord_31", level: "elementary", prefix: "I feel", scrambled: ["today.", "ill", "very"], answer: "very ill today.", hint: "very стоїть безпосередньо перед прикметником" }
      ],
      choice: [
        { id: "ch_7", level: "advanced", before: "This is a", options: ["pretty", "prettily"], after: "complicated situation.", correct: "pretty", explanation: "Тут pretty = «досить», підсилює прикметник complicated." },
        { id: "ch_8", level: "advanced", before: "They had", options: ["hard", "hardly"], after: "been home for a minute when the phone rang.", correct: "hardly", explanation: "Hardly = «ледве, майже не». Hard означало б «наполегливо»." },
        { id: "ch_9", level: "advanced", before: "My friends are", options: ["most", "mostly"], after: "vegetarians.", correct: "mostly", explanation: "Mostly = «здебільшого». Most = «найбільше»." },
        { id: "ch_10", level: "intermediate", before: "Her loose outfit allowed her to move", options: ["free", "freely"], after: ".", correct: "freely", explanation: "Freely = «вільно, без обмежень». Free означало б «безкоштовно»." },
        { id: "ch_11", level: "intermediate", before: "The shelf was so", options: ["high", "highly"], after: "that he couldn't reach it.", correct: "high", explanation: "Йдеться про фізичну висоту — high. Highly = «дуже, високо» в оцінці." },
        { id: "ch_12", level: "intermediate", before: "John may be", options: ["late", "lately"], after: "home tonight, as he has a lot of work to do.", correct: "late", explanation: "Late = «пізно». Lately = «останнім часом»." },
        { id: "ch_13", level: "advanced", before: "The room was", options: ["pretty", "prettily"], after: "decorated.", correct: "prettily", explanation: "Prettily = «гарно» описує спосіб оздоблення (дієприкметник decorated)." },
        { id: "ch_14", level: "intermediate", before: "Children under five years old travel", options: ["free", "freely"], after: ".", correct: "free", explanation: "Free = «безкоштовно»." },
        { id: "ch_15", level: "intermediate", before: "Sue has", options: ["near", "nearly"], after: "finished her homework.", correct: "nearly", explanation: "Nearly = «майже». Near = «близько» (про відстань)." },
        { id: "ch_16", level: "intermediate", before: "They have been going out a lot", options: ["late", "lately"], after: ".", correct: "lately", explanation: "Lately = «останнім часом»." },
        { id: "ch_17", level: "advanced", before: "This college is", options: ["high", "highly"], after: "recommended for its range of courses.", correct: "highly", explanation: "Highly recommended — стала сполука зі значенням «дуже рекомендований»." },
        { id: "ch_18", level: "intermediate", before: "The miners dug", options: ["deep", "deeply"], after: "to find coal.", correct: "deep", explanation: "Фізична глибина — deep. Deeply вживається в переносному значенні." },
        { id: "ch_19", level: "intermediate", before: "The new supermarket is very", options: ["near", "nearly"], after: "our house.", correct: "near", explanation: "Near = «близько» про відстань." },
        { id: "ch_20", level: "advanced", before: "He is", options: ["deep", "deeply"], after: "involved in the scandal.", correct: "deeply", explanation: "Переносне значення «глибоко залучений» — deeply." },
        { id: "ch_21", level: "advanced", before: "We found it", options: ["hard", "hardly"], after: "to get used to living in a foreign country.", correct: "hard", explanation: "Hard = «важко». Hardly має негативне значення «майже не»." },
        { id: "ch_22", level: "advanced", before: "Which of Mel Gibson's films do you like", options: ["most", "mostly"], after: "?", correct: "most", explanation: "Most = «найбільше» (найвищий ступінь від much)." },
        { id: "ch_23", level: "elementary", before: "It was Lucy's birthday and she was very", options: ["sad", "sadly"], after: ".", correct: "sad", explanation: "Після дієслова-зв'язки be вживаємо прикметник." },
        { id: "ch_24", level: "elementary", before: "She had been waiting", options: ["hopeful", "hopefully"], after: "all morning for the postman to arrive.", correct: "hopefully", explanation: "Описуємо, ЯК вона чекала — потрібен прислівник." },
        { id: "ch_25", level: "elementary", before: "", options: ["Sudden", "Suddenly"], after: ", the letterbox rattled.", correct: "Suddenly", explanation: "На початку речення як обставина вживається прислівник Suddenly." },
        { id: "ch_26", level: "elementary", before: "The letterbox rattled", options: ["gentle", "gently"], after: "and an envelope fell onto the doormat.", correct: "gently", explanation: "Описуємо дію дієслова rattled — прислівник gently." },
        { id: "ch_27", level: "elementary", before: "An envelope fell", options: ["soft", "softly"], after: "onto the doormat.", correct: "softly", explanation: "Як саме впав конверт — прислівник softly." },
        { id: "ch_28", level: "intermediate", before: "Picking it up, Lucy noticed", options: ["miserable", "miserably"], after: "that it was a bill.", correct: "miserably", explanation: "Прислівник описує дієслово noticed." },
        { id: "ch_29", level: "intermediate", before: "There were no cards, no presents and no", options: ["pretty", "prettily"], after: "bouquets of flowers.", correct: "pretty", explanation: "Тут потрібен прикметник до іменника bouquets — pretty («гарні»)." },
        { id: "ch_30", level: "intermediate", before: "Lucy", options: ["near", "nearly"], after: "burst into tears.", correct: "nearly", explanation: "Nearly = «майже»." },
        { id: "ch_31", level: "elementary", before: "Just then, there was a", options: ["loud", "loudly"], after: "knock on the door.", correct: "loud", explanation: "Описуємо іменник knock — потрібен прикметник loud." },
        { id: "ch_32", level: "elementary", before: "Opening the door", options: ["slow", "slowly"], after: ", Lucy saw all her friends.", correct: "slowly", explanation: "Як вона відчиняла двері — прислівник slowly." },
        { id: "ch_33", level: "intermediate", before: "Her friends were holding", options: ["brightly", "bright"], after: "wrapped gifts.", correct: "brightly", explanation: "Прислівник описує дієприкметник wrapped: brightly wrapped = «яскраво загорнуті»." },
        { id: "ch_34", level: "elementary", before: "Lucy", options: ["immediate", "immediately"], after: "cheered up.", correct: "immediately", explanation: "Описуємо дієслово cheered up — прислівник." },
        { id: "ch_35", level: "elementary", before: "She greeted her friends", options: ["warm", "warmly"], after: ".", correct: "warmly", explanation: "Як саме привітала — прислівник warmly." },
        { id: "ch_36", level: "intermediate", before: "He enjoyed designing", options: ["brightly coloured", "coloured brightly"], after: "clothes.", correct: "brightly coloured", explanation: "Прислівник стоїть ПЕРЕД дієприкметником, який описує іменник." },
        { id: "ch_37", level: "intermediate", before: "He", options: ["worked very hard", "very hard worked"], after: "throughout his career.", correct: "worked very hard", explanation: "Прислівник способу дії (very hard) стоїть після дієслова." },
        { id: "ch_38", level: "intermediate", before: "By 1982, he was", options: ["incredibly famous", "famous incredibly"], after: "and had won the first of many awards.", correct: "incredibly famous", explanation: "Прислівник ступеня стоїть перед прикметником." },
        { id: "ch_39", level: "intermediate", before: "His clothes were", options: ["extremely popular", "popular extremely"], after: "with famous musicians, such as Elton John and George Michael.", correct: "extremely popular", explanation: "Degree-прислівник — завжди перед прикметником." },
        { id: "ch_40", level: "advanced", before: "He was", options: ["frequently asked", "asked frequently"], after: "to design costumes for ballets, shows and concerts.", correct: "frequently asked", explanation: "Прислівник частотності стоїть після допоміжного дієслова (was) і перед основним." },
        { id: "ch_41", level: "advanced", before: "He was", options: ["greatly respected", "respected greatly"], after: "by other fashion designers.", correct: "greatly respected", explanation: "Прислівник ступеня в пасиві ставимо між допоміжним і основним дієсловом." },
        { id: "ch_42", level: "advanced", before: "", options: ["Sadly, Versace died", "Versace died sadly"], after: "in 1997, at the age of fifty.", correct: "Sadly, Versace died", explanation: "Sadly тут оцінює ВСЕ речення, тому виноситься на початок. «Died sadly» означало б спосіб смерті." },
        { id: "ch_43", level: "advanced", before: "Being a nurse is a", options: ["quite", "pretty"], after: "stressful job.", correct: "pretty", explanation: "Після артикля a/an вживаємо pretty або fairly, а quite ставиться ПЕРЕД артиклем (quite a stressful job)." },
        { id: "ch_44", level: "advanced", before: "He has", options: ["rather", "fairly"], after: "a funny name.", correct: "rather", explanation: "Конструкція rather + a/an можлива, а fairly вимагає артикля перед собою (a fairly funny name)." },
        { id: "ch_45", level: "advanced", before: "Jane is", options: ["rather", "quite"], after: "more athletic than Susan.", correct: "rather", explanation: "Лише rather вживається з вищим ступенем (rather + comparative)." },
        { id: "ch_46", level: "advanced", before: "She stayed out", options: ["rather", "fairly"], after: "too late last night.", correct: "rather", explanation: "Сполука rather too — стала; fairly too не вживається." },
        { id: "ch_47", level: "advanced", before: "That story was", options: ["quite", "rather"], after: "true.", correct: "quite", explanation: "З абсолютними прикметниками (true, useless, certain) quite означає «повністю»." },
        { id: "ch_48", level: "advanced", before: "She is", options: ["quite", "fairly"], after: "a friendly woman.", correct: "quite", explanation: "Порядок quite + a/an + adjective; fairly ставиться після артикля." },
        { id: "ch_49", level: "advanced", before: "I didn't expect to enjoy the film, but it was", options: ["fairly", "rather"], after: "brilliant.", correct: "rather", explanation: "Rather передає несподіванку: вийшло краще, ніж очікували." },
        { id: "ch_50", level: "advanced", before: "He is", options: ["rather", "fairly"], after: "good at his job, but he sometimes makes mistakes.", correct: "fairly", explanation: "Fairly — найслабший ступінь: «непогано, але не ідеально»." },
        { id: "ch_51", level: "advanced", before: "It was a", options: ["fairly", "quite"], after: "interesting book, but it wasn't the best I've read.", correct: "fairly", explanation: "Після артикля можливе лише fairly; окрім того, значення слабке — «доволі цікава»." },
        { id: "ch_52", level: "advanced", before: "This tin opener doesn't work. It's", options: ["fairly", "quite"], after: "useless.", correct: "quite", explanation: "Useless — абсолютний прикметник, із ним quite = «абсолютно»." },
        { id: "ch_53", level: "advanced", before: "It was", options: ["pretty", "rather"], after: "a long way from the station to the hotel.", correct: "rather", explanation: "Перед артиклем вживається rather; pretty ставиться лише ПІСЛЯ артикля (a pretty long way)." },
        { id: "ch_54", level: "advanced", before: "It was", options: ["rather", "pretty"], after: "a waste of time watering the plants. It's raining now.", correct: "rather", explanation: "Знову конструкція rather + a/an + noun." }
      ],
      gap: [
        { id: "gap_17", level: "elementary", prompt: "Julia heard someone call her name ______ (loud).", answers: ["loudly"], explanation: "Додаємо -ly до прикметника: loud → loudly." },
        { id: "gap_18", level: "elementary", prompt: "She looked ______ (nervous) behind her.", answers: ["nervously"], explanation: "nervous → nervously." },
        { id: "gap_19", level: "elementary", prompt: "The street was ______ (complete) empty.", answers: ["completely"], explanation: "complete → completely (прислівник ступеня перед прикметником)." },
        { id: "gap_20", level: "elementary", prompt: "______ (Sudden), she heard her name again.", answers: ["suddenly"], explanation: "sudden → suddenly; на початку речення як обставина." },
        { id: "gap_21", level: "elementary", prompt: "She turned to see her brother running towards her, smiling ______ (cheerful).", answers: ["cheerfully"], explanation: "Прикметник на -l бере -ly: cheerful → cheerfully." },
        { id: "gap_22", level: "elementary", prompt: "'Didn't you hear me?' he laughed ______ (happy).", answers: ["happily"], explanation: "Приголосний + -y → -ily: happy → happily." },
        { id: "gap_23", level: "intermediate", prompt: "'You ______ (near) frightened me to death!'", answers: ["nearly"], explanation: "Nearly = «майже», а не near («близько»)." }
      ],
      abcd: [
        { id: "abcd_1", level: "elementary", q: "1. If you drive ______ you could have an accident.", options: ["A) reckless", "B) recklessly", "C) more reckless", "D) more recklessly"], correct: 1, explanation: "Описуємо дієслово drive — потрібен прислівник recklessly." },
        { id: "abcd_2", level: "elementary", q: "2. The teacher explained the assignment ______.", options: ["A) careful", "B) carefully", "C) more carefully", "D) most careful"], correct: 1, explanation: "Прислівник способу дії до explained; порівняння в реченні немає." },
        { id: "abcd_3", level: "elementary", q: "3. There was a ______ noise last night. Did you hear it?", options: ["A) loud", "B) louder", "C) loudly", "D) more loudly"], correct: 0, explanation: "Перед іменником noise потрібен прикметник loud." },
        { id: "abcd_4", level: "elementary", q: "4. Paul walks so ______ in his new boots.", options: ["A) loud", "B) louder", "C) loudly", "D) more loudly"], correct: 2, explanation: "Описуємо дієслово walks — прислівник loudly." },
        { id: "abcd_5", level: "elementary", q: "5. Jason ate his dinner very ______.", options: ["A) quick", "B) quicker", "C) most quickly", "D) quickly"], correct: 3, explanation: "Very + прислівник у звичайному ступені: very quickly." },
        { id: "abcd_6", level: "intermediate", q: "6. Those apples look ______. May I have one?", options: ["A) delicious", "B) most delicious", "C) deliciously", "D) most deliciously"], correct: 0, explanation: "Look тут дієслово-зв'язка, тому після нього прикметник." },
        { id: "abcd_7", level: "intermediate", q: "7. He is an awful driver. He never stops the car ______.", options: ["A) smooth", "B) smoothly", "C) more smooth", "D) more smoothly"], correct: 1, explanation: "Описуємо, ЯК він зупиняє авто — прислівник smoothly." },
        { id: "abcd_8", level: "elementary", q: "8. Pavarotti is an opera singer. He sings ______.", options: ["A) beautiful", "B) beautifully", "C) most beautifully", "D) more beautiful"], correct: 1, explanation: "Sing — дія, тому прислівник beautifully." },
        { id: "abcd_9", level: "intermediate", q: "9. This situation requires a ______ investigation.", options: ["A) serious", "B) seriously", "C) most serious", "D) more seriously"], correct: 0, explanation: "Перед іменником investigation потрібен прикметник." },
        { id: "abcd_10", level: "intermediate", q: "10. Sometimes, driving at night can be very ______.", options: ["A) dangerously", "B) more dangerously", "C) most dangerous", "D) dangerous"], correct: 3, explanation: "Після be + very вживаємо прикметник dangerous." },
        { id: "abcd_11", level: "elementary", q: "11. They shouted ______ at each other.", options: ["A) angry", "B) angrier", "C) angriest", "D) angrily"], correct: 3, explanation: "Прислівник до дієслова shouted — angrily." },
        { id: "abcd_12", level: "elementary", q: "12. If you ask ______, I will give it to you.", options: ["A) polite", "B) politely", "C) more polite", "D) most politely"], correct: 1, explanation: "Описуємо дієслово ask — прислівник politely." },
        { id: "abcd_13", level: "elementary", q: "13. Try to speak ______ if you are giving a speech.", options: ["A) clear", "B) clearly", "C) clearer", "D) more clear"], correct: 1, explanation: "Прислівник до speak — clearly." },
        { id: "abcd_14", level: "elementary", q: "14. Why are you so ______?", options: ["A) angry", "B) angrier", "C) angrily", "D) more angrily"], correct: 0, explanation: "Після be + so вживаємо прикметник angry." },
        { id: "abcd_15", level: "elementary", q: "15. He is a ______ driver.", options: ["A) careless", "B) carelessly", "C) more careless", "D) most careless"], correct: 0, explanation: "Перед іменником driver — прикметник careless." },
        { id: "abcd_16", level: "elementary", q: "16. Frank always works so ______!", options: ["A) slow", "B) slower", "C) slowerly", "D) slowly"], correct: 3, explanation: "Прислівник до works — slowly (форми slowerly не існує)." },
        { id: "abcd_17", level: "intermediate", q: "17. Samantha speaks so ______ that I can't understand her.", options: ["A) fast", "B) fastly", "C) in a fast way", "D) faster"], correct: 0, explanation: "Fast має однакову форму прикметника і прислівника; слова fastly не існує." },
        { id: "abcd_18", level: "elementary", q: "18. Sonia opened the door ______.", options: ["A) slow", "B) slowly", "C) slowest", "D) more slowly"], correct: 1, explanation: "Прислівник способу дії без порівняння — slowly." },
        { id: "abcd_19", level: "elementary", q: "19. It is a beautiful ______ day.", options: ["A) clear", "B) clearly", "C) clearer", "D) clearest"], correct: 0, explanation: "Другий прикметник перед іменником day — clear." },
        { id: "abcd_20", level: "intermediate", q: "20. Jessica writes so ______. Look at these mistakes!", options: ["A) careless", "B) more careless", "C) carelessly", "D) more carelessly"], correct: 2, explanation: "Описуємо дієслово writes — прислівник carelessly." },
        { id: "abcd_21", level: "intermediate", q: "21. Taras drives ______. I am afraid to go with him.", options: ["A) dangerous", "B) dangerously", "C) more dangerous", "D) dangerouslyer"], correct: 1, explanation: "Прислівник до drives — dangerously." },
        { id: "abcd_22", level: "advanced", q: "22. I didn't sleep ______ last night, so I feel ______ today.", options: ["A) good, terrible", "B) well, terrible", "C) well, terribly", "D) terribly, well"], correct: 1, explanation: "Sleep потребує прислівника well, а feel — дієслово-зв'язка, тому після нього прикметник terrible." },
        { id: "abcd_23", level: "intermediate", q: "23. Lee is a ______ speller.", options: ["A) bad", "B) badly", "C) worse", "D) worst"], correct: 0, explanation: "Перед іменником speller — прикметник bad." },
        { id: "abcd_24", level: "advanced", q: "24. He met them ______.", options: ["A) friend", "B) friendly", "C) in a friendly way", "D) more friendly"], correct: 2, explanation: "Friendly — прикметник; прислівник утворюється описово: in a friendly way." },
        { id: "abcd_25", level: "intermediate", q: "25. Please try to be more ______.", options: ["A) careful", "B) carefully", "C) more carefully", "D) more careful"], correct: 0, explanation: "Після be вживаємо прикметник, а more вже є в реченні." },
        { id: "abcd_26", level: "intermediate", q: "26. If you want tourists to visit your country, you must treat them ______.", options: ["A) pleasant", "B) pleased", "C) pleasantly", "D) pleasing"], correct: 2, explanation: "Описуємо дієслово treat — прислівник pleasantly." },
        { id: "abcd_27", level: "elementary", q: "27. Lola played the piano ______.", options: ["A) perfect", "B) perfectly", "C) more perfect", "D) the perfectliest"], correct: 1, explanation: "Прислівник до played — perfectly." },
        { id: "abcd_28", level: "intermediate", q: "28. Max is a ______ talker, but he never listens.", options: ["A) fast", "B) fastly", "C) faster", "D) fastest"], correct: 0, explanation: "Перед іменником talker — прикметник fast." },
        { id: "abcd_29", level: "elementary", q: "29. Shannon writes very ______.", options: ["A) neat", "B) neatly", "C) neatlier", "D) more neat"], correct: 1, explanation: "Very + прислівник neatly описує дієслово writes." },
        { id: "abcd_30", level: "advanced", q: "30. Kate is the best student in class. She studies ______.", options: ["A) hard", "B) harder", "C) hardest", "D) hardly"], correct: 2, explanation: "Контекст «the best student» задає найвищий ступінь: studies hardest. Hardly означало б «майже не вчиться»." },
        { id: "abcd_31", level: "intermediate", q: "31. They finished their task ______ than their friends.", options: ["A) quick", "B) quickly", "C) more quickly", "D) more quicker"], correct: 2, explanation: "Than вимагає вищого ступеня прислівника: more quickly." },
        { id: "abcd_32", level: "elementary", q: "32. Fanny can sew dresses so ______.", options: ["A) good", "B) well", "C) better", "D) best"], correct: 1, explanation: "Прислівник від good — well." },
        { id: "abcd_33", level: "advanced", q: "33. Although Dan felt very ______ he smiled ______.", options: ["A) angrily, widely", "B) angry, widely", "C) widely, angry", "D) wide, angry"], correct: 1, explanation: "Feel — дієслово-зв'язка (прикметник angry), smile — дія (прислівник widely)." },
        { id: "abcd_34", level: "intermediate", q: "34. Margaret has a ______ collection of hairpins.", options: ["A) modern", "B) moderner", "C) more modern", "D) modernly"], correct: 0, explanation: "Перед іменником collection — прикметник modern без порівняння." },
        { id: "abcd_35", level: "intermediate", q: "35. She kept tapping her fingers ______.", options: ["A) nervous", "B) nervously", "C) more nervous", "D) more nervously"], correct: 1, explanation: "Описуємо дію tapping — прислівник nervously." },
        { id: "abcd_36", level: "elementary", q: "36. Denis always helps his old-aged neighbours. He is so ______.", options: ["A) polite", "B) politer", "C) more politely", "D) politely"], correct: 0, explanation: "Після be + so вживаємо прикметник polite." }
      ]
    }
  };

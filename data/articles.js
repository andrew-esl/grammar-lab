// Тема: articles
// Додається у глобальний реєстр TOPICS_DATA. Порядок підключення у index.html = порядок у меню.
window.TOPICS_DATA = window.TOPICS_DATA || {};
window.TOPICS_DATA["articles"] = {
    id: "articles",
    title: "Артиклі (Articles)",
    description: "Артиклі a/an, the, нульовий артикль, географічні назви.",
    theory: [
      {
        id: "th_8",
        title: "A/an і the: перша та друга згадка",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Коли говоримо про щось <strong>уперше</strong> — вживаємо a/an. Коли співрозмовник уже знає, про що йдеться, — <strong>the</strong>.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> 1-ша згадка → <strong>a/an</strong> &nbsp;|&nbsp; 2-га згадка → <strong>the</strong>
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>I had <strong>a</strong> sandwich and <strong>an</strong> apple for lunch. <strong>The</strong> sandwich wasn't very good, but <strong>the</strong> apple was nice.</em></li>
            <li>• <em><strong>A</strong> man and <strong>a</strong> woman were sitting opposite me. <strong>The</strong> man was American.</em></li>
            <li>• The вживаємо і тоді, коли предмет конкретизований: <em>Tim sat down on <strong>a</strong> chair</em> (один із багатьох) — <em>Tim sat down on <strong>the</strong> chair nearest the door</em> (конкретний)</li>
            <li>• <em>Paula is looking for <strong>a</strong> job.</em> — <em>Did Paula get <strong>the</strong> job she applied for?</em></li>
          </ul>
        `
      },
      {
        id: "th_9",
        title: "The, коли зрозуміло із ситуації",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Коли з контексту ясно, про який саме предмет чи людину йдеться, вживаємо <strong>the</strong> навіть при першій згадці.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>У кімнаті:</strong> the light, the floor, the ceiling, the door, the carpet<br>
            <strong>У місті:</strong> the bank, the post office, the station, the doctor, the dentist
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>Can you turn off <strong>the</strong> light, please?</em> (= світло в цій кімнаті)</li>
            <li>• <em>I took a taxi to <strong>the</strong> station.</em> (= вокзал у цьому місті)</li>
            <li>• <em>Clare isn't very well. She's gone to <strong>the</strong> doctor.</em> (= її звичайний лікар)</li>
            <li>• Порівняй: <em>I have to go to <strong>the</strong> bank today.</em> — <em>Is there <strong>a</strong> bank near here?</em></li>
            <li>• <em>I don't like going to <strong>the</strong> dentist.</em> — <em>My sister is <strong>a</strong> dentist.</em></li>
          </ul>
        `
      },
      {
        id: "th_10",
        title: "A/an = «за» (once a week, £1.50 a kilo)",
        level: "elementary",
        contentHtml: `
          <p class="text-slate-600 mb-3">Для частоти, швидкості й ціни на одиницю вживаємо <strong>a/an</strong> у значенні «за».</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Формула:</strong> once / twice / three times + <strong>a</strong> + day/week/month/year
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>'How often do you go to the cinema?' 'About once <strong>a</strong> month.'</em></li>
            <li>• <em>'How much are those potatoes?' '£1.50 <strong>a</strong> kilo.'</em></li>
            <li>• <em>Helen works eight hours <strong>a</strong> day, six days <strong>a</strong> week.</em></li>
            <li>• Перед голосним звуком — <strong>an</strong>: <em>50 kilometres <strong>an</strong> hour</em></li>
          </ul>
        `
      },
      {
        id: "th_11",
        title: "The з унікальними об'єктами",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Коли предмет у світі <strong>єдиний</strong>, вживаємо the. Так само перед <strong>same</strong> і порядковими числівниками.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            the sun · the moon · the earth · the world · the universe · the sky · the sea · the ground · the environment · the internet · the equator
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>What's <strong>the</strong> longest river in Europe? / Our apartment is on <strong>the</strong> tenth floor.</em></li>
            <li>• <em>Your sweater is <strong>the same</strong> colour as mine.</em> (НЕ <s>same colour</s>)</li>
            <li>• <strong>АЛЕ без the:</strong> <em>Earth</em> як планета (<em>Which planet is nearest Earth?</em>) і <em>space</em> як космос (<em>There are millions of stars in space.</em>)</li>
            <li>• A/an показує, ЩО це за річ: <em><strong>The</strong> sun is <strong>a</strong> star.</em></li>
          </ul>
        `
      },
      {
        id: "th_12",
        title: "The cinema / television / breakfast / Platform 5",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Три окремі групи, які учні найчастіше плутають.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>the cinema / the theatre / the radio</strong> &nbsp;АЛЕ&nbsp; <strong>television / TV</strong> (без the)
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>I go to <strong>the</strong> cinema a lot, but I haven't been to <strong>the</strong> theatre for ages.</em> (не обов'язково конкретний кінотеатр)</li>
            <li>• <em>I listen to <strong>the</strong> radio a lot.</em> АЛЕ <em>I watch television a lot.</em></li>
            <li>• <em>Can you turn off <strong>the</strong> television?</em> — тут the TV = сам телевізор</li>
            <li>• <strong>breakfast / lunch / dinner</strong> — без the: <em>What did you have for breakfast?</em></li>
            <li>• АЛЕ з прикметником — a/an: <em>We had <strong>a</strong> very nice lunch.</em></li>
            <li>• <strong>Noun + number</strong> — без the: <em>Platform 5, size 43, Room 126, page 29, question 3, Gate 10</em></li>
          </ul>
        `
      },
      {
        id: "th_13",
        title: "School або the school? (prison, hospital, bed, work, home)",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Коли йдеться про <strong>призначення</strong> місця — артикля немає. Коли про <strong>саму будівлю</strong> — вживаємо the.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Без the (за призначенням):</strong> school, prison/jail, hospital, university, college, church, bed, work, home, sea
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>Ken's brother is <strong>in prison</strong> for robbery.</em> (він в'язень) — <em>Ken went to <strong>the prison</strong> to visit his brother.</em> (відвідувач)</li>
            <li>• <em>He was taken <strong>to hospital</strong>.</em> (пацієнт) — <em>Jane has gone to <strong>the hospital</strong> to visit Joe.</em> (гостя)</li>
            <li>• <em>Sally's father goes <strong>to church</strong> every Sunday.</em> (на службу) — <em>Some workmen went to <strong>the church</strong> to repair the roof.</em></li>
            <li>• <em>go <strong>to bed</strong> / be <strong>in bed</strong></em> АЛЕ <em>I sat down on <strong>the bed</strong>.</em> (конкретні меблі)</li>
            <li>• <strong>work</strong> у значенні «робота» НІКОЛИ не бере the: <em>go to work, finish work</em></li>
            <li>• <strong>home</strong>: <em>go home, be at home</em> (НЕ <s>to home</s>)</li>
            <li>• <em>at sea</em> = у плаванні, АЛЕ <em>swim in <strong>the</strong> sea</em></li>
          </ul>
        `
      },
      {
        id: "th_14",
        title: "Children або the children? Загальне vs конкретне",
        level: "intermediate",
        contentHtml: `
          <p class="text-slate-600 mb-3">Коли говоримо про речі чи людей <strong>загалом</strong>, артикль НЕ вживається. The з'являється, коли йдеться про конкретну групу.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Загальне:</strong> plural / uncountable БЕЗ артикля &nbsp;|&nbsp; <strong>конкретне:</strong> the + noun
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>I'm afraid of <strong>dogs</strong>.</em> (собаки взагалі) — <em>We took <strong>the children</strong> to the zoo.</em> (саме ці діти)</li>
            <li>• <em>Doctors are usually paid more than teachers. / Crime is a problem in most big cities.</em></li>
            <li>• <em><strong>Sugar</strong> isn't very good for you.</em> — <em>Can you pass <strong>the sugar</strong>, please?</em></li>
            <li>• Шкільні предмети, спорт, музика — без the: <em>history, physics, football, classical music</em></li>
            <li>• <strong>most</strong> + noun — без the: <em>Most shops accept credit cards.</em> (НЕ <s>The most shops</s>)</li>
            <li>• Уточнення не завжди додає the: <em>I like working with <strong>people who say what they think</strong></em> — це все ще загальна ідея</li>
          </ul>
        `
      },
      {
        id: "th_15",
        title: "Назви БЕЗ the: люди, країни, міста, гори",
        level: "advanced",
        contentHtml: `
          <p class="text-slate-600 mb-3">Імена людей і більшість географічних назв вживаються <strong>без артикля</strong>.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Без the:</strong> континенти · країни · штати · острови · міста · окремі гори · озера
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>Africa, Europe, South America; France, Brazil, Texas; Sicily, Bermuda; Cairo, New York; Everest, Etna</em></li>
            <li>• <strong>Титул + ім'я</strong> — без the: <em>Mr Johnson, Doctor Johnson, President Johnson, Uncle Robert, Saint Catherine</em> (порівняй: <em>We called <strong>the</strong> doctor.</em>)</li>
            <li>• <strong>Mount</strong> і <strong>Lake</strong> + назва — без the: <em>Mount Everest, Lake Superior</em> (порівняй: <em>They live near <strong>the</strong> lake.</em>)</li>
            <li>• <strong>АЛЕ з the:</strong> назви зі словами Republic, Kingdom, States — <em>the Czech Republic, the United Kingdom, the United States</em></li>
            <li>• <strong>northern Europe</strong> (без the) АЛЕ <strong>the north of Brazil</strong>, <strong>the Middle East</strong>, <strong>the Far East</strong></li>
          </ul>
        `
      },
      {
        id: "th_16",
        title: "Назви З the: океани, річки, пустелі, множинні назви",
        level: "advanced",
        contentHtml: `
          <p class="text-slate-600 mb-3">Водойми, пустелі та всі назви у <strong>множині</strong> беруть the.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>the + </strong>океани · моря · річки · канали · пустелі · гірські пасма · групи островів · родини · країни у множині
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <em>the Atlantic, the Indian Ocean, the Mediterranean, the Red Sea, the Channel</em></li>
            <li>• <em>the Amazon, the Nile, the Thames, the Volga, the Danube, the Suez Canal, the Panama Canal</em></li>
            <li>• <em>the Sahara, the Gobi Desert</em></li>
            <li>• <em>the Taylors, the Johnsons</em> (родина); <em>the Netherlands, the Philippines, the United States</em></li>
            <li>• <em>the Canaries, the Bahamas, the Seychelles, the Virgin Islands</em></li>
            <li>• <em>the Rocky Mountains / the Rockies, the Andes, the Alps, the Himalayas, the Pyrenees, the Urals</em></li>
          </ul>
        `
      },
      {
        id: "th_17",
        title: "Будівлі, вулиці, організації, газети",
        level: "advanced",
        contentHtml: `
          <p class="text-slate-600 mb-3">Правило просте: якщо перше слово — <strong>назва місця або людини</strong>, the не потрібен.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Без the:</strong> Manchester Airport, Victoria Station, Harvard University, Buckingham Palace<br>
            <strong>З the:</strong> the Sheraton Hotel, the National Gallery, the Eiffel Tower, the Royal Palace
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>Вулиці, площі, парки — без the:</strong> <em>Union Street, Fifth Avenue, Hyde Park, Broadway, Times Square</em></li>
            <li>• <strong>Назви з of — завжди the:</strong> <em>the Bank of England, the Tower of London, the Great Wall of China, the University of Cambridge</em> (порівняй: <em>Cambridge University</em> без the)</li>
            <li>• <strong>Магазини й ресторани на -'s / -s — без the:</strong> <em>McDonald's, Barclays, Harrods, Macy's, St John's Church</em></li>
            <li>• <strong>Газети та організації — з the:</strong> <em>the Washington Post, the Financial Times, the BBC, the European Union, the Red Cross</em></li>
            <li>• <strong>Компанії та авіалінії — без the:</strong> <em>Fiat, Sony, IBM, Kodak, Singapore Airlines, Cambridge University Press</em></li>
          </ul>
        `
      },
      {
        id: "th_18",
        title: "Common Mistakes: де НЕ ставлять the",
        level: "advanced",
        contentHtml: `
          <p class="text-slate-600 mb-3">Найчастіші помилки українських учнів — зайвий артикль там, де його бути не може.</p>
          <div class="bg-rose-50 border border-rose-100 p-3 rounded-lg text-sm mb-3">
            <strong>НІКОЛИ не ставимо the перед:</strong> видами спорту, іграми, предметами, мовами, стравами, порами року у загальному значенні, присвійними займенниками та <em>work</em>
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <s>I love the tennis.</s> → <em>I love tennis.</em></li>
            <li>• <s>Can you speak the French?</s> → <em>Can you speak French?</em> (АЛЕ: <em><strong>The</strong> French language is beautiful.</em>)</li>
            <li>• <s>That is the my book.</s> → <em>That is my book.</em></li>
            <li>• <s>The most students pass.</s> → <em>Most students pass.</em></li>
            <li>• <s>I have to go to the work.</s> → <em>I have to go to work.</em></li>
            <li>• <s>She came by the plane.</s> → <em>She came by plane.</em> (АЛЕ: <em>She was <strong>on the bus</strong>.</em>)</li>
            <li>• <s>We had the lunch.</s> → <em>We had lunch.</em></li>
            <li>• <s>I went to the Glasgow Airport.</s> → <em>...to Glasgow Airport.</em></li>
            <li>• <s>We visited the Buckingham Palace.</s> → <em>...visited Buckingham Palace.</em></li>
            <li>• Хвороби: <em>flu / the flu, measles / the measles, mumps / the mumps</em> АЛЕ <em>He's got pneumonia.</em></li>
          </ul>
        `
      }
    ],
    exercises: {
      order: [
        { id: "ord_1_nouns", level: "advanced", prefix: "I'd like to visit", scrambled: ["Wall", "Great", "China.", "the", "of"], answer: "the Great Wall of China.", hint: "Назви зі словом of завжди беруть the" },
        { id: "ord_2_nouns", level: "intermediate", prefix: "The ship sailed through", scrambled: ["Canal", "Suez", "night.", "the", "at"], answer: "the Suez Canal at night.", hint: "Канали — з the" },
        { id: "ord_3_nouns", level: "advanced", prefix: "Last year we climbed", scrambled: ["Sicily.", "Etna", "in", "Mount"], answer: "Mount Etna in Sicily.", hint: "Mount + назва — без артикля" },
        { id: "ord_4_nouns", level: "advanced", prefix: "She studies at", scrambled: ["of", "University", "Cambridge.", "the"], answer: "the University of Cambridge.", hint: "University of X → the" },
        { id: "ord_5_nouns", level: "advanced", prefix: "Her brother studies at", scrambled: ["University.", "Cambridge"], answer: "Cambridge University.", hint: "X University — без the" },
        { id: "ord_6_nouns", level: "intermediate", prefix: "They stayed at", scrambled: ["Hotel", "Sheraton", "London.", "the", "in"], answer: "the Sheraton Hotel in London.", hint: "Готелі — з the" },
        { id: "ord_7_nouns", level: "advanced", prefix: "The plane landed at", scrambled: ["Airport.", "Gaulle", "Charles", "de"], answer: "Charles de Gaulle Airport.", hint: "Аеропорти з іменем людини чи міста — без the" },
        { id: "ord_8_nouns", level: "intermediate", prefix: "I read about it in", scrambled: ["Financial", "The", "Times."], answer: "The Financial Times.", hint: "Газети — з the" },
        { id: "ord_9_nouns", level: "advanced", prefix: "They live in", scrambled: ["Netherlands,", "not", "Germany.", "the", "in"], answer: "the Netherlands, not in Germany.", hint: "Країни у множині — з the" },
        { id: "ord_10_nouns", level: "intermediate", prefix: "We drove through", scrambled: ["Desert.", "Sahara", "the"], answer: "the Sahara Desert.", hint: "Пустелі — з the" },
        { id: "ord_11_nouns", level: "intermediate", prefix: "Tourists always visit", scrambled: ["Liberty.", "of", "the", "Statue"], answer: "the Statue of Liberty.", hint: "Назва з of → the" },
        { id: "ord_15_nouns", level: "intermediate", prefix: "In the summer she swims", scrambled: ["day.", "sea", "the", "every", "in"], answer: "in the sea every day.", hint: "swim in the sea — з артиклем (порівняй: be at sea)" }
      ],
      choice: [
        { id: "ch_22_nouns", level: "elementary", before: "This morning I bought a newspaper and", options: ["a", "an", "the"], after: "magazine.", correct: "a", explanation: "Перша згадка про журнал — неозначений артикль." },
        { id: "ch_23_nouns", level: "elementary", before: "", options: ["A", "An", "The"], after: "newspaper is in my bag.", correct: "The", explanation: "Про газету вже говорили — друга згадка, тому the." },
        { id: "ch_24_nouns", level: "elementary", before: "I can't remember where I put", options: ["a", "an", "the"], after: "magazine.", correct: "the", explanation: "Журнал уже згадували — the." },
        { id: "ch_25_nouns", level: "elementary", before: "I saw", options: ["a", "an", "the"], after: "accident this morning.", correct: "an", explanation: "Перша згадка + слово починається з голосного звука → an." },
        { id: "ch_26_nouns", level: "elementary", before: "", options: ["A", "An", "The"], after: "car crashed into a tree.", correct: "A", explanation: "Автомобіль згадується вперше." },
        { id: "ch_27_nouns", level: "elementary", before: "A car crashed into", options: ["a", "an", "the"], after: "tree.", correct: "a", explanation: "Дерево згадується вперше." },
        { id: "ch_28_nouns", level: "elementary", before: "", options: ["A", "An", "The"], after: "driver of the car wasn't hurt.", correct: "The", explanation: "Уточнення «of the car» робить іменник конкретним." },
        { id: "ch_29_nouns", level: "elementary", before: "The driver of", options: ["a", "an", "the"], after: "car wasn't hurt.", correct: "the", explanation: "Про це авто вже йшлося — the." },
        { id: "ch_30_nouns", level: "elementary", before: "The driver wasn't hurt, but", options: ["a", "an", "the"], after: "car was badly damaged.", correct: "the", explanation: "Друга згадка того самого автомобіля." },
        { id: "ch_31_nouns", level: "elementary", before: "There are two cars parked outside:", options: ["a", "an", "the"], after: "blue one and a grey one.", correct: "a", explanation: "Описуємо машини вперше — неозначений артикль." },
        { id: "ch_32_nouns", level: "elementary", before: "There are two cars parked outside: a blue one and", options: ["a", "an", "the"], after: "grey one.", correct: "a", explanation: "Так само перша згадка." },
        { id: "ch_33_nouns", level: "elementary", before: "", options: ["A", "An", "The"], after: "blue one belongs to my neighbours.", correct: "The", explanation: "Тепер відомо, про яку саме машину йдеться." },
        { id: "ch_34_nouns", level: "intermediate", before: "I don't know who", options: ["a", "an", "the"], after: "owner of the grey one is.", correct: "the", explanation: "Owner уточнений словами «of the grey one»." },
        { id: "ch_35_nouns", level: "elementary", before: "I don't know who the owner of", options: ["a", "an", "the"], after: "grey one is.", correct: "the", explanation: "Про сіру машину вже говорили." },
        { id: "ch_36_nouns", level: "elementary", before: "My friends live in", options: ["a", "an", "the"], after: "old house in a small village.", correct: "an", explanation: "Перед голосним звуком [o] вживаємо an." },
        { id: "ch_37_nouns", level: "elementary", before: "My friends live in an old house in", options: ["a", "an", "the"], after: "small village.", correct: "a", explanation: "Село згадується вперше." },
        { id: "ch_38_nouns", level: "elementary", before: "There is", options: ["a", "an", "the"], after: "beautiful garden behind the house.", correct: "a", explanation: "Сад згадується вперше." },
        { id: "ch_39_nouns", level: "elementary", before: "There is a beautiful garden behind", options: ["a", "an", "the"], after: "house.", correct: "the", explanation: "Будинок уже згадували." },
        { id: "ch_40_nouns", level: "intermediate", before: "I would like to have", options: ["a", "an", "the"], after: "garden like that.", correct: "a", explanation: "Будь-який такий сад, не конкретний — a." },
        { id: "ch_41_nouns", level: "elementary", before: "This house is very nice. Has it got", options: ["a", "the"], after: "garden?", correct: "a", explanation: "Невідомо, чи є сад узагалі — перша згадка." },
        { id: "ch_42_nouns", level: "elementary", before: "It's a beautiful day. Let's sit in", options: ["a", "the"], after: "garden.", correct: "the", explanation: "З ситуації зрозуміло, про який сад ідеться — наш." },
        { id: "ch_43_nouns", level: "elementary", before: "I like living in this house, but it's a shame that", options: ["a", "the"], after: "garden is so small.", correct: "the", explanation: "Сад цього будинку — конкретний." },
        { id: "ch_44_nouns", level: "elementary", before: "Can you recommend", options: ["a", "the"], after: "good restaurant?", correct: "a", explanation: "Будь-який хороший ресторан — неозначений артикль." },
        { id: "ch_45_nouns", level: "elementary", before: "We had dinner in", options: ["a", "the"], after: "very nice restaurant.", correct: "a", explanation: "Слухач не знає, про який ресторан ідеться." },
        { id: "ch_46_nouns", level: "intermediate", before: "We had dinner in", options: ["a", "the"], after: "best restaurant in town.", correct: "the", explanation: "Перед найвищим ступенем завжди the." },
        { id: "ch_47_nouns", level: "elementary", before: "She has", options: ["a", "the"], after: "French name, but in fact she's English.", correct: "a", explanation: "Описуємо, яке в неї ім'я — a + adjective + noun." },
        { id: "ch_48_nouns", level: "intermediate", before: "What's", options: ["a", "the"], after: "name of that man we met yesterday?", correct: "the", explanation: "Уточнення «of that man» робить іменник конкретним." },
        { id: "ch_49_nouns", level: "intermediate", before: "We stayed at a very nice hotel – I can't remember", options: ["a", "the"], after: "name now.", correct: "the", explanation: "Назва саме цього готелю — the." },
        { id: "ch_50_nouns", level: "elementary", before: "There isn't", options: ["a", "an", "the"], after: "airport near where I live.", correct: "an", explanation: "Перша згадка + голосний звук → an." },
        { id: "ch_51_nouns", level: "intermediate", before: "", options: ["A", "An", "The"], after: "nearest airport is 70 miles away.", correct: "The", explanation: "Nearest — найвищий ступінь, тому the." },
        { id: "ch_52_nouns", level: "elementary", before: "Our flight was delayed. We had to wait at", options: ["a", "an", "the"], after: "airport for three hours.", correct: "the", explanation: "Із ситуації зрозуміло, про який аеропорт ідеться." },
        { id: "ch_53_nouns", level: "elementary", before: "Excuse me, please. Can you tell me how to get to", options: ["a", "an", "the"], after: "airport?", correct: "the", explanation: "Аеропорт цього міста — the." },
        { id: "ch_54_nouns", level: "intermediate", before: "'Are you going away next week?' 'No,", options: ["a", "the"], after: "week after next.'", correct: "the", explanation: "Конкретний тиждень, уточнений словами «after next»." },
        { id: "ch_55_nouns", level: "elementary", before: "I'm going away for", options: ["a", "the"], after: "week in September.", correct: "a", explanation: "«На тиждень» — тривалість, неозначений артикль." },
        { id: "ch_56_nouns", level: "intermediate", before: "Gary has a part-time job. He works three mornings", options: ["a", "the"], after: "week.", correct: "a", explanation: "A у значенні «за»: three mornings a week." },
        { id: "ch_57_nouns", level: "elementary", before: "How often do you go to", options: ["a", "the", "—"], after: "dentist?", correct: "the", explanation: "Go to the dentist — стала конструкція (твій звичайний стоматолог)." },
        { id: "ch_58_nouns", level: "elementary", before: "Could you close", options: ["a", "the", "—"], after: "door, please?", correct: "the", explanation: "Із ситуації ясно, про які двері йдеться." },
        { id: "ch_59_nouns", level: "elementary", before: "I didn't mean to do that. It was", options: ["a", "the", "—"], after: "mistake.", correct: "a", explanation: "A + іменник показує, ЩО це було." },
        { id: "ch_60_nouns", level: "elementary", before: "Excuse me, where is", options: ["a", "the", "—"], after: "bus station, please?", correct: "the", explanation: "Автовокзал цього міста — the." },
        { id: "ch_61_nouns", level: "elementary", before: "I have", options: ["a", "the", "—"], after: "problem. Can you help me?", correct: "a", explanation: "Проблема згадується вперше." },
        { id: "ch_62_nouns", level: "elementary", before: "I'm just going to", options: ["a", "the", "—"], after: "post office. I won't be long.", correct: "the", explanation: "Go to the post office — звичне місце у твоєму районі." },
        { id: "ch_63_nouns", level: "elementary", before: "There were no chairs, so we sat on", options: ["a", "the", "—"], after: "floor.", correct: "the", explanation: "Підлога в цій кімнаті — the floor." },
        { id: "ch_64_nouns", level: "intermediate", before: "Have you finished with", options: ["a", "the", "—"], after: "book I lent you?", correct: "the", explanation: "Уточнення «I lent you» робить книжку конкретною." },
        { id: "ch_65_nouns", level: "elementary", before: "My sister has just got", options: ["a", "the", "—"], after: "job in a bank in Zurich.", correct: "a", explanation: "Робота згадується вперше." },
        { id: "ch_66_nouns", level: "elementary", before: "My sister has just got a job in", options: ["a", "the", "—"], after: "bank in Zurich.", correct: "a", explanation: "Один із багатьох банків — a." },
        { id: "ch_67_nouns", level: "elementary", before: "We live in", options: ["a", "the", "—"], after: "small apartment in the city centre.", correct: "a", explanation: "Квартира згадується вперше." },
        { id: "ch_68_nouns", level: "intermediate", before: "We live in a small apartment in", options: ["a", "the", "—"], after: "city centre.", correct: "the", explanation: "Центр міста один — the city centre." },
        { id: "ch_69_nouns", level: "elementary", before: "There's", options: ["a", "the", "—"], after: "supermarket at the end of the street I live in.", correct: "a", explanation: "Супермаркет згадується вперше." },
        { id: "ch_70_nouns", level: "intermediate", before: "There's a supermarket at", options: ["a", "the", "—"], after: "end of the street I live in.", correct: "the", explanation: "Кінець вулиці один — the end of." },
        { id: "ch_71_nouns", level: "elementary", before: "A: Did you have", options: ["a", "the", "—"], after: "nice holiday?", correct: "a", explanation: "Have a nice holiday — неозначений артикль із прикметником." },
        { id: "ch_72_nouns", level: "intermediate", before: "B: Yes, it was", options: ["a", "the", "—"], after: "best holiday I've ever had.", correct: "the", explanation: "Найвищий ступінь завжди з the." },
        { id: "ch_73_nouns", level: "intermediate", before: "A: Where's", options: ["a", "the", "—"], after: "nearest shop?", correct: "the", explanation: "Nearest — найвищий ступінь." },
        { id: "ch_74_nouns", level: "intermediate", before: "B: There's one at", options: ["a", "the", "—"], after: "end of this street.", correct: "the", explanation: "The end of — єдиний кінець цієї вулиці." },
        { id: "ch_75_nouns", level: "elementary", before: "A: It's", options: ["a", "the", "—"], after: "lovely day, isn't it?", correct: "a", explanation: "A + adjective + day — стала конструкція." },
        { id: "ch_76_nouns", level: "elementary", before: "B: Yes, there isn't", options: ["a", "the", "—"], after: "cloud in the sky.", correct: "a", explanation: "Жодної хмаринки — одна (неозначена) хмара." },
        { id: "ch_77_nouns", level: "intermediate", before: "There isn't a cloud in", options: ["a", "the", "—"], after: "sky.", correct: "the", explanation: "Небо одне — the sky." },
        { id: "ch_78_nouns", level: "intermediate", before: "My computer isn't connecting to", options: ["a", "the", "—"], after: "internet.", correct: "the", explanation: "The internet — унікальний об'єкт." },
        { id: "ch_79_nouns", level: "intermediate", before: "That's interesting. I've got", options: ["a", "the", "—"], after: "same problem with mine.", correct: "the", explanation: "Перед same завжди вживається the." },
        { id: "ch_80_nouns", level: "intermediate", before: "We spent all our money because we stayed at", options: ["a", "the", "—"], after: "most expensive hotel in town.", correct: "the", explanation: "Найвищий ступінь → the." },
        { id: "ch_81_nouns", level: "intermediate", before: "Why didn't you stay at", options: ["a", "the", "—"], after: "cheaper hotel?", correct: "a", explanation: "Вищий ступінь без уточнення — неозначений артикль." },
        { id: "ch_82_nouns", level: "advanced", before: "A: Would you like to travel in", options: ["a", "the", "—"], after: "space?", correct: "—", explanation: "Space у значенні «космос» вживається без артикля." },
        { id: "ch_83_nouns", level: "intermediate", before: "B: Yes, I'd love to go to", options: ["a", "the", "—"], after: "moon.", correct: "the", explanation: "Місяць один — the moon." },
        { id: "ch_84_nouns", level: "intermediate", before: "A: What's Jupiter? Is it", options: ["a", "the", "—"], after: "star?", correct: "a", explanation: "A/an показує, ЩО це за об'єкт (одна з багатьох зірок)." },
        { id: "ch_85_nouns", level: "intermediate", before: "B: No, it's", options: ["a", "the", "—"], after: "planet.", correct: "a", explanation: "Одна з планет — неозначений артикль." },
        { id: "ch_86_nouns", level: "intermediate", before: "It's", options: ["a", "the", "—"], after: "largest planet in the solar system.", correct: "the", explanation: "Найвищий ступінь → the." },
        { id: "ch_87_nouns", level: "intermediate", before: "It's the largest planet in", options: ["a", "the", "—"], after: "solar system.", correct: "the", explanation: "Сонячна система одна — the solar system." },
        { id: "ch_88_nouns", level: "intermediate", before: "Sarah spends most of her free time watching", options: ["the", "—"], after: "TV.", correct: "—", explanation: "Watch TV / television — без артикля." },
        { id: "ch_89_nouns", level: "intermediate", before: "Do you ever listen to", options: ["the", "—"], after: "radio?", correct: "the", explanation: "Listen to the radio — завжди з артиклем (на відміну від TV)." },
        { id: "ch_90_nouns", level: "advanced", before: "", options: ["The", "—"], after: "television was on, but nobody was watching it.", correct: "The", explanation: "Тут television = сам телевізор як прилад, тому the." },
        { id: "ch_91_nouns", level: "elementary", before: "Have you had", options: ["the", "—"], after: "dinner yet?", correct: "—", explanation: "Назви прийомів їжі вживаються без артикля." },
        { id: "ch_92_nouns", level: "intermediate", before: "Lisa and I arrived at", options: ["the", "—"], after: "same time.", correct: "the", explanation: "Перед same завжди the." },
        { id: "ch_93_nouns", level: "intermediate", before: "What's", options: ["the", "—"], after: "capital city of Canada?", correct: "the", explanation: "Столиця одна — унікальний об'єкт." },
        { id: "ch_94_nouns", level: "elementary", before: "What do you want for", options: ["the", "—"], after: "breakfast?", correct: "—", explanation: "For breakfast / lunch / dinner — без артикля." },
        { id: "ch_95_nouns", level: "intermediate", before: "I lay down on", options: ["the", "—"], after: "ground and looked up at the sky.", correct: "the", explanation: "The ground — унікальний об'єкт." },
        { id: "ch_96_nouns", level: "intermediate", before: "I lay down on the ground and looked up at", options: ["the", "—"], after: "sky.", correct: "the", explanation: "The sky — унікальний об'єкт." },
        { id: "ch_97_nouns", level: "intermediate", before: "When he was younger, Tim hated", options: ["school", "the school"], after: ".", correct: "school", explanation: "Йдеться про навчання загалом, а не про будівлю." },
        { id: "ch_98_nouns", level: "intermediate", before: "There were some parents waiting outside", options: ["school", "the school"], after: "to meet their children.", correct: "the school", explanation: "Батьки стоять біля конкретної будівлі — the school." },
        { id: "ch_99_nouns", level: "intermediate", before: "", options: ["School", "The school"], after: "usually starts at 8.30 in the morning.", correct: "School", explanation: "Навчання як процес — без артикля." },
        { id: "ch_100_nouns", level: "advanced", before: "How do your children get to and from", options: ["school", "the school"], after: "? By bus?", correct: "school", explanation: "Діти — учні, тому стала конструкція get to school." },
        { id: "ch_101_nouns", level: "advanced", before: "No, they walk.", options: ["School", "The school"], after: "isn't very far.", correct: "The school", explanation: "Тут мається на увазі саме будівля (відстань до неї)." },
        { id: "ch_102_nouns", level: "intermediate", before: "What sort of job does Emily want to do when she leaves", options: ["school", "the school"], after: "?", correct: "school", explanation: "Leave school = «закінчити школу» — без артикля." },
        { id: "ch_103_nouns", level: "advanced", before: "'How old is", options: ["university", "the university"], after: "?' 'About 200 years.'", correct: "the university", explanation: "Йдеться про конкретний заклад як будівлю/установу." },
        { id: "ch_104_nouns", level: "intermediate", before: "In your country do many people go to", options: ["university", "the university"], after: "?", correct: "university", explanation: "Вступати до університету як студент — без артикля." },
        { id: "ch_105_nouns", level: "intermediate", before: "If you want to get a degree, you normally have to study at", options: ["university", "the university"], after: ".", correct: "university", explanation: "Навчання за призначенням — без артикля." },
        { id: "ch_106_nouns", level: "advanced", before: "This is a small town, but", options: ["university", "the university"], after: "is the biggest in the country.", correct: "the university", explanation: "Конкретний університет цього міста." },
        { id: "ch_107_nouns", level: "intermediate", before: "My brother has always been healthy. He's never been in", options: ["hospital", "the hospital"], after: ".", correct: "hospital", explanation: "Be in hospital = лежати як пацієнт." },
        { id: "ch_108_nouns", level: "advanced", before: "When Ann was ill, I went to", options: ["hospital", "the hospital"], after: "to visit her.", correct: "the hospital", explanation: "Я — відвідувач, а не пацієнт, тому the hospital." },
        { id: "ch_109_nouns", level: "advanced", before: "When I was there, I met Lisa, who is a nurse at", options: ["hospital", "the hospital"], after: ".", correct: "the hospital", explanation: "Працівниця конкретної лікарні — the hospital." },
        { id: "ch_110_nouns", level: "intermediate", before: "A woman was injured in the accident and was taken to", options: ["hospital", "the hospital"], after: ".", correct: "hospital", explanation: "Її везуть як пацієнтку — без артикля." },
        { id: "ch_111_nouns", level: "intermediate", before: "John's mother is a regular churchgoer. She goes to", options: ["church", "the church"], after: "every Sunday.", correct: "church", explanation: "Ходить на службу — за призначенням, без артикля." },
        { id: "ch_112_nouns", level: "intermediate", before: "John himself doesn't go to", options: ["church", "the church"], after: ".", correct: "church", explanation: "Не відвідує служби — без артикля." },
        { id: "ch_113_nouns", level: "advanced", before: "John went to", options: ["church", "the church"], after: "to take some pictures of the building.", correct: "the church", explanation: "Він пішов туди не на службу, а до будівлі." },
        { id: "ch_114_nouns", level: "intermediate", before: "Why is she in", options: ["prison", "the prison"], after: "? What did she do?", correct: "prison", explanation: "Be in prison = відбувати покарання." },
        { id: "ch_115_nouns", level: "advanced", before: "A few days ago firefighters were called to", options: ["prison", "the prison"], after: "to put out a fire.", correct: "the prison", explanation: "Пожежники приїхали до будівлі, а не як в'язні." },
        { id: "ch_116_nouns", level: "intermediate", before: "Do you think too many people are sent to", options: ["prison", "the prison"], after: "?", correct: "prison", explanation: "Sent to prison = ув'язнені — без артикля." },
        { id: "ch_117_nouns", level: "elementary", before: "I like to read", options: ["in bed", "in the bed"], after: "before I go to sleep.", correct: "in bed", explanation: "In bed = «у ліжку» (спати, відпочивати) — без артикля." },
        { id: "ch_118_nouns", level: "elementary", before: "Shall we meet", options: ["after work", "after the work"], after: "tomorrow evening?", correct: "after work", explanation: "Work у значенні «робота» ніколи не бере the." },
        { id: "ch_119_nouns", level: "elementary", before: "I love swimming", options: ["in the sea", "in sea"], after: ".", correct: "in the sea", explanation: "Купатися в морі — the sea (унікальний об'єкт)." },
        { id: "ch_120_nouns", level: "intermediate", before: "It's nice to travel around, but there's no place", options: ["like home", "like the home"], after: "!", correct: "like home", explanation: "Home у значенні «рідна домівка» — без артикля." },
        { id: "ch_121_nouns", level: "elementary", before: "Sam likes to", options: ["go to bed", "go to the bed"], after: "early, and get up early.", correct: "go to bed", explanation: "Go to bed — стала конструкція без артикля." },
        { id: "ch_122_nouns", level: "intermediate", before: "I didn't sleep well in the hotel.", options: ["The bed", "Bed"], after: "was uncomfortable.", correct: "The bed", explanation: "Тут bed — конкретний предмет меблів, тому the." },
        { id: "ch_123_nouns", level: "advanced", before: "How long did it take to cross the ocean? How long were you", options: ["at sea", "at the sea"], after: "?", correct: "at sea", explanation: "At sea = «у плаванні» — без артикля." },
        { id: "ch_124_nouns", level: "elementary", before: "What time do you usually start", options: ["work", "the work"], after: "in the morning?", correct: "work", explanation: "Start work — без артикля." },
        { id: "ch_125_nouns", level: "elementary", before: "How did you", options: ["get home", "get to home"], after: "after the party?", correct: "get home", explanation: "Home вживається без прийменника to: get home, go home." },
        { id: "ch_126_nouns", level: "elementary", before: "I don't like", options: ["hot weather", "the hot weather"], after: "very much.", correct: "hot weather", explanation: "Явище загалом — без артикля." },
        { id: "ch_127_nouns", level: "elementary", before: "I'm not interested in", options: ["boxing", "the boxing"], after: ".", correct: "boxing", explanation: "Види спорту вживаються без артикля." },
        { id: "ch_128_nouns", level: "elementary", before: "I love", options: ["cats", "the cats"], after: ".", correct: "cats", explanation: "Тварини загалом — множина без артикля." },
        { id: "ch_129_nouns", level: "elementary", before: "I hate", options: ["crowds", "the crowds"], after: ".", correct: "crowds", explanation: "Загальне поняття у множині — без артикля." },
        { id: "ch_130_nouns", level: "elementary", before: "I don't mind", options: ["fast food", "the fast food"], after: ".", correct: "fast food", explanation: "Незлічуваний іменник у загальному значенні — без артикля." },
        { id: "ch_131_nouns", level: "elementary", before: "I'm interested in", options: ["maths", "the maths"], after: ".", correct: "maths", explanation: "Шкільні предмети — без артикля." },
        { id: "ch_132_nouns", level: "elementary", before: "", options: ["Apples", "The apples"], after: "are good for you.", correct: "Apples", explanation: "Яблука взагалі — множина без артикля." },
        { id: "ch_133_nouns", level: "elementary", before: "Look at", options: ["apples", "the apples"], after: "on that tree! They're very big.", correct: "the apples", explanation: "Саме ці яблука на тому дереві — конкретні." },
        { id: "ch_134_nouns", level: "intermediate", before: "", options: ["Women", "The women"], after: "live longer than men.", correct: "Women", explanation: "Жінки як категорія — без артикля." },
        { id: "ch_135_nouns", level: "intermediate", before: "Women live longer than", options: ["men", "the men"], after: ".", correct: "men", explanation: "Чоловіки загалом — без артикля." },
        { id: "ch_136_nouns", level: "elementary", before: "I don't drink", options: ["tea", "the tea"], after: ". I don't like it.", correct: "tea", explanation: "Напій загалом — без артикля." },
        { id: "ch_137_nouns", level: "intermediate", before: "We had a very good meal.", options: ["Vegetables", "The vegetables"], after: "were especially good.", correct: "The vegetables", explanation: "Саме ті овочі, які подали під час вечері." },
        { id: "ch_138_nouns", level: "intermediate", before: "", options: ["Life", "The life"], after: "is strange sometimes. Some very strange things happen.", correct: "Life", explanation: "Життя як абстрактне поняття — без артикля." },
        { id: "ch_139_nouns", level: "intermediate", before: "I enjoy", options: ["holidays", "the holidays"], after: "by the sea.", correct: "holidays", explanation: "Відпустки взагалі; уточнення «by the sea» усе одно залишає ідею загальною." },
        { id: "ch_140_nouns", level: "intermediate", before: "How much money does the government spend on", options: ["education", "the education"], after: "?", correct: "education", explanation: "Абстрактне поняття у загальному значенні." },
        { id: "ch_141_nouns", level: "intermediate", before: "Who are", options: ["people", "the people"], after: "in this picture?", correct: "the people", explanation: "Конкретні люди на цьому фото." },
        { id: "ch_142_nouns", level: "intermediate", before: "What makes", options: ["people", "the people"], after: "violent?", correct: "people", explanation: "Люди загалом — без артикля." },
        { id: "ch_143_nouns", level: "intermediate", before: "What causes", options: ["aggression", "the aggression"], after: "?", correct: "aggression", explanation: "Абстрактне поняття у загальному значенні." },
        { id: "ch_144_nouns", level: "advanced", before: "", options: ["All books", "All the books"], after: "on the top shelf belong to me.", correct: "All the books", explanation: "Уточнення «on the top shelf» робить групу конкретною." },
        { id: "ch_145_nouns", level: "intermediate", before: "Don't stay in that hotel. It's very noisy and", options: ["rooms", "the rooms"], after: "are very small.", correct: "the rooms", explanation: "Кімнати саме цього готелю." },
        { id: "ch_146_nouns", level: "intermediate", before: "A pacifist is somebody who is against", options: ["war", "the war"], after: ".", correct: "war", explanation: "Війна як явище загалом." },
        { id: "ch_147_nouns", level: "advanced", before: "", options: ["First World War", "The First World War"], after: "lasted from 1914 until 1918.", correct: "The First World War", explanation: "Історичні події вживаються з the (АЛЕ: World War I)." },
        { id: "ch_148_nouns", level: "intermediate", before: "I don't like", options: ["films", "the films"], after: "that don't have happy endings.", correct: "films", explanation: "«Фільми без хепі-енду» — усе ще загальна категорія." },
        { id: "ch_149_nouns", level: "advanced", before: "Someone gave me a book about", options: ["history", "the history"], after: "of modern art.", correct: "the history", explanation: "Уточнення «of modern art» робить іменник конкретним." },
        { id: "ch_150_nouns", level: "intermediate", before: "Someone gave me a book about the history of", options: ["modern art", "the modern art"], after: ".", correct: "modern art", explanation: "Вид мистецтва загалом — без артикля." },
        { id: "ch_151_nouns", level: "advanced", before: "Rob and Louise got married, but", options: ["marriage", "the marriage"], after: "didn't last very long.", correct: "the marriage", explanation: "Саме їхній шлюб — конкретний." },
        { id: "ch_152_nouns", level: "intermediate", before: "", options: ["Most people", "The most people"], after: "believe that marriage is important.", correct: "Most people", explanation: "Most + іменник ніколи не бере the." },
        { id: "ch_153_nouns", level: "intermediate", before: "Most people believe that", options: ["marriage", "the marriage"], after: "and family life are the basis of society.", correct: "marriage", explanation: "Шлюб як інститут — загальне поняття." },
        { id: "ch_154_nouns", level: "intermediate", before: "Marriage and family life are the basis of", options: ["society", "the society"], after: ".", correct: "society", explanation: "Суспільство загалом — без артикля." },
        { id: "ch_155_nouns", level: "intermediate", before: "I was ill, so I went to see", options: ["the", "—"], after: "doctor.", correct: "the", explanation: "Без імені — the doctor (твій звичайний лікар)." },
        { id: "ch_156_nouns", level: "intermediate", before: "The most powerful person in", options: ["the", "—"], after: "United States is the president.", correct: "the", explanation: "Назви зі словом States вживаються з the." },
        { id: "ch_157_nouns", level: "intermediate", before: "The most powerful person in the United States is", options: ["the", "—"], after: "president.", correct: "the", explanation: "Посада без імені — з артиклем." },
        { id: "ch_158_nouns", level: "intermediate", before: "", options: ["The", "—"], after: "President Kennedy was assassinated in 1963.", correct: "—", explanation: "Титул + ім'я вживаються без артикля." },
        { id: "ch_159_nouns", level: "advanced", before: "Do you know", options: ["the", "—"], after: "Wilsons? They're a very nice couple.", correct: "the", explanation: "Прізвище у множині позначає родину: the Wilsons." },
        { id: "ch_160_nouns", level: "intermediate", before: "I'm looking for", options: ["the", "—"], after: "Professor Brown. Do you know where she is?", correct: "—", explanation: "Титул + прізвище — без артикля." },
        { id: "ch_161_nouns", level: "advanced", before: "Milan is in", options: ["the north", "north"], after: "of Italy.", correct: "the north", explanation: "The north/south/east/west of + країна — з артиклем." },
        { id: "ch_162_nouns", level: "intermediate", before: "Last year I visited Mexico and", options: ["the United States", "United States"], after: ".", correct: "the United States", explanation: "Назви зі словом States беруть the." },
        { id: "ch_163_nouns", level: "advanced", before: "", options: ["The south", "South"], after: "of England is warmer than the north.", correct: "The south", explanation: "Сторона світу + of + країна → the." },
        { id: "ch_164_nouns", level: "intermediate", before: "Portugal is in", options: ["western Europe", "the western Europe"], after: ".", correct: "western Europe", explanation: "Прикметник northern/western + назва — без артикля." },
        { id: "ch_165_nouns", level: "intermediate", before: "France and Britain are separated by", options: ["the Channel", "Channel"], after: ".", correct: "the Channel", explanation: "Протоки й канали — з the." },
        { id: "ch_166_nouns", level: "advanced", before: "James has travelled a lot in", options: ["the Middle East", "Middle East"], after: ".", correct: "the Middle East", explanation: "The Middle East / the Far East — сталі назви з артиклем." },
        { id: "ch_167_nouns", level: "intermediate", before: "Chicago is on", options: ["Lake Michigan", "the Lake Michigan"], after: ".", correct: "Lake Michigan", explanation: "Lake + назва — без артикля." },
        { id: "ch_168_nouns", level: "intermediate", before: "Next year we're going skiing in", options: ["the Swiss Alps", "Swiss Alps"], after: ".", correct: "the Swiss Alps", explanation: "Гірські пасма (множина) — з the." },
        { id: "ch_169_nouns", level: "intermediate", before: "", options: ["The UK", "UK"], after: "consists of Great Britain and Northern Ireland.", correct: "The UK", explanation: "Назви зі словом Kingdom — з the." },
        { id: "ch_170_nouns", level: "advanced", before: "", options: ["The Seychelles", "Seychelles"], after: "are a group of islands in the Indian Ocean.", correct: "The Seychelles", explanation: "Групи островів у множині — з the." },
        { id: "ch_171_nouns", level: "intermediate", before: "The Seychelles are a group of islands in", options: ["the Indian Ocean", "Indian Ocean"], after: ".", correct: "the Indian Ocean", explanation: "Океани — завжди з the." },
        { id: "ch_172_nouns", level: "intermediate", before: "The highest mountain in Africa is", options: ["Kilimanjaro", "the Kilimanjaro"], after: ".", correct: "Kilimanjaro", explanation: "Окремі гори — без артикля." },
        { id: "ch_173_nouns", level: "intermediate", before: "", options: ["The River Volga", "River Volga"], after: "flows into the Caspian Sea.", correct: "The River Volga", explanation: "Річки — з the." },
        { id: "ch_174_nouns", level: "intermediate", before: "The River Volga flows into", options: ["the Caspian Sea", "Caspian Sea"], after: ".", correct: "the Caspian Sea", explanation: "Моря — з the." },
        { id: "ch_175_nouns", level: "intermediate", before: "Is there a supermarket near here? — Yes,", options: ["Turner's", "the Turner's"], after: ".", correct: "Turner's", explanation: "Магазини на -'s (за іменем власника) — без артикля." },
        { id: "ch_176_nouns", level: "intermediate", before: "Is there a hotel near here? — Yes,", options: ["the Crown Hotel", "Crown Hotel"], after: ".", correct: "the Crown Hotel", explanation: "Готелі — з the." },
        { id: "ch_177_nouns", level: "intermediate", before: "Is there a church near here? — Yes,", options: ["St Peter's", "the St Peter's"], after: ".", correct: "St Peter's", explanation: "Церкви, названі на честь святих, — без артикля." },
        { id: "ch_178_nouns", level: "intermediate", before: "Is there a museum near here? — Yes,", options: ["the City Museum", "City Museum"], after: ".", correct: "the City Museum", explanation: "Музеї — з the." },
        { id: "ch_179_nouns", level: "intermediate", before: "Is there a bookshop near here? — Yes,", options: ["Blackstone's", "the Blackstone's"], after: ".", correct: "Blackstone's", explanation: "Назва на -'s — без артикля." },
        { id: "ch_180_nouns", level: "intermediate", before: "Is there a restaurant near here? — Yes,", options: ["Mario's Pizza", "the Mario's Pizza"], after: ".", correct: "Mario's Pizza", explanation: "Ресторан з іменем власника — без артикля." },
        { id: "ch_181_nouns", level: "intermediate", before: "Is there a park near here? — Yes,", options: ["Victoria Park", "the Victoria Park"], after: ".", correct: "Victoria Park", explanation: "Парки — без артикля." },
        { id: "ch_182_nouns", level: "intermediate", before: "Is there a cinema near here? — Yes,", options: ["the Odeon", "Odeon"], after: "in Market Street.", correct: "the Odeon", explanation: "Кінотеатри — з the; вулиці — без артикля." },
        { id: "ch_183_nouns", level: "intermediate", before: "The biggest park in New York is", options: ["Central Park", "the Central Park"], after: ".", correct: "Central Park", explanation: "Парки — без артикля." },
        { id: "ch_184_nouns", level: "intermediate", before: "My favourite park in London is", options: ["St James's Park", "the St James's Park"], after: ".", correct: "St James's Park", explanation: "Назва на -'s + Park — без артикля." },
        { id: "ch_185_nouns", level: "intermediate", before: "", options: ["The Imperial Hotel", "Imperial Hotel"], after: "is in Baker Street.", correct: "The Imperial Hotel", explanation: "Готелі — з the." },
        { id: "ch_186_nouns", level: "intermediate", before: "The Imperial Hotel is in", options: ["Baker Street", "the Baker Street"], after: ".", correct: "Baker Street", explanation: "Вулиці — без артикля." },
        { id: "ch_187_nouns", level: "intermediate", before: "", options: ["Dublin Airport", "The Dublin Airport"], after: "is about 12 kilometres from the city centre.", correct: "Dublin Airport", explanation: "Назва міста + Airport — без артикля." },
        { id: "ch_188_nouns", level: "intermediate", before: "Jack is a student at", options: ["Liverpool University", "the Liverpool University"], after: ".", correct: "Liverpool University", explanation: "Назва міста + University — без артикля." },
        { id: "ch_189_nouns", level: "intermediate", before: "If you're looking for a department store, I would recommend", options: ["Harrison's", "the Harrison's"], after: ".", correct: "Harrison's", explanation: "Магазини на -'s — без артикля." },
        { id: "ch_190_nouns", level: "advanced", before: "If you're looking for a hotel, I would recommend", options: ["the Park Plaza", "Park Plaza"], after: ".", correct: "the Park Plaza", explanation: "Готелі — з the, навіть коли слово Hotel випущене." },
        { id: "ch_191_nouns", level: "intermediate", before: "", options: ["The Statue of Liberty", "Statue of Liberty"], after: "is at the entrance to New York Harbour.", correct: "The Statue of Liberty", explanation: "Назви з of — завжди з the." },
        { id: "ch_192_nouns", level: "advanced", before: "The Statue of Liberty is at the entrance to", options: ["New York Harbour", "the New York Harbour"], after: ".", correct: "New York Harbour", explanation: "Назва міста + Harbour — без артикля." },
        { id: "ch_193_nouns", level: "intermediate", before: "You should go to", options: ["the Science Museum", "Science Museum"], after: ". It's very interesting.", correct: "the Science Museum", explanation: "Музеї — з the (перше слово не є іменем місця чи людини)." },
        { id: "ch_194_nouns", level: "intermediate", before: "Andy works for", options: ["IBM", "the IBM"], after: "now.", correct: "IBM", explanation: "Назви компаній — без артикля." },
        { id: "ch_195_nouns", level: "advanced", before: "He used to work for", options: ["British Telecom", "the British Telecom"], after: ".", correct: "British Telecom", explanation: "Компанії — без артикля, навіть із прикметником British." },
        { id: "ch_196_nouns", level: "intermediate", before: "'Which cinema are you going to this evening?' '", options: ["The Classic", "Classic"], after: ".'", correct: "The Classic", explanation: "Кінотеатри — з the." },
        { id: "ch_197_nouns", level: "intermediate", before: "I'd like to go to China and see", options: ["the Great Wall", "Great Wall"], after: ".", correct: "the Great Wall", explanation: "Пам'ятки на кшталт the Great Wall — з артиклем." },
        { id: "ch_198_nouns", level: "intermediate", before: "'Which newspaper do you want?' '", options: ["The Times", "Times"], after: ".'", correct: "The Times", explanation: "Назви газет — з the." },
        { id: "ch_199_nouns", level: "advanced", before: "This book is published by", options: ["Cambridge University Press", "the Cambridge University Press"], after: ".", correct: "Cambridge University Press", explanation: "Видавництва й компанії — без артикля." },
        { id: "ch_200_nouns", level: "advanced", before: "'What's that building?' 'It's", options: ["the College of Art", "College of Art"], after: ".'", correct: "the College of Art", explanation: "Назва з of — з the." },
        { id: "ch_201_nouns", level: "intermediate", before: "The Great Wall of China is said to be", options: ["the", "—"], after: "only man-made structure seen from space.", correct: "the", explanation: "Перед only/last/first завжди вживається the." },
        { id: "ch_202_nouns", level: "advanced", before: "...the only man-made structure seen from", options: ["the", "—"], after: "space.", correct: "—", explanation: "Space = космос — без артикля." },
        { id: "ch_203_nouns", level: "intermediate", before: "", options: ["The", "—"], after: "Prince of Wales visited a shelter yesterday.", correct: "The", explanation: "Титули з of вживаються з the." },
        { id: "ch_204_nouns", level: "intermediate", before: "The Prince of Wales visited a shelter for", options: ["the", "—"], after: "homeless yesterday.", correct: "the", explanation: "The + прикметник = група людей (the homeless)." },
        { id: "ch_205_nouns", level: "advanced", before: "", options: ["The", "—"], after: "Rock Garden Café is half way up Queen Street.", correct: "The", explanation: "Кафе й ресторани без імені власника — з the." },
        { id: "ch_206_nouns", level: "intermediate", before: "The Rock Garden Café is half way up", options: ["the", "—"], after: "Queen Street, off George Square.", correct: "—", explanation: "Вулиці й площі — без артикля." },
        { id: "ch_207_nouns", level: "advanced", before: "", options: ["The", "—"], after: "Quins are holding a ball in the Sherbrooke Castle Hotel.", correct: "The", explanation: "Прізвище у множині = родина, тому the Quins." },
        { id: "ch_208_nouns", level: "intermediate", before: "The Quins are holding a ball in", options: ["the", "—"], after: "Sherbrooke Castle Hotel.", correct: "the", explanation: "Готелі — з the." },
        { id: "ch_209_nouns", level: "intermediate", before: "The ball is on", options: ["the", "—"], after: "fifth of June.", correct: "the", explanation: "Дати у форматі «the fifth of June» — з артиклем." },
        { id: "ch_210_nouns", level: "intermediate", before: "When we arrived at", options: ["the", "—"], after: "Manchester Airport, Rachel was waiting for us.", correct: "—", explanation: "Назва міста + Airport — без артикля." },
        { id: "ch_211_nouns", level: "intermediate", before: "Rachel was waiting for us at", options: ["the", "—"], after: "arrivals gate.", correct: "the", explanation: "Конкретне місце в аеропорту — the arrivals gate." },
        { id: "ch_212_nouns", level: "advanced", before: "James went to", options: ["the", "—"], after: "hospital to pick up his wife, who is a surgeon there.", correct: "the", explanation: "Він їде по дружину, а не лікуватися — the hospital." },
        { id: "ch_213_nouns", level: "intermediate", before: "It's interesting to look at", options: ["the", "—"], after: "old maps of the world.", correct: "—", explanation: "Загальне поняття у множині — без артикля." },
        { id: "ch_214_nouns", level: "intermediate", before: "It's interesting to look at old maps of", options: ["the", "—"], after: "world.", correct: "the", explanation: "The world — унікальний об'єкт." },
        { id: "ch_215_nouns", level: "advanced", before: "...and see how", options: ["the", "—"], after: "borders have changed.", correct: "the", explanation: "Кордони саме цих країн — конкретні, тому the." },
        { id: "ch_216_nouns", level: "intermediate", before: "If you go to", options: ["the", "—"], after: "New York, you must visit Central Park.", correct: "—", explanation: "Міста — без артикля." },
        { id: "ch_217_nouns", level: "intermediate", before: "You must visit", options: ["the", "—"], after: "Central Park.", correct: "—", explanation: "Парки — без артикля." },
        { id: "ch_218_nouns", level: "intermediate", before: "You must visit", options: ["the", "—"], after: "Guggenheim museum.", correct: "the", explanation: "Музеї — з the." },
        { id: "ch_219_nouns", level: "intermediate", before: "You must visit", options: ["the", "—"], after: "Statue of Liberty.", correct: "the", explanation: "Назва з of — з the." },
        { id: "ch_220_nouns", level: "intermediate", before: "Don't bother to visit", options: ["the", "—"], after: "Times Square.", correct: "—", explanation: "Площі — без артикля." },
        { id: "ch_221_nouns", level: "intermediate", before: "I was thinking of making", options: ["the", "—"], after: "lasagne.", correct: "—", explanation: "Страва як незлічуваний іменник — без артикля." },
        { id: "ch_222_nouns", level: "elementary", before: "We can go to a restaurant for", options: ["the", "—"], after: "lunch.", correct: "—", explanation: "Назви прийомів їжі — без артикля." },
        { id: "ch_223_nouns", level: "intermediate", before: "As soon as Jim got home from", options: ["the", "—"], after: "school, he went straight to bed.", correct: "—", explanation: "Jim — учень, тому from school без артикля." },
        { id: "ch_224_nouns", level: "intermediate", before: "He went straight to", options: ["the", "—"], after: "bed because he felt ill.", correct: "—", explanation: "Go to bed — стала конструкція." },
        { id: "ch_225_nouns", level: "advanced", before: "He felt as if he had", options: ["the", "—"], after: "flu.", correct: "the", explanation: "З flu, measles, mumps артикль факультативний, але частіше кажуть the flu." },
        { id: "ch_226_nouns", level: "advanced", before: "Margaret Thatcher was", options: ["the", "—"], after: "Prime Minister of Great Britain for 12 years.", correct: "—", explanation: "Унікальна посада після дієслова be вживається без артикля." },
        { id: "ch_227_nouns", level: "intermediate", before: "She was Prime Minister of", options: ["the", "—"], after: "Great Britain for 12 years.", correct: "—", explanation: "Назва країни без слова Kingdom/Republic/States — без артикля." },
        { id: "ch_228_nouns", level: "intermediate", before: "She is now known as", options: ["the", "—"], after: "Baroness Thatcher of Kesteven.", correct: "—", explanation: "Титул + ім'я — без артикля." },
        { id: "ch_229_nouns", level: "intermediate", before: "We've decided to go to", options: ["the", "—"], after: "Canary Islands on holiday.", correct: "the", explanation: "Групи островів у множині — з the." },
        { id: "ch_230_nouns", level: "intermediate", before: "Last year we went to", options: ["the", "—"], after: "Crete.", correct: "—", explanation: "Окремі острови — без артикля." },
        { id: "ch_231_nouns", level: "intermediate", before: "We liked", options: ["the", "—"], after: "people there very much.", correct: "the", explanation: "Люди саме того місця — конкретна група." },
        { id: "ch_232_nouns", level: "advanced", before: "I was born in", options: ["the", "—"], after: "North of England.", correct: "the", explanation: "Сторона світу + of + країна → the." },
        { id: "ch_233_nouns", level: "intermediate", before: "When I was in", options: ["the", "—"], after: "infant school we moved to Lewes.", correct: "—", explanation: "Школа за призначенням (як учень) — без артикля." },
        { id: "ch_234_nouns", level: "intermediate", before: "We moved to", options: ["the", "—"], after: "Lewes, which is in East Sussex.", correct: "—", explanation: "Міста — без артикля." },
        { id: "ch_235_nouns", level: "intermediate", before: "In", options: ["the", "—"], after: "office where I work most people have a degree.", correct: "the", explanation: "Уточнення «where I work» робить офіс конкретним." },
        { id: "ch_236_nouns", level: "intermediate", before: "In the office where I work", options: ["the", "—"], after: "most people have a degree in English.", correct: "—", explanation: "Most + іменник ніколи не бере the." },
        { id: "ch_237_nouns", level: "intermediate", before: "Most people have a degree in", options: ["the", "—"], after: "English.", correct: "—", explanation: "Назви мов — без артикля." },
        { id: "ch_238_nouns", level: "intermediate", before: "My boss is", options: ["the", "—"], after: "nicest person I've ever worked for.", correct: "the", explanation: "Найвищий ступінь → the." },
        { id: "ch_239_nouns", level: "intermediate", before: "My boss has a PhD in", options: ["the", "—"], after: "astronomy.", correct: "—", explanation: "Назви наук і предметів — без артикля." },
        { id: "ch_240_nouns", level: "intermediate", before: "Many people enjoy", options: ["the", "—"], after: "snowboarding and hiking.", correct: "—", explanation: "Назви видів спорту — без артикля." },
        { id: "ch_241_nouns", level: "intermediate", before: "Many people enjoy hiking in", options: ["the", "—"], after: "Alps and the Pyrenees.", correct: "the", explanation: "Гірські пасма — з the." },
        { id: "ch_242_nouns", level: "intermediate", before: "On the first of April, it is", options: ["a", "an", "the", "—"], after: "custom for British people to make jokes.", correct: "a", explanation: "A custom = «звичай» (один із багатьох)." },
        { id: "ch_243_nouns", level: "intermediate", before: "It is a custom for British people to make", options: ["a", "an", "the", "—"], after: "jokes and play tricks on each other.", correct: "—", explanation: "Множина у загальному значенні — без артикля." },
        { id: "ch_244_nouns", level: "intermediate", before: "Of all", options: ["a", "an", "the", "—"], after: "countries on the continent of North America...", correct: "the", explanation: "Уточнення «on the continent» робить групу конкретною." },
        { id: "ch_245_nouns", level: "intermediate", before: "Of all the countries on", options: ["a", "an", "the", "—"], after: "continent of North America...", correct: "the", explanation: "Назва з of — з the." },
        { id: "ch_246_nouns", level: "intermediate", before: "...on the continent of", options: ["a", "an", "the", "—"], after: "North America, Phil has only visited Canada.", correct: "—", explanation: "Континенти — без артикля." },
        { id: "ch_247_nouns", level: "advanced", before: "", options: ["A", "An", "The", "—"], after: "universities of Oxford and Cambridge are famous.", correct: "The", explanation: "Назва з of → the universities of..." },
        { id: "ch_248_nouns", level: "intermediate", before: "They are two of", options: ["a", "an", "the", "—"], after: "most famous universities in Europe.", correct: "the", explanation: "Найвищий ступінь → the." },
        { id: "ch_249_nouns", level: "intermediate", before: "...two of the most famous universities in", options: ["a", "an", "the", "—"], after: "Europe.", correct: "—", explanation: "Континенти — без артикля." },
        { id: "ch_250_nouns", level: "intermediate", before: "Why don't you contact", options: ["a", "an", "the", "—"], after: "agency I went to in Lamb Street?", correct: "the", explanation: "Уточнення «I went to» робить агенцію конкретною." },
        { id: "ch_251_nouns", level: "intermediate", before: "...the agency I went to in", options: ["a", "an", "the", "—"], after: "Lamb Street?", correct: "—", explanation: "Вулиці — без артикля." },
        { id: "ch_252_nouns", level: "intermediate", before: "", options: ["A", "An", "The", "—"], after: "capital city of Spain, Madrid, is to the north of Seville.", correct: "The", explanation: "Унікальний об'єкт + уточнення of Spain." },
        { id: "ch_253_nouns", level: "intermediate", before: "The capital city of", options: ["a", "an", "the", "—"], after: "Spain is Madrid.", correct: "—", explanation: "Країни — без артикля." },
        { id: "ch_254_nouns", level: "advanced", before: "Madrid is to", options: ["a", "an", "the", "—"], after: "north of Seville.", correct: "the", explanation: "Сторона світу + of — з the." },
        { id: "ch_255_nouns", level: "intermediate", before: "", options: ["A", "An", "The", "—"], after: "holiday I took in Rome was the best I've ever had.", correct: "The", explanation: "Уточнення «I took in Rome» робить відпустку конкретною." },
        { id: "ch_256_nouns", level: "intermediate", before: "The holiday I took in Rome was", options: ["a", "an", "the", "—"], after: "best I've ever had.", correct: "the", explanation: "Найвищий ступінь → the." },
        { id: "ch_257_nouns", level: "intermediate", before: "", options: ["A", "An", "The", "—"], after: "Detective Sherlock Holmes solved many mysteries.", correct: "—", explanation: "Титул/звання + ім'я — без артикля." },
        { id: "ch_258_nouns", level: "intermediate", before: "Sherlock Holmes and his assistant,", options: ["a", "an", "the", "—"], after: "Doctor Watson, solved a lot of mysteries.", correct: "—", explanation: "Doctor + прізвище — без артикля." },
        { id: "ch_259_nouns", level: "elementary", before: "They solved", options: ["a", "an", "the", "—"], after: "lot of mysteries.", correct: "a", explanation: "A lot of — стала сполука." },
        { id: "ch_260_nouns", level: "advanced", before: "I would love to spend", options: ["a", "an", "the", "—"], after: "summer cruising in the Caribbean.", correct: "a", explanation: "«Одне літо» — неозначений артикль." },
        { id: "ch_261_nouns", level: "intermediate", before: "I would love to spend a summer cruising in", options: ["a", "an", "the", "—"], after: "Caribbean.", correct: "the", explanation: "The Caribbean — назва регіону/моря з артиклем." },
        { id: "ch_262_nouns", level: "elementary", before: "Mrs Hamilton holds", options: ["a", "an", "the", "—"], after: "flower arranging class on Wednesday evenings.", correct: "a", explanation: "Заняття згадується вперше." },
        { id: "ch_263_nouns", level: "intermediate", before: "She holds a class on", options: ["a", "an", "the", "—"], after: "Wednesday evenings.", correct: "—", explanation: "Дні тижня — без артикля." },
        { id: "ch_264_nouns", level: "intermediate", before: "The highest mountain in", options: ["a", "an", "the", "—"], after: "world is Mount Everest.", correct: "the", explanation: "The world — унікальний об'єкт." },
        { id: "ch_265_nouns", level: "intermediate", before: "The highest mountain is", options: ["a", "an", "the", "—"], after: "Mount Everest.", correct: "—", explanation: "Mount + назва — без артикля." },
        { id: "ch_266_nouns", level: "intermediate", before: "Mount Everest is in", options: ["a", "an", "the", "—"], after: "Himalayas.", correct: "the", explanation: "Гірські пасма — з the." },
        { id: "ch_267_nouns", level: "elementary", before: "There is", options: ["a", "an", "the", "—"], after: "wonderful 1920s style restaurant-café in Glasgow.", correct: "a", explanation: "Кафе згадується вперше." },
        { id: "ch_268_nouns", level: "intermediate", before: "There is a wonderful café in", options: ["a", "an", "the", "—"], after: "Glasgow.", correct: "—", explanation: "Міста — без артикля." },
        { id: "ch_269_nouns", level: "intermediate", before: "It has some of", options: ["a", "an", "the", "—"], after: "most charming waiters I've ever met.", correct: "the", explanation: "Найвищий ступінь → the." },
        { id: "ch_270_nouns", level: "intermediate", before: "Belfast is", options: ["a", "an", "the", "—"], after: "capital of Northern Ireland.", correct: "the", explanation: "Столиця одна — унікальний об'єкт." },
        { id: "ch_271_nouns", level: "intermediate", before: "Belfast is the capital of", options: ["a", "an", "the", "—"], after: "Northern Ireland.", correct: "—", explanation: "Назва країни без Republic/Kingdom/States — без артикля." },
        { id: "ch_272_nouns", level: "advanced", before: "Dublin is the capital of", options: ["a", "an", "the", "—"], after: "Republic of Ireland.", correct: "the", explanation: "Назви зі словом Republic — з the." },
        { id: "ch_273_nouns", level: "intermediate", before: "", options: ["A", "An", "The", "—"], after: "Balearic Islands lie to the east of Spain.", correct: "The", explanation: "Групи островів — з the." },
        { id: "ch_274_nouns", level: "advanced", before: "The Balearic Islands lie to", options: ["a", "an", "the", "—"], after: "east of Spain.", correct: "the", explanation: "Сторона світу + of — з the." },
        { id: "ch_275_nouns", level: "elementary", before: "Julia is", options: ["a", "an", "the", "—"], after: "extremely patient girl.", correct: "an", explanation: "Перед голосним звуком [e] у слові extremely — an." },
        { id: "ch_276_nouns", level: "elementary", before: "She will have no problem in her career as", options: ["a", "an", "the", "—"], after: "nanny.", correct: "a", explanation: "Професія після as — з неозначеним артиклем." },
        { id: "ch_277_nouns", level: "elementary", before: "Stephen has", options: ["a", "an", "the", "—"], after: "seminar on Saturday morning.", correct: "a", explanation: "Семінар згадується вперше." },
        { id: "ch_278_nouns", level: "intermediate", before: "Stephen has a seminar on", options: ["a", "an", "the", "—"], after: "Saturday morning.", correct: "—", explanation: "Дні тижня — без артикля." },
        { id: "ch_279_nouns", level: "intermediate", before: "We won't be able to go to", options: ["a", "an", "the", "—"], after: "ski slopes until Sunday.", correct: "the", explanation: "Конкретні схили, про які обидва знають." },
        { id: "ch_280_nouns", level: "intermediate", before: "On Sunday we decided to go to", options: ["a", "an", "the", "—"], after: "beach by train.", correct: "the", explanation: "The beach — звичне місце, зрозуміле із ситуації." },
        { id: "ch_281_nouns", level: "intermediate", before: "We decided to go to the beach by", options: ["a", "an", "the", "—"], after: "train.", correct: "—", explanation: "Засоби транспорту після by — без артикля." },
        { id: "ch_282_nouns", level: "intermediate", before: "By the time we got to", options: ["a", "an", "the", "—"], after: "station, the weather looked threatening.", correct: "the", explanation: "Вокзал цього міста — the station." },
        { id: "ch_283_nouns", level: "intermediate", before: "", options: ["A", "An", "The", "—"], after: "weather looked so threatening that we went to the cinema.", correct: "The", explanation: "Weather завжди вживається з the." },
        { id: "ch_284_nouns", level: "intermediate", before: "We went to", options: ["a", "an", "the", "—"], after: "cinema instead.", correct: "the", explanation: "Go to the cinema — стала конструкція." },
        { id: "ch_285_nouns", level: "intermediate", before: "", options: ["the British Museum", "British Museum"], after: "", correct: "the British Museum", explanation: "Музеї — з the (British тут прикметник, а не назва місця)." },
        { id: "ch_286_nouns", level: "intermediate", before: "", options: ["St Pancras Station", "the St Pancras Station"], after: "", correct: "St Pancras Station", explanation: "Вокзали з іменем святого чи місця — без артикля." },
        { id: "ch_287_nouns", level: "intermediate", before: "", options: ["Kew Gardens", "the Kew Gardens"], after: "", correct: "Kew Gardens", explanation: "Парки й сади з назвою місця — без артикля." },
        { id: "ch_288_nouns", level: "advanced", before: "", options: ["the Mendip Hills", "Mendip Hills"], after: "", correct: "the Mendip Hills", explanation: "Гірські пасма у множині — з the." },
        { id: "ch_289_nouns", level: "intermediate", before: "", options: ["Red Lion Square", "the Red Lion Square"], after: "", correct: "Red Lion Square", explanation: "Площі — без артикля." },
        { id: "ch_290_nouns", level: "advanced", before: "", options: ["the Dutch language", "Dutch language"], after: "", correct: "the Dutch language", explanation: "Зі словом language назва мови бере the (порівняй: speak Dutch)." },
        { id: "ch_291_nouns", level: "intermediate", before: "", options: ["King George VI", "the King George VI"], after: "", correct: "King George VI", explanation: "Титул + ім'я — без артикля." },
        { id: "ch_292_nouns", level: "intermediate", before: "", options: ["the East River", "East River"], after: "", correct: "the East River", explanation: "Річки — з the." },
        { id: "ch_293_nouns", level: "advanced", before: "", options: ["the High Street", "High Street"], after: "", correct: "the High Street", explanation: "The High Street — виняток серед вулиць (як the Mall, the Strand)." },
        { id: "ch_294_nouns", level: "intermediate", before: "", options: ["the Andes", "Andes"], after: "", correct: "the Andes", explanation: "Гірські пасма — з the." },
        { id: "ch_295_nouns", level: "intermediate", before: "", options: ["Lake Windermere", "the Lake Windermere"], after: "", correct: "Lake Windermere", explanation: "Lake + назва — без артикля." },
        { id: "ch_296_nouns", level: "intermediate", before: "", options: ["flamenco music", "the flamenco music"], after: "", correct: "flamenco music", explanation: "Музичні стилі у загальному значенні — без артикля." },
        { id: "ch_297_nouns", level: "intermediate", before: "", options: ["UNESCO", "the UNESCO"], after: "", correct: "UNESCO", explanation: "Абревіатури, що читаються як слово, — без артикля." },
        { id: "ch_298_nouns", level: "intermediate", before: "", options: ["the Uffizi Gallery", "Uffizi Gallery"], after: "", correct: "the Uffizi Gallery", explanation: "Галереї — з the." },
        { id: "ch_299_nouns", level: "intermediate", before: "", options: ["Macy's", "the Macy's"], after: "", correct: "Macy's", explanation: "Магазини на -'s — без артикля." },
        { id: "ch_300_nouns", level: "intermediate", before: "", options: ["Harrods", "the Harrods"], after: "", correct: "Harrods", explanation: "Магазини на -s за іменем засновника — без артикля." },
        { id: "ch_301_nouns", level: "intermediate", before: "", options: ["the Red Sea", "Red Sea"], after: "", correct: "the Red Sea", explanation: "Моря — з the." },
        { id: "ch_302_nouns", level: "advanced", before: "", options: ["the Duchess of Devonshire", "Duchess of Devonshire"], after: "", correct: "the Duchess of Devonshire", explanation: "Титул із of — з the." },
        { id: "ch_303_nouns", level: "intermediate", before: "", options: ["Regent Street", "the Regent Street"], after: "", correct: "Regent Street", explanation: "Вулиці — без артикля." },
        { id: "ch_304_nouns", level: "intermediate", before: "", options: ["the Virgin Islands", "Virgin Islands"], after: "", correct: "the Virgin Islands", explanation: "Групи островів — з the." },
        { id: "ch_305_nouns", level: "intermediate", before: "", options: ["Mount Etna", "the Mount Etna"], after: "", correct: "Mount Etna", explanation: "Mount + назва — без артикля." },
        { id: "ch_306_nouns", level: "intermediate", before: "", options: ["Charles de Gaulle Airport", "the Charles de Gaulle Airport"], after: "", correct: "Charles de Gaulle Airport", explanation: "Аеропорти — без артикля." },
        { id: "ch_307_nouns", level: "intermediate", before: "", options: ["Malta", "the Malta"], after: "", correct: "Malta", explanation: "Окремі острови й країни — без артикля." },
        { id: "ch_308_nouns", level: "intermediate", before: "", options: ["the Atlantic", "Atlantic"], after: "", correct: "the Atlantic", explanation: "Океани — з the." },
        { id: "ch_309_nouns", level: "advanced", before: "", options: ["the Queen of Spain", "Queen of Spain"], after: "", correct: "the Queen of Spain", explanation: "Титул із of — з the." }
      ],
      gap: [
        { id: "gap_102_nouns", level: "elementary", prompt: "'How often do you go to the cinema?' 'About once ______ month.'", answers: ["a"], explanation: "A у значенні «за»: once a month." },
        { id: "gap_103_nouns", level: "elementary", prompt: "'How often do you go to the dentist?' 'Twice ______ year.'", answers: ["a"], explanation: "Twice a year — частота." },
        { id: "gap_104_nouns", level: "elementary", prompt: "'How often do you go away on holiday?' 'Once ______ year.'", answers: ["a"], explanation: "Once a year — частота." },
        { id: "gap_105_nouns", level: "intermediate", prompt: "'What's the usual speed limit in towns?' '50 kilometres ______ hour.'", answers: ["an"], explanation: "Перед голосним звуком [au] у слові hour вживаємо an." },
        { id: "gap_106_nouns", level: "elementary", prompt: "'How much sleep do you need?' 'About eight hours ______ night.'", answers: ["a"], explanation: "Eight hours a night — норма за одиницю часу." },
        { id: "gap_107_nouns", level: "elementary", prompt: "'How often do you go out in the evening?' 'Two or three times ______ week.'", answers: ["a"], explanation: "Three times a week — частота." },
        { id: "gap_108_nouns", level: "elementary", prompt: "'How much television do you watch?' 'About two hours ______ day.'", answers: ["a"], explanation: "Two hours a day — норма за день." },
        { id: "gap_109_nouns", level: "elementary", prompt: "'How much does it cost to rent a small car?' 'About £40 ______ day.'", answers: ["a"], explanation: "Ціна за одиницю: £40 a day." },
        { id: "gap_110_nouns", level: "intermediate", prompt: "I'm fed up with doing ______ same thing every day.", answers: ["the"], explanation: "Перед same завжди вживається the." },
        { id: "gap_111_nouns", level: "intermediate", prompt: "Room 25 is on ______ second floor.", answers: ["the"], explanation: "Перед порядковим числівником — the (але Room 25 без артикля)." },
        { id: "gap_112_nouns", level: "intermediate", prompt: "______ moon goes round the earth every 27 days.", answers: ["The"], explanation: "Місяць один — унікальний об'єкт." },
        { id: "gap_113_nouns", level: "intermediate", prompt: "It was very hot. It was ______ hottest day of the year.", answers: ["the"], explanation: "Найвищий ступінь → the." },
        { id: "gap_114_nouns", level: "intermediate", prompt: "We had lunch in ______ nice restaurant by the sea.", answers: ["a"], explanation: "Ресторан згадується вперше." },
        { id: "gap_115_nouns", level: "intermediate", prompt: "We had lunch in a nice restaurant by ______ sea.", answers: ["the"], explanation: "The sea — унікальний об'єкт." },
        { id: "gap_116_nouns", level: "intermediate", prompt: "What's on at ______ cinema this week?", answers: ["the"], explanation: "At the cinema — стала конструкція." },
        { id: "gap_117_nouns", level: "intermediate", prompt: "I like to eat ______ good breakfast before I go to work.", answers: ["a"], explanation: "Із прикметником назва їжі бере a/an." },
        { id: "gap_118_nouns", level: "intermediate", prompt: "We missed our train because we were waiting on ______ wrong platform.", answers: ["the"], explanation: "Перед wrong/right вживаємо the." },
        { id: "gap_119_nouns", level: "intermediate", prompt: "______ next train to London leaves from Platform 3.", answers: ["The"], explanation: "Перед next у значенні «наступний за розкладом» — the." },
        { id: "gap_120_nouns", level: "intermediate", prompt: "You'll find ______ information you need at the top of page 15.", answers: ["the"], explanation: "Уточнення «you need» робить іменник конкретним." },
        { id: "gap_121_nouns", level: "intermediate", prompt: "You'll find the information you need at ______ top of page 15.", answers: ["the"], explanation: "The top of — єдине місце." },
        { id: "gap_122_nouns", level: "intermediate", prompt: "There was no wind, so ______ was very calm. (sea)", answers: ["the sea"], explanation: "The sea — унікальний об'єкт." },
        { id: "gap_123_nouns", level: "intermediate", prompt: "The test wasn't too difficult, but I couldn't answer ______. (question 8)", answers: ["question 8"], explanation: "Іменник + число вживається без артикля." },
        { id: "gap_124_nouns", level: "intermediate", prompt: "'I'm going to ______ tonight.' 'What film are you going to see?' (cinema)", answers: ["the cinema"], explanation: "Go to the cinema — стала конструкція." },
        { id: "gap_125_nouns", level: "elementary", prompt: "I didn't have time for ______ this morning because I was in a hurry. (breakfast)", answers: ["breakfast"], explanation: "Назви прийомів їжі — без артикля." },
        { id: "gap_126_nouns", level: "intermediate", prompt: "Oh, ______ is open. I must have forgotten to shut it. (gate)", answers: ["the gate"], explanation: "Із ситуації зрозуміло, про яку хвіртку йдеться." },
        { id: "gap_127_nouns", level: "intermediate", prompt: "(airport announcement) Flight AB123 to Rome is now boarding at ______. (Gate 21)", answers: ["Gate 21"], explanation: "Іменник + число — без артикля." },
        { id: "gap_128_nouns", level: "elementary", prompt: "In Britain, children from the age of five have to go ______. (school)", answers: ["to school"], explanation: "Go to school — як учень, без артикля." },
        { id: "gap_129_nouns", level: "elementary", prompt: "Mark didn't go out last night. He stayed ______. (home)", answers: ["at home"], explanation: "At home — без артикля." },
        { id: "gap_130_nouns", level: "elementary", prompt: "There is a lot of traffic in the morning when everybody is going ______. (work)", answers: ["to work"], explanation: "Work ніколи не бере the." },
        { id: "gap_131_nouns", level: "intermediate", prompt: "Kate's mother has just had an operation. She is still ______. (hospital)", answers: ["in hospital"], explanation: "Be in hospital — як пацієнтка." },
        { id: "gap_132_nouns", level: "intermediate", prompt: "When Sophie leaves school, she wants to study economics ______. (university)", answers: ["at university"], explanation: "Навчатися в університеті — без артикля." },
        { id: "gap_133_nouns", level: "elementary", prompt: "Ben never gets up before 9 o'clock. It's 8.30 now, so he is still ______. (bed)", answers: ["in bed"], explanation: "In bed — без артикля." },
        { id: "gap_134_nouns", level: "intermediate", prompt: "If people commit crimes, they may be sent ______. (prison)", answers: ["to prison"], explanation: "Sent to prison — за призначенням, без артикля." },
        { id: "gap_135_nouns", level: "intermediate", prompt: "Some people are afraid of ______. (spiders)", answers: ["spiders"], explanation: "Загальне поняття у множині — без артикля." },
        { id: "gap_136_nouns", level: "intermediate", prompt: "A vegetarian is somebody who doesn't eat ______. (meat)", answers: ["meat"], explanation: "Незлічуваний іменник у загальному значенні." },
        { id: "gap_137_nouns", level: "intermediate", prompt: "The test wasn't very difficult. I answered ______ without difficulty. (questions)", answers: ["the questions"], explanation: "Питання саме цього тесту — конкретні." },
        { id: "gap_138_nouns", level: "intermediate", prompt: "Do you know ______ who live next door? (people)", answers: ["the people"], explanation: "Уточнення «who live next door» робить групу конкретною." },
        { id: "gap_139_nouns", level: "intermediate", prompt: "______ is the study of the past. (history)", answers: ["History"], explanation: "Назви наук — без артикля." },
        { id: "gap_140_nouns", level: "intermediate", prompt: "It's better to tell the truth. Telling ______ usually causes problems. (lies)", answers: ["lies"], explanation: "Загальне поняття у множині — без артикля." },
        { id: "gap_141_nouns", level: "intermediate", prompt: "We couldn't find anywhere to stay in the town. ______ were full. (hotels)", answers: ["The hotels"], explanation: "Готелі саме цього міста — конкретні." },
        { id: "gap_142_nouns", level: "intermediate", prompt: "______ in the pool didn't look very clean. (water)", answers: ["The water"], explanation: "Вода саме в цьому басейні — конкретна." },
        { id: "gap_143_nouns", level: "intermediate", prompt: "Don't sit on ______. It's wet after the rain. (grass)", answers: ["the grass"], explanation: "Трава тут, у цьому місці — the grass." },
        { id: "gap_144_nouns", level: "intermediate", prompt: "You need ______ to teach young children. (patience)", answers: ["patience"], explanation: "Абстрактний іменник у загальному значенні — без артикля." },
        { id: "gap_145_nouns", level: "intermediate", prompt: "Where is Argentina? — In ______.", answers: ["South America"], explanation: "Континенти — без артикля." },
        { id: "gap_146_nouns", level: "intermediate", prompt: "Which is the longest river in Africa? — ______.", answers: ["The Nile", "the Nile"], explanation: "Річки — з the." },
        { id: "gap_147_nouns", level: "intermediate", prompt: "Of which country is Stockholm the capital? — ______.", answers: ["Sweden"], explanation: "Країни — без артикля." },
        { id: "gap_148_nouns", level: "intermediate", prompt: "Of which country is Washington the capital? — ______.", answers: ["The United States", "the United States", "The USA", "the USA"], explanation: "Назви зі словом States — з the." },
        { id: "gap_149_nouns", level: "advanced", prompt: "What is the mountain range in the west of North America? — ______.", answers: ["The Rockies", "the Rockies", "The Rocky Mountains", "the Rocky Mountains"], explanation: "Гірські пасма — з the." },
        { id: "gap_150_nouns", level: "intermediate", prompt: "What is the sea between Africa and Europe? — ______.", answers: ["The Mediterranean", "the Mediterranean"], explanation: "Моря — з the." },
        { id: "gap_151_nouns", level: "intermediate", prompt: "Which is the smallest continent in the world? — ______.", answers: ["Australia"], explanation: "Континенти — без артикля." },
        { id: "gap_152_nouns", level: "intermediate", prompt: "What is the ocean between North America and Asia? — ______.", answers: ["The Pacific", "the Pacific"], explanation: "Океани — з the." },
        { id: "gap_153_nouns", level: "intermediate", prompt: "What is the ocean between Africa and Australia? — ______.", answers: ["The Indian Ocean", "the Indian Ocean"], explanation: "Океани — з the." },
        { id: "gap_154_nouns", level: "intermediate", prompt: "Which river flows through London? — ______.", answers: ["The Thames", "the Thames"], explanation: "Річки — з the." },
        { id: "gap_155_nouns", level: "intermediate", prompt: "Which river flows through Vienna, Budapest and Belgrade? — ______.", answers: ["The Danube", "the Danube"], explanation: "Річки — з the." },
        { id: "gap_156_nouns", level: "intermediate", prompt: "Of which country is Bangkok the capital? — ______.", answers: ["Thailand"], explanation: "Країни — без артикля." },
        { id: "gap_157_nouns", level: "advanced", prompt: "What joins the Atlantic and Pacific oceans? — ______.", answers: ["The Panama Canal", "the Panama Canal"], explanation: "Канали — з the." },
        { id: "gap_158_nouns", level: "intermediate", prompt: "Which is the longest river in South America? — ______.", answers: ["The Amazon", "the Amazon"], explanation: "Річки — з the." },
        { id: "gap_159_nouns", level: "intermediate", prompt: "______ is in Paris. (Eiffel Tower)", answers: ["The Eiffel Tower"], explanation: "Відомі споруди — з the." },
        { id: "gap_160_nouns", level: "intermediate", prompt: "______ is in London. (Buckingham Palace)", answers: ["Buckingham Palace"], explanation: "Перше слово — назва місця, тому без артикля." },
        { id: "gap_161_nouns", level: "intermediate", prompt: "______ is in Washington. (White House)", answers: ["The White House"], explanation: "White не є іменем місця чи людини, тому the." },
        { id: "gap_162_nouns", level: "intermediate", prompt: "______ is in Moscow. (Kremlin)", answers: ["The Kremlin"], explanation: "Назви типу the + іменник — з артиклем." },
        { id: "gap_163_nouns", level: "intermediate", prompt: "______ is in New York. (Broadway)", answers: ["Broadway"], explanation: "Вулиці — без артикля." },
        { id: "gap_164_nouns", level: "intermediate", prompt: "______ is in Athens. (Acropolis)", answers: ["The Acropolis"], explanation: "The Acropolis — стала назва з артиклем." },
        { id: "gap_165_nouns", level: "intermediate", prompt: "______ is near London. (Gatwick Airport)", answers: ["Gatwick Airport"], explanation: "Аеропорти — без артикля." }
      ],
      cross: [
        { id: "cr_1_nouns", level: "elementary", words: ["He", "goes", "to", "the", "school", "by", "bus", "every", "morning."], extraIndex: 3, explanation: "Учень ходить до школи — go to school без артикля." },
        { id: "cr_2_nouns", level: "elementary", words: ["I", "have", "to", "go", "to", "the", "work", "now."], extraIndex: 5, explanation: "Work у значенні «робота» ніколи не бере the." },
        { id: "cr_3_nouns", level: "elementary", words: ["Mum", "is", "at", "the", "home", "now."], extraIndex: 3, explanation: "At home — без артикля." },
        { id: "cr_4_nouns", level: "intermediate", words: ["She", "came", "by", "the", "plane", "last", "night."], extraIndex: 3, explanation: "Засоби транспорту після by — без артикля." },
        { id: "cr_5_nouns", level: "elementary", words: ["I", "love", "the", "tennis", "and", "swimming."], extraIndex: 2, explanation: "Назви видів спорту вживаються без артикля." },
        { id: "cr_6_nouns", level: "elementary", words: ["Can", "you", "speak", "the", "French?"], extraIndex: 3, explanation: "Назви мов — без артикля (АЛЕ: the French language)." },
        { id: "cr_7_nouns", level: "intermediate", words: ["We", "went", "to", "the", "France", "last", "summer."], extraIndex: 3, explanation: "Країни — без артикля." },
        { id: "cr_8_nouns", level: "intermediate", words: ["The", "most", "students", "pass", "the", "exams."], extraIndex: 0, explanation: "Most + іменник ніколи не бере the." },
        { id: "cr_9_nouns", level: "elementary", words: ["That", "is", "the", "my", "book."], extraIndex: 2, explanation: "Артикль і присвійний займенник не вживаються разом." },
        { id: "cr_10_nouns", level: "intermediate", words: ["I", "went", "to", "the", "Glasgow", "Airport", "yesterday."], extraIndex: 3, explanation: "Назва міста + Airport — без артикля." },
        { id: "cr_11_nouns", level: "elementary", words: ["We", "had", "the", "lunch", "in", "a", "nice", "restaurant."], extraIndex: 2, explanation: "Назви прийомів їжі — без артикля." },
        { id: "cr_12_nouns", level: "intermediate", words: ["She", "is", "in", "the", "bed", "because", "she", "has", "flu."], extraIndex: 3, explanation: "In bed = «хворіє, лежить» — без артикля." },
        { id: "cr_13_nouns", level: "intermediate", words: ["The", "Buckingham", "Palace", "is", "in", "London."], extraIndex: 0, explanation: "Перше слово — назва місця, тому артикль не потрібен." },
        { id: "cr_14_nouns", level: "intermediate", words: ["I", "bought", "this", "book", "at", "the", "Harrods."], extraIndex: 5, explanation: "Магазини на -s за іменем засновника — без артикля." },
        { id: "cr_15_nouns", level: "advanced", words: ["Milan", "is", "in", "the", "northern", "Italy."], extraIndex: 3, explanation: "Northern Italy — без артикля (АЛЕ: the north of Italy)." },
        { id: "cr_16_nouns", level: "intermediate", words: ["He", "works", "for", "the", "IBM", "in", "Dublin."], extraIndex: 3, explanation: "Назви компаній — без артикля." },
        { id: "cr_17_nouns", level: "intermediate", words: ["My", "favourite", "subject", "at", "school", "was", "the", "history."], extraIndex: 6, explanation: "Шкільні предмети — без артикля." },
        { id: "cr_18_nouns", level: "intermediate", words: ["The", "Lake", "Superior", "is", "the", "largest", "of", "the", "Great", "Lakes."], extraIndex: 0, explanation: "Lake + назва — без артикля." },
        { id: "cr_19_nouns", level: "intermediate", words: ["I", "like", "to", "walk", "along", "the", "Regent", "Street."], extraIndex: 5, explanation: "Вулиці — без артикля." },
        { id: "cr_20_nouns", level: "intermediate", words: ["She", "plays", "the", "darts", "every", "Friday."], extraIndex: 2, explanation: "Назви ігор — без артикля (але the з музичними інструментами: play the piano)." },
        { id: "cr_21_nouns", level: "advanced", words: ["The", "President", "Kennedy", "was", "assassinated", "in", "1963."], extraIndex: 0, explanation: "Титул + ім'я — без артикля." }
      ],
      abcd: [
        { id: "abcd_9_nouns", level: "elementary", q: "9. I bought ______ umbrella because it was raining.", options: ["A) a", "B) an", "C) the", "D) —"], correct: 1, explanation: "Перед голосним звуком вживаємо an; парасолька згадується вперше." },
        { id: "abcd_10_nouns", level: "elementary", q: "10. I had a sandwich and an apple. ______ sandwich wasn't very good.", options: ["A) A", "B) An", "C) The", "D) —"], correct: 2, explanation: "Друга згадка того самого предмета — the." },
        { id: "abcd_11_nouns", level: "elementary", q: "11. Could you turn off ______ light, please?", options: ["A) a", "B) an", "C) the", "D) —"], correct: 2, explanation: "Із ситуації ясно, про яке світло йдеться." },
        { id: "abcd_12_nouns", level: "intermediate", q: "12. We go to the theatre about twice ______ month.", options: ["A) a", "B) the", "C) in", "D) —"], correct: 0, explanation: "A у значенні «за»: twice a month." },
        { id: "abcd_13_nouns", level: "intermediate", q: "13. ______ earth goes round ______ sun.", options: ["A) —, —", "B) The, the", "C) An, a", "D) The, —"], correct: 1, explanation: "Унікальні об'єкти вживаються з the." },
        { id: "abcd_14_nouns", level: "intermediate", q: "14. Your jacket is ______ same colour as mine.", options: ["A) a", "B) —", "C) the", "D) an"], correct: 2, explanation: "Перед same завжди вживається the." },
        { id: "abcd_15_nouns", level: "intermediate", q: "15. I watch ______ television, but I also listen to ______ radio.", options: ["A) the, the", "B) —, the", "C) the, —", "D) —, —"], correct: 1, explanation: "Watch television — без артикля, listen to the radio — з артиклем." },
        { id: "abcd_16_nouns", level: "intermediate", q: "16. Our train leaves from ______.", options: ["A) the Platform 5", "B) Platform 5", "C) a Platform 5", "D) platform the 5"], correct: 1, explanation: "Іменник + число вживається без артикля." },
        { id: "abcd_17_nouns", level: "intermediate", q: "17. What did you have for ______ breakfast this morning?", options: ["A) a", "B) the", "C) an", "D) —"], correct: 3, explanation: "Назви прийомів їжі — без артикля." },
        { id: "abcd_18_nouns", level: "advanced", q: "18. Joe was taken ______ after the accident.", options: ["A) to the hospital", "B) to hospital", "C) in hospital", "D) at hospital"], correct: 1, explanation: "Його везуть як пацієнта, тому to hospital без артикля." },
        { id: "abcd_19_nouns", level: "advanced", q: "19. Jane went ______ to visit her friend Joe.", options: ["A) to hospital", "B) in hospital", "C) to the hospital", "D) at hospital"], correct: 2, explanation: "Вона відвідувачка, а не пацієнтка, тому the hospital." },
        { id: "abcd_20_nouns", level: "intermediate", q: "20. Chris didn't go ______ yesterday because he was ill.", options: ["A) to the work", "B) to work", "C) at work", "D) in work"], correct: 1, explanation: "Work ніколи не вживається з the." },
        { id: "abcd_21_nouns", level: "intermediate", q: "21. It's late. Let's go ______.", options: ["A) to home", "B) at home", "C) home", "D) to the home"], correct: 2, explanation: "Home вживається без прийменника to й без артикля." },
        { id: "abcd_22_nouns", level: "intermediate", q: "22. I'm afraid of ______. They're everywhere in summer.", options: ["A) the spiders", "B) spiders", "C) a spiders", "D) spider"], correct: 1, explanation: "Загальне поняття у множині — без артикля." },
        { id: "abcd_23_nouns", level: "intermediate", q: "23. ______ accept credit cards nowadays.", options: ["A) The most shops", "B) Most of shops", "C) Most shops", "D) The most of shops"], correct: 2, explanation: "Most + іменник вживається без артикля." },
        { id: "abcd_24_nouns", level: "advanced", q: "24. We took ______ to the zoo last Saturday.", options: ["A) children", "B) the children", "C) a children", "D) child"], correct: 1, explanation: "Йдеться про конкретних дітей, тому the." },
        { id: "abcd_25_nouns", level: "intermediate", q: "25. Last year I visited Mexico and ______.", options: ["A) United States", "B) a United States", "C) the United States", "D) United State"], correct: 2, explanation: "Назви зі словом States вживаються з the." },
        { id: "abcd_26_nouns", level: "intermediate", q: "26. ______ is the longest river in Africa.", options: ["A) Nile", "B) A Nile", "C) The Nile", "D) The river Nile's"], correct: 2, explanation: "Назви річок — з the." },
        { id: "abcd_27_nouns", level: "intermediate", q: "27. They're going skiing in ______ next winter.", options: ["A) Alps", "B) the Alps", "C) an Alps", "D) Alp"], correct: 1, explanation: "Гірські пасма у множині — з the." },
        { id: "abcd_28_nouns", level: "advanced", q: "28. We climbed ______ when we were in Tanzania.", options: ["A) the Kilimanjaro", "B) a Kilimanjaro", "C) Kilimanjaro", "D) the Mount the Kilimanjaro"], correct: 2, explanation: "Окремі гори вживаються без артикля." },
        { id: "abcd_29_nouns", level: "advanced", q: "29. I'd love to visit ______ when I'm in China.", options: ["A) Great Wall", "B) a Great Wall", "C) the Great Wall", "D) Great Wall's"], correct: 2, explanation: "Назви з of (the Great Wall of China) та пам'ятки такого типу — з the." },
        { id: "abcd_30_nouns", level: "intermediate", q: "30. We're flying from ______ tomorrow morning.", options: ["A) the Manchester Airport", "B) Manchester Airport", "C) a Manchester Airport", "D) the airport Manchester"], correct: 1, explanation: "Назва міста + Airport — без артикля." },
        { id: "abcd_31_nouns", level: "advanced", q: "31. Andy used to work for ______, but now he works for ______.", options: ["A) the IBM, the Sony", "B) IBM, Sony", "C) an IBM, a Sony", "D) the IBM, Sony"], correct: 1, explanation: "Назви компаній вживаються без артикля." },
        { id: "abcd_32_nouns", level: "advanced", q: "32. 'Which newspaper do you want?' '______, please.'", options: ["A) Times", "B) A Times", "C) The Times", "D) Time's"], correct: 2, explanation: "Назви газет вживаються з the." },
        { id: "abcd_33_nouns", level: "advanced", q: "33. He studies at ______, and his sister studies at ______.", options: ["A) the Cambridge University, University of Cambridge", "B) Cambridge University, the University of Cambridge", "C) a Cambridge University, a University of Cambridge", "D) the Cambridge University, the University Cambridge"], correct: 1, explanation: "X University — без артикля, але University of X — з the." }
      ]
    }
  };

-- ============================================================
--  Контент теми: Іменники (Nouns)
--  Згенеровано з data/nouns.js — вручну не редагувати.
--  Повторний запуск оновлює наявні рядки, дублікатів не створює.
-- ============================================================
begin;
create unique index if not exists uq_exercises_legacy_shared
  on public.exercises (legacy_id) where student_id is null;

insert into public.topics (slug, title, description, position)
values ($g643$nouns$g643$, $g644$Іменники (Nouns)$g644$, $g645$Іменник: множина, злічувані/незлічувані, узгодження з дієсловом.$g645$, 3)
on conflict (slug) do update set title = excluded.title,
  description = excluded.description, position = excluded.position;

with t as (select id from public.topics where slug = $g646$nouns$g646$)
insert into public.theory_blocks (topic_id, block_key, title, level, content_html, position)
select t.id, v.k, v.title, v.level, v.html, v.pos from t, (values
  ($g647$th_1$g647$, $g648$Іменник: типи, рід, відмінки$g648$, $g649$elementary$g649$, $g650$
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
        $g650$, 0),
  ($g651$th_2$g651$, $g652$Множина: основні правила$g652$, $g653$elementary$g653$, $g654$
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
        $g654$, 1),
  ($g655$th_3$g655$, $g656$Неправильні форми множини$g656$, $g657$elementary$g657$, $g658$
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
        $g658$, 2),
  ($g659$th_4$g659$, $g660$Запозичені та складені іменники у множині$g660$, $g661$advanced$g661$, $g662$
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
        $g662$, 3),
  ($g663$th_5$g663$, $g664$Злічувані та незлічувані іменники$g664$, $g665$elementary$g665$, $g666$
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
        $g666$, 4),
  ($g667$th_6$g667$, $g668$Іменники ТІЛЬКИ в однині$g668$, $g669$intermediate$g669$, $g670$
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
        $g670$, 5),
  ($g671$th_7$g671$, $g672$Іменники ТІЛЬКИ у множині$g672$, $g673$intermediate$g673$, $g674$
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
        $g674$, 6)
) as v(k, title, level, html, pos)
on conflict (topic_id, block_key) do update set title = excluded.title,
  level = excluded.level, content_html = excluded.content_html, position = excluded.position;

with t as (select id from public.topics where slug = $g1231$nouns$g1231$)
insert into public.exercises (topic_id, legacy_id, type, level, payload, position, source)
select t.id, v.lid, v.type, v.level, v.payload::jsonb, v.pos, 'book' from t, (values
  ($g675$ord_12_nouns$g675$, $g676$order$g676$, $g677$advanced$g677$, $g678${"id":"ord_12_nouns","level":"advanced","prefix":"My two","scrambled":["coming","are","sisters-in-law","tomorrow."],"answer":"sisters-in-law are coming tomorrow.","hint":"У складених іменниках -s бере головне слово"}$g678$, 0),
  ($g679$ord_13_nouns$g679$, $g680$order$g680$, $g681$advanced$g681$, $g682${"id":"ord_13_nouns","level":"advanced","prefix":"Both","scrambled":["meeting.","at","editors-in-chief","the","were"],"answer":"editors-in-chief were at the meeting.","hint":"editor — головне слово, тому editors-in-chief"}$g682$, 1),
  ($g683$ord_14_nouns$g683$, $g684$order$g684$, $g685$advanced$g685$, $g686${"id":"ord_14_nouns","level":"advanced","prefix":"Several","scrambled":["stopped","passers-by","helped.","and"],"answer":"passers-by stopped and helped.","hint":"passer — головне слово"}$g686$, 2),
  ($g687$ch_1_nouns$g687$, $g688$choice$g688$, $g689$intermediate$g689$, $g690${"id":"ch_1_nouns","level":"intermediate","before":"Chemistry","options":["are","is"],"after":"my least favourite subject.","correct":"is","explanation":"Назви шкільних предметів на -s (chemistry, physics, maths) вживаються з дієсловом в однині."}$g690$, 0),
  ($g691$ch_2_nouns$g691$, $g692$choice$g692$, $g693$intermediate$g693$, $g694${"id":"ch_2_nouns","level":"intermediate","before":"Your bathroom scales","options":["is","are"],"after":"not very accurate.","correct":"are","explanation":"Scales — предмет із двох частин, тому тільки множина."}$g694$, 1),
  ($g695$ch_3_nouns$g695$, $g696$choice$g696$, $g697$advanced$g697$, $g698${"id":"ch_3_nouns","level":"advanced","before":"£2000","options":["is","are"],"after":"far too expensive for that stereo.","correct":"is","explanation":"Сума грошей сприймається як одне ціле — дієслово в однині."}$g698$, 2),
  ($g699$ch_4_nouns$g699$, $g700$choice$g700$, $g701$elementary$g701$, $g702${"id":"ch_4_nouns","level":"elementary","before":"Table tennis","options":["is","are"],"after":"sometimes referred to as ping-pong.","correct":"is","explanation":"Назви видів спорту — однина."}$g702$, 3),
  ($g703$ch_5_nouns$g703$, $g704$choice$g704$, $g705$intermediate$g705$, $g706${"id":"ch_5_nouns","level":"intermediate","before":"The police","options":["is","are"],"after":"coming to the rescue.","correct":"are","explanation":"Police вживається тільки у множині."}$g706$, 4),
  ($g707$ch_6_nouns$g707$, $g708$choice$g708$, $g709$elementary$g709$, $g710${"id":"ch_6_nouns","level":"elementary","before":"Paper","options":["is","are"],"after":"made from wood.","correct":"is","explanation":"Матеріали — незлічувані іменники, дієслово в однині."}$g710$, 5),
  ($g711$ch_7_nouns$g711$, $g712$choice$g712$, $g713$elementary$g713$, $g714${"id":"ch_7_nouns","level":"elementary","before":"Children","options":["likes","like"],"after":"playing games.","correct":"like","explanation":"Children — неправильна форма множини від child."}$g714$, 6),
  ($g715$ch_8_nouns$g715$, $g716$choice$g716$, $g717$intermediate$g717$, $g718${"id":"ch_8_nouns","level":"intermediate","before":"The scissors","options":["don't","doesn't"],"after":"work very well.","correct":"don't","explanation":"Scissors складаються з двох частин — тільки множина."}$g718$, 7),
  ($g719$ch_9_nouns$g719$, $g720$choice$g720$, $g721$elementary$g721$, $g722${"id":"ch_9_nouns","level":"elementary","before":"These trousers","options":["is","are"],"after":"terribly unflattering.","correct":"are","explanation":"Trousers — завжди множина (these trousers)."}$g722$, 8),
  ($g723$ch_10_nouns$g723$, $g724$choice$g724$, $g725$intermediate$g725$, $g726${"id":"ch_10_nouns","level":"intermediate","before":"Education","options":["are","is"],"after":"considered to be very important by almost everyone.","correct":"is","explanation":"Абстрактний незлічуваний іменник — однина."}$g726$, 9),
  ($g727$ch_11_nouns$g727$, $g728$choice$g728$, $g729$intermediate$g729$, $g730${"id":"ch_11_nouns","level":"intermediate","before":"Most people","options":["worry","worries"],"after":"about the effect of pollution on the environment.","correct":"worry","explanation":"People — множина від person, тому дієслово без -s."}$g730$, 10),
  ($g731$ch_12_nouns$g731$, $g732$choice$g732$, $g733$elementary$g733$, $g734${"id":"ch_12_nouns","level":"elementary","before":"Water","options":["is","are"],"after":"necessary for plants to grow.","correct":"is","explanation":"Рідини — незлічувані, дієслово в однині."}$g734$, 11),
  ($g735$ch_13_nouns$g735$, $g736$choice$g736$, $g737$intermediate$g737$, $g738${"id":"ch_13_nouns","level":"intermediate","before":"In the summer my hair","options":["becomes","become"],"after":"dry.","correct":"becomes","explanation":"Hair у значенні «волосся на голові» — незлічуваний іменник."}$g738$, 12),
  ($g739$ch_14_nouns$g739$, $g740$choice$g740$, $g741$intermediate$g741$, $g742${"id":"ch_14_nouns","level":"intermediate","before":"The rubbish","options":["has","have"],"after":"been taken away.","correct":"has","explanation":"Rubbish — незлічуваний іменник."}$g742$, 13),
  ($g743$ch_15_nouns$g743$, $g744$choice$g744$, $g745$intermediate$g745$, $g746${"id":"ch_15_nouns","level":"intermediate","before":"The information","options":["is","are"],"after":"inaccurate.","correct":"is","explanation":"Information ніколи не має множини."}$g746$, 14),
  ($g747$ch_16_nouns$g747$, $g748$choice$g748$, $g749$intermediate$g749$, $g750${"id":"ch_16_nouns","level":"intermediate","before":"Binoculars","options":["is","are"],"after":"needed to see that far.","correct":"are","explanation":"Прилад із двох частин — тільки множина."}$g750$, 15),
  ($g751$ch_17_nouns$g751$, $g752$choice$g752$, $g753$intermediate$g753$, $g754${"id":"ch_17_nouns","level":"intermediate","before":"His luggage","options":["was","were"],"after":"left on the platform.","correct":"was","explanation":"Luggage — незлічуваний (порівняй: two pieces of luggage)."}$g754$, 16),
  ($g755$ch_18_nouns$g755$, $g756$choice$g756$, $g757$intermediate$g757$, $g758${"id":"ch_18_nouns","level":"intermediate","before":"The stairs","options":["is","are"],"after":"very dangerous.","correct":"are","explanation":"Stairs вживається у множині."}$g758$, 17),
  ($g759$ch_19_nouns$g759$, $g760$choice$g760$, $g761$advanced$g761$, $g762${"id":"ch_19_nouns","level":"advanced","before":"Mumps","options":["is","are"],"after":"contagious.","correct":"is","explanation":"Назви хвороб на -s (mumps, measles) — однина."}$g762$, 18),
  ($g763$ch_20_nouns$g763$, $g764$choice$g764$, $g765$intermediate$g765$, $g766${"id":"ch_20_nouns","level":"intermediate","before":"The news","options":["was","were"],"after":"unexpected.","correct":"was","explanation":"News — незлічуваний іменник в однині, попри -s."}$g766$, 19),
  ($g767$ch_21_nouns$g767$, $g768$choice$g768$, $g769$advanced$g769$, $g770${"id":"ch_21_nouns","level":"advanced","before":"His experience of travel","options":["is","are"],"after":"limited.","correct":"is","explanation":"Experience у значенні «досвід» — незлічуваний."}$g770$, 20),
  ($g771$gap_1_nouns$g771$, $g772$gap$g772$, $g773$elementary$g773$, $g774${"id":"gap_1_nouns","level":"elementary","prompt":"toe – ______","answers":["toes"],"explanation":"Звичайне правило: іменник + -s."}$g774$, 0),
  ($g775$gap_2_nouns$g775$, $g776$gap$g776$, $g777$elementary$g777$, $g778${"id":"gap_2_nouns","level":"elementary","prompt":"city – ______","answers":["cities"],"explanation":"Приголосний + -y → -ies."}$g778$, 1),
  ($g779$gap_3_nouns$g779$, $g780$gap$g780$, $g781$elementary$g781$, $g782${"id":"gap_3_nouns","level":"elementary","prompt":"hero – ______","answers":["heroes"],"explanation":"Після -o додаємо -es."}$g782$, 2),
  ($g783$gap_4_nouns$g783$, $g784$gap$g784$, $g785$intermediate$g785$, $g786${"id":"gap_4_nouns","level":"intermediate","prompt":"piano – ______","answers":["pianos"],"explanation":"Виняток: музичні терміни на -o беруть лише -s."}$g786$, 3),
  ($g787$gap_5_nouns$g787$, $g788$gap$g788$, $g789$intermediate$g789$, $g790${"id":"gap_5_nouns","level":"intermediate","prompt":"calf – ______","answers":["calves"],"explanation":"-f → -ves."}$g790$, 4),
  ($g791$gap_6_nouns$g791$, $g792$gap$g792$, $g793$intermediate$g793$, $g794${"id":"gap_6_nouns","level":"intermediate","prompt":"cliff – ______","answers":["cliffs"],"explanation":"Виняток: cliff зберігає -f і бере просто -s."}$g794$, 5),
  ($g795$gap_7_nouns$g795$, $g796$gap$g796$, $g797$intermediate$g797$, $g798${"id":"gap_7_nouns","level":"intermediate","prompt":"chief – ______","answers":["chiefs"],"explanation":"Виняток із правила -f → -ves."}$g798$, 6),
  ($g799$gap_8_nouns$g799$, $g800$gap$g800$, $g801$elementary$g801$, $g802${"id":"gap_8_nouns","level":"elementary","prompt":"stitch – ______","answers":["stitches"],"explanation":"Після -ch додаємо -es."}$g802$, 7),
  ($g803$gap_9_nouns$g803$, $g804$gap$g804$, $g805$intermediate$g805$, $g806${"id":"gap_9_nouns","level":"intermediate","prompt":"bath – ______","answers":["baths"],"explanation":"Після -th додаємо просто -s."}$g806$, 8),
  ($g807$gap_10_nouns$g807$, $g808$gap$g808$, $g809$intermediate$g809$, $g810${"id":"gap_10_nouns","level":"intermediate","prompt":"life – ______","answers":["lives"],"explanation":"-fe → -ves."}$g810$, 9),
  ($g811$gap_11_nouns$g811$, $g812$gap$g812$, $g813$intermediate$g813$, $g814${"id":"gap_11_nouns","level":"intermediate","prompt":"shelf – ______","answers":["shelves"],"explanation":"-f → -ves."}$g814$, 10),
  ($g815$gap_12_nouns$g815$, $g816$gap$g816$, $g817$elementary$g817$, $g818${"id":"gap_12_nouns","level":"elementary","prompt":"berry – ______","answers":["berries"],"explanation":"Приголосний + -y → -ies."}$g818$, 11),
  ($g819$gap_13_nouns$g819$, $g820$gap$g820$, $g821$elementary$g821$, $g822${"id":"gap_13_nouns","level":"elementary","prompt":"valley – ______","answers":["valleys"],"explanation":"Голосний + -y → просто -s."}$g822$, 12),
  ($g823$gap_14_nouns$g823$, $g824$gap$g824$, $g825$intermediate$g825$, $g826${"id":"gap_14_nouns","level":"intermediate","prompt":"roof – ______","answers":["roofs"],"explanation":"Виняток: roof бере -s, а не -ves."}$g826$, 13),
  ($g827$gap_15_nouns$g827$, $g828$gap$g828$, $g829$elementary$g829$, $g830${"id":"gap_15_nouns","level":"elementary","prompt":"pen – ______","answers":["pens"],"explanation":"Звичайне правило: + -s."}$g830$, 14),
  ($g831$gap_16_nouns$g831$, $g832$gap$g832$, $g833$elementary$g833$, $g834${"id":"gap_16_nouns","level":"elementary","prompt":"window – ______","answers":["windows"],"explanation":"Після голосного + -o додаємо -s."}$g834$, 15),
  ($g835$gap_17_nouns$g835$, $g836$gap$g836$, $g837$elementary$g837$, $g838${"id":"gap_17_nouns","level":"elementary","prompt":"library – ______","answers":["libraries"],"explanation":"Приголосний + -y → -ies."}$g838$, 16),
  ($g839$gap_18_nouns$g839$, $g840$gap$g840$, $g841$elementary$g841$, $g842${"id":"gap_18_nouns","level":"elementary","prompt":"watch – ______","answers":["watches"],"explanation":"Після -ch додаємо -es."}$g842$, 17),
  ($g843$gap_19_nouns$g843$, $g844$gap$g844$, $g845$elementary$g845$, $g846${"id":"gap_19_nouns","level":"elementary","prompt":"dress – ______","answers":["dresses"],"explanation":"Після -ss додаємо -es."}$g846$, 18),
  ($g847$gap_20_nouns$g847$, $g848$gap$g848$, $g849$elementary$g849$, $g850${"id":"gap_20_nouns","level":"elementary","prompt":"country – ______","answers":["countries"],"explanation":"Приголосний + -y → -ies."}$g850$, 19),
  ($g851$gap_21_nouns$g851$, $g852$gap$g852$, $g853$elementary$g853$, $g854${"id":"gap_21_nouns","level":"elementary","prompt":"glass – ______","answers":["glasses"],"explanation":"Після -ss додаємо -es."}$g854$, 20),
  ($g855$gap_22_nouns$g855$, $g856$gap$g856$, $g857$elementary$g857$, $g858${"id":"gap_22_nouns","level":"elementary","prompt":"day – ______","answers":["days"],"explanation":"Голосний + -y → просто -s."}$g858$, 21),
  ($g859$gap_23_nouns$g859$, $g860$gap$g860$, $g861$elementary$g861$, $g862${"id":"gap_23_nouns","level":"elementary","prompt":"party – ______","answers":["parties"],"explanation":"Приголосний + -y → -ies."}$g862$, 22),
  ($g863$gap_24_nouns$g863$, $g864$gap$g864$, $g865$intermediate$g865$, $g866${"id":"gap_24_nouns","level":"intermediate","prompt":"leaf – ______","answers":["leaves"],"explanation":"-f → -ves."}$g866$, 23),
  ($g867$gap_25_nouns$g867$, $g868$gap$g868$, $g869$elementary$g869$, $g870${"id":"gap_25_nouns","level":"elementary","prompt":"fox – ______","answers":["foxes"],"explanation":"Після -x додаємо -es."}$g870$, 24),
  ($g871$gap_26_nouns$g871$, $g872$gap$g872$, $g873$intermediate$g873$, $g874${"id":"gap_26_nouns","level":"intermediate","prompt":"half – ______","answers":["halves"],"explanation":"-f → -ves."}$g874$, 25),
  ($g875$gap_27_nouns$g875$, $g876$gap$g876$, $g877$elementary$g877$, $g878${"id":"gap_27_nouns","level":"elementary","prompt":"eye – ______","answers":["eyes"],"explanation":"Звичайне правило: + -s."}$g878$, 26),
  ($g879$gap_28_nouns$g879$, $g880$gap$g880$, $g881$elementary$g881$, $g882${"id":"gap_28_nouns","level":"elementary","prompt":"language – ______","answers":["languages"],"explanation":"Звичайне правило: + -s."}$g882$, 27),
  ($g883$gap_29_nouns$g883$, $g884$gap$g884$, $g885$elementary$g885$, $g886${"id":"gap_29_nouns","level":"elementary","prompt":"place – ______","answers":["places"],"explanation":"Звичайне правило: + -s."}$g886$, 28),
  ($g887$gap_30_nouns$g887$, $g888$gap$g888$, $g889$elementary$g889$, $g890${"id":"gap_30_nouns","level":"elementary","prompt":"ray – ______","answers":["rays"],"explanation":"Голосний + -y → просто -s."}$g890$, 29),
  ($g891$gap_31_nouns$g891$, $g892$gap$g892$, $g893$elementary$g893$, $g894${"id":"gap_31_nouns","level":"elementary","prompt":"bush – ______","answers":["bushes"],"explanation":"Після -sh додаємо -es."}$g894$, 30),
  ($g895$gap_32_nouns$g895$, $g896$gap$g896$, $g897$intermediate$g897$, $g898${"id":"gap_32_nouns","level":"intermediate","prompt":"mouth – ______","answers":["mouths"],"explanation":"Після -th додаємо просто -s."}$g898$, 31),
  ($g899$gap_33_nouns$g899$, $g900$gap$g900$, $g901$elementary$g901$, $g902${"id":"gap_33_nouns","level":"elementary","prompt":"journey – ______","answers":["journeys"],"explanation":"Голосний + -y → просто -s."}$g902$, 32),
  ($g903$gap_34_nouns$g903$, $g904$gap$g904$, $g905$intermediate$g905$, $g906${"id":"gap_34_nouns","level":"intermediate","prompt":"photo – ______","answers":["photos"],"explanation":"Виняток: photo бере лише -s."}$g906$, 33),
  ($g907$gap_35_nouns$g907$, $g908$gap$g908$, $g909$elementary$g909$, $g910${"id":"gap_35_nouns","level":"elementary","prompt":"foot – ______","answers":["feet"],"explanation":"Неправильна форма множини."}$g910$, 34),
  ($g911$gap_36_nouns$g911$, $g912$gap$g912$, $g913$elementary$g913$, $g914${"id":"gap_36_nouns","level":"elementary","prompt":"boot – ______","answers":["boots"],"explanation":"Правильна форма: boot + -s (не плутати з foot)."}$g914$, 35)
) as v(lid, type, level, payload, pos)
on conflict (legacy_id) where student_id is null do update set
  type = excluded.type, level = excluded.level,
  payload = excluded.payload, position = excluded.position;

with t as (select id from public.topics where slug = $g1232$nouns$g1232$)
insert into public.exercises (topic_id, legacy_id, type, level, payload, position, source)
select t.id, v.lid, v.type, v.level, v.payload::jsonb, v.pos, 'book' from t, (values
  ($g915$gap_37_nouns$g915$, $g916$gap$g916$, $g917$intermediate$g917$, $g918${"id":"gap_37_nouns","level":"intermediate","prompt":"ox – ______","answers":["oxen"],"explanation":"Архаїчне закінчення -en."}$g918$, 36),
  ($g919$gap_38_nouns$g919$, $g920$gap$g920$, $g921$elementary$g921$, $g922${"id":"gap_38_nouns","level":"elementary","prompt":"man – ______","answers":["men"],"explanation":"Неправильна форма: зміна голосного."}$g922$, 37),
  ($g923$gap_39_nouns$g923$, $g924$gap$g924$, $g925$elementary$g925$, $g926${"id":"gap_39_nouns","level":"elementary","prompt":"woman – ______","answers":["women"],"explanation":"Пишеться women, а читається [ˈwɪmɪn]."}$g926$, 38),
  ($g927$gap_40_nouns$g927$, $g928$gap$g928$, $g929$elementary$g929$, $g930${"id":"gap_40_nouns","level":"elementary","prompt":"month – ______","answers":["months"],"explanation":"Правильна форма: + -s."}$g930$, 39),
  ($g931$gap_41_nouns$g931$, $g932$gap$g932$, $g933$elementary$g933$, $g934${"id":"gap_41_nouns","level":"elementary","prompt":"mouse – ______","answers":["mice"],"explanation":"Неправильна форма (mouses — лише про комп'ютерні миші)."}$g934$, 40),
  ($g935$gap_42_nouns$g935$, $g936$gap$g936$, $g937$elementary$g937$, $g938${"id":"gap_42_nouns","level":"elementary","prompt":"child – ______","answers":["children"],"explanation":"Неправильна форма із закінченням -ren."}$g938$, 41),
  ($g939$gap_43_nouns$g939$, $g940$gap$g940$, $g941$elementary$g941$, $g942${"id":"gap_43_nouns","level":"elementary","prompt":"ship – ______","answers":["ships"],"explanation":"Правильна форма: + -s."}$g942$, 42),
  ($g943$gap_44_nouns$g943$, $g944$gap$g944$, $g945$intermediate$g945$, $g946${"id":"gap_44_nouns","level":"intermediate","prompt":"goose – ______","answers":["geese"],"explanation":"Неправильна форма: зміна голосного."}$g946$, 43),
  ($g947$gap_45_nouns$g947$, $g948$gap$g948$, $g949$intermediate$g949$, $g950${"id":"gap_45_nouns","level":"intermediate","prompt":"deer – ______","answers":["deer"],"explanation":"Форма множини збігається з одниною."}$g950$, 44),
  ($g951$gap_46_nouns$g951$, $g952$gap$g952$, $g953$intermediate$g953$, $g954${"id":"gap_46_nouns","level":"intermediate","prompt":"sheep – ______","answers":["sheep"],"explanation":"Форма множини збігається з одниною."}$g954$, 45),
  ($g955$gap_47_nouns$g955$, $g956$gap$g956$, $g957$advanced$g957$, $g958${"id":"gap_47_nouns","level":"advanced","prompt":"crisis – ______","answers":["crises"],"explanation":"Грецьке закінчення -is → -es."}$g958$, 46),
  ($g959$gap_48_nouns$g959$, $g960$gap$g960$, $g961$advanced$g961$, $g962${"id":"gap_48_nouns","level":"advanced","prompt":"phenomenon – ______","answers":["phenomena"],"explanation":"Грецьке -on → -a."}$g962$, 47),
  ($g963$gap_49_nouns$g963$, $g964$gap$g964$, $g965$advanced$g965$, $g966${"id":"gap_49_nouns","level":"advanced","prompt":"datum – ______","answers":["data"],"explanation":"Латинське -um → -a."}$g966$, 48),
  ($g967$gap_50_nouns$g967$, $g968$gap$g968$, $g969$advanced$g969$, $g970${"id":"gap_50_nouns","level":"advanced","prompt":"nucleus – ______","answers":["nuclei"],"explanation":"Латинське -us → -i."}$g970$, 49),
  ($g971$gap_51_nouns$g971$, $g972$gap$g972$, $g973$advanced$g973$, $g974${"id":"gap_51_nouns","level":"advanced","prompt":"basis – ______","answers":["bases"],"explanation":"Закінчення -is → -es."}$g974$, 50),
  ($g975$gap_52_nouns$g975$, $g976$gap$g976$, $g977$advanced$g977$, $g978${"id":"gap_52_nouns","level":"advanced","prompt":"criterion – ______","answers":["criteria"],"explanation":"Грецьке -on → -a."}$g978$, 51),
  ($g979$gap_53_nouns$g979$, $g980$gap$g980$, $g981$advanced$g981$, $g982${"id":"gap_53_nouns","level":"advanced","prompt":"series – ______","answers":["series"],"explanation":"Форма не змінюється."}$g982$, 52),
  ($g983$gap_54_nouns$g983$, $g984$gap$g984$, $g985$advanced$g985$, $g986${"id":"gap_54_nouns","level":"advanced","prompt":"analysis – ______","answers":["analyses"],"explanation":"Закінчення -is → -es."}$g986$, 53),
  ($g987$gap_55_nouns$g987$, $g988$gap$g988$, $g989$advanced$g989$, $g990${"id":"gap_55_nouns","level":"advanced","prompt":"formula – ______","answers":["formulae","formulas"],"explanation":"У науці — formulae, у розмовній мові — formulas."}$g990$, 54),
  ($g991$gap_56_nouns$g991$, $g992$gap$g992$, $g993$intermediate$g993$, $g994${"id":"gap_56_nouns","level":"intermediate","prompt":"room-mate – ______","answers":["room-mates","room mates"],"explanation":"-s додається до останнього елемента."}$g994$, 55),
  ($g995$gap_57_nouns$g995$, $g996$gap$g996$, $g997$intermediate$g997$, $g998${"id":"gap_57_nouns","level":"intermediate","prompt":"fellow-worker – ______","answers":["fellow-workers","fellow workers"],"explanation":"-s до останнього елемента."}$g998$, 56),
  ($g999$gap_58_nouns$g999$, $g1000$gap$g1000$, $g1001$advanced$g1001$, $g1002${"id":"gap_58_nouns","level":"advanced","prompt":"court-martial – ______","answers":["courts-martial"],"explanation":"Головне слово court, тому courts-martial."}$g1002$, 57),
  ($g1003$gap_59_nouns$g1003$, $g1004$gap$g1004$, $g1005$advanced$g1005$, $g1006${"id":"gap_59_nouns","level":"advanced","prompt":"man-of-war – ______","answers":["men-of-war"],"explanation":"Головне слово man → men-of-war."}$g1006$, 58),
  ($g1007$gap_60_nouns$g1007$, $g1008$gap$g1008$, $g1009$intermediate$g1009$, $g1010${"id":"gap_60_nouns","level":"intermediate","prompt":"boy-messenger – ______","answers":["boy-messengers","boy messengers"],"explanation":"-s до останнього елемента."}$g1010$, 59),
  ($g1011$gap_61_nouns$g1011$, $g1012$gap$g1012$, $g1013$intermediate$g1013$, $g1014${"id":"gap_61_nouns","level":"intermediate","prompt":"onlooker – ______","answers":["onlookers"],"explanation":"Це одне слово, тому просто + -s."}$g1014$, 60),
  ($g1015$gap_62_nouns$g1015$, $g1016$gap$g1016$, $g1017$advanced$g1017$, $g1018${"id":"gap_62_nouns","level":"advanced","prompt":"passer-by – ______","answers":["passers-by"],"explanation":"Головне слово passer → passers-by."}$g1018$, 61),
  ($g1019$gap_63_nouns$g1019$, $g1020$gap$g1020$, $g1021$advanced$g1021$, $g1022${"id":"gap_63_nouns","level":"advanced","prompt":"sister-in-law – ______","answers":["sisters-in-law"],"explanation":"Головне слово sister → sisters-in-law."}$g1022$, 62),
  ($g1023$gap_64_nouns$g1023$, $g1024$gap$g1024$, $g1025$intermediate$g1025$, $g1026${"id":"gap_64_nouns","level":"intermediate","prompt":"postman – ______","answers":["postmen"],"explanation":"Елемент man у кінці → men."}$g1026$, 63),
  ($g1027$gap_65_nouns$g1027$, $g1028$gap$g1028$, $g1029$advanced$g1029$, $g1030${"id":"gap_65_nouns","level":"advanced","prompt":"son-in-law – ______","answers":["sons-in-law"],"explanation":"Головне слово son → sons-in-law."}$g1030$, 64),
  ($g1031$gap_66_nouns$g1031$, $g1032$gap$g1032$, $g1033$intermediate$g1033$, $g1034${"id":"gap_66_nouns","level":"intermediate","prompt":"fisherman – ______","answers":["fishermen"],"explanation":"Елемент man у кінці → men."}$g1034$, 65),
  ($g1035$gap_67_nouns$g1035$, $g1036$gap$g1036$, $g1037$elementary$g1037$, $g1038${"id":"gap_67_nouns","level":"elementary","prompt":"schoolgirl – ______","answers":["schoolgirls"],"explanation":"Одне слово, тому + -s."}$g1038$, 66),
  ($g1039$gap_68_nouns$g1039$, $g1040$gap$g1040$, $g1041$intermediate$g1041$, $g1042${"id":"gap_68_nouns","level":"intermediate","prompt":"text-book – ______","answers":["text-books","text books"],"explanation":"-s до останнього елемента."}$g1042$, 67),
  ($g1043$gap_69_nouns$g1043$, $g1044$gap$g1044$, $g1045$intermediate$g1045$, $g1046${"id":"gap_69_nouns","level":"intermediate","prompt":"statesman – ______","answers":["statesmen"],"explanation":"Елемент man у кінці → men."}$g1046$, 68),
  ($g1047$gap_70_nouns$g1047$, $g1048$gap$g1048$, $g1049$advanced$g1049$, $g1050${"id":"gap_70_nouns","level":"advanced","prompt":"editor-in-chief – ______","answers":["editors-in-chief"],"explanation":"Головне слово editor → editors-in-chief."}$g1050$, 69),
  ($g1051$gap_71_nouns$g1051$, $g1052$gap$g1052$, $g1053$intermediate$g1053$, $g1054${"id":"gap_71_nouns","level":"intermediate","prompt":"Making mistakes ______ (be) only natural.","answers":["is"],"explanation":"Герундій як підмет вимагає дієслова в однині."}$g1054$, 70),
  ($g1055$gap_72_nouns$g1055$, $g1056$gap$g1056$, $g1057$intermediate$g1057$, $g1058${"id":"gap_72_nouns","level":"intermediate","prompt":"Maths ______ (not/interest) me very much.","answers":["doesn't interest","does not interest"],"explanation":"Назви предметів на -s — однина."}$g1058$, 71),
  ($g1059$gap_73_nouns$g1059$, $g1060$gap$g1060$, $g1061$intermediate$g1061$, $g1062${"id":"gap_73_nouns","level":"intermediate","prompt":"All of our furniture ______ (be) brand new.","answers":["is"],"explanation":"Furniture — незлічуваний іменник."}$g1062$, 72),
  ($g1063$gap_74_nouns$g1063$, $g1064$gap$g1064$, $g1065$elementary$g1065$, $g1066${"id":"gap_74_nouns","level":"elementary","prompt":"Sugar ______ (damage) your teeth.","answers":["damages"],"explanation":"Незлічуваний іменник → дієслово з -s."}$g1066$, 73),
  ($g1067$gap_75_nouns$g1067$, $g1068$gap$g1068$, $g1069$elementary$g1069$, $g1070${"id":"gap_75_nouns","level":"elementary","prompt":"Snow rarely ______ (fall) in this part of the country.","answers":["falls"],"explanation":"Snow — незлічуваний іменник в однині."}$g1070$, 74),
  ($g1071$gap_76_nouns$g1071$, $g1072$gap$g1072$, $g1073$intermediate$g1073$, $g1074${"id":"gap_76_nouns","level":"intermediate","prompt":"The applause ______ (be) very loud.","answers":["was","is"],"explanation":"Applause — незлічуваний іменник, тому однина."}$g1074$, 75),
  ($g1075$gap_77_nouns$g1075$, $g1076$gap$g1076$, $g1077$intermediate$g1077$, $g1078${"id":"gap_77_nouns","level":"intermediate","prompt":"The news they brought us ______ (be) good.","answers":["was","is"],"explanation":"News має -s, але вживається в однині."}$g1078$, 76),
  ($g1079$gap_78_nouns$g1079$, $g1080$gap$g1080$, $g1081$intermediate$g1081$, $g1082${"id":"gap_78_nouns","level":"intermediate","prompt":"Your trousers ______ (not/match) your shirt.","answers":["don't match","do not match"],"explanation":"Trousers — завжди множина."}$g1082$, 77),
  ($g1083$gap_79_nouns$g1083$, $g1084$gap$g1084$, $g1085$advanced$g1085$, $g1086${"id":"gap_79_nouns","level":"advanced","prompt":"The team ______ (discuss) strategy before every game.","answers":["discusses","discuss"],"explanation":"Збірний іменник: в однині — як ціле, у множині — як окремі люди (британський варіант)."}$g1086$, 78),
  ($g1087$gap_80_nouns$g1087$, $g1088$gap$g1088$, $g1089$advanced$g1089$, $g1090${"id":"gap_80_nouns","level":"advanced","prompt":"Chickenpox ______ (give) you an itchy rash.","answers":["gives"],"explanation":"Назви хвороб на -s — однина."}$g1090$, 79),
  ($g1091$gap_81_nouns$g1091$, $g1092$gap$g1092$, $g1093$intermediate$g1093$, $g1094${"id":"gap_81_nouns","level":"intermediate","prompt":"Billiards ______ (be) his favourite game.","answers":["is"],"explanation":"Назви ігор на -s — однина."}$g1094$, 80),
  ($g1095$gap_82_nouns$g1095$, $g1096$gap$g1096$, $g1097$intermediate$g1097$, $g1098${"id":"gap_82_nouns","level":"intermediate","prompt":"The accommodation here ______ (seem) very expensive.","answers":["seems"],"explanation":"Accommodation — незлічуваний іменник."}$g1098$, 81),
  ($g1099$gap_83_nouns$g1099$, $g1100$gap$g1100$, $g1101$intermediate$g1101$, $g1102${"id":"gap_83_nouns","level":"intermediate","prompt":"The pliers ______ (be) in the tool box.","answers":["are"],"explanation":"Інструмент із двох частин — тільки множина."}$g1102$, 82),
  ($g1103$gap_84_nouns$g1103$, $g1104$gap$g1104$, $g1105$intermediate$g1105$, $g1106${"id":"gap_84_nouns","level":"intermediate","prompt":"Knowledge of other languages ______ (help) people in business.","answers":["helps"],"explanation":"Підмет — knowledge (незлічуваний), а не languages."}$g1106$, 83),
  ($g1107$gap_85_nouns$g1107$, $g1108$gap$g1108$, $g1109$advanced$g1109$, $g1110${"id":"gap_85_nouns","level":"advanced","prompt":"Ten minutes ______ (be) too little time to finish this report.","answers":["is"],"explanation":"Відрізок часу сприймається як одне ціле — однина."}$g1110$, 84),
  ($g1111$gap_86_nouns$g1111$, $g1112$gap$g1112$, $g1113$intermediate$g1113$, $g1114${"id":"gap_86_nouns","level":"intermediate","prompt":"Every time I travel, some of my luggage ______ (get) damaged.","answers":["gets"],"explanation":"Luggage — незлічуваний іменник."}$g1114$, 85),
  ($g1115$gap_87_nouns$g1115$, $g1116$gap$g1116$, $g1117$intermediate$g1117$, $g1118${"id":"gap_87_nouns","level":"intermediate","prompt":"Welsh ______ (be) difficult to learn.","answers":["is"],"explanation":"Назви мов — однина."}$g1118$, 86),
  ($g1119$gap_88_nouns$g1119$, $g1120$gap$g1120$, $g1121$advanced$g1121$, $g1122${"id":"gap_88_nouns","level":"advanced","prompt":"The staff ______ (be) happy with the pay rise.","answers":["are","is"],"explanation":"Staff — збірний іменник; у британському варіанті частіше are."}$g1122$, 87),
  ($g1123$gap_89_nouns$g1123$, $g1124$gap$g1124$, $g1125$intermediate$g1125$, $g1126${"id":"gap_89_nouns","level":"intermediate","prompt":"Sophisticated machinery ______ (cost) a lot of money.","answers":["costs"],"explanation":"Machinery — незлічуваний іменник."}$g1126$, 88),
  ($g1127$gap_90_nouns$g1127$, $g1128$gap$g1128$, $g1129$advanced$g1129$, $g1130${"id":"gap_90_nouns","level":"advanced","prompt":"They are teaching Physics in room 2A. → Physics ______ (teach) in room 2A.","answers":["is being taught"],"explanation":"Physics — однина, тому is being taught."}$g1130$, 89),
  ($g1131$gap_91_nouns$g1131$, $g1132$gap$g1132$, $g1133$advanced$g1133$, $g1134${"id":"gap_91_nouns","level":"advanced","prompt":"Craftsmen have used the best wood. → The best wood ______ (use) by craftsmen.","answers":["has been used"],"explanation":"Wood — незлічуваний, тому has been used."}$g1134$, 90),
  ($g1135$gap_92_nouns$g1135$, $g1136$gap$g1136$, $g1137$intermediate$g1137$, $g1138${"id":"gap_92_nouns","level":"intermediate","prompt":"You need to have experience. → Experience ______ (need) if you wish to apply.","answers":["is needed"],"explanation":"Experience — незлічуваний іменник, дієслово в однині."}$g1138$, 91),
  ($g1139$gap_93_nouns$g1139$, $g1140$gap$g1140$, $g1141$intermediate$g1141$, $g1142${"id":"gap_93_nouns","level":"intermediate","prompt":"Rangers protect the woods. → The woods ______ (protect) by rangers.","answers":["are protected"],"explanation":"Woods — множина, тому are protected."}$g1142$, 92),
  ($g1143$gap_94_nouns$g1143$, $g1144$gap$g1144$, $g1145$intermediate$g1145$, $g1146${"id":"gap_94_nouns","level":"intermediate","prompt":"He tore his trousers in the fight. → His trousers ______ (tear) in the fight.","answers":["were torn"],"explanation":"Trousers — множина, тому were torn."}$g1146$, 93),
  ($g1147$gap_95_nouns$g1147$, $g1148$gap$g1148$, $g1149$intermediate$g1149$, $g1150${"id":"gap_95_nouns","level":"intermediate","prompt":"We give exam advice at the end of the course. → Exam advice ______ (give) at the end of the course.","answers":["is given"],"explanation":"Advice — незлічуваний іменник в однині."}$g1150$, 94),
  ($g1151$gap_96_nouns$g1151$, $g1152$gap$g1152$, $g1153$intermediate$g1153$, $g1154${"id":"gap_96_nouns","level":"intermediate","prompt":"He classified the information as 'Top Secret'. → The information ______ (classify) as 'Top Secret'.","answers":["was classified"],"explanation":"Information — однина."}$g1154$, 95)
) as v(lid, type, level, payload, pos)
on conflict (legacy_id) where student_id is null do update set
  type = excluded.type, level = excluded.level,
  payload = excluded.payload, position = excluded.position;

with t as (select id from public.topics where slug = $g1233$nouns$g1233$)
insert into public.exercises (topic_id, legacy_id, type, level, payload, position, source)
select t.id, v.lid, v.type, v.level, v.payload::jsonb, v.pos, 'book' from t, (values
  ($g1155$gap_97_nouns$g1155$, $g1156$gap$g1156$, $g1157$intermediate$g1157$, $g1158${"id":"gap_97_nouns","level":"intermediate","prompt":"A security guard protects our property. → Our property ______ (protect) by a security guard.","answers":["is protected"],"explanation":"Property — незлічуваний іменник."}$g1158$, 96),
  ($g1159$gap_98_nouns$g1159$, $g1160$gap$g1160$, $g1161$advanced$g1161$, $g1162${"id":"gap_98_nouns","level":"advanced","prompt":"That shop is selling wedding dresses at half price. → Wedding dresses ______ (sell) at half price.","answers":["are being sold"],"explanation":"Dresses — множина, тому are being sold."}$g1162$, 97),
  ($g1163$gap_99_nouns$g1163$, $g1164$gap$g1164$, $g1165$intermediate$g1165$, $g1166${"id":"gap_99_nouns","level":"intermediate","prompt":"We need new members for our tennis club. → Our tennis club ______ (need) new members.","answers":["needs"],"explanation":"Club — однина, тому дієслово з -s."}$g1166$, 98),
  ($g1167$gap_100_nouns$g1167$, $g1168$gap$g1168$, $g1169$advanced$g1169$, $g1170${"id":"gap_100_nouns","level":"advanced","prompt":"You can always find cheap silver jewellery in Portugal. → Cheap silver jewellery ______ (can/find) in Portugal.","answers":["can be found"],"explanation":"Jewellery — незлічуваний іменник у пасиві."}$g1170$, 99),
  ($g1171$gap_101_nouns$g1171$, $g1172$gap$g1172$, $g1173$intermediate$g1173$, $g1174${"id":"gap_101_nouns","level":"intermediate","prompt":"One doesn't need money to be happy. → Money ______ (not/need) to be happy.","answers":["isn't needed","is not needed"],"explanation":"Money — незлічуваний іменник в однині."}$g1174$, 100),
  ($g1175$cr_22_nouns$g1175$, $g1176$cross$g1176$, $g1177$advanced$g1177$, $g1178${"id":"cr_22_nouns","level":"advanced","words":["He","gave","me","a","useful","advice."],"extraIndex":3,"explanation":"Advice — незлічуваний іменник, тому артикль a/an неможливий: He gave me useful advice (або a useful piece of advice)."}$g1178$, 0),
  ($g1179$cr_23_nouns$g1179$, $g1180$cross$g1180$, $g1181$intermediate$g1181$, $g1182${"id":"cr_23_nouns","level":"intermediate","words":["The","police","is","investigating","the","crime."],"extraIndex":2,"explanation":"Police вживається у множині: the police are."}$g1182$, 1),
  ($g1183$cr_24_nouns$g1183$, $g1184$cross$g1184$, $g1185$advanced$g1185$, $g1186${"id":"cr_24_nouns","level":"advanced","words":["She","bought","two","new","furnitures","yesterday."],"extraIndex":4,"explanation":"Furniture не має множини; правильно — two pieces of furniture."}$g1186$, 2),
  ($g1187$abcd_1_nouns$g1187$, $g1188$abcd$g1188$, $g1189$elementary$g1189$, $g1190${"id":"abcd_1_nouns","level":"elementary","q":"1. I need ______ to finish this report.","options":["A) an information","B) informations","C) some information","D) a few information"],"correct":2,"explanation":"Information — незлічуваний іменник: без a/an і без -s, але можливе some."}$g1190$, 0),
  ($g1191$abcd_2_nouns$g1191$, $g1192$abcd$g1192$, $g1193$elementary$g1193$, $g1194${"id":"abcd_2_nouns","level":"elementary","q":"2. The plural of 'knife' is ______.","options":["A) knifes","B) knives","C) knifies","D) knive"],"correct":1,"explanation":"Іменники на -fe утворюють множину через -ves."}$g1194$, 1),
  ($g1195$abcd_3_nouns$g1195$, $g1196$abcd$g1196$, $g1197$elementary$g1197$, $g1198${"id":"abcd_3_nouns","level":"elementary","q":"3. There ______ six children in the garden.","options":["A) is","B) are","C) was","D) has"],"correct":1,"explanation":"Children — множина, тому are."}$g1198$, 2),
  ($g1199$abcd_4_nouns$g1199$, $g1200$abcd$g1200$, $g1201$intermediate$g1201$, $g1202${"id":"abcd_4_nouns","level":"intermediate","q":"4. The news ______ very disappointing.","options":["A) were","B) are","C) was","D) have been"],"correct":2,"explanation":"News — незлічуваний іменник в однині, попри закінчення -s."}$g1202$, 3),
  ($g1203$abcd_5_nouns$g1203$, $g1204$abcd$g1204$, $g1205$intermediate$g1205$, $g1206${"id":"abcd_5_nouns","level":"intermediate","q":"5. Where ______ my trousers? I can't find them.","options":["A) is","B) are","C) was","D) does"],"correct":1,"explanation":"Trousers — предмет із двох частин, тільки множина."}$g1206$, 4),
  ($g1207$abcd_6_nouns$g1207$, $g1208$abcd$g1208$, $g1209$intermediate$g1209$, $g1210${"id":"abcd_6_nouns","level":"intermediate","q":"6. Mathematics ______ my favourite subject at school.","options":["A) are","B) were","C) is","D) have been"],"correct":2,"explanation":"Назви предметів на -s вживаються з дієсловом в однині."}$g1210$, 5),
  ($g1211$abcd_7_nouns$g1211$, $g1212$abcd$g1212$, $g1213$advanced$g1213$, $g1214${"id":"abcd_7_nouns","level":"advanced","q":"7. The plural of 'passer-by' is ______.","options":["A) passer-bys","B) passers-by","C) passers-bys","D) passer-bies"],"correct":1,"explanation":"У складених іменниках -s отримує головне слово (passer)."}$g1214$, 6),
  ($g1215$abcd_8_nouns$g1215$, $g1216$abcd$g1216$, $g1217$advanced$g1217$, $g1218${"id":"abcd_8_nouns","level":"advanced","q":"8. The plural of 'phenomenon' is ______.","options":["A) phenomenons","B) phenomenas","C) phenomena","D) phenomeni"],"correct":2,"explanation":"Грецьке закінчення -on змінюється на -a."}$g1218$, 7),
  ($g1219$abcd_34_nouns$g1219$, $g1220$abcd$g1220$, $g1221$intermediate$g1221$, $g1222${"id":"abcd_34_nouns","level":"intermediate","q":"34. £5000 ______ a lot of money for a second-hand car.","options":["A) are","B) were","C) is","D) have been"],"correct":2,"explanation":"Сума грошей сприймається як одне ціле — однина."}$g1222$, 8),
  ($g1223$abcd_35_nouns$g1223$, $g1224$abcd$g1224$, $g1225$advanced$g1225$, $g1226${"id":"abcd_35_nouns","level":"advanced","q":"35. The staff ______ very helpful when we visited the office.","options":["A) was being","B) were","C) is","D) has"],"correct":1,"explanation":"Staff — збірний іменник; у британському варіанті частіше вживається у множині."}$g1226$, 9),
  ($g1227$abcd_36_nouns$g1227$, $g1228$abcd$g1228$, $g1229$advanced$g1229$, $g1230${"id":"abcd_36_nouns","level":"advanced","q":"36. Mumps ______ a common childhood illness.","options":["A) are","B) were","C) is","D) have been"],"correct":2,"explanation":"Назви хвороб на -s вживаються з дієсловом в однині."}$g1230$, 10)
) as v(lid, type, level, payload, pos)
on conflict (legacy_id) where student_id is null do update set
  type = excluded.type, level = excluded.level,
  payload = excluded.payload, position = excluded.position;

commit;

-- Контроль: очікуємо 7 блоків теорії і 139 вправ
select
  (select count(*) from public.theory_blocks tb join public.topics t on t.id = tb.topic_id
    where t.slug = $g1234$nouns$g1234$) as theory_blocks,
  (select count(*) from public.exercises e join public.topics t on t.id = e.topic_id
    where t.slug = $g1235$nouns$g1235$ and e.student_id is null) as exercises;

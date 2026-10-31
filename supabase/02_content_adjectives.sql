-- ============================================================
--  Контент теми: Прикметники (Adjectives)
--  Згенеровано з data/adjectives.js — вручну не редагувати.
--  Повторний запуск оновлює наявні рядки, дублікатів не створює.
-- ============================================================
begin;
create unique index if not exists uq_exercises_legacy_shared
  on public.exercises (legacy_id) where student_id is null;

insert into public.topics (slug, title, description, position)
values ($g0$adjectives$g0$, $g1$Прикметники (Adjectives)$g1$, $g2$Прикметники: позиція в реченні, порядок прикметників, складні форми.$g2$, 1)
on conflict (slug) do update set title = excluded.title,
  description = excluded.description, position = excluded.position;

with t as (select id from public.topics where slug = $g3$adjectives$g3$)
insert into public.theory_blocks (topic_id, block_key, title, level, content_html, position)
select t.id, v.k, v.title, v.level, v.html, v.pos from t, (values
  ($g4$th_1$g4$, $g5$Прикметник: що це і де він стоїть$g5$, $g6$elementary$g6$, $g7$
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
        $g7$, 0),
  ($g8$th_2$g8$, $g9$Opinion vs Fact: два типи прикметників$g9$, $g10$elementary$g10$, $g11$
          <p class="text-slate-600 mb-3">Прикметники поділяються на <strong>оцінні (opinion)</strong> — те, що людина думає, і <strong>фактичні (fact)</strong> — об'єктивна інформація про вік, розмір, колір, походження, матеріал.</p>
          <div class="bg-indigo-50 border border-indigo-100 p-3 rounded-lg text-sm mb-3">
            <strong>Ключ:</strong> Opinion завжди стоїть ПЕРЕД Fact
          </div>
          <ul class="text-xs space-y-1 text-slate-700">
            <li>• <strong>Opinion:</strong> <em>boring, exciting, lovely, beautiful, delicious, ugly, fantastic</em></li>
            <li>• <strong>Fact:</strong> <em>tall, thin, new, old, red, Swiss, wooden, round</em></li>
            <li>• <em>a lovely old-fashioned wooden table</em> — спочатку думка, потім факти</li>
          </ul>
        $g11$, 1),
  ($g12$th_3$g12$, $g13$Повний порядок прикметників (OSASCOMP)$g13$, $g14$intermediate$g14$, $g15$
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
        $g15$, 2),
  ($g16$th_4$g16$, $g17$Складні прикметники (compound adjectives)$g17$, $g18$intermediate$g18$, $g19$
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
        $g19$, 3),
  ($g20$th_5$g20$, $g21$Іменник у ролі прикметника + gold/golden, silk/silky, stone/stony$g21$, $g22$intermediate$g22$, $g23$
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
        $g23$, 4),
  ($g24$th_6$g24$, $g25$The + adjective = група людей$g25$, $g26$intermediate$g26$, $g27$
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
        $g27$, 5),
  ($g28$th_7$g28$, $g29$Прикметники з обмеженою позицією (afraid, asleep / chief, elder)$g29$, $g30$advanced$g30$, $g31$
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
        $g31$, 6)
) as v(k, title, level, html, pos)
on conflict (topic_id, block_key) do update set title = excluded.title,
  level = excluded.level, content_html = excluded.content_html, position = excluded.position;

with t as (select id from public.topics where slug = $g176$adjectives$g176$)
insert into public.exercises (topic_id, legacy_id, type, level, payload, position, source)
select t.id, v.lid, v.type, v.level, v.payload::jsonb, v.pos, 'book' from t, (values
  ($g32$ord_1$g32$, $g33$order$g33$, $g34$elementary$g34$, $g35${"id":"ord_1","level":"elementary","prefix":"It's a(n)","scrambled":["stone","small","cottage"],"answer":"small stone cottage","hint":"Size → Material → Noun"}$g35$, 0),
  ($g36$ord_2$g36$, $g37$order$g37$, $g38$elementary$g38$, $g39${"id":"ord_2","level":"elementary","prefix":"It's a(n)","scrambled":["wooden","English","huge","wardrobe"],"answer":"huge English wooden wardrobe","hint":"Size → Origin → Material → Noun"}$g39$, 1),
  ($g40$ord_3$g40$, $g41$order$g41$, $g42$intermediate$g42$, $g43${"id":"ord_3","level":"intermediate","prefix":"It's a(n)","scrambled":["Chinese","old","amazing","story"],"answer":"amazing old Chinese story","hint":"Opinion → Age → Origin → Noun"}$g43$, 2),
  ($g44$ord_4$g44$, $g45$order$g45$, $g46$intermediate$g46$, $g47${"id":"ord_4","level":"intermediate","prefix":"It's a(n)","scrambled":["American","exciting","new","film"],"answer":"exciting new American film","hint":"Opinion → Age → Origin → Noun"}$g47$, 3),
  ($g48$ord_5$g48$, $g49$order$g49$, $g50$intermediate$g50$, $g51${"id":"ord_5","level":"intermediate","prefix":"It's a pair of","scrambled":["reading","old","wire","glasses"],"answer":"old wire reading glasses","hint":"Age → Material → Used for → Noun"}$g51$, 4),
  ($g52$ord_6$g52$, $g53$order$g53$, $g54$intermediate$g54$, $g55${"id":"ord_6","level":"intermediate","prefix":"It's a(n)","scrambled":["old-fashioned","wooden","lovely","table"],"answer":"lovely old-fashioned wooden table","hint":"Opinion → Age → Material → Noun"}$g55$, 5),
  ($g56$ord_7$g56$, $g57$order$g57$, $g58$advanced$g58$, $g59${"id":"ord_7","level":"advanced","prefix":"It's a(n)","scrambled":["Irish","tablecloth","linen","white"],"answer":"white Irish linen tablecloth","hint":"Colour → Origin → Material → Noun"}$g59$, 6),
  ($g60$ord_8$g60$, $g61$order$g61$, $g62$intermediate$g62$, $g63${"id":"ord_8","level":"intermediate","prefix":"It's a","scrambled":["large","chocolate","cake","delicious"],"answer":"delicious large chocolate cake","hint":"Opinion → Size → Material → Noun"}$g63$, 7),
  ($g64$ord_9$g64$, $g65$order$g65$, $g66$intermediate$g66$, $g67${"id":"ord_9","level":"intermediate","prefix":"It's a(n)","scrambled":["velvet","ugly","sofa","orange"],"answer":"ugly orange velvet sofa","hint":"Opinion → Colour → Material → Noun"}$g67$, 8),
  ($g68$ord_10$g68$, $g69$order$g69$, $g70$intermediate$g70$, $g71${"id":"ord_10","level":"intermediate","prefix":"For the bedroom I got a(n)","scrambled":["round","antique","mirror","large"],"answer":"large antique round mirror","hint":"Size → Age → Shape → Noun"}$g71$, 9),
  ($g72$ord_11$g72$, $g73$order$g73$, $g74$intermediate$g74$, $g75${"id":"ord_11","level":"intermediate","prefix":"I found some","scrambled":["tall","silver","beautiful","candlesticks"],"answer":"beautiful tall silver candlesticks","hint":"Opinion → Size → Material → Noun"}$g75$, 10),
  ($g76$ord_12$g76$, $g77$order$g77$, $g78$intermediate$g78$, $g79${"id":"ord_12","level":"intermediate","prefix":"I also bought some","scrambled":["cotton","thick","soft","towels"],"answer":"soft thick cotton towels","hint":"Opinion → Size → Material → Noun"}$g79$, 11),
  ($g80$ord_13$g80$, $g81$order$g81$, $g82$advanced$g82$, $g83${"id":"ord_13","level":"advanced","prefix":"I bought a","scrambled":["woollen","green","rug","square"],"answer":"square green woollen rug","hint":"Shape → Colour → Material → Noun"}$g83$, 12),
  ($g84$ord_14$g84$, $g85$order$g85$, $g86$advanced$g86$, $g87${"id":"ord_14","level":"advanced","prefix":"I bought a(n)","scrambled":["oak","English","table","fabulous"],"answer":"fabulous English oak table","hint":"Opinion → Origin → Material → Noun"}$g87$, 13),
  ($g88$ch_1$g88$, $g89$choice$g89$, $g90$elementary$g90$, $g91${"id":"ch_1","level":"elementary","before":"When she looked inside, she found a doll wrapped in","options":["silk","silky"],"after":"paper.","correct":"silky","explanation":"Папір не може бути ЗРОБЛЕНИЙ із шовку, він лише на дотик як шовк — тому silky."}$g91$, 0),
  ($g92$ch_2$g92$, $g93$choice$g93$, $g94$elementary$g94$, $g95${"id":"ch_2","level":"elementary","before":"The doll had","options":["gold","golden"],"after":"hair.","correct":"golden","explanation":"Волосся лише кольору золота, а не з золота — golden."}$g95$, 1),
  ($g96$ch_3$g96$, $g97$choice$g97$, $g98$elementary$g98$, $g99${"id":"ch_3","level":"elementary","before":"She was wearing a long","options":["woollen","wool"],"after":"coat.","correct":"woollen","explanation":"Матеріал передається прикметником woollen (зроблений із вовни)."}$g99$, 2),
  ($g100$ch_4$g100$, $g101$choice$g101$, $g102$intermediate$g102$, $g103${"id":"ch_4","level":"intermediate","before":"She sat down on the cold","options":["stony","stone"],"after":"floor.","correct":"stone","explanation":"Підлога справді зроблена з каменю — stone. Stony означає «холодний, як камінь» (про погляд)."}$g103$, 3),
  ($g104$ch_5$g104$, $g105$choice$g105$, $g106$intermediate$g106$, $g107${"id":"ch_5","level":"intermediate","before":"She was wearing a real","options":["gold","golden"],"after":"necklace.","correct":"gold","explanation":"Справжнє намисто з золота — gold necklace."}$g107$, 4),
  ($g108$ch_6$g108$, $g109$choice$g109$, $g110$intermediate$g110$, $g111${"id":"ch_6","level":"intermediate","before":"Underneath the coat, she had a","options":["silky","silk"],"after":"dress.","correct":"silk","explanation":"Сукня пошита зі шовку — silk dress."}$g111$, 5),
  ($g112$gap_1$g112$, $g113$gap$g113$, $g114$intermediate$g114$, $g115${"id":"gap_1","level":"intermediate","prompt":"It is important to look after ______ (elderly), especially in winter.","answers":["the elderly"],"explanation":"The + adjective позначає групу людей ЗАГАЛОМ, без слова people."}$g115$, 0),
  ($g116$gap_2$g116$, $g117$gap$g117$, $g118$intermediate$g118$, $g119${"id":"gap_2","level":"intermediate","prompt":"Ambulances took ______ (injured) to hospitals in the area.","answers":["the injured"],"explanation":"The injured = «постраждалі» як група; дієслово узгоджується з множиною."}$g119$, 1),
  ($g120$gap_3$g120$, $g121$gap$g121$, $g122$advanced$g122$, $g123${"id":"gap_3","level":"advanced","prompt":"______ (old) in the village are upset about the new road.","answers":["the old people"],"explanation":"Йдеться про конкретну групу (саме в цьому селі), тому додаємо people."}$g123$, 2),
  ($g124$gap_4$g124$, $g125$gap$g125$, $g126$intermediate$g126$, $g127${"id":"gap_4","level":"intermediate","prompt":"They are changing the building to make it easier for ______ (disabled) to get around.","answers":["the disabled"],"explanation":"Загальна категорія людей — the + adjective."}$g127$, 3),
  ($g128$gap_5$g128$, $g129$gap$g129$, $g130$advanced$g130$, $g131${"id":"gap_5","level":"advanced","prompt":"______ (young) in the audience cheered loudly at the end of the concert.","answers":["the young people"],"explanation":"Конкретна група (та, що була в залі) — the + adjective + people."}$g131$, 4),
  ($g132$gap_6$g132$, $g133$gap$g133$, $g134$advanced$g134$, $g135${"id":"gap_6","level":"advanced","prompt":"______ (poor) of our town receive help from the council.","answers":["the poor people"],"explanation":"Уточнення «of our town» робить групу конкретною, тому потрібне people."}$g135$, 5),
  ($g136$gap_7$g136$, $g137$gap$g137$, $g138$intermediate$g138$, $g139${"id":"gap_7","level":"intermediate","prompt":"Christine is a nurse who looks after ______ (sick).","answers":["the sick"],"explanation":"Хворі загалом — the sick."}$g139$, 6),
  ($g140$gap_8$g140$, $g141$gap$g141$, $g142$advanced$g142$, $g143${"id":"gap_8","level":"advanced","prompt":"______ (strong) in the group carried the heavy equipment.","answers":["the strong people"],"explanation":"Конкретна група («у цій групі») — додаємо people."}$g143$, 7),
  ($g144$gap_9$g144$, $g145$gap$g145$, $g146$intermediate$g146$, $g147${"id":"gap_9","level":"intermediate","prompt":"______ (rich) can afford to live in luxury.","answers":["the rich"],"explanation":"Багаті як суспільна категорія — the rich."}$g147$, 8),
  ($g148$gap_10$g148$, $g149$gap$g149$, $g150$elementary$g150$, $g151${"id":"gap_10","level":"elementary","prompt":"A story which is written well is a ______ story. (well / write)","answers":["well-written","well written"],"explanation":"Compound adjective: well + Participle II через дефіс."}$g151$, 9),
  ($g152$gap_11$g152$, $g153$gap$g153$, $g154$elementary$g154$, $g155${"id":"gap_11","level":"elementary","prompt":"A building which has twelve storeys is a ______ building. (twelve / storey)","answers":["twelve-storey","twelve storey"],"explanation":"Після числівника іменник стоїть в ОДНИНІ: twelve-storey."}$g155$, 10),
  ($g156$gap_12$g156$, $g157$gap$g157$, $g158$intermediate$g158$, $g159${"id":"gap_12","level":"intermediate","prompt":"A train which moves fast is a ______ train. (fast / move)","answers":["fast-moving","fast moving"],"explanation":"Прислівник/прикметник + Participle I: fast-moving."}$g159$, 11),
  ($g160$gap_13$g160$, $g161$gap$g161$, $g162$intermediate$g162$, $g163${"id":"gap_13","level":"intermediate","prompt":"A student who works hard is a ______ student. (hard / work)","answers":["hard-working","hard working"],"explanation":"hard + working — класичний compound adjective."}$g163$, 12),
  ($g164$gap_14$g164$, $g165$gap$g165$, $g166$advanced$g166$, $g167${"id":"gap_14","level":"advanced","prompt":"An office which has good lighting is a ______ office. (well / light)","answers":["well-lit","well lit"],"explanation":"Good lighting передається як well-lit (Participle II від light)."}$g167$, 13),
  ($g168$gap_15$g168$, $g169$gap$g169$, $g170$elementary$g170$, $g171${"id":"gap_15","level":"elementary","prompt":"A holiday which lasts two weeks is a ______ holiday. (two / week)","answers":["two-week","two week"],"explanation":"Два тижні → two-week, іменник без -s."}$g171$, 14),
  ($g172$gap_16$g172$, $g173$gap$g173$, $g174$elementary$g174$, $g175${"id":"gap_16","level":"elementary","prompt":"A report which has ten pages is a ______ report. (ten / page)","answers":["ten-page","ten page"],"explanation":"Числівник + іменник в однині: ten-page report."}$g175$, 15)
) as v(lid, type, level, payload, pos)
on conflict (legacy_id) where student_id is null do update set
  type = excluded.type, level = excluded.level,
  payload = excluded.payload, position = excluded.position;

commit;

-- Контроль: очікуємо 7 блоків теорії і 36 вправ
select
  (select count(*) from public.theory_blocks tb join public.topics t on t.id = tb.topic_id
    where t.slug = $g177$adjectives$g177$) as theory_blocks,
  (select count(*) from public.exercises e join public.topics t on t.id = e.topic_id
    where t.slug = $g178$adjectives$g178$ and e.student_id is null) as exercises;

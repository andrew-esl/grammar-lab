-- ============================================================
--  Тема «Прикметники» у структурованому форматі
--  Згенеровано з mig/adjectives.js — вручну не редагувати.
--  Потребує 06_theory_structure.sql.
-- ============================================================
begin;

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g0$th_hero$g0$, $g1$Прикметники$g1$, $g2$elementary$g2$, $g3$hero$g3$, $g4${"title":"Adjectives","chips":["Англійська граматика","Прикметники","5 кроків"],"lead":"Слова, що описують іменник. В англійській вони не змінюються за числом і мають <b>строгий порядок</b>, коли їх кілька поспіль.","diagramTitle":"Скелет іменникової групи","diagram":[{"role":"думка","label":"lovely","tone":"opinion"},{"role":"факти","label":"old · red · Swiss","tone":"colour"},{"role":"іменник","label":"clock","tone":"noun"}],"diagramNote":"Opinion → Fact → Noun"}$g4$::jsonb, null, 0
from public.topics where slug = $g5$adjectives$g5$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g6$th_1$g6$, $g7$Що це за частина мови і де вона стоїть$g7$, $g8$elementary$g8$, $g9$cases$g9$, $g10${"step":"Суть і позиція","kicker":"Базове розуміння","lead":"Прикметник описує іменник. Є лише дві позиції, де він може опинитися, і одне правило, яке ламає звичку з української.","cards":[{"icon":"→","title":"Перед іменником","text":"Найчастіша позиція: прикметник стоїть одразу перед словом, яке описує.","example":"a <b>small</b> house","examplePlain":"a small house"},{"icon":"=","title":"Після дієслова-звʼязки","text":"Після <i>be, look, smell, sound, feel, taste, seem, appear, become, get, stay</i>.","example":"She is <b>beautiful</b>.","examplePlain":"She is beautiful."},{"icon":"≠","title":"Ніколи не має множини","text":"Одна форма для однини й множини. Це головна помилка тих, хто думає українською.","example":"two <b>small</b> houses","examplePlain":"two small houses"}],"axis":{"title":"Одне речення — обидві позиції","points":[{"label":"перед іменником","text":"It's a <b>cold</b> day."},{"label":"перед іменником","text":"the <b>crisp white</b> snow"},{"label":"після звʼязки","text":"They seem <b>unhappy</b>."}],"note":"Прикметник не змінюється ні за родом, ні за числом — змінюється тільки іменник поруч."}}$g10$::jsonb, null, 1
from public.topics where slug = $g11$adjectives$g11$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g12$th_2$g12$, $g13$Думка проти факту$g13$, $g14$elementary$g14$, $g15$formula$g15$, $g16${"step":"Думка і факт","kicker":"Перше правило порядку","lead":"Коли прикметників два, порядок уже не вільний. Спочатку те, що людина <b>думає</b>, потім те, що можна <b>перевірити</b>.","tiles":[{"role":"Opinion","label":"думка","tone":"opinion"},{"role":"Fact","label":"факт","tone":"colour"},{"role":"Noun","label":"іменник","tone":"noun"}],"legend":[{"tone":"opinion","label":"Opinion: boring, exciting, lovely, beautiful, delicious, ugly, fantastic"},{"tone":"colour","label":"Fact: tall, thin, new, old, red, Swiss, wooden, round"}],"examples":[{"text":"a <b>lovely</b> old-fashioned wooden table","plain":"a lovely old-fashioned wooden table","note":"думка → факти"},{"text":"a <b>beautiful</b> blue lace handkerchief","plain":"a beautiful blue lace handkerchief","note":"думка → колір → матеріал"}],"note":"Opinion завжди стоїть <b>перед</b> Fact. Якщо сумніваєтесь, спитайте себе: це моя оцінка чи об'єктивна ознака?","tabs":[{"title":"Як відрізнити","html":"<div class=\"grid sm:grid-cols-2 gap-4 text-body-sm\">\n          <div><div class=\"text-caption-bold uppercase tracking-wider text-indigo-600 mb-1.5\">Opinion — моя оцінка</div>\n          <p class=\"text-text-secondary leading-relaxed\">Інша людина може не погодитись: <i>boring, exciting, lovely, beautiful, delicious, ugly, fantastic</i>.</p></div>\n          <div><div class=\"text-caption-bold uppercase tracking-wider text-amber-700 mb-1.5\">Fact — можна перевірити</div>\n          <p class=\"text-text-secondary leading-relaxed\">Вік, розмір, колір, походження, матеріал: <i>tall, thin, new, old, red, Swiss, wooden, round</i>.</p></div>\n        </div>"},{"title":"Скільки їх ставити","html":"<p class=\"text-body-sm text-text-secondary leading-relaxed\">\n          Не ставте більше <b>2–3</b> прикметників перед одним іменником: речення стає важким.\n          <br><br>Добре: <i>a beautiful blue evening dress</i>.\n          <br>Погано: нанизувати всі ознаки поспіль, навіть якщо порядок правильний.</p>"}]}$g16$::jsonb, null, 2
from public.topics where slug = $g17$adjectives$g17$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g18$th_8$g18$, $g19$Стоп-калька: захист від рідної мови$g19$, $g20$elementary$g20$, $g21$traps$g21$, $g22${"step":"Стоп-калька","kicker":"Типові помилки інтерференції","lead":"Найчастіші пастки, коли мозок намагається дослівно перекласти українське речення.","items":[{"title":"«Два маленьких будинки»","bad":"two smalls houses","good":"two <b>small</b> houses","goodPlain":"two small houses","rule":"В англійській прикметник не має форми множини. Змінюється лише іменник."},{"title":"«Десятихвилинна прогулянка»","bad":"a ten-minutes walk","good":"a <b>ten-minute</b> walk","goodPlain":"a ten-minute walk","rule":"У складному прикметнику після числівника іменник стоїть в <b>однині</b>: <i>a three-hour delay</i>."},{"title":"«Перші два тижні»","bad":"the two first weeks","good":"the <b>first two</b> weeks","goodPlain":"the first two weeks","rule":"Порядкові числівники (first, second) стоять <b>перед</b> кількісними, а не навпаки."}]}$g22$::jsonb, null, 3
from public.topics where slug = $g23$adjectives$g23$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

-- блоки вищих рівнів переносимо в кінець: вони стануть розділом «Глибше»
update public.theory_blocks tb set position = 10
  from public.topics t where t.id = tb.topic_id and t.slug = $g24$adjectives$g24$ and tb.block_key = $g25$th_3$g25$;
update public.theory_blocks tb set position = 11
  from public.topics t where t.id = tb.topic_id and t.slug = $g26$adjectives$g26$ and tb.block_key = $g27$th_4$g27$;
update public.theory_blocks tb set position = 12
  from public.topics t where t.id = tb.topic_id and t.slug = $g28$adjectives$g28$ and tb.block_key = $g29$th_5$g29$;
update public.theory_blocks tb set position = 13
  from public.topics t where t.id = tb.topic_id and t.slug = $g30$adjectives$g30$ and tb.block_key = $g31$th_6$g31$;
update public.theory_blocks tb set position = 14
  from public.topics t where t.id = tb.topic_id and t.slug = $g32$adjectives$g32$ and tb.block_key = $g33$th_7$g33$;

commit;

-- Контроль: 4 структуровані блоки + 5 звичайних вищих рівнів
select tb.kind, tb.level, tb.position, tb.block_key, tb.title from public.theory_blocks tb
  join public.topics t on t.id = tb.topic_id where t.slug = $g34$adjectives$g34$ order by position;

-- ============================================================
--  Тема «Іменники» у структурованому форматі
--  Згенеровано з mig/nouns.js — вручну не редагувати.
--  Потребує 06_theory_structure.sql.
-- ============================================================
begin;

-- новий тип блоку: таблиця пар «однина → множина»
alter table public.theory_blocks drop constraint if exists theory_blocks_kind_check;
alter table public.theory_blocks add constraint theory_blocks_kind_check
  check (kind in ('prose', 'hero', 'cases', 'formula', 'traps', 'pairs'));

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g0$th_hero$g0$, $g1$Іменники$g1$, $g2$elementary$g2$, $g3$hero$g3$, $g4${"title":"Nouns","chips":["Англійська граматика","Іменники"],"lead":"Назва предмета чи явища. Головні труднощі не в самому слові, а в <b>множині</b> та в тому, яке дієслово поруч: <i>is</i> чи <i>are</i>.","diagramTitle":"Від однини до множини","diagram":[{"role":"основа","label":"book · box · city","tone":"neutral"},{"role":"закінчення","label":"-s · -es · -ies","tone":"colour"},{"role":"множина","label":"books · boxes · cities","tone":"noun"}],"diagramNote":"Noun + -s → plural"}$g4$::jsonb, null, 0
from public.topics where slug = $g5$nouns$g5$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g6$th_1$g6$, $g7$Що таке іменник і яким він буває$g7$, $g8$elementary$g8$, $g9$cases$g9$, $g10${"step":"Суть і типи","kicker":"Базове розуміння","lead":"Іменник називає предмет чи явище і відповідає на питання <b>хто?</b> що? За значенням їх ділять на три групи — від цього залежить, чи можна їх рахувати.","cards":[{"icon":"▣","title":"Конкретні","text":"Предмети, які можна побачити й доторкнутись. Майже завжди злічувані.","example":"a pen · a book · a knife · a bottle","examplePlain":"a pen, a book, a knife, a bottle"},{"icon":"◌","title":"Абстрактні","text":"Почуття, стани, поняття. Здебільшого незлічувані — у них немає множини.","example":"love · hate · knowledge","examplePlain":"love, hate, knowledge"},{"icon":"⬒","title":"Збірні","text":"Назва групи як цілого. Одне слово, а людей чи предметів за ним багато.","example":"team · family · crowd · group","examplePlain":"team, family, crowd, group"}],"axis":{"title":"Що змінюється в англійського іменника","points":[{"label":"число","text":"book → <b>books</b>"},{"label":"відмінок","text":"boy → <b>boy's</b>"},{"label":"рід","text":"майже ніколи"}],"note":"Відмінків лише два: Nominative (називний) і Possessive (присвійний). Рід здебільшого середній — виняток становлять назви кораблів, транспорту й країн (жіночий) та пари на кшталт <i>man – woman</i>, <i>bull – cow</i>, <i>duke – duchess</i>."}}$g10$::jsonb, null, 1
from public.topics where slug = $g11$nouns$g11$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g12$th_2$g12$, $g13$Множина: чотири правила правопису$g13$, $g14$elementary$g14$, $g15$formula$g15$, $g16${"step":"Множина","kicker":"Архітектура форми","lead":"За замовчуванням додаємо <b>-s</b>. Але закінчення основи може змінити це правило — таких випадків рівно чотири.","tiles":[{"role":"за замовчуванням","label":"+ -s","tone":"neutral"},{"role":"s, ss, sh, ch, x, o","label":"+ -es","tone":"colour"},{"role":"приголосний + y","label":"-ies","tone":"origin"},{"role":"-f / -fe","label":"-ves","tone":"material"}],"legend":[{"tone":"neutral","label":"a pen – pens, a phone – phones"},{"tone":"colour","label":"bush – bushes, church – churches, box – boxes, tomato – tomatoes"},{"tone":"origin","label":"city – cities, baby – babies"},{"tone":"material","label":"wolf – wolves, knife – knives, life – lives"}],"examples":[{"text":"a bush → two <b>bushes</b>","plain":"a bush, two bushes","note":"після sh"},{"text":"a city → three <b>cities</b>","plain":"a city, three cities","note":"приголосний + y"},{"text":"a knife → two <b>knives</b>","plain":"a knife, two knives","note":"-fe → -ves"}],"note":"Голосний перед <b>y</b> нічого не змінює: <i>toy – toys</i>, <i>boy – boys</i>, <i>day – days</i>.","tabs":[{"title":"Коли -es","html":"<p class=\"text-body-sm text-text-secondary leading-relaxed mb-3\">\n          Запамʼятати допомагає набір літер <b>s, ss, sh, ch, x, o</b>: якщо основа закінчується на будь-яку з них, додаємо <code class=\"font-mono\">-es</code>.</p>\n          <div class=\"font-mono text-body-sm text-text-primary space-y-1\">\n            <div>bush → bush<b>es</b> · church → church<b>es</b></div>\n            <div>box → box<b>es</b> · tomato → tomato<b>es</b></div>\n          </div>"},{"title":"Винятки на -o","html":"<p class=\"text-body-sm text-text-secondary leading-relaxed mb-3\">\n          Частина слів на <b>-o</b> бере просто <code class=\"font-mono\">-s</code>. Їх небагато, варто вивчити списком.</p>\n          <div class=\"font-mono text-body-sm text-text-primary\">piano<b>s</b> · radio<b>s</b> · zoo<b>s</b> · hippo<b>s</b> · video<b>s</b> · photo<b>s</b></div>"},{"title":"Винятки на -f","html":"<p class=\"text-body-sm text-text-secondary leading-relaxed mb-3\">\n          Не всі слова на <b>-f</b> переходять у <code class=\"font-mono\">-ves</code>. Ці зберігають <code class=\"font-mono\">-s</code>:</p>\n          <div class=\"font-mono text-body-sm text-text-primary\">chief<b>s</b> · roof<b>s</b> · handkerchief<b>s</b> · dwarf<b>s</b> · proof<b>s</b> · cliff<b>s</b></div>\n          <p class=\"text-body-sm text-text-secondary leading-relaxed mt-3\">А ці — переходять:\n          <span class=\"font-mono\">wolves, knives, lives, leaves, halves, shelves, calves</span>.</p>"}]}$g16$::jsonb, null, 2
from public.topics where slug = $g17$nouns$g17$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g18$th_3$g18$, $g19$Неправильна множина: вивчити напамʼять$g19$, $g20$elementary$g20$, $g21$pairs$g21$, $g22${"step":"Винятки","kicker":"Форми поза правилами","lead":"Ці слова не підпорядковуються жодному правилу правопису. Їх просто треба знати.","groups":[{"title":"Змінюється голосна","note":"7 слів","items":[["man","men"],["woman","women"],["tooth","teeth"],["foot","feet"],["goose","geese"],["mouse","mice"],["louse","lice"]]},{"title":"Особлива форма","note":"3 слова","items":[["child","children"],["ox","oxen"],["person","people"]]},{"title":"Не змінюються","note":"4 слова","items":[["deer","deer"],["sheep","sheep"],["fish","fish"],["fruit","fruit"]]}],"notes":["<b>peoples</b> — це «народи», а не «люди». Множина від <i>person</i> — просто <i>people</i>.","<b>fishes</b> і <b>fruits</b> вживають, коли йдеться про <i>різні види</i> риби чи фруктів.","<b>mouses</b> — лише про компʼютерні миші. Тварини завжди <i>mice</i>."]}$g22$::jsonb, null, 3
from public.topics where slug = $g23$nouns$g23$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g24$th_5$g24$, $g25$Злічувані та незлічувані$g25$, $g26$elementary$g26$, $g27$formula$g27$, $g28${"step":"Злічувані","kicker":"Друга велика розвилка","lead":"Злічувані можна порахувати: <i>one book, two books</i>. Незлічувані — ні, і через це в них інші слова-супутники й дієслово в однині.","tiles":[{"role":"Countable","label":"a/an · many · few","tone":"opinion"},{"role":"Uncountable","label":"the · much · little","tone":"colour"}],"legend":[{"tone":"opinion","label":"Злічувані: a/an/the, присвійні займенники, some/any/many/few"},{"tone":"colour","label":"Незлічувані: тільки the, some/any/much/little, дієслово в ОДНИНІ"}],"examples":[{"text":"The furniture <b>is</b> new.","plain":"The furniture is new.","note":"не are"},{"text":"I need <b>some</b> advice.","plain":"I need some advice.","note":"не an advice"},{"text":"<b>much</b> water · <b>many</b> bottles","plain":"much water, many bottles"}],"note":"Щоб порахувати незлічуване, потрібна «одиниця виміру»: <i>a piece of advice</i>, <i>a glass of water</i>, <i>two pieces of furniture</i>.","tabs":[{"title":"Типові незлічувані","html":"<div class=\"grid sm:grid-cols-2 gap-4 text-body-sm\">\n          <div><div class=\"text-caption-bold uppercase tracking-wider text-text-muted mb-1.5\">Їжа та рідини</div>\n            <p class=\"font-mono text-text-primary leading-relaxed\">rice · buckwheat · flour · butter · sugar · meat · bread · milk · water · wine · beer</p></div>\n          <div><div class=\"text-caption-bold uppercase tracking-wider text-text-muted mb-1.5\">Матеріали й абстрактне</div>\n            <p class=\"font-mono text-text-primary leading-relaxed\">carbon · metal · wood · paper · knowledge · love · help · justice · patience · experience · education</p></div>\n        </div>"},{"title":"Запамʼятати окремо","html":"<p class=\"text-body-sm text-text-secondary leading-relaxed mb-3\">\n          Ці слова незлічувані в англійській, хоча в українській мають множину. Саме вони дають найбільше помилок:</p>\n          <p class=\"font-mono text-body-sm text-text-primary leading-relaxed\">luggage · baggage · hair · advice · news · furniture · equipment · money · information · accommodation · machinery · rubbish · applause</p>"}]}$g28$::jsonb, null, 4
from public.topics where slug = $g29$nouns$g29$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position)
select id, $g30$th_9$g30$, $g31$Стоп-калька: захист від рідної мови$g31$, $g32$elementary$g32$, $g33$traps$g33$, $g34${"step":"Стоп-калька","kicker":"Типові помилки інтерференції","lead":"Усі ці помилки виникають з однієї причини: в українській слово має множину, а в англійській — ні. Або навпаки.","items":[{"title":"«Меблі нові»","bad":"The furniture are new.","good":"The furniture <b>is</b> new.","goodPlain":"The furniture is new.","rule":"<i>furniture</i> незлічуваний, тому дієслово в однині."},{"title":"«Дай пораду»","bad":"Give me an advice.","good":"Give me <b>a piece of</b> advice.","goodPlain":"Give me a piece of advice.","rule":"<i>advice</i> незлічуваний: артикль <i>a/an</i> неможливий, рахуємо через <i>a piece of</i>."},{"title":"«Новини були гарні»","bad":"The news were good.","good":"The news <b>was</b> good.","goodPlain":"The news was good.","rule":"<i>news</i> закінчується на -s, але це однина."},{"title":"«У неї гарне волосся»","bad":"Her hair are beautiful.","good":"Her hair <b>is</b> beautiful.","goodPlain":"Her hair is beautiful.","rule":"<i>hair</i> як маса волосся — незлічуваний іменник в однині."},{"title":"«Поліція їде»","bad":"The police is coming.","good":"The police <b>are</b> coming.","goodPlain":"The police are coming.","rule":"<i>police</i> завжди має дієслово у множині, хоча форми на -s немає."},{"title":"«Двоє штанів»","bad":"two trousers","good":"two <b>pairs of</b> trousers","goodPlain":"two pairs of trousers","rule":"Предмети з двох частин рахують через <i>a pair of</i>."}]}$g34$::jsonb, null, 5
from public.topics where slug = $g35$nouns$g35$
on conflict (topic_id, block_key) do update set
  title = excluded.title, level = excluded.level, kind = excluded.kind,
  content_json = excluded.content_json, content_html = null, position = excluded.position;

-- блоки вищих рівнів переносимо в кінець: вони стануть розділом «Глибше»
update public.theory_blocks tb set position = 10
  from public.topics t where t.id = tb.topic_id and t.slug = $g36$nouns$g36$ and tb.block_key = $g37$th_6$g37$;
update public.theory_blocks tb set position = 11
  from public.topics t where t.id = tb.topic_id and t.slug = $g38$nouns$g38$ and tb.block_key = $g39$th_7$g39$;
update public.theory_blocks tb set position = 12
  from public.topics t where t.id = tb.topic_id and t.slug = $g40$nouns$g40$ and tb.block_key = $g41$th_4$g41$;

commit;

-- Контроль: 6 структурованих блоків + 3 звичайні вищих рівнів
select tb.kind, tb.level, tb.position, tb.block_key, tb.title from public.theory_blocks tb
  join public.topics t on t.id = tb.topic_id where t.slug = $g42$nouns$g42$ order by tb.position;

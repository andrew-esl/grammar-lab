-- ============================================================
--  Контент теми: Прислівники (Adverbs)
--  Згенеровано з data/adverbs.js — вручну не редагувати.
--  Повторний запуск оновлює наявні рядки, дублікатів не створює.
-- ============================================================
begin;
create unique index if not exists uq_exercises_legacy_shared
  on public.exercises (legacy_id) where student_id is null;

insert into public.topics (slug, title, description, position)
values ($g179$adverbs$g179$, $g180$Прислівники (Adverbs)$g180$, $g181$Утворення прислівників, fairly/quite/rather/pretty, позиція в реченні.$g181$, 2)
on conflict (slug) do update set title = excluded.title,
  description = excluded.description, position = excluded.position;

with t as (select id from public.topics where slug = $g182$adverbs$g182$)
insert into public.theory_blocks (topic_id, block_key, title, level, content_html, position)
select t.id, v.k, v.title, v.level, v.html, v.pos from t, (values
  ($g183$th_8$g183$, $g184$Прислівник: що описує і які бувають типи$g184$, $g185$elementary$g185$, $g186$
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
        $g186$, 0),
  ($g187$th_9$g187$, $g188$Утворення прислівників (-ly)$g188$, $g189$elementary$g189$, $g190$
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
        $g190$, 1),
  ($g191$th_10$g191$, $g192$Пастка: слова на -ly, які є прикметниками$g192$, $g193$intermediate$g193$, $g194$
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
        $g194$, 2),
  ($g195$th_11$g195$, $g196$Прислівники з двома формами та різним значенням$g196$, $g197$advanced$g197$, $g198$
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
        $g198$, 3),
  ($g199$th_12$g199$, $g200$Однакова форма прикметника і прислівника$g200$, $g201$intermediate$g201$, $g202$
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
        $g202$, 4),
  ($g203$th_13$g203$, $g204$Позиція та порядок прислівників$g204$, $g205$intermediate$g205$, $g206$
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
        $g206$, 5),
  ($g207$th_14$g207$, $g208$Fairly – Quite – Rather – Pretty$g208$, $g209$advanced$g209$, $g210$
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
        $g210$, 6)
) as v(k, title, level, html, pos)
on conflict (topic_id, block_key) do update set title = excluded.title,
  level = excluded.level, content_html = excluded.content_html, position = excluded.position;

with t as (select id from public.topics where slug = $g639$adverbs$g639$)
insert into public.exercises (topic_id, legacy_id, type, level, payload, position, source)
select t.id, v.lid, v.type, v.level, v.payload::jsonb, v.pos, 'book' from t, (values
  ($g211$ord_15$g211$, $g212$order$g212$, $g213$elementary$g213$, $g214${"id":"ord_15","level":"elementary","prefix":"Joanne has been writing","scrambled":["day.","letters","her","to","all","friends"],"answer":"letters to her friends all day.","hint":"Прислівник часу (all day) — у кінці речення"}$g214$, 0),
  ($g215$ord_16$g215$, $g216$order$g216$, $g217$intermediate$g217$, $g218${"id":"ord_16","level":"intermediate","prefix":"He has been working","scrambled":["day.","office","all","in","his"],"answer":"in his office all day.","hint":"PLACE → TIME"}$g218$, 1),
  ($g219$ord_17$g219$, $g220$order$g220$, $g221$intermediate$g221$, $g222${"id":"ord_17","level":"intermediate","prefix":"We placed the box","scrambled":["table.","carefully","the","on"],"answer":"carefully on the table.","hint":"MANNER → PLACE"}$g222$, 2),
  ($g223$ord_18$g223$, $g224$order$g224$, $g225$intermediate$g225$, $g226${"id":"ord_18","level":"intermediate","prefix":"They bought some fruit","scrambled":["yesterday.","the","at","market"],"answer":"at the market yesterday.","hint":"PLACE → TIME"}$g226$, 3),
  ($g227$ord_19$g227$, $g228$order$g228$, $g229$advanced$g229$, $g230${"id":"ord_19","level":"advanced","prefix":"He walked","scrambled":["film.","the","quietly","of","room","the","during","out"],"answer":"out of the room quietly during the film.","hint":"Дієслово руху: PLACE → MANNER → TIME"}$g230$, 4),
  ($g231$ord_20$g231$, $g232$order$g232$, $g233$elementary$g233$, $g234${"id":"ord_20","level":"elementary","prefix":"The party was","scrambled":["amazing.","utterly"],"answer":"utterly amazing.","hint":"Прислівник ступеня — перед прикметником"}$g234$, 5),
  ($g235$ord_21$g235$, $g236$order$g236$, $g237$elementary$g237$, $g238${"id":"ord_21","level":"elementary","prefix":"We were","scrambled":["lost.","completely"],"answer":"completely lost.","hint":"Прислівник ступеня — перед дієприкметником"}$g238$, 6),
  ($g239$ord_22$g239$, $g240$order$g240$, $g241$intermediate$g241$, $g242${"id":"ord_22","level":"intermediate","prefix":"Jenny has been reading her magazine","scrambled":["morning.","garden","all","the","in"],"answer":"in the garden all morning.","hint":"PLACE → TIME"}$g242$, 7),
  ($g243$ord_23$g243$, $g244$order$g244$, $g245$advanced$g245$, $g246${"id":"ord_23","level":"advanced","prefix":"They","scrambled":["match.","knew","the","then","they","had","lost"],"answer":"then knew they had lost the match.","hint":"then — перед основним дієсловом"}$g246$, 8),
  ($g247$ord_24$g247$, $g248$order$g248$, $g249$intermediate$g249$, $g250${"id":"ord_24","level":"intermediate","prefix":"They have been talking","scrambled":["hours.","hall","the","for","in"],"answer":"in the hall for hours.","hint":"PLACE → TIME"}$g250$, 9),
  ($g251$ord_25$g251$, $g252$order$g252$, $g253$intermediate$g253$, $g254${"id":"ord_25","level":"intermediate","prefix":"She","scrambled":["clothes.","quickly","her","changed"],"answer":"quickly changed her clothes.","hint":"Прислівник способу дії — перед основним дієсловом"}$g254$, 10),
  ($g255$ord_26$g255$, $g256$order$g256$, $g257$elementary$g257$, $g258${"id":"ord_26","level":"elementary","prefix":"I was","scrambled":["tired.","extremely","feeling"],"answer":"feeling extremely tired.","hint":"Degree-прислівник — безпосередньо перед прикметником"}$g258$, 11),
  ($g259$ord_27$g259$, $g260$order$g260$, $g261$intermediate$g261$, $g262${"id":"ord_27","level":"intermediate","prefix":"He is doing his homework","scrambled":["bedroom.","quietly","his","in"],"answer":"quietly in his bedroom.","hint":"MANNER → PLACE"}$g262$, 12),
  ($g263$ord_28$g263$, $g264$order$g264$, $g265$intermediate$g265$, $g266${"id":"ord_28","level":"intermediate","prefix":"We watched a film","scrambled":["night.","cinema","last","the","at"],"answer":"at the cinema last night.","hint":"PLACE → TIME"}$g266$, 13),
  ($g267$ord_30$g267$, $g268$order$g268$, $g269$advanced$g269$, $g270${"id":"ord_30","level":"advanced","prefix":"She is","scrambled":["girl.","a","pretty","quite"],"answer":"quite a pretty girl.","hint":"quite + a/an + adjective + noun"}$g270$, 14),
  ($g271$ord_31$g271$, $g272$order$g272$, $g273$elementary$g273$, $g274${"id":"ord_31","level":"elementary","prefix":"I feel","scrambled":["today.","ill","very"],"answer":"very ill today.","hint":"very стоїть безпосередньо перед прикметником"}$g274$, 15),
  ($g275$ch_7$g275$, $g276$choice$g276$, $g277$advanced$g277$, $g278${"id":"ch_7","level":"advanced","before":"This is a","options":["pretty","prettily"],"after":"complicated situation.","correct":"pretty","explanation":"Тут pretty = «досить», підсилює прикметник complicated."}$g278$, 0),
  ($g279$ch_8$g279$, $g280$choice$g280$, $g281$advanced$g281$, $g282${"id":"ch_8","level":"advanced","before":"They had","options":["hard","hardly"],"after":"been home for a minute when the phone rang.","correct":"hardly","explanation":"Hardly = «ледве, майже не». Hard означало б «наполегливо»."}$g282$, 1),
  ($g283$ch_9$g283$, $g284$choice$g284$, $g285$advanced$g285$, $g286${"id":"ch_9","level":"advanced","before":"My friends are","options":["most","mostly"],"after":"vegetarians.","correct":"mostly","explanation":"Mostly = «здебільшого». Most = «найбільше»."}$g286$, 2),
  ($g287$ch_10$g287$, $g288$choice$g288$, $g289$intermediate$g289$, $g290${"id":"ch_10","level":"intermediate","before":"Her loose outfit allowed her to move","options":["free","freely"],"after":".","correct":"freely","explanation":"Freely = «вільно, без обмежень». Free означало б «безкоштовно»."}$g290$, 3),
  ($g291$ch_11$g291$, $g292$choice$g292$, $g293$intermediate$g293$, $g294${"id":"ch_11","level":"intermediate","before":"The shelf was so","options":["high","highly"],"after":"that he couldn't reach it.","correct":"high","explanation":"Йдеться про фізичну висоту — high. Highly = «дуже, високо» в оцінці."}$g294$, 4),
  ($g295$ch_12$g295$, $g296$choice$g296$, $g297$intermediate$g297$, $g298${"id":"ch_12","level":"intermediate","before":"John may be","options":["late","lately"],"after":"home tonight, as he has a lot of work to do.","correct":"late","explanation":"Late = «пізно». Lately = «останнім часом»."}$g298$, 5),
  ($g299$ch_13$g299$, $g300$choice$g300$, $g301$advanced$g301$, $g302${"id":"ch_13","level":"advanced","before":"The room was","options":["pretty","prettily"],"after":"decorated.","correct":"prettily","explanation":"Prettily = «гарно» описує спосіб оздоблення (дієприкметник decorated)."}$g302$, 6),
  ($g303$ch_14$g303$, $g304$choice$g304$, $g305$intermediate$g305$, $g306${"id":"ch_14","level":"intermediate","before":"Children under five years old travel","options":["free","freely"],"after":".","correct":"free","explanation":"Free = «безкоштовно»."}$g306$, 7),
  ($g307$ch_15$g307$, $g308$choice$g308$, $g309$intermediate$g309$, $g310${"id":"ch_15","level":"intermediate","before":"Sue has","options":["near","nearly"],"after":"finished her homework.","correct":"nearly","explanation":"Nearly = «майже». Near = «близько» (про відстань)."}$g310$, 8),
  ($g311$ch_16$g311$, $g312$choice$g312$, $g313$intermediate$g313$, $g314${"id":"ch_16","level":"intermediate","before":"They have been going out a lot","options":["late","lately"],"after":".","correct":"lately","explanation":"Lately = «останнім часом»."}$g314$, 9),
  ($g315$ch_17$g315$, $g316$choice$g316$, $g317$advanced$g317$, $g318${"id":"ch_17","level":"advanced","before":"This college is","options":["high","highly"],"after":"recommended for its range of courses.","correct":"highly","explanation":"Highly recommended — стала сполука зі значенням «дуже рекомендований»."}$g318$, 10),
  ($g319$ch_18$g319$, $g320$choice$g320$, $g321$intermediate$g321$, $g322${"id":"ch_18","level":"intermediate","before":"The miners dug","options":["deep","deeply"],"after":"to find coal.","correct":"deep","explanation":"Фізична глибина — deep. Deeply вживається в переносному значенні."}$g322$, 11),
  ($g323$ch_19$g323$, $g324$choice$g324$, $g325$intermediate$g325$, $g326${"id":"ch_19","level":"intermediate","before":"The new supermarket is very","options":["near","nearly"],"after":"our house.","correct":"near","explanation":"Near = «близько» про відстань."}$g326$, 12),
  ($g327$ch_20$g327$, $g328$choice$g328$, $g329$advanced$g329$, $g330${"id":"ch_20","level":"advanced","before":"He is","options":["deep","deeply"],"after":"involved in the scandal.","correct":"deeply","explanation":"Переносне значення «глибоко залучений» — deeply."}$g330$, 13),
  ($g331$ch_21$g331$, $g332$choice$g332$, $g333$advanced$g333$, $g334${"id":"ch_21","level":"advanced","before":"We found it","options":["hard","hardly"],"after":"to get used to living in a foreign country.","correct":"hard","explanation":"Hard = «важко». Hardly має негативне значення «майже не»."}$g334$, 14),
  ($g335$ch_22$g335$, $g336$choice$g336$, $g337$advanced$g337$, $g338${"id":"ch_22","level":"advanced","before":"Which of Mel Gibson's films do you like","options":["most","mostly"],"after":"?","correct":"most","explanation":"Most = «найбільше» (найвищий ступінь від much)."}$g338$, 15),
  ($g339$ch_23$g339$, $g340$choice$g340$, $g341$elementary$g341$, $g342${"id":"ch_23","level":"elementary","before":"It was Lucy's birthday and she was very","options":["sad","sadly"],"after":".","correct":"sad","explanation":"Після дієслова-зв'язки be вживаємо прикметник."}$g342$, 16),
  ($g343$ch_24$g343$, $g344$choice$g344$, $g345$elementary$g345$, $g346${"id":"ch_24","level":"elementary","before":"She had been waiting","options":["hopeful","hopefully"],"after":"all morning for the postman to arrive.","correct":"hopefully","explanation":"Описуємо, ЯК вона чекала — потрібен прислівник."}$g346$, 17),
  ($g347$ch_25$g347$, $g348$choice$g348$, $g349$elementary$g349$, $g350${"id":"ch_25","level":"elementary","before":"","options":["Sudden","Suddenly"],"after":", the letterbox rattled.","correct":"Suddenly","explanation":"На початку речення як обставина вживається прислівник Suddenly."}$g350$, 18),
  ($g351$ch_26$g351$, $g352$choice$g352$, $g353$elementary$g353$, $g354${"id":"ch_26","level":"elementary","before":"The letterbox rattled","options":["gentle","gently"],"after":"and an envelope fell onto the doormat.","correct":"gently","explanation":"Описуємо дію дієслова rattled — прислівник gently."}$g354$, 19),
  ($g355$ch_27$g355$, $g356$choice$g356$, $g357$elementary$g357$, $g358${"id":"ch_27","level":"elementary","before":"An envelope fell","options":["soft","softly"],"after":"onto the doormat.","correct":"softly","explanation":"Як саме впав конверт — прислівник softly."}$g358$, 20),
  ($g359$ch_28$g359$, $g360$choice$g360$, $g361$intermediate$g361$, $g362${"id":"ch_28","level":"intermediate","before":"Picking it up, Lucy noticed","options":["miserable","miserably"],"after":"that it was a bill.","correct":"miserably","explanation":"Прислівник описує дієслово noticed."}$g362$, 21),
  ($g363$ch_29$g363$, $g364$choice$g364$, $g365$intermediate$g365$, $g366${"id":"ch_29","level":"intermediate","before":"There were no cards, no presents and no","options":["pretty","prettily"],"after":"bouquets of flowers.","correct":"pretty","explanation":"Тут потрібен прикметник до іменника bouquets — pretty («гарні»)."}$g366$, 22),
  ($g367$ch_30$g367$, $g368$choice$g368$, $g369$intermediate$g369$, $g370${"id":"ch_30","level":"intermediate","before":"Lucy","options":["near","nearly"],"after":"burst into tears.","correct":"nearly","explanation":"Nearly = «майже»."}$g370$, 23),
  ($g371$ch_31$g371$, $g372$choice$g372$, $g373$elementary$g373$, $g374${"id":"ch_31","level":"elementary","before":"Just then, there was a","options":["loud","loudly"],"after":"knock on the door.","correct":"loud","explanation":"Описуємо іменник knock — потрібен прикметник loud."}$g374$, 24),
  ($g375$ch_32$g375$, $g376$choice$g376$, $g377$elementary$g377$, $g378${"id":"ch_32","level":"elementary","before":"Opening the door","options":["slow","slowly"],"after":", Lucy saw all her friends.","correct":"slowly","explanation":"Як вона відчиняла двері — прислівник slowly."}$g378$, 25),
  ($g379$ch_33$g379$, $g380$choice$g380$, $g381$intermediate$g381$, $g382${"id":"ch_33","level":"intermediate","before":"Her friends were holding","options":["brightly","bright"],"after":"wrapped gifts.","correct":"brightly","explanation":"Прислівник описує дієприкметник wrapped: brightly wrapped = «яскраво загорнуті»."}$g382$, 26),
  ($g383$ch_34$g383$, $g384$choice$g384$, $g385$elementary$g385$, $g386${"id":"ch_34","level":"elementary","before":"Lucy","options":["immediate","immediately"],"after":"cheered up.","correct":"immediately","explanation":"Описуємо дієслово cheered up — прислівник."}$g386$, 27),
  ($g387$ch_35$g387$, $g388$choice$g388$, $g389$elementary$g389$, $g390${"id":"ch_35","level":"elementary","before":"She greeted her friends","options":["warm","warmly"],"after":".","correct":"warmly","explanation":"Як саме привітала — прислівник warmly."}$g390$, 28),
  ($g391$ch_36$g391$, $g392$choice$g392$, $g393$intermediate$g393$, $g394${"id":"ch_36","level":"intermediate","before":"He enjoyed designing","options":["brightly coloured","coloured brightly"],"after":"clothes.","correct":"brightly coloured","explanation":"Прислівник стоїть ПЕРЕД дієприкметником, який описує іменник."}$g394$, 29),
  ($g395$ch_37$g395$, $g396$choice$g396$, $g397$intermediate$g397$, $g398${"id":"ch_37","level":"intermediate","before":"He","options":["worked very hard","very hard worked"],"after":"throughout his career.","correct":"worked very hard","explanation":"Прислівник способу дії (very hard) стоїть після дієслова."}$g398$, 30),
  ($g399$ch_38$g399$, $g400$choice$g400$, $g401$intermediate$g401$, $g402${"id":"ch_38","level":"intermediate","before":"By 1982, he was","options":["incredibly famous","famous incredibly"],"after":"and had won the first of many awards.","correct":"incredibly famous","explanation":"Прислівник ступеня стоїть перед прикметником."}$g402$, 31),
  ($g403$ch_39$g403$, $g404$choice$g404$, $g405$intermediate$g405$, $g406${"id":"ch_39","level":"intermediate","before":"His clothes were","options":["extremely popular","popular extremely"],"after":"with famous musicians, such as Elton John and George Michael.","correct":"extremely popular","explanation":"Degree-прислівник — завжди перед прикметником."}$g406$, 32),
  ($g407$ch_40$g407$, $g408$choice$g408$, $g409$advanced$g409$, $g410${"id":"ch_40","level":"advanced","before":"He was","options":["frequently asked","asked frequently"],"after":"to design costumes for ballets, shows and concerts.","correct":"frequently asked","explanation":"Прислівник частотності стоїть після допоміжного дієслова (was) і перед основним."}$g410$, 33),
  ($g411$ch_41$g411$, $g412$choice$g412$, $g413$advanced$g413$, $g414${"id":"ch_41","level":"advanced","before":"He was","options":["greatly respected","respected greatly"],"after":"by other fashion designers.","correct":"greatly respected","explanation":"Прислівник ступеня в пасиві ставимо між допоміжним і основним дієсловом."}$g414$, 34),
  ($g415$ch_42$g415$, $g416$choice$g416$, $g417$advanced$g417$, $g418${"id":"ch_42","level":"advanced","before":"","options":["Sadly, Versace died","Versace died sadly"],"after":"in 1997, at the age of fifty.","correct":"Sadly, Versace died","explanation":"Sadly тут оцінює ВСЕ речення, тому виноситься на початок. «Died sadly» означало б спосіб смерті."}$g418$, 35),
  ($g419$ch_43$g419$, $g420$choice$g420$, $g421$advanced$g421$, $g422${"id":"ch_43","level":"advanced","before":"Being a nurse is a","options":["quite","pretty"],"after":"stressful job.","correct":"pretty","explanation":"Після артикля a/an вживаємо pretty або fairly, а quite ставиться ПЕРЕД артиклем (quite a stressful job)."}$g422$, 36),
  ($g423$ch_44$g423$, $g424$choice$g424$, $g425$advanced$g425$, $g426${"id":"ch_44","level":"advanced","before":"He has","options":["rather","fairly"],"after":"a funny name.","correct":"rather","explanation":"Конструкція rather + a/an можлива, а fairly вимагає артикля перед собою (a fairly funny name)."}$g426$, 37),
  ($g427$ch_45$g427$, $g428$choice$g428$, $g429$advanced$g429$, $g430${"id":"ch_45","level":"advanced","before":"Jane is","options":["rather","quite"],"after":"more athletic than Susan.","correct":"rather","explanation":"Лише rather вживається з вищим ступенем (rather + comparative)."}$g430$, 38),
  ($g431$ch_46$g431$, $g432$choice$g432$, $g433$advanced$g433$, $g434${"id":"ch_46","level":"advanced","before":"She stayed out","options":["rather","fairly"],"after":"too late last night.","correct":"rather","explanation":"Сполука rather too — стала; fairly too не вживається."}$g434$, 39),
  ($g435$ch_47$g435$, $g436$choice$g436$, $g437$advanced$g437$, $g438${"id":"ch_47","level":"advanced","before":"That story was","options":["quite","rather"],"after":"true.","correct":"quite","explanation":"З абсолютними прикметниками (true, useless, certain) quite означає «повністю»."}$g438$, 40),
  ($g439$ch_48$g439$, $g440$choice$g440$, $g441$advanced$g441$, $g442${"id":"ch_48","level":"advanced","before":"She is","options":["quite","fairly"],"after":"a friendly woman.","correct":"quite","explanation":"Порядок quite + a/an + adjective; fairly ставиться після артикля."}$g442$, 41),
  ($g443$ch_49$g443$, $g444$choice$g444$, $g445$advanced$g445$, $g446${"id":"ch_49","level":"advanced","before":"I didn't expect to enjoy the film, but it was","options":["fairly","rather"],"after":"brilliant.","correct":"rather","explanation":"Rather передає несподіванку: вийшло краще, ніж очікували."}$g446$, 42),
  ($g447$ch_50$g447$, $g448$choice$g448$, $g449$advanced$g449$, $g450${"id":"ch_50","level":"advanced","before":"He is","options":["rather","fairly"],"after":"good at his job, but he sometimes makes mistakes.","correct":"fairly","explanation":"Fairly — найслабший ступінь: «непогано, але не ідеально»."}$g450$, 43)
) as v(lid, type, level, payload, pos)
on conflict (legacy_id) where student_id is null do update set
  type = excluded.type, level = excluded.level,
  payload = excluded.payload, position = excluded.position;

with t as (select id from public.topics where slug = $g640$adverbs$g640$)
insert into public.exercises (topic_id, legacy_id, type, level, payload, position, source)
select t.id, v.lid, v.type, v.level, v.payload::jsonb, v.pos, 'book' from t, (values
  ($g451$ch_51$g451$, $g452$choice$g452$, $g453$advanced$g453$, $g454${"id":"ch_51","level":"advanced","before":"It was a","options":["fairly","quite"],"after":"interesting book, but it wasn't the best I've read.","correct":"fairly","explanation":"Після артикля можливе лише fairly; окрім того, значення слабке — «доволі цікава»."}$g454$, 44),
  ($g455$ch_52$g455$, $g456$choice$g456$, $g457$advanced$g457$, $g458${"id":"ch_52","level":"advanced","before":"This tin opener doesn't work. It's","options":["fairly","quite"],"after":"useless.","correct":"quite","explanation":"Useless — абсолютний прикметник, із ним quite = «абсолютно»."}$g458$, 45),
  ($g459$ch_53$g459$, $g460$choice$g460$, $g461$advanced$g461$, $g462${"id":"ch_53","level":"advanced","before":"It was","options":["pretty","rather"],"after":"a long way from the station to the hotel.","correct":"rather","explanation":"Перед артиклем вживається rather; pretty ставиться лише ПІСЛЯ артикля (a pretty long way)."}$g462$, 46),
  ($g463$ch_54$g463$, $g464$choice$g464$, $g465$advanced$g465$, $g466${"id":"ch_54","level":"advanced","before":"It was","options":["rather","pretty"],"after":"a waste of time watering the plants. It's raining now.","correct":"rather","explanation":"Знову конструкція rather + a/an + noun."}$g466$, 47),
  ($g467$gap_17$g467$, $g468$gap$g468$, $g469$elementary$g469$, $g470${"id":"gap_17","level":"elementary","prompt":"Julia heard someone call her name ______ (loud).","answers":["loudly"],"explanation":"Додаємо -ly до прикметника: loud → loudly."}$g470$, 0),
  ($g471$gap_18$g471$, $g472$gap$g472$, $g473$elementary$g473$, $g474${"id":"gap_18","level":"elementary","prompt":"She looked ______ (nervous) behind her.","answers":["nervously"],"explanation":"nervous → nervously."}$g474$, 1),
  ($g475$gap_19$g475$, $g476$gap$g476$, $g477$elementary$g477$, $g478${"id":"gap_19","level":"elementary","prompt":"The street was ______ (complete) empty.","answers":["completely"],"explanation":"complete → completely (прислівник ступеня перед прикметником)."}$g478$, 2),
  ($g479$gap_20$g479$, $g480$gap$g480$, $g481$elementary$g481$, $g482${"id":"gap_20","level":"elementary","prompt":"______ (Sudden), she heard her name again.","answers":["suddenly"],"explanation":"sudden → suddenly; на початку речення як обставина."}$g482$, 3),
  ($g483$gap_21$g483$, $g484$gap$g484$, $g485$elementary$g485$, $g486${"id":"gap_21","level":"elementary","prompt":"She turned to see her brother running towards her, smiling ______ (cheerful).","answers":["cheerfully"],"explanation":"Прикметник на -l бере -ly: cheerful → cheerfully."}$g486$, 4),
  ($g487$gap_22$g487$, $g488$gap$g488$, $g489$elementary$g489$, $g490${"id":"gap_22","level":"elementary","prompt":"'Didn't you hear me?' he laughed ______ (happy).","answers":["happily"],"explanation":"Приголосний + -y → -ily: happy → happily."}$g490$, 5),
  ($g491$gap_23$g491$, $g492$gap$g492$, $g493$intermediate$g493$, $g494${"id":"gap_23","level":"intermediate","prompt":"'You ______ (near) frightened me to death!'","answers":["nearly"],"explanation":"Nearly = «майже», а не near («близько»)."}$g494$, 6),
  ($g495$abcd_1$g495$, $g496$abcd$g496$, $g497$elementary$g497$, $g498${"id":"abcd_1","level":"elementary","q":"1. If you drive ______ you could have an accident.","options":["A) reckless","B) recklessly","C) more reckless","D) more recklessly"],"correct":1,"explanation":"Описуємо дієслово drive — потрібен прислівник recklessly."}$g498$, 0),
  ($g499$abcd_2$g499$, $g500$abcd$g500$, $g501$elementary$g501$, $g502${"id":"abcd_2","level":"elementary","q":"2. The teacher explained the assignment ______.","options":["A) careful","B) carefully","C) more carefully","D) most careful"],"correct":1,"explanation":"Прислівник способу дії до explained; порівняння в реченні немає."}$g502$, 1),
  ($g503$abcd_3$g503$, $g504$abcd$g504$, $g505$elementary$g505$, $g506${"id":"abcd_3","level":"elementary","q":"3. There was a ______ noise last night. Did you hear it?","options":["A) loud","B) louder","C) loudly","D) more loudly"],"correct":0,"explanation":"Перед іменником noise потрібен прикметник loud."}$g506$, 2),
  ($g507$abcd_4$g507$, $g508$abcd$g508$, $g509$elementary$g509$, $g510${"id":"abcd_4","level":"elementary","q":"4. Paul walks so ______ in his new boots.","options":["A) loud","B) louder","C) loudly","D) more loudly"],"correct":2,"explanation":"Описуємо дієслово walks — прислівник loudly."}$g510$, 3),
  ($g511$abcd_5$g511$, $g512$abcd$g512$, $g513$elementary$g513$, $g514${"id":"abcd_5","level":"elementary","q":"5. Jason ate his dinner very ______.","options":["A) quick","B) quicker","C) most quickly","D) quickly"],"correct":3,"explanation":"Very + прислівник у звичайному ступені: very quickly."}$g514$, 4),
  ($g515$abcd_6$g515$, $g516$abcd$g516$, $g517$intermediate$g517$, $g518${"id":"abcd_6","level":"intermediate","q":"6. Those apples look ______. May I have one?","options":["A) delicious","B) most delicious","C) deliciously","D) most deliciously"],"correct":0,"explanation":"Look тут дієслово-зв'язка, тому після нього прикметник."}$g518$, 5),
  ($g519$abcd_7$g519$, $g520$abcd$g520$, $g521$intermediate$g521$, $g522${"id":"abcd_7","level":"intermediate","q":"7. He is an awful driver. He never stops the car ______.","options":["A) smooth","B) smoothly","C) more smooth","D) more smoothly"],"correct":1,"explanation":"Описуємо, ЯК він зупиняє авто — прислівник smoothly."}$g522$, 6),
  ($g523$abcd_8$g523$, $g524$abcd$g524$, $g525$elementary$g525$, $g526${"id":"abcd_8","level":"elementary","q":"8. Pavarotti is an opera singer. He sings ______.","options":["A) beautiful","B) beautifully","C) most beautifully","D) more beautiful"],"correct":1,"explanation":"Sing — дія, тому прислівник beautifully."}$g526$, 7),
  ($g527$abcd_9$g527$, $g528$abcd$g528$, $g529$intermediate$g529$, $g530${"id":"abcd_9","level":"intermediate","q":"9. This situation requires a ______ investigation.","options":["A) serious","B) seriously","C) most serious","D) more seriously"],"correct":0,"explanation":"Перед іменником investigation потрібен прикметник."}$g530$, 8),
  ($g531$abcd_10$g531$, $g532$abcd$g532$, $g533$intermediate$g533$, $g534${"id":"abcd_10","level":"intermediate","q":"10. Sometimes, driving at night can be very ______.","options":["A) dangerously","B) more dangerously","C) most dangerous","D) dangerous"],"correct":3,"explanation":"Після be + very вживаємо прикметник dangerous."}$g534$, 9),
  ($g535$abcd_11$g535$, $g536$abcd$g536$, $g537$elementary$g537$, $g538${"id":"abcd_11","level":"elementary","q":"11. They shouted ______ at each other.","options":["A) angry","B) angrier","C) angriest","D) angrily"],"correct":3,"explanation":"Прислівник до дієслова shouted — angrily."}$g538$, 10),
  ($g539$abcd_12$g539$, $g540$abcd$g540$, $g541$elementary$g541$, $g542${"id":"abcd_12","level":"elementary","q":"12. If you ask ______, I will give it to you.","options":["A) polite","B) politely","C) more polite","D) most politely"],"correct":1,"explanation":"Описуємо дієслово ask — прислівник politely."}$g542$, 11),
  ($g543$abcd_13$g543$, $g544$abcd$g544$, $g545$elementary$g545$, $g546${"id":"abcd_13","level":"elementary","q":"13. Try to speak ______ if you are giving a speech.","options":["A) clear","B) clearly","C) clearer","D) more clear"],"correct":1,"explanation":"Прислівник до speak — clearly."}$g546$, 12),
  ($g547$abcd_14$g547$, $g548$abcd$g548$, $g549$elementary$g549$, $g550${"id":"abcd_14","level":"elementary","q":"14. Why are you so ______?","options":["A) angry","B) angrier","C) angrily","D) more angrily"],"correct":0,"explanation":"Після be + so вживаємо прикметник angry."}$g550$, 13),
  ($g551$abcd_15$g551$, $g552$abcd$g552$, $g553$elementary$g553$, $g554${"id":"abcd_15","level":"elementary","q":"15. He is a ______ driver.","options":["A) careless","B) carelessly","C) more careless","D) most careless"],"correct":0,"explanation":"Перед іменником driver — прикметник careless."}$g554$, 14),
  ($g555$abcd_16$g555$, $g556$abcd$g556$, $g557$elementary$g557$, $g558${"id":"abcd_16","level":"elementary","q":"16. Frank always works so ______!","options":["A) slow","B) slower","C) slowerly","D) slowly"],"correct":3,"explanation":"Прислівник до works — slowly (форми slowerly не існує)."}$g558$, 15),
  ($g559$abcd_17$g559$, $g560$abcd$g560$, $g561$intermediate$g561$, $g562${"id":"abcd_17","level":"intermediate","q":"17. Samantha speaks so ______ that I can't understand her.","options":["A) fast","B) fastly","C) in a fast way","D) faster"],"correct":0,"explanation":"Fast має однакову форму прикметника і прислівника; слова fastly не існує."}$g562$, 16),
  ($g563$abcd_18$g563$, $g564$abcd$g564$, $g565$elementary$g565$, $g566${"id":"abcd_18","level":"elementary","q":"18. Sonia opened the door ______.","options":["A) slow","B) slowly","C) slowest","D) more slowly"],"correct":1,"explanation":"Прислівник способу дії без порівняння — slowly."}$g566$, 17),
  ($g567$abcd_19$g567$, $g568$abcd$g568$, $g569$elementary$g569$, $g570${"id":"abcd_19","level":"elementary","q":"19. It is a beautiful ______ day.","options":["A) clear","B) clearly","C) clearer","D) clearest"],"correct":0,"explanation":"Другий прикметник перед іменником day — clear."}$g570$, 18),
  ($g571$abcd_20$g571$, $g572$abcd$g572$, $g573$intermediate$g573$, $g574${"id":"abcd_20","level":"intermediate","q":"20. Jessica writes so ______. Look at these mistakes!","options":["A) careless","B) more careless","C) carelessly","D) more carelessly"],"correct":2,"explanation":"Описуємо дієслово writes — прислівник carelessly."}$g574$, 19),
  ($g575$abcd_21$g575$, $g576$abcd$g576$, $g577$intermediate$g577$, $g578${"id":"abcd_21","level":"intermediate","q":"21. Taras drives ______. I am afraid to go with him.","options":["A) dangerous","B) dangerously","C) more dangerous","D) dangerouslyer"],"correct":1,"explanation":"Прислівник до drives — dangerously."}$g578$, 20),
  ($g579$abcd_22$g579$, $g580$abcd$g580$, $g581$advanced$g581$, $g582${"id":"abcd_22","level":"advanced","q":"22. I didn't sleep ______ last night, so I feel ______ today.","options":["A) good, terrible","B) well, terrible","C) well, terribly","D) terribly, well"],"correct":1,"explanation":"Sleep потребує прислівника well, а feel — дієслово-зв'язка, тому після нього прикметник terrible."}$g582$, 21),
  ($g583$abcd_23$g583$, $g584$abcd$g584$, $g585$intermediate$g585$, $g586${"id":"abcd_23","level":"intermediate","q":"23. Lee is a ______ speller.","options":["A) bad","B) badly","C) worse","D) worst"],"correct":0,"explanation":"Перед іменником speller — прикметник bad."}$g586$, 22),
  ($g587$abcd_24$g587$, $g588$abcd$g588$, $g589$advanced$g589$, $g590${"id":"abcd_24","level":"advanced","q":"24. He met them ______.","options":["A) friend","B) friendly","C) in a friendly way","D) more friendly"],"correct":2,"explanation":"Friendly — прикметник; прислівник утворюється описово: in a friendly way."}$g590$, 23),
  ($g591$abcd_25$g591$, $g592$abcd$g592$, $g593$intermediate$g593$, $g594${"id":"abcd_25","level":"intermediate","q":"25. Please try to be more ______.","options":["A) careful","B) carefully","C) more carefully","D) more careful"],"correct":0,"explanation":"Після be вживаємо прикметник, а more вже є в реченні."}$g594$, 24),
  ($g595$abcd_26$g595$, $g596$abcd$g596$, $g597$intermediate$g597$, $g598${"id":"abcd_26","level":"intermediate","q":"26. If you want tourists to visit your country, you must treat them ______.","options":["A) pleasant","B) pleased","C) pleasantly","D) pleasing"],"correct":2,"explanation":"Описуємо дієслово treat — прислівник pleasantly."}$g598$, 25),
  ($g599$abcd_27$g599$, $g600$abcd$g600$, $g601$elementary$g601$, $g602${"id":"abcd_27","level":"elementary","q":"27. Lola played the piano ______.","options":["A) perfect","B) perfectly","C) more perfect","D) the perfectliest"],"correct":1,"explanation":"Прислівник до played — perfectly."}$g602$, 26),
  ($g603$abcd_28$g603$, $g604$abcd$g604$, $g605$intermediate$g605$, $g606${"id":"abcd_28","level":"intermediate","q":"28. Max is a ______ talker, but he never listens.","options":["A) fast","B) fastly","C) faster","D) fastest"],"correct":0,"explanation":"Перед іменником talker — прикметник fast."}$g606$, 27),
  ($g607$abcd_29$g607$, $g608$abcd$g608$, $g609$elementary$g609$, $g610${"id":"abcd_29","level":"elementary","q":"29. Shannon writes very ______.","options":["A) neat","B) neatly","C) neatlier","D) more neat"],"correct":1,"explanation":"Very + прислівник neatly описує дієслово writes."}$g610$, 28),
  ($g611$abcd_30$g611$, $g612$abcd$g612$, $g613$advanced$g613$, $g614${"id":"abcd_30","level":"advanced","q":"30. Kate is the best student in class. She studies ______.","options":["A) hard","B) harder","C) hardest","D) hardly"],"correct":2,"explanation":"Контекст «the best student» задає найвищий ступінь: studies hardest. Hardly означало б «майже не вчиться»."}$g614$, 29),
  ($g615$abcd_31$g615$, $g616$abcd$g616$, $g617$intermediate$g617$, $g618${"id":"abcd_31","level":"intermediate","q":"31. They finished their task ______ than their friends.","options":["A) quick","B) quickly","C) more quickly","D) more quicker"],"correct":2,"explanation":"Than вимагає вищого ступеня прислівника: more quickly."}$g618$, 30),
  ($g619$abcd_32$g619$, $g620$abcd$g620$, $g621$elementary$g621$, $g622${"id":"abcd_32","level":"elementary","q":"32. Fanny can sew dresses so ______.","options":["A) good","B) well","C) better","D) best"],"correct":1,"explanation":"Прислівник від good — well."}$g622$, 31),
  ($g623$abcd_33$g623$, $g624$abcd$g624$, $g625$advanced$g625$, $g626${"id":"abcd_33","level":"advanced","q":"33. Although Dan felt very ______ he smiled ______.","options":["A) angrily, widely","B) angry, widely","C) widely, angry","D) wide, angry"],"correct":1,"explanation":"Feel — дієслово-зв'язка (прикметник angry), smile — дія (прислівник widely)."}$g626$, 32),
  ($g627$abcd_34$g627$, $g628$abcd$g628$, $g629$intermediate$g629$, $g630${"id":"abcd_34","level":"intermediate","q":"34. Margaret has a ______ collection of hairpins.","options":["A) modern","B) moderner","C) more modern","D) modernly"],"correct":0,"explanation":"Перед іменником collection — прикметник modern без порівняння."}$g630$, 33),
  ($g631$abcd_35$g631$, $g632$abcd$g632$, $g633$intermediate$g633$, $g634${"id":"abcd_35","level":"intermediate","q":"35. She kept tapping her fingers ______.","options":["A) nervous","B) nervously","C) more nervous","D) more nervously"],"correct":1,"explanation":"Описуємо дію tapping — прислівник nervously."}$g634$, 34),
  ($g635$abcd_36$g635$, $g636$abcd$g636$, $g637$elementary$g637$, $g638${"id":"abcd_36","level":"elementary","q":"36. Denis always helps his old-aged neighbours. He is so ______.","options":["A) polite","B) politer","C) more politely","D) politely"],"correct":0,"explanation":"Після be + so вживаємо прикметник polite."}$g638$, 35)
) as v(lid, type, level, payload, pos)
on conflict (legacy_id) where student_id is null do update set
  type = excluded.type, level = excluded.level,
  payload = excluded.payload, position = excluded.position;

commit;

-- Контроль: очікуємо 7 блоків теорії і 107 вправ
select
  (select count(*) from public.theory_blocks tb join public.topics t on t.id = tb.topic_id
    where t.slug = $g641$adverbs$g641$) as theory_blocks,
  (select count(*) from public.exercises e join public.topics t on t.id = e.topic_id
    where t.slug = $g642$adverbs$g642$ and e.student_id is null) as exercises;

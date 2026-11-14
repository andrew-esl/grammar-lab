-- 15_exercise_groups.sql
-- Групування вправ за номерами з підручника («Exercise N»).
-- Додає в payload поля group, instruction та (для пунктів, де перший пункт у книзі — приклад) no.
-- Нічого не видаляє й не дублює: можна запускати повторно.

-- adjectives: Exercise 1 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '1'::jsonb, 'instruction', 'Underline the opinion adjectives, circle the fact ones, then put them in order.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('ord_1', 2),
    ('ord_2', 3),
    ('ord_3', 4),
    ('ord_4', 5),
    ('ord_5', 6),
    ('ord_6', 7),
    ('ord_7', 8),
    ('ord_8', 9),
    ('ord_9', 10)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adjectives: Exercise 2 (5)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '2'::jsonb, 'instruction', 'Put the adjectives in the correct order.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('ord_10', 2),
    ('ord_11', 3),
    ('ord_12', 4),
    ('ord_13', 5),
    ('ord_14', 6)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adjectives: Exercise 3 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '3'::jsonb, 'instruction', 'Fill in: the + adjective or the + adjective + people.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('gap_1', 2),
    ('gap_2', 3),
    ('gap_3', 4),
    ('gap_4', 5),
    ('gap_5', 6),
    ('gap_6', 7),
    ('gap_7', 8),
    ('gap_8', 9),
    ('gap_9', 10)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adjectives: Exercise 4 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '4'::jsonb, 'instruction', 'Make compound adjectives to describe the following.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('gap_10', 2),
    ('gap_11', 3),
    ('gap_12', 4),
    ('gap_13', 5),
    ('gap_14', 6),
    ('gap_15', 7),
    ('gap_16', 8)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adjectives: Exercise 5 (6)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '5'::jsonb, 'instruction', 'Underline the correct item.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('ch_1', 2),
    ('ch_2', 3),
    ('ch_3', 4),
    ('ch_4', 5),
    ('ch_5', 6),
    ('ch_6', 7)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adverbs: Exercise 6 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '6'::jsonb, 'instruction', 'For each gap, turn the adjective into an adverb.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('gap_17', 2),
    ('gap_18', 3),
    ('gap_19', 4),
    ('gap_20', 5),
    ('gap_21', 6),
    ('gap_22', 7),
    ('gap_23', 8)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 7 (16)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '7'::jsonb, 'instruction', 'Underline the correct item.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('ch_7', 1),
    ('ch_8', 2),
    ('ch_9', 3),
    ('ch_10', 4),
    ('ch_11', 5),
    ('ch_12', 6),
    ('ch_13', 7),
    ('ch_14', 8),
    ('ch_15', 9),
    ('ch_16', 10),
    ('ch_17', 11),
    ('ch_18', 12),
    ('ch_19', 13),
    ('ch_20', 14),
    ('ch_21', 15),
    ('ch_22', 16)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 8 (13)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '8'::jsonb, 'instruction', 'Underline the correct item.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('ch_23', 1),
    ('ch_24', 2),
    ('ch_25', 3),
    ('ch_26', 4),
    ('ch_27', 5),
    ('ch_28', 6),
    ('ch_29', 7),
    ('ch_30', 8),
    ('ch_31', 9),
    ('ch_32', 10),
    ('ch_33', 11),
    ('ch_34', 12),
    ('ch_35', 13)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 9 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '9'::jsonb, 'instruction', 'Put the adverbs in brackets in the correct place in the sentences, as in the example.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('ch_36', 2),
    ('ch_37', 3),
    ('ch_38', 4),
    ('ch_39', 5),
    ('ch_40', 6),
    ('ch_41', 7),
    ('ch_42', 8)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 10 (14)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '10'::jsonb, 'instruction', 'Say the sentences in as many ways as possible, using the adverbs in brackets.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('ord_15', 2),
    ('ord_16', 3),
    ('ord_17', 4),
    ('ord_18', 5),
    ('ord_19', 6),
    ('ord_20', 7),
    ('ord_21', 8),
    ('ord_22', 9),
    ('ord_23', 10),
    ('ord_24', 11),
    ('ord_25', 12),
    ('ord_26', 13),
    ('ord_27', 14),
    ('ord_28', 15)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 11 (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '11'::jsonb, 'instruction', 'Underline the correct word.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('ch_43', 1),
    ('ch_44', 2),
    ('ch_45', 3),
    ('ch_46', 4),
    ('ch_47', 5),
    ('ch_48', 6),
    ('ch_49', 7),
    ('ch_50', 8),
    ('ch_51', 9),
    ('ch_52', 10),
    ('ch_53', 11),
    ('ch_54', 12)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- nouns: Exercise A (34)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"A"'::jsonb, 'instruction', 'Write the plural forms of these nouns.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('gap_1_nouns', null::int),
    ('gap_2_nouns', null::int),
    ('gap_3_nouns', null::int),
    ('gap_4_nouns', null::int),
    ('gap_5_nouns', null::int),
    ('gap_6_nouns', null::int),
    ('gap_7_nouns', null::int),
    ('gap_8_nouns', null::int),
    ('gap_9_nouns', null::int),
    ('gap_10_nouns', null::int),
    ('gap_11_nouns', null::int),
    ('gap_12_nouns', null::int),
    ('gap_13_nouns', null::int),
    ('gap_14_nouns', null::int),
    ('gap_15_nouns', null::int),
    ('gap_16_nouns', null::int),
    ('gap_17_nouns', null::int),
    ('gap_18_nouns', null::int),
    ('gap_19_nouns', null::int),
    ('gap_20_nouns', null::int),
    ('gap_21_nouns', null::int),
    ('gap_22_nouns', null::int),
    ('gap_23_nouns', null::int),
    ('gap_24_nouns', null::int),
    ('gap_25_nouns', null::int),
    ('gap_26_nouns', null::int),
    ('gap_27_nouns', null::int),
    ('gap_28_nouns', null::int),
    ('gap_29_nouns', null::int),
    ('gap_30_nouns', null::int),
    ('gap_31_nouns', null::int),
    ('gap_32_nouns', null::int),
    ('gap_33_nouns', null::int),
    ('gap_34_nouns', null::int)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise B (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"B"'::jsonb, 'instruction', 'Write the plural forms of these nouns.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('gap_35_nouns', null::int),
    ('gap_36_nouns', null::int),
    ('gap_37_nouns', null::int),
    ('gap_38_nouns', null::int),
    ('gap_39_nouns', null::int),
    ('gap_40_nouns', null::int),
    ('gap_41_nouns', null::int),
    ('gap_42_nouns', null::int),
    ('gap_43_nouns', null::int),
    ('gap_44_nouns', null::int),
    ('gap_45_nouns', null::int),
    ('gap_46_nouns', null::int)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise C (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"C"'::jsonb, 'instruction', 'Write the plural forms of these nouns.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('gap_47_nouns', null::int),
    ('gap_48_nouns', null::int),
    ('gap_49_nouns', null::int),
    ('gap_50_nouns', null::int),
    ('gap_51_nouns', null::int),
    ('gap_52_nouns', null::int),
    ('gap_53_nouns', null::int),
    ('gap_54_nouns', null::int),
    ('gap_55_nouns', null::int)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise D (15)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"D"'::jsonb, 'instruction', 'Write the plural forms of these nouns.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('gap_56_nouns', null::int),
    ('gap_57_nouns', null::int),
    ('gap_58_nouns', null::int),
    ('gap_59_nouns', null::int),
    ('gap_60_nouns', null::int),
    ('gap_61_nouns', null::int),
    ('gap_62_nouns', null::int),
    ('gap_63_nouns', null::int),
    ('gap_64_nouns', null::int),
    ('gap_65_nouns', null::int),
    ('gap_66_nouns', null::int),
    ('gap_67_nouns', null::int),
    ('gap_68_nouns', null::int),
    ('gap_69_nouns', null::int),
    ('gap_70_nouns', null::int)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise 4 (21)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '4'::jsonb, 'instruction', 'Underline the correct verb form.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('ch_1_nouns', 1),
    ('ch_2_nouns', 2),
    ('ch_3_nouns', 3),
    ('ch_4_nouns', 4),
    ('ch_5_nouns', 5),
    ('ch_6_nouns', 6),
    ('ch_7_nouns', 7),
    ('ch_8_nouns', 8),
    ('ch_9_nouns', 9),
    ('ch_10_nouns', 10),
    ('ch_11_nouns', 11),
    ('ch_12_nouns', 12),
    ('ch_13_nouns', 13),
    ('ch_14_nouns', 14),
    ('ch_15_nouns', 15),
    ('ch_16_nouns', 16),
    ('ch_17_nouns', 17),
    ('ch_18_nouns', 18),
    ('ch_19_nouns', 19),
    ('ch_20_nouns', 20),
    ('ch_21_nouns', 21)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise 5 (19)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '5'::jsonb, 'instruction', 'Put the verbs in brackets into the correct form.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('gap_71_nouns', 2),
    ('gap_72_nouns', 3),
    ('gap_73_nouns', 4),
    ('gap_74_nouns', 5),
    ('gap_75_nouns', 6),
    ('gap_76_nouns', 7),
    ('gap_77_nouns', 8),
    ('gap_78_nouns', 9),
    ('gap_79_nouns', 10),
    ('gap_80_nouns', 11),
    ('gap_81_nouns', 12),
    ('gap_82_nouns', 13),
    ('gap_83_nouns', 14),
    ('gap_84_nouns', 15),
    ('gap_85_nouns', 16),
    ('gap_86_nouns', 17),
    ('gap_87_nouns', 18),
    ('gap_88_nouns', 19),
    ('gap_89_nouns', 20)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise 6 (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '6'::jsonb, 'instruction', 'Finish the second sentence so that it has the same meaning as the first sentence.')
       || case when v.no is null then '{}'::jsonb else jsonb_build_object('no', v.no) end
  from (values
    ('gap_90_nouns', 2),
    ('gap_91_nouns', 3),
    ('gap_92_nouns', 4),
    ('gap_93_nouns', 5),
    ('gap_94_nouns', 6),
    ('gap_95_nouns', 7),
    ('gap_96_nouns', 8),
    ('gap_97_nouns', 9),
    ('gap_98_nouns', 10),
    ('gap_99_nouns', 11),
    ('gap_100_nouns', 12),
    ('gap_101_nouns', 13)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- Exercise 1, пункт 2 у книзі містить ще й слово «ancient» (раніше було пропущене)
update exercises
   set payload = payload || '{"answer":"small ancient stone cottage","scrambled":["stone","ancient","small","cottage"],"hint":"Size → Age → Material → Noun"}'::jsonb
 where legacy_id = 'ord_1' and student_id is null
   and topic_id = (select id from topics where slug = 'adjectives');

-- Контроль: скільки вправ отримали групу
select t.slug, count(*) filter (where e.payload ? 'group') as grouped, count(*) as total
  from exercises e join topics t on t.id = e.topic_id
 where e.student_id is null and t.slug in ('adjectives','adverbs','nouns','comparisons')
 group by t.slug order by t.slug;

-- 15_exercise_groups.sql
-- 1) групування вправ за номерами з підручника («Exercise N»);
-- 2) підтеми в кожній темі; 3) Verbals розбивається на Infinitive, Gerund, Participle.
-- Додає в payload поля group, instruction та (для пунктів, де перший пункт у книзі — приклад) no.
-- Нічого не видаляє й не дублює: можна запускати повторно.

-- adjectives: Exercise 1 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '1'::jsonb, 'instruction', 'Underline the opinion adjectives, circle the fact ones, then put them in order.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ord_1', '2'),
    ('ord_2', '3'),
    ('ord_3', '4'),
    ('ord_4', '5'),
    ('ord_5', '6'),
    ('ord_6', '7'),
    ('ord_7', '8'),
    ('ord_8', '9'),
    ('ord_9', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adjectives: Exercise 2 (5)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '2'::jsonb, 'instruction', 'Put the adjectives in the correct order.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ord_10', '2'),
    ('ord_11', '3'),
    ('ord_12', '4'),
    ('ord_13', '5'),
    ('ord_14', '6')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adjectives: Exercise 3 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '3'::jsonb, 'instruction', 'Fill in: the + adjective or the + adjective + people.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_1', '2'),
    ('gap_2', '3'),
    ('gap_3', '4'),
    ('gap_4', '5'),
    ('gap_5', '6'),
    ('gap_6', '7'),
    ('gap_7', '8'),
    ('gap_8', '9'),
    ('gap_9', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adjectives: Exercise 4 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '4'::jsonb, 'instruction', 'Make compound adjectives to describe the following.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_10', '2'),
    ('gap_11', '3'),
    ('gap_12', '4'),
    ('gap_13', '5'),
    ('gap_14', '6'),
    ('gap_15', '7'),
    ('gap_16', '8')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adjectives: Exercise 5 (6)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '5'::jsonb, 'instruction', 'Underline the correct item.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_1', '2'),
    ('ch_2', '3'),
    ('ch_3', '4'),
    ('ch_4', '5'),
    ('ch_5', '6'),
    ('ch_6', '7')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adjectives');

-- adverbs: Exercise 6 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '6'::jsonb, 'instruction', 'For each gap, turn the adjective into an adverb.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_17', '2'),
    ('gap_18', '3'),
    ('gap_19', '4'),
    ('gap_20', '5'),
    ('gap_21', '6'),
    ('gap_22', '7'),
    ('gap_23', '8')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 7 (16)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '7'::jsonb, 'instruction', 'Underline the correct item.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_7', '1'),
    ('ch_8', '2'),
    ('ch_9', '3'),
    ('ch_10', '4'),
    ('ch_11', '5'),
    ('ch_12', '6'),
    ('ch_13', '7'),
    ('ch_14', '8'),
    ('ch_15', '9'),
    ('ch_16', '10'),
    ('ch_17', '11'),
    ('ch_18', '12'),
    ('ch_19', '13'),
    ('ch_20', '14'),
    ('ch_21', '15'),
    ('ch_22', '16')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 8 (13)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '8'::jsonb, 'instruction', 'Underline the correct item.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_23', '1'),
    ('ch_24', '2'),
    ('ch_25', '3'),
    ('ch_26', '4'),
    ('ch_27', '5'),
    ('ch_28', '6'),
    ('ch_29', '7'),
    ('ch_30', '8'),
    ('ch_31', '9'),
    ('ch_32', '10'),
    ('ch_33', '11'),
    ('ch_34', '12'),
    ('ch_35', '13')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 9 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '9'::jsonb, 'instruction', 'Put the adverbs in brackets in the correct place in the sentences, as in the example.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_36', '2'),
    ('ch_37', '3'),
    ('ch_38', '4'),
    ('ch_39', '5'),
    ('ch_40', '6'),
    ('ch_41', '7'),
    ('ch_42', '8')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 10 (14)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '10'::jsonb, 'instruction', 'Say the sentences in as many ways as possible, using the adverbs in brackets.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ord_15', '2'),
    ('ord_16', '3'),
    ('ord_17', '4'),
    ('ord_18', '5'),
    ('ord_19', '6'),
    ('ord_20', '7'),
    ('ord_21', '8'),
    ('ord_22', '9'),
    ('ord_23', '10'),
    ('ord_24', '11'),
    ('ord_25', '12'),
    ('ord_26', '13'),
    ('ord_27', '14'),
    ('ord_28', '15')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- adverbs: Exercise 11 (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '11'::jsonb, 'instruction', 'Underline the correct word.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_43', '1'),
    ('ch_44', '2'),
    ('ch_45', '3'),
    ('ch_46', '4'),
    ('ch_47', '5'),
    ('ch_48', '6'),
    ('ch_49', '7'),
    ('ch_50', '8'),
    ('ch_51', '9'),
    ('ch_52', '10'),
    ('ch_53', '11'),
    ('ch_54', '12')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'adverbs');

-- nouns: Exercise A (34)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"A"'::jsonb, 'instruction', 'Write the plural forms of these nouns.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_1_nouns', null::text),
    ('gap_2_nouns', null::text),
    ('gap_3_nouns', null::text),
    ('gap_4_nouns', null::text),
    ('gap_5_nouns', null::text),
    ('gap_6_nouns', null::text),
    ('gap_7_nouns', null::text),
    ('gap_8_nouns', null::text),
    ('gap_9_nouns', null::text),
    ('gap_10_nouns', null::text),
    ('gap_11_nouns', null::text),
    ('gap_12_nouns', null::text),
    ('gap_13_nouns', null::text),
    ('gap_14_nouns', null::text),
    ('gap_15_nouns', null::text),
    ('gap_16_nouns', null::text),
    ('gap_17_nouns', null::text),
    ('gap_18_nouns', null::text),
    ('gap_19_nouns', null::text),
    ('gap_20_nouns', null::text),
    ('gap_21_nouns', null::text),
    ('gap_22_nouns', null::text),
    ('gap_23_nouns', null::text),
    ('gap_24_nouns', null::text),
    ('gap_25_nouns', null::text),
    ('gap_26_nouns', null::text),
    ('gap_27_nouns', null::text),
    ('gap_28_nouns', null::text),
    ('gap_29_nouns', null::text),
    ('gap_30_nouns', null::text),
    ('gap_31_nouns', null::text),
    ('gap_32_nouns', null::text),
    ('gap_33_nouns', null::text),
    ('gap_34_nouns', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise B (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"B"'::jsonb, 'instruction', 'Write the plural forms of these nouns.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_35_nouns', null::text),
    ('gap_36_nouns', null::text),
    ('gap_37_nouns', null::text),
    ('gap_38_nouns', null::text),
    ('gap_39_nouns', null::text),
    ('gap_40_nouns', null::text),
    ('gap_41_nouns', null::text),
    ('gap_42_nouns', null::text),
    ('gap_43_nouns', null::text),
    ('gap_44_nouns', null::text),
    ('gap_45_nouns', null::text),
    ('gap_46_nouns', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise C (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"C"'::jsonb, 'instruction', 'Write the plural forms of these nouns.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_47_nouns', null::text),
    ('gap_48_nouns', null::text),
    ('gap_49_nouns', null::text),
    ('gap_50_nouns', null::text),
    ('gap_51_nouns', null::text),
    ('gap_52_nouns', null::text),
    ('gap_53_nouns', null::text),
    ('gap_54_nouns', null::text),
    ('gap_55_nouns', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise D (15)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"D"'::jsonb, 'instruction', 'Write the plural forms of these nouns.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_56_nouns', null::text),
    ('gap_57_nouns', null::text),
    ('gap_58_nouns', null::text),
    ('gap_59_nouns', null::text),
    ('gap_60_nouns', null::text),
    ('gap_61_nouns', null::text),
    ('gap_62_nouns', null::text),
    ('gap_63_nouns', null::text),
    ('gap_64_nouns', null::text),
    ('gap_65_nouns', null::text),
    ('gap_66_nouns', null::text),
    ('gap_67_nouns', null::text),
    ('gap_68_nouns', null::text),
    ('gap_69_nouns', null::text),
    ('gap_70_nouns', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise 4 (21)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '4'::jsonb, 'instruction', 'Underline the correct verb form.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_1_nouns', '1'),
    ('ch_2_nouns', '2'),
    ('ch_3_nouns', '3'),
    ('ch_4_nouns', '4'),
    ('ch_5_nouns', '5'),
    ('ch_6_nouns', '6'),
    ('ch_7_nouns', '7'),
    ('ch_8_nouns', '8'),
    ('ch_9_nouns', '9'),
    ('ch_10_nouns', '10'),
    ('ch_11_nouns', '11'),
    ('ch_12_nouns', '12'),
    ('ch_13_nouns', '13'),
    ('ch_14_nouns', '14'),
    ('ch_15_nouns', '15'),
    ('ch_16_nouns', '16'),
    ('ch_17_nouns', '17'),
    ('ch_18_nouns', '18'),
    ('ch_19_nouns', '19'),
    ('ch_20_nouns', '20'),
    ('ch_21_nouns', '21')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise 5 (19)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '5'::jsonb, 'instruction', 'Put the verbs in brackets into the correct form.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_71_nouns', '2'),
    ('gap_72_nouns', '3'),
    ('gap_73_nouns', '4'),
    ('gap_74_nouns', '5'),
    ('gap_75_nouns', '6'),
    ('gap_76_nouns', '7'),
    ('gap_77_nouns', '8'),
    ('gap_78_nouns', '9'),
    ('gap_79_nouns', '10'),
    ('gap_80_nouns', '11'),
    ('gap_81_nouns', '12'),
    ('gap_82_nouns', '13'),
    ('gap_83_nouns', '14'),
    ('gap_84_nouns', '15'),
    ('gap_85_nouns', '16'),
    ('gap_86_nouns', '17'),
    ('gap_87_nouns', '18'),
    ('gap_88_nouns', '19'),
    ('gap_89_nouns', '20')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- nouns: Exercise 6 (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '6'::jsonb, 'instruction', 'Finish the second sentence so that it has the same meaning as the first sentence.')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_90_nouns', '2'),
    ('gap_91_nouns', '3'),
    ('gap_92_nouns', '4'),
    ('gap_93_nouns', '5'),
    ('gap_94_nouns', '6'),
    ('gap_95_nouns', '7'),
    ('gap_96_nouns', '8'),
    ('gap_97_nouns', '9'),
    ('gap_98_nouns', '10'),
    ('gap_99_nouns', '11'),
    ('gap_100_nouns', '12'),
    ('gap_101_nouns', '13')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'nouns');

-- articles: Exercise 72.1 (19)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"72.1"'::jsonb, 'instruction', 'Put in a/an or the.')
       || jsonb_build_object('gord', 1)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_22_nouns', '1'),
    ('ch_23_nouns', '1'),
    ('ch_24_nouns', '1'),
    ('ch_25_nouns', '2'),
    ('ch_26_nouns', '2'),
    ('ch_27_nouns', '2'),
    ('ch_28_nouns', '2'),
    ('ch_29_nouns', '2'),
    ('ch_30_nouns', '2'),
    ('ch_31_nouns', '3'),
    ('ch_32_nouns', '3'),
    ('ch_33_nouns', '3'),
    ('ch_34_nouns', '3'),
    ('ch_35_nouns', '3'),
    ('ch_36_nouns', '4'),
    ('ch_37_nouns', '4'),
    ('ch_38_nouns', '4'),
    ('ch_39_nouns', '4'),
    ('ch_40_nouns', '4')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 72.2 (16)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"72.2"'::jsonb, 'instruction', 'Put in a/an or the.')
       || jsonb_build_object('gord', 2)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_41_nouns', '1a'),
    ('ch_42_nouns', '1b'),
    ('ch_43_nouns', '1c'),
    ('ch_44_nouns', '2a'),
    ('ch_45_nouns', '2b'),
    ('ch_46_nouns', '2c'),
    ('ch_47_nouns', '3a'),
    ('ch_48_nouns', '3b'),
    ('ch_49_nouns', '3c'),
    ('ch_50_nouns', '4a'),
    ('ch_51_nouns', '4a'),
    ('ch_52_nouns', '4b'),
    ('ch_53_nouns', '4c'),
    ('ch_54_nouns', '5a'),
    ('ch_55_nouns', '5b'),
    ('ch_56_nouns', '5c')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 72.3 (14)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"72.3"'::jsonb, 'instruction', 'Put in a/an or the where necessary.')
       || jsonb_build_object('gord', 3)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_57_nouns', '2'),
    ('ch_58_nouns', '3'),
    ('ch_59_nouns', '4'),
    ('ch_60_nouns', '5'),
    ('ch_61_nouns', '6'),
    ('ch_62_nouns', '7'),
    ('ch_63_nouns', '8'),
    ('ch_64_nouns', '9'),
    ('ch_65_nouns', '10'),
    ('ch_66_nouns', '10'),
    ('ch_67_nouns', '11'),
    ('ch_68_nouns', '11'),
    ('ch_69_nouns', '12'),
    ('ch_70_nouns', '12')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 72.4 (8)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"72.4"'::jsonb, 'instruction', 'Answer these questions about yourself. Where possible, use the structure in Section D (once a week / three times a day etc.).')
       || jsonb_build_object('gord', 4)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_102_nouns', '1'),
    ('gap_103_nouns', '2'),
    ('gap_104_nouns', '3'),
    ('gap_105_nouns', '4'),
    ('gap_106_nouns', '5'),
    ('gap_107_nouns', '6'),
    ('gap_108_nouns', '7'),
    ('gap_109_nouns', '8')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 73.1 (17)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"73.1"'::jsonb, 'instruction', 'Put in the or a where necessary. If no word is necessary, leave the space empty.')
       || jsonb_build_object('gord', 5)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_71_nouns', '2'),
    ('ch_72_nouns', '2'),
    ('ch_73_nouns', '3'),
    ('ch_74_nouns', '3'),
    ('ch_75_nouns', '4'),
    ('ch_76_nouns', '4'),
    ('ch_77_nouns', '4'),
    ('ch_78_nouns', '5'),
    ('ch_79_nouns', '5'),
    ('ch_80_nouns', '6'),
    ('ch_81_nouns', '6'),
    ('ch_82_nouns', '7'),
    ('ch_83_nouns', '7'),
    ('ch_84_nouns', '8'),
    ('ch_85_nouns', '8'),
    ('ch_86_nouns', '8'),
    ('ch_87_nouns', '8')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 73.2 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"73.2"'::jsonb, 'instruction', 'Put in the where necessary. If you don''t need the, leave the space empty.')
       || jsonb_build_object('gord', 6)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_88_nouns', '2'),
    ('ch_89_nouns', '3'),
    ('ch_90_nouns', '4'),
    ('ch_91_nouns', '5'),
    ('ch_92_nouns', '6'),
    ('ch_93_nouns', '7'),
    ('ch_94_nouns', '8'),
    ('ch_95_nouns', '9'),
    ('ch_96_nouns', '9')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 73.3 (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"73.3"'::jsonb, 'instruction', 'Put in the or a where necessary. (See Unit 72 for a and the if necessary.)')
       || jsonb_build_object('gord', 7)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_110_nouns', '2'),
    ('gap_111_nouns', '3'),
    ('gap_112_nouns', '4'),
    ('gap_113_nouns', '5'),
    ('gap_114_nouns', '6'),
    ('gap_115_nouns', '6'),
    ('gap_116_nouns', '7'),
    ('gap_117_nouns', '8'),
    ('gap_118_nouns', '9'),
    ('gap_119_nouns', '10'),
    ('gap_120_nouns', '11'),
    ('gap_121_nouns', '11')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 73.4 (6)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"73.4"'::jsonb, 'instruction', 'Complete the sentences using the following. Use the where necessary.')
       || jsonb_build_object('gord', 8)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_122_nouns', '2'),
    ('gap_123_nouns', '3'),
    ('gap_124_nouns', '4'),
    ('gap_125_nouns', '5'),
    ('gap_126_nouns', '6'),
    ('gap_127_nouns', '7')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 74.1 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"74.1"'::jsonb, 'instruction', 'Complete each sentence using a preposition (to/at/in etc.) + one of these words: bed, home, hospital, prison, school, university, work.')
       || jsonb_build_object('gord', 9)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_128_nouns', '2'),
    ('gap_129_nouns', '3'),
    ('gap_130_nouns', '4'),
    ('gap_131_nouns', '5'),
    ('gap_132_nouns', '6'),
    ('gap_133_nouns', '7'),
    ('gap_134_nouns', '8')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 74.2 (6)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"74.2"'::jsonb, 'instruction', 'Complete the sentences with school or the school.')
       || jsonb_build_object('gord', 10)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_97_nouns', '2'),
    ('ch_98_nouns', '3'),
    ('ch_99_nouns', '4'),
    ('ch_100_nouns', '5'),
    ('ch_101_nouns', '5'),
    ('ch_102_nouns', '6')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 74.3 (14)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"74.3"'::jsonb, 'instruction', 'Some of these sentences need the. Correct them where necessary.')
       || jsonb_build_object('gord', 11)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_103_nouns', '1a'),
    ('ch_104_nouns', '1b'),
    ('ch_105_nouns', '1c'),
    ('ch_106_nouns', '1d'),
    ('ch_107_nouns', '2a'),
    ('ch_108_nouns', '2b'),
    ('ch_109_nouns', '2b'),
    ('ch_110_nouns', '2c'),
    ('ch_111_nouns', '3a'),
    ('ch_112_nouns', '3b'),
    ('ch_113_nouns', '3c'),
    ('ch_114_nouns', '4a'),
    ('ch_115_nouns', '4b'),
    ('ch_116_nouns', '4c')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 74.4 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"74.4"'::jsonb, 'instruction', 'Which is correct?')
       || jsonb_build_object('gord', 12)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_117_nouns', '2'),
    ('ch_118_nouns', '3'),
    ('ch_119_nouns', '4'),
    ('ch_120_nouns', '5'),
    ('ch_121_nouns', '6'),
    ('ch_122_nouns', '7'),
    ('ch_123_nouns', '8'),
    ('ch_124_nouns', '9'),
    ('ch_125_nouns', '1')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 75.1 (6)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"75.1"'::jsonb, 'instruction', 'Choose four of these things and write whether you like them or not.')
       || jsonb_build_object('gord', 13)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_126_nouns', '1'),
    ('ch_127_nouns', '2'),
    ('ch_128_nouns', '3'),
    ('ch_129_nouns', '4'),
    ('ch_130_nouns', '5'),
    ('ch_131_nouns', '6')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 75.2 (10)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"75.2"'::jsonb, 'instruction', 'Complete the sentences using the following. Use the where necessary.')
       || jsonb_build_object('gord', 14)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_135_nouns', '3'),
    ('gap_136_nouns', '4'),
    ('gap_137_nouns', '5'),
    ('gap_138_nouns', '6'),
    ('gap_139_nouns', '7'),
    ('gap_140_nouns', '8'),
    ('gap_141_nouns', '9'),
    ('gap_142_nouns', '10'),
    ('gap_143_nouns', '11'),
    ('gap_144_nouns', '12')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 75.3 (23)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"75.3"'::jsonb, 'instruction', 'Choose the correct form, with or without the.')
       || jsonb_build_object('gord', 15)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_132_nouns', '2'),
    ('ch_133_nouns', '3'),
    ('ch_134_nouns', '4'),
    ('ch_135_nouns', '4'),
    ('ch_136_nouns', '5'),
    ('ch_137_nouns', '6'),
    ('ch_138_nouns', '7'),
    ('ch_139_nouns', '8'),
    ('ch_140_nouns', '9'),
    ('ch_141_nouns', '10'),
    ('ch_142_nouns', '11'),
    ('ch_143_nouns', '11'),
    ('ch_144_nouns', '12'),
    ('ch_145_nouns', '13'),
    ('ch_146_nouns', '14'),
    ('ch_147_nouns', '15'),
    ('ch_148_nouns', '16'),
    ('ch_149_nouns', '17'),
    ('ch_150_nouns', '17'),
    ('ch_151_nouns', '18'),
    ('ch_152_nouns', '19'),
    ('ch_153_nouns', '19'),
    ('ch_154_nouns', '19')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 77.1 (6)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"77.1"'::jsonb, 'instruction', 'Put in the where necessary. Leave the space empty if the sentence is already complete.')
       || jsonb_build_object('gord', 16)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_155_nouns', '2'),
    ('ch_156_nouns', '3'),
    ('ch_157_nouns', '3'),
    ('ch_158_nouns', '4'),
    ('ch_159_nouns', '5'),
    ('ch_160_nouns', '6')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 77.2 (14)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"77.2"'::jsonb, 'instruction', 'Some of these sentences are correct, but some need the (sometimes more than once). Correct the sentences where necessary.')
       || jsonb_build_object('gord', 17)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_161_nouns', '2'),
    ('ch_162_nouns', '4'),
    ('ch_163_nouns', '5'),
    ('ch_164_nouns', '6'),
    ('ch_165_nouns', '7'),
    ('ch_166_nouns', '8'),
    ('ch_167_nouns', '9'),
    ('ch_168_nouns', '10'),
    ('ch_169_nouns', '11'),
    ('ch_170_nouns', '12'),
    ('ch_171_nouns', '12'),
    ('ch_172_nouns', '13'),
    ('ch_173_nouns', '14'),
    ('ch_174_nouns', '14')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 77.3 (14)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"77.3"'::jsonb, 'instruction', 'Here are some geography questions. Choose the right answer from one of the boxes and write the if necessary. You do not need all the names in the boxes. Use an atlas if necessary.')
       || jsonb_build_object('gord', 18)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_145_nouns', '2'),
    ('gap_146_nouns', '3'),
    ('gap_147_nouns', '4'),
    ('gap_148_nouns', '5'),
    ('gap_149_nouns', '6'),
    ('gap_150_nouns', '7'),
    ('gap_151_nouns', '8'),
    ('gap_152_nouns', '9'),
    ('gap_153_nouns', '10'),
    ('gap_154_nouns', '11'),
    ('gap_155_nouns', '12'),
    ('gap_156_nouns', '13'),
    ('gap_157_nouns', '14'),
    ('gap_158_nouns', '15')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 78.1 (8)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"78.1"'::jsonb, 'instruction', 'Use the map to answer the questions. Write the name of the place and the street it is in. Use the if necessary. (Remember that on maps we do not normally use the.)')
       || jsonb_build_object('gord', 19)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_175_nouns', '2'),
    ('ch_176_nouns', '3'),
    ('ch_177_nouns', '4'),
    ('ch_178_nouns', '5'),
    ('ch_179_nouns', '6'),
    ('ch_180_nouns', '7'),
    ('ch_181_nouns', '8'),
    ('ch_182_nouns', '1')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 78.2 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"78.2"'::jsonb, 'instruction', 'Where are the following? Use the where necessary.')
       || jsonb_build_object('gord', 20)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('gap_159_nouns', '2'),
    ('gap_160_nouns', '3'),
    ('gap_161_nouns', '4'),
    ('gap_162_nouns', '5'),
    ('gap_163_nouns', '6'),
    ('gap_164_nouns', '7'),
    ('gap_165_nouns', '8')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 78.3 (18)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"78.3"'::jsonb, 'instruction', 'Choose the correct form, with or without the.')
       || jsonb_build_object('gord', 21)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_183_nouns', '2'),
    ('ch_184_nouns', '3'),
    ('ch_185_nouns', '4'),
    ('ch_186_nouns', '4'),
    ('ch_187_nouns', '5'),
    ('ch_188_nouns', '6'),
    ('ch_189_nouns', '7'),
    ('ch_190_nouns', '8'),
    ('ch_191_nouns', '9'),
    ('ch_192_nouns', '9'),
    ('ch_193_nouns', '10'),
    ('ch_194_nouns', '11'),
    ('ch_195_nouns', '11'),
    ('ch_196_nouns', '12'),
    ('ch_197_nouns', '13'),
    ('ch_198_nouns', '14'),
    ('ch_199_nouns', '15'),
    ('ch_200_nouns', '16')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 11 (41)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '11'::jsonb, 'instruction', 'Fill in the where necessary.')
       || jsonb_build_object('gord', 22)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_201_nouns', '1'),
    ('ch_202_nouns', '1'),
    ('ch_203_nouns', '2'),
    ('ch_204_nouns', '2'),
    ('ch_205_nouns', '3'),
    ('ch_206_nouns', '3'),
    ('ch_207_nouns', '4'),
    ('ch_208_nouns', '4'),
    ('ch_209_nouns', '4'),
    ('ch_210_nouns', '5'),
    ('ch_211_nouns', '5'),
    ('ch_212_nouns', '6'),
    ('ch_213_nouns', '7'),
    ('ch_214_nouns', '7'),
    ('ch_215_nouns', '7'),
    ('ch_216_nouns', '8'),
    ('ch_217_nouns', '8'),
    ('ch_218_nouns', '8'),
    ('ch_219_nouns', '8'),
    ('ch_220_nouns', '8'),
    ('ch_221_nouns', '9'),
    ('ch_222_nouns', '9'),
    ('ch_223_nouns', '10'),
    ('ch_224_nouns', '10'),
    ('ch_225_nouns', '10'),
    ('ch_226_nouns', '11'),
    ('ch_227_nouns', '11'),
    ('ch_228_nouns', '11'),
    ('ch_229_nouns', '12'),
    ('ch_230_nouns', '12'),
    ('ch_231_nouns', '12'),
    ('ch_232_nouns', '13'),
    ('ch_233_nouns', '13'),
    ('ch_234_nouns', '13'),
    ('ch_235_nouns', '14'),
    ('ch_236_nouns', '14'),
    ('ch_237_nouns', '14'),
    ('ch_238_nouns', '14'),
    ('ch_239_nouns', '14'),
    ('ch_240_nouns', '15'),
    ('ch_241_nouns', '15')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise 12 (43)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '12'::jsonb, 'instruction', 'Fill in a/an or the where necessary.')
       || jsonb_build_object('gord', 23)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_242_nouns', '1'),
    ('ch_243_nouns', '1'),
    ('ch_244_nouns', '2'),
    ('ch_245_nouns', '2'),
    ('ch_246_nouns', '2'),
    ('ch_247_nouns', '3'),
    ('ch_248_nouns', '3'),
    ('ch_249_nouns', '3'),
    ('ch_250_nouns', '4'),
    ('ch_251_nouns', '4'),
    ('ch_252_nouns', '5'),
    ('ch_253_nouns', '5'),
    ('ch_254_nouns', '5'),
    ('ch_255_nouns', '6'),
    ('ch_256_nouns', '6'),
    ('ch_257_nouns', '7'),
    ('ch_258_nouns', '7'),
    ('ch_259_nouns', '7'),
    ('ch_260_nouns', '8'),
    ('ch_261_nouns', '8'),
    ('ch_262_nouns', '9'),
    ('ch_263_nouns', '9'),
    ('ch_264_nouns', '10'),
    ('ch_265_nouns', '10'),
    ('ch_266_nouns', '10'),
    ('ch_267_nouns', '11'),
    ('ch_268_nouns', '11'),
    ('ch_269_nouns', '11'),
    ('ch_270_nouns', '12'),
    ('ch_271_nouns', '12'),
    ('ch_272_nouns', '12'),
    ('ch_273_nouns', '13'),
    ('ch_274_nouns', '13'),
    ('ch_275_nouns', '14'),
    ('ch_276_nouns', '14'),
    ('ch_277_nouns', '15'),
    ('ch_278_nouns', '15'),
    ('ch_279_nouns', '15'),
    ('ch_280_nouns', '16'),
    ('ch_281_nouns', '16'),
    ('ch_282_nouns', '16'),
    ('ch_283_nouns', '16'),
    ('ch_284_nouns', '16')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- articles: Exercise OD11 (25)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"OD11"'::jsonb, 'instruction', 'Look at the following list, then say each item using the where necessary.')
       || jsonb_build_object('gord', 24)
       || jsonb_build_object('groupTitle', 'Oral Development 11')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('ch_285_nouns', '1'),
    ('ch_286_nouns', '2'),
    ('ch_287_nouns', '3'),
    ('ch_288_nouns', '4'),
    ('ch_289_nouns', '5'),
    ('ch_290_nouns', '6'),
    ('ch_291_nouns', '7'),
    ('ch_292_nouns', '8'),
    ('ch_293_nouns', '9'),
    ('ch_294_nouns', '10'),
    ('ch_295_nouns', '11'),
    ('ch_296_nouns', '12'),
    ('ch_297_nouns', '13'),
    ('ch_298_nouns', '14'),
    ('ch_299_nouns', '15'),
    ('ch_300_nouns', '16'),
    ('ch_301_nouns', '17'),
    ('ch_302_nouns', '18'),
    ('ch_303_nouns', '19'),
    ('ch_304_nouns', '20'),
    ('ch_305_nouns', '21'),
    ('ch_306_nouns', '22'),
    ('ch_307_nouns', '23'),
    ('ch_308_nouns', '24'),
    ('ch_309_nouns', '25')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'articles');

-- modal_verbs: Exercise 13.1 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"13.1"'::jsonb, 'instruction', 'Underline the correct word or phrase in each sentence.')
       || jsonb_build_object('gord', 1)
       || jsonb_build_object('groupTitle', 'Exercise 1')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_ch_1', '2'),
    ('modal_ch_2', '3'),
    ('modal_ch_3', '4'),
    ('modal_ch_4', '5'),
    ('modal_ch_5', '6'),
    ('modal_ch_6', '7'),
    ('modal_ch_7', '8'),
    ('modal_ch_8', '9'),
    ('modal_ch_9', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 13.2 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"13.2"'::jsonb, 'instruction', 'Complete the second sentence so that it has a similar meaning to the first sentence, using the word given. Do not change the word given. You must use between two and five words, including the word given.')
       || jsonb_build_object('gord', 2)
       || jsonb_build_object('groupTitle', 'Exercise 2')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_gap_1', '2'),
    ('modal_gap_2', '3'),
    ('modal_gap_3', '4'),
    ('modal_gap_4', '5'),
    ('modal_gap_5', '6'),
    ('modal_gap_6', '7'),
    ('modal_gap_7', '8'),
    ('modal_gap_8', '9'),
    ('modal_gap_9', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 13.3 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"13.3"'::jsonb, 'instruction', 'Underline the most suitable word or phrase in each sentence.')
       || jsonb_build_object('gord', 3)
       || jsonb_build_object('groupTitle', 'Exercise 3')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_ch_10', '2'),
    ('modal_ch_11', '3'),
    ('modal_ch_12', '4'),
    ('modal_ch_13', '5'),
    ('modal_ch_14', '6'),
    ('modal_ch_15', '7'),
    ('modal_ch_16', '8'),
    ('modal_ch_17', '9'),
    ('modal_ch_18', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 13.4 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"13.4"'::jsonb, 'instruction', 'Rewrite each sentence so that it contains can, could, must, have to or should (including negative forms).')
       || jsonb_build_object('gord', 4)
       || jsonb_build_object('groupTitle', 'Exercise 4')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_gap_10', '2'),
    ('modal_gap_11', '3'),
    ('modal_gap_12', '4'),
    ('modal_gap_13', '5'),
    ('modal_gap_14', '6'),
    ('modal_gap_15', '7'),
    ('modal_gap_16', '8'),
    ('modal_gap_17', '9'),
    ('modal_gap_18', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 13.5 (5)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"13.5"'::jsonb, 'instruction', 'Choose the most suitable description for each picture.')
       || jsonb_build_object('gord', 5)
       || jsonb_build_object('groupTitle', 'Exercise 5')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_ch_19', '2'),
    ('modal_ch_20', '3'),
    ('modal_ch_21', '4'),
    ('modal_ch_22', '5'),
    ('modal_ch_23', '6')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 13.6 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"13.6"'::jsonb, 'instruction', 'Complete each sentence so that it contains might, might not, must, mustn''t, can or can''t. More than one answer may be possible.')
       || jsonb_build_object('gord', 6)
       || jsonb_build_object('groupTitle', 'Exercise 6')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_gap_19', '2'),
    ('modal_gap_20', '3'),
    ('modal_gap_21', '4'),
    ('modal_gap_22', '5'),
    ('modal_gap_23', '6'),
    ('modal_gap_24', '7'),
    ('modal_gap_25', '8'),
    ('modal_gap_26', '9'),
    ('modal_gap_27', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 14.1 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"14.1"'::jsonb, 'instruction', 'Choose the most suitable response to each comment or question.')
       || jsonb_build_object('gord', 7)
       || jsonb_build_object('groupTitle', 'Exercise 1')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_ch_24', '2'),
    ('modal_ch_25', '3'),
    ('modal_ch_26', '4'),
    ('modal_ch_27', '5'),
    ('modal_ch_28', '6'),
    ('modal_ch_29', '7'),
    ('modal_ch_30', '8'),
    ('modal_ch_31', '9'),
    ('modal_ch_32', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 14.2 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"14.2"'::jsonb, 'instruction', 'Complete the second sentence so that it has a similar meaning to the first sentence, using the word given. Do not change the word given. You must use between two and five words, including the word given.')
       || jsonb_build_object('gord', 8)
       || jsonb_build_object('groupTitle', 'Exercise 2')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_gap_28', '2'),
    ('modal_gap_29', '3'),
    ('modal_gap_30', '4'),
    ('modal_gap_31', '5'),
    ('modal_gap_32', '6'),
    ('modal_gap_33', '7'),
    ('modal_gap_34', '8'),
    ('modal_gap_35', '9'),
    ('modal_gap_36', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 14.3 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"14.3"'::jsonb, 'instruction', 'Underline the most suitable phrase in each sentence.')
       || jsonb_build_object('gord', 9)
       || jsonb_build_object('groupTitle', 'Exercise 3')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_ch_33', '2'),
    ('modal_ch_34', '3'),
    ('modal_ch_35', '4'),
    ('modal_ch_36', '5'),
    ('modal_ch_37', '6'),
    ('modal_ch_38', '7'),
    ('modal_ch_39', '8')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 14.4 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"14.4"'::jsonb, 'instruction', 'Rewrite each sentence so that it contains can''t, might, must, should or needn''t.')
       || jsonb_build_object('gord', 10)
       || jsonb_build_object('groupTitle', 'Exercise 4')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_gap_37', '2'),
    ('modal_gap_38', '3'),
    ('modal_gap_39', '4'),
    ('modal_gap_40', '5'),
    ('modal_gap_41', '6'),
    ('modal_gap_42', '7'),
    ('modal_gap_43', '8'),
    ('modal_gap_44', '9'),
    ('modal_gap_45', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise 14.5 (5)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"14.5"'::jsonb, 'instruction', 'Choose the most suitable description for each picture.')
       || jsonb_build_object('gord', 11)
       || jsonb_build_object('groupTitle', 'Exercise 5')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_ch_40', '2'),
    ('modal_ch_41', '3'),
    ('modal_ch_42', '4'),
    ('modal_ch_43', '5'),
    ('modal_ch_44', '6')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- modal_verbs: Exercise ECCE (20)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"ECCE"'::jsonb, 'instruction', 'Choose the correct word or phrase to complete the sentences.')
       || jsonb_build_object('gord', 12)
       || jsonb_build_object('groupTitle', 'ECCE in Action')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('modal_abcd_10', null::text),
    ('modal_abcd_11', null::text),
    ('modal_abcd_12', null::text),
    ('modal_abcd_13', null::text),
    ('modal_abcd_14', null::text),
    ('modal_abcd_15', null::text),
    ('modal_abcd_16', null::text),
    ('modal_abcd_17', null::text),
    ('modal_abcd_18', null::text),
    ('modal_abcd_19', null::text),
    ('modal_abcd_20', null::text),
    ('modal_abcd_21', null::text),
    ('modal_abcd_22', null::text),
    ('modal_abcd_23', null::text),
    ('modal_abcd_24', null::text),
    ('modal_abcd_25', null::text),
    ('modal_abcd_26', null::text),
    ('modal_abcd_27', null::text),
    ('modal_abcd_28', null::text),
    ('modal_abcd_29', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'modal_verbs');

-- pronouns: Exercise 1 (25)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '1'::jsonb, 'instruction', 'Fill in: this, these, that or those.')
       || jsonb_build_object('gord', 1)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('pron_ch_1', '2'),
    ('pron_ch_2', '3'),
    ('pron_ch_3', '4'),
    ('pron_ch_4', '5'),
    ('pron_ch_5', '6'),
    ('pron_ch_6', '7'),
    ('pron_ch_7', '8'),
    ('pron_ch_8', '9'),
    ('pron_ch_9', '10'),
    ('pron_ch_10', '11'),
    ('pron_ch_11', '12a'),
    ('pron_ch_12', '12b'),
    ('pron_ch_13', '13'),
    ('pron_ch_14', '14'),
    ('pron_ch_15', '15'),
    ('pron_ch_16', '16'),
    ('pron_ch_17', '17'),
    ('pron_ch_18', '18'),
    ('pron_ch_19', '19'),
    ('pron_ch_20', '20'),
    ('pron_ch_21', '21'),
    ('pron_ch_22', '22'),
    ('pron_ch_23', '23'),
    ('pron_ch_24', '24'),
    ('pron_ch_25', '25')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'pronouns');

-- pronouns: Exercise 2 (14)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '2'::jsonb, 'instruction', 'Fill in: a lot (of), much or many.')
       || jsonb_build_object('gord', 2)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('pron_ch_26', '2'),
    ('pron_ch_27', '3'),
    ('pron_ch_28', '4'),
    ('pron_ch_29', '5'),
    ('pron_ch_30', '6'),
    ('pron_ch_31', '7'),
    ('pron_ch_32', '8'),
    ('pron_ch_33', '9'),
    ('pron_ch_34', '10'),
    ('pron_ch_35', '11'),
    ('pron_ch_36', '12'),
    ('pron_ch_37', '13'),
    ('pron_ch_38', '14'),
    ('pron_ch_39', '15')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'pronouns');

-- pronouns: Exercise 3 (11)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '3'::jsonb, 'instruction', 'Underline the correct item.')
       || jsonb_build_object('gord', 3)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('pron_ch_40', '2'),
    ('pron_ch_41', '3'),
    ('pron_ch_42', '4'),
    ('pron_ch_43', '5'),
    ('pron_ch_44', '6'),
    ('pron_ch_45', '7'),
    ('pron_ch_46', '8'),
    ('pron_ch_47', '9'),
    ('pron_ch_48', '10'),
    ('pron_ch_49', '11'),
    ('pron_ch_50', '12')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'pronouns');

-- pronouns: Exercise 4 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '4'::jsonb, 'instruction', 'Underline the correct item.')
       || jsonb_build_object('gord', 4)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('pron_ch_51', '2'),
    ('pron_ch_52', '3'),
    ('pron_ch_53', '4'),
    ('pron_ch_54', '5'),
    ('pron_ch_55', '6'),
    ('pron_ch_56', '7'),
    ('pron_ch_57', '8'),
    ('pron_ch_58', '9'),
    ('pron_ch_59', '10')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'pronouns');

-- pronouns: Exercise 5 (26)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '5'::jsonb, 'instruction', 'Fill in: some, any, no, every or their compounds.')
       || jsonb_build_object('gord', 5)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('pron_gap_1', '2a'),
    ('pron_gap_2', '2b'),
    ('pron_gap_3', '3'),
    ('pron_gap_4', '4'),
    ('pron_gap_5', '5'),
    ('pron_gap_6', '6a'),
    ('pron_gap_7', '6b'),
    ('pron_gap_8', '7a'),
    ('pron_gap_9', '7b'),
    ('pron_gap_10', '8a'),
    ('pron_gap_11', '8b'),
    ('pron_gap_12', '9a'),
    ('pron_gap_13', '9b'),
    ('pron_gap_14', '10a'),
    ('pron_gap_15', '10b'),
    ('pron_gap_16', '11a'),
    ('pron_gap_17', '11b'),
    ('pron_gap_18', '12'),
    ('pron_gap_19', '13a'),
    ('pron_gap_20', '13b'),
    ('pron_gap_21', '13c'),
    ('pron_gap_22', '14a'),
    ('pron_gap_23', '14b'),
    ('pron_gap_24', '15a'),
    ('pron_gap_25', '15b'),
    ('pron_gap_26', '15c')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'pronouns');

-- pronouns: Exercise 6 (30)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '6'::jsonb, 'instruction', 'Underline the correct item.')
       || jsonb_build_object('gord', 6)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('pron_ch_60', '2'),
    ('pron_ch_61', '3'),
    ('pron_ch_62', '4'),
    ('pron_ch_63', '5'),
    ('pron_ch_64', '6'),
    ('pron_ch_65', '7'),
    ('pron_ch_66', '8'),
    ('pron_ch_67', '9a'),
    ('pron_ch_68', '9b'),
    ('pron_ch_69', '10'),
    ('pron_ch_70', '11'),
    ('pron_ch_71', '12'),
    ('pron_ch_72', '13'),
    ('pron_ch_73', '14'),
    ('pron_ch_74', '15'),
    ('pron_ch_75', '16'),
    ('pron_ch_76', '17'),
    ('pron_ch_77', '18'),
    ('pron_ch_78', '19'),
    ('pron_ch_79', '20'),
    ('pron_ch_80', '21'),
    ('pron_ch_81', '22'),
    ('pron_ch_82', '23'),
    ('pron_ch_83', '24'),
    ('pron_ch_84', '25'),
    ('pron_ch_85', '26'),
    ('pron_ch_86', '27'),
    ('pron_ch_87', '28'),
    ('pron_ch_88', '29'),
    ('pron_ch_89', '30')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'pronouns');

-- pronouns: Exercise 7 (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '7'::jsonb, 'instruction', 'Rewrite the sentences using both … and, neither … nor, either … or, not only … but also.')
       || jsonb_build_object('gord', 7)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('pron_ord_1', '2'),
    ('pron_ord_2', '3'),
    ('pron_ord_3', '4'),
    ('pron_ord_4', '5'),
    ('pron_ord_5', '6'),
    ('pron_ord_6', '7'),
    ('pron_ord_7', '8'),
    ('pron_ord_8', '9'),
    ('pron_ord_9', '10'),
    ('pron_ord_10', '11'),
    ('pron_ord_11', '12'),
    ('pron_ord_12', '13')
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'pronouns');

-- verbals: Exercise 1 (20)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '1'::jsonb, 'instruction', 'Choose the correct form of the Infinitive. Give two variants where possible, explain the difference.')
       || jsonb_build_object('gord', 1)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_1', null::text),
    ('verb_ch_2', null::text),
    ('verb_ch_3', null::text),
    ('verb_ch_4', null::text),
    ('verb_ch_5', null::text),
    ('verb_ch_6', null::text),
    ('verb_ch_7', null::text),
    ('verb_ch_8', null::text),
    ('verb_ch_9', null::text),
    ('verb_ch_10', null::text),
    ('verb_ch_11', null::text),
    ('verb_ch_12', null::text),
    ('verb_ch_13', null::text),
    ('verb_ch_14', null::text),
    ('verb_ch_15', null::text),
    ('verb_ch_16', null::text),
    ('verb_ch_17', null::text),
    ('verb_ch_18', null::text),
    ('verb_ch_19', null::text),
    ('verb_ch_20', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 2 (16)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '2'::jsonb, 'instruction', 'Use the appropriate form of the Infinitive in brackets.')
       || jsonb_build_object('gord', 2)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_1', null::text),
    ('verb_gap_2', null::text),
    ('verb_gap_3', null::text),
    ('verb_gap_4', null::text),
    ('verb_gap_5', null::text),
    ('verb_gap_6', null::text),
    ('verb_gap_7', null::text),
    ('verb_gap_8', null::text),
    ('verb_gap_9', null::text),
    ('verb_gap_10', null::text),
    ('verb_gap_11', null::text),
    ('verb_gap_12', null::text),
    ('verb_gap_13', null::text),
    ('verb_gap_14', null::text),
    ('verb_gap_15', null::text),
    ('verb_gap_16', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 3 (10)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '3'::jsonb, 'instruction', 'Correct the mistakes (if any) in the use of the infinitives.')
       || jsonb_build_object('gord', 3)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_21', null::text),
    ('verb_ch_22', null::text),
    ('verb_ch_23', null::text),
    ('verb_ch_24', null::text),
    ('verb_ch_25', null::text),
    ('verb_ch_26', null::text),
    ('verb_ch_27', null::text),
    ('verb_ch_28', null::text),
    ('verb_ch_29', null::text),
    ('verb_ch_30', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 4I (20)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"4I"'::jsonb, 'instruction', 'Insert to where necessary.')
       || jsonb_build_object('gord', 4)
       || jsonb_build_object('groupTitle', 'Exercise 4 · I')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_31', null::text),
    ('verb_ch_32', null::text),
    ('verb_ch_33', null::text),
    ('verb_ch_34', null::text),
    ('verb_ch_35', null::text),
    ('verb_ch_36', null::text),
    ('verb_ch_37', null::text),
    ('verb_ch_38', null::text),
    ('verb_ch_39', null::text),
    ('verb_ch_40', null::text),
    ('verb_ch_41', null::text),
    ('verb_ch_42', null::text),
    ('verb_ch_43', null::text),
    ('verb_ch_44', null::text),
    ('verb_ch_45', null::text),
    ('verb_ch_46', null::text),
    ('verb_ch_47', null::text),
    ('verb_ch_48', null::text),
    ('verb_ch_49', null::text),
    ('verb_ch_50', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 4II (17)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"4II"'::jsonb, 'instruction', 'Insert to where necessary.')
       || jsonb_build_object('gord', 5)
       || jsonb_build_object('groupTitle', 'Exercise 4 · II')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_51', null::text),
    ('verb_ch_52', null::text),
    ('verb_ch_53', null::text),
    ('verb_ch_54', null::text),
    ('verb_ch_55', null::text),
    ('verb_ch_56', null::text),
    ('verb_ch_57', null::text),
    ('verb_ch_58', null::text),
    ('verb_ch_59', null::text),
    ('verb_ch_60', null::text),
    ('verb_ch_61', null::text),
    ('verb_ch_62', null::text),
    ('verb_ch_63', null::text),
    ('verb_ch_64', null::text),
    ('verb_ch_65', null::text),
    ('verb_ch_66', null::text),
    ('verb_ch_67', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 5 (16)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '5'::jsonb, 'instruction', 'Use the appropriate form of the Infinitive.')
       || jsonb_build_object('gord', 6)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_17', null::text),
    ('verb_gap_18', null::text),
    ('verb_gap_19', null::text),
    ('verb_gap_20', null::text),
    ('verb_gap_21', null::text),
    ('verb_gap_22', null::text),
    ('verb_gap_23', null::text),
    ('verb_gap_24', null::text),
    ('verb_gap_25', null::text),
    ('verb_gap_26', null::text),
    ('verb_gap_27', null::text),
    ('verb_gap_28', null::text),
    ('verb_gap_29', null::text),
    ('verb_gap_30', null::text),
    ('verb_gap_31', null::text),
    ('verb_gap_32', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 6 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '6'::jsonb, 'instruction', 'What did your parents let/make you do when you were at school? Use the prompts to write sentences.')
       || jsonb_build_object('gord', 7)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_1', null::text),
    ('verb_ord_2', null::text),
    ('verb_ord_3', null::text),
    ('verb_ord_4', null::text),
    ('verb_ord_5', null::text),
    ('verb_ord_6', null::text),
    ('verb_ord_7', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 7 (16)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '7'::jsonb, 'instruction', 'Translate the sentences, using the phrases: let / make / allow.')
       || jsonb_build_object('gord', 8)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_8', null::text),
    ('verb_ord_9', null::text),
    ('verb_ord_10', null::text),
    ('verb_ord_11', null::text),
    ('verb_ord_12', null::text),
    ('verb_ord_13', null::text),
    ('verb_ord_14', null::text),
    ('verb_ord_15', null::text),
    ('verb_ord_16', null::text),
    ('verb_ord_17', null::text),
    ('verb_ord_18', null::text),
    ('verb_ord_19', null::text),
    ('verb_ord_20', null::text),
    ('verb_ord_21', null::text),
    ('verb_ord_22', null::text),
    ('verb_ord_23', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 8 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '8'::jsonb, 'instruction', 'State the function of the Infinitive. Translate the sentences into Russian.')
       || jsonb_build_object('gord', 9)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_68', null::text),
    ('verb_ch_69', null::text),
    ('verb_ch_70', null::text),
    ('verb_ch_71', null::text),
    ('verb_ch_72', null::text),
    ('verb_ch_73', null::text),
    ('verb_ch_74', null::text),
    ('verb_ch_75', null::text),
    ('verb_ch_76', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 9 (5)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '9'::jsonb, 'instruction', 'Complete the following, using infinitives from the list below.')
       || jsonb_build_object('gord', 10)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_77', null::text),
    ('verb_ch_78', null::text),
    ('verb_ch_79', null::text),
    ('verb_ch_80', null::text),
    ('verb_ch_81', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 10 (8)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '10'::jsonb, 'instruction', 'Combine the following pairs of sentences into one sentence, using the Infinitive.')
       || jsonb_build_object('gord', 11)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_33', null::text),
    ('verb_gap_34', null::text),
    ('verb_gap_35', null::text),
    ('verb_gap_36', null::text),
    ('verb_gap_37', null::text),
    ('verb_gap_38', null::text),
    ('verb_gap_39', null::text),
    ('verb_gap_40', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 11 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '11'::jsonb, 'instruction', 'Combine the following pairs of sentences into one sentence, using so as / in order with the Infinitive.')
       || jsonb_build_object('gord', 12)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_41', null::text),
    ('verb_gap_42', null::text),
    ('verb_gap_43', null::text),
    ('verb_gap_44', null::text),
    ('verb_gap_45', null::text),
    ('verb_gap_46', null::text),
    ('verb_gap_47', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 12 (16)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '12'::jsonb, 'instruction', 'Translate the sentences into English, using the models.')
       || jsonb_build_object('gord', 13)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_24', null::text),
    ('verb_ord_25', null::text),
    ('verb_ord_26', null::text),
    ('verb_ord_27', null::text),
    ('verb_ord_28', null::text),
    ('verb_ord_29', null::text),
    ('verb_ord_30', null::text),
    ('verb_ord_31', null::text),
    ('verb_ord_32', null::text),
    ('verb_ord_33', null::text),
    ('verb_ord_34', null::text),
    ('verb_ord_35', null::text),
    ('verb_ord_36', null::text),
    ('verb_ord_37', null::text),
    ('verb_ord_38', null::text),
    ('verb_ord_39', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 13 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '13'::jsonb, 'instruction', 'Translate the sentences, using the model: do smth (in order/so as) (not) to get smth.')
       || jsonb_build_object('gord', 14)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_40', null::text),
    ('verb_ord_41', null::text),
    ('verb_ord_42', null::text),
    ('verb_ord_43', null::text),
    ('verb_ord_44', null::text),
    ('verb_ord_45', null::text),
    ('verb_ord_46', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 18 (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '18'::jsonb, 'instruction', 'State the form and function of the Infinitive. Translate the sentences into Russian.')
       || jsonb_build_object('gord', 15)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_82', null::text),
    ('verb_ch_83', null::text),
    ('verb_ch_84', null::text),
    ('verb_ch_85', null::text),
    ('verb_ch_86', null::text),
    ('verb_ch_87', null::text),
    ('verb_ch_88', null::text),
    ('verb_ch_89', null::text),
    ('verb_ch_90', null::text),
    ('verb_ch_91', null::text),
    ('verb_ch_92', null::text),
    ('verb_ch_93', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 19 (8)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '19'::jsonb, 'instruction', 'Translate the sentences, giving the Russian equivalents of the Infinitive used as an attribute.')
       || jsonb_build_object('gord', 16)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_94', null::text),
    ('verb_ch_95', null::text),
    ('verb_ch_96', null::text),
    ('verb_ch_97', null::text),
    ('verb_ch_98', null::text),
    ('verb_ch_99', null::text),
    ('verb_ch_100', null::text),
    ('verb_ch_101', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 20 (10)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '20'::jsonb, 'instruction', 'Complete the following sentences. Use the Infinitive phrases from the list.')
       || jsonb_build_object('gord', 17)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_102', null::text),
    ('verb_ch_103', null::text),
    ('verb_ch_104', null::text),
    ('verb_ch_105', null::text),
    ('verb_ch_106', null::text),
    ('verb_ch_107', null::text),
    ('verb_ch_108', null::text),
    ('verb_ch_109', null::text),
    ('verb_ch_110', null::text),
    ('verb_ch_111', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 21 (12)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '21'::jsonb, 'instruction', 'Insert the Infinitive in the appropriate form and translate the sentences into Russian.')
       || jsonb_build_object('gord', 18)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_48', null::text),
    ('verb_gap_49', null::text),
    ('verb_gap_50', null::text),
    ('verb_gap_51', null::text),
    ('verb_gap_52', null::text),
    ('verb_gap_53', null::text),
    ('verb_gap_54', null::text),
    ('verb_gap_55', null::text),
    ('verb_gap_56', null::text),
    ('verb_gap_57', null::text),
    ('verb_gap_58', null::text),
    ('verb_gap_59', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 22 (10)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '22'::jsonb, 'instruction', 'Translate the sentences, using the models: the first/last to do; something to do; the man to do.')
       || jsonb_build_object('gord', 19)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_47', null::text),
    ('verb_ord_48', null::text),
    ('verb_ord_49', null::text),
    ('verb_ord_50', null::text),
    ('verb_ord_51', null::text),
    ('verb_ord_52', null::text),
    ('verb_ord_53', null::text),
    ('verb_ord_54', null::text),
    ('verb_ord_55', null::text),
    ('verb_ord_56', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 23 (11)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '23'::jsonb, 'instruction', 'Translate the sentences from Russian into English.')
       || jsonb_build_object('gord', 20)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_57', null::text),
    ('verb_ord_58', null::text),
    ('verb_ord_59', null::text),
    ('verb_ord_60', null::text),
    ('verb_ord_61', null::text),
    ('verb_ord_62', null::text),
    ('verb_ord_63', null::text),
    ('verb_ord_64', null::text),
    ('verb_ord_65', null::text),
    ('verb_ord_66', null::text),
    ('verb_ord_67', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 24 (8)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '24'::jsonb, 'instruction', 'Match the parts of the sentences to describe the girl.')
       || jsonb_build_object('gord', 21)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_112', null::text),
    ('verb_ch_113', null::text),
    ('verb_ch_114', null::text),
    ('verb_ch_115', null::text),
    ('verb_ch_116', null::text),
    ('verb_ch_117', null::text),
    ('verb_ch_118', null::text),
    ('verb_ch_119', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 31 (10)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '31'::jsonb, 'instruction', 'Translate the sentences, paying special attention to the use of the Complex Object.')
       || jsonb_build_object('gord', 22)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_120', null::text),
    ('verb_ch_121', null::text),
    ('verb_ch_122', null::text),
    ('verb_ch_123', null::text),
    ('verb_ch_124', null::text),
    ('verb_ch_125', null::text),
    ('verb_ch_126', null::text),
    ('verb_ch_127', null::text),
    ('verb_ch_128', null::text),
    ('verb_ch_129', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 32 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '32'::jsonb, 'instruction', 'Replace the following complex sentences by simple sentences with the Infinitive Construction.')
       || jsonb_build_object('gord', 23)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_60', null::text),
    ('verb_gap_61', null::text),
    ('verb_gap_62', null::text),
    ('verb_gap_63', null::text),
    ('verb_gap_64', null::text),
    ('verb_gap_65', null::text),
    ('verb_gap_66', null::text),
    ('verb_gap_67', null::text),
    ('verb_gap_68', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 33 (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '33'::jsonb, 'instruction', 'Practise the following according to the model: Do you want to …? — No, I want you to …')
       || jsonb_build_object('gord', 24)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_69', null::text),
    ('verb_gap_70', null::text),
    ('verb_gap_71', null::text),
    ('verb_gap_72', null::text),
    ('verb_gap_73', null::text),
    ('verb_gap_74', null::text),
    ('verb_gap_75', null::text),
    ('verb_gap_76', null::text),
    ('verb_gap_77', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 34 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '34'::jsonb, 'instruction', 'Fill in the blanks with suitable verbs: want, let, make, allow, expect, wish.')
       || jsonb_build_object('gord', 25)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_130', null::text),
    ('verb_ch_131', null::text),
    ('verb_ch_132', null::text),
    ('verb_ch_133', null::text),
    ('verb_ch_134', null::text),
    ('verb_ch_135', null::text),
    ('verb_ch_136', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 35 (7)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '35'::jsonb, 'instruction', 'Replace the words in italics by the Complex Object.')
       || jsonb_build_object('gord', 26)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_78', null::text),
    ('verb_gap_79', null::text),
    ('verb_gap_80', null::text),
    ('verb_gap_81', null::text),
    ('verb_gap_82', null::text),
    ('verb_gap_83', null::text),
    ('verb_gap_84', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 36 (3)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '36'::jsonb, 'instruction', 'Complete the story. Use the elements in brackets to construct the Complex Object.')
       || jsonb_build_object('gord', 27)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_85', null::text),
    ('verb_gap_86', null::text),
    ('verb_gap_87', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 37 (10)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '37'::jsonb, 'instruction', 'Translate the sentences from Russian into English, using the model: want/expect/suppose/consider somebody to do something.')
       || jsonb_build_object('gord', 28)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_68', null::text),
    ('verb_ord_69', null::text),
    ('verb_ord_70', null::text),
    ('verb_ord_71', null::text),
    ('verb_ord_72', null::text),
    ('verb_ord_73', null::text),
    ('verb_ord_74', null::text),
    ('verb_ord_75', null::text),
    ('verb_ord_76', null::text),
    ('verb_ord_77', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 38 (16)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '38'::jsonb, 'instruction', 'Translate the sentences from Russian into English, paying attention to the form of the Infinitive.')
       || jsonb_build_object('gord', 29)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_78', null::text),
    ('verb_ord_79', null::text),
    ('verb_ord_80', null::text),
    ('verb_ord_81', null::text),
    ('verb_ord_82', null::text),
    ('verb_ord_83', null::text),
    ('verb_ord_84', null::text),
    ('verb_ord_85', null::text),
    ('verb_ord_86', null::text),
    ('verb_ord_87', null::text),
    ('verb_ord_88', null::text),
    ('verb_ord_89', null::text),
    ('verb_ord_90', null::text),
    ('verb_ord_91', null::text),
    ('verb_ord_92', null::text),
    ('verb_ord_93', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 39 (8)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '39'::jsonb, 'instruction', 'Translate the sentences from Russian into English.')
       || jsonb_build_object('gord', 30)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_94', null::text),
    ('verb_ord_95', null::text),
    ('verb_ord_96', null::text),
    ('verb_ord_97', null::text),
    ('verb_ord_98', null::text),
    ('verb_ord_99', null::text),
    ('verb_ord_100', null::text),
    ('verb_ord_101', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 40 (10)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '40'::jsonb, 'instruction', 'Translate the sentences, paying special attention to the use of the Complex Object.')
       || jsonb_build_object('gord', 31)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_137', null::text),
    ('verb_ch_138', null::text),
    ('verb_ch_139', null::text),
    ('verb_ch_140', null::text),
    ('verb_ch_141', null::text),
    ('verb_ch_142', null::text),
    ('verb_ch_143', null::text),
    ('verb_ch_144', null::text),
    ('verb_ch_145', null::text),
    ('verb_ch_146', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 41 (13)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '41'::jsonb, 'instruction', 'Fill in the blanks with the particle to where necessary.')
       || jsonb_build_object('gord', 32)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_147', null::text),
    ('verb_ch_148', null::text),
    ('verb_ch_149', null::text),
    ('verb_ch_150', null::text),
    ('verb_ch_151', null::text),
    ('verb_ch_152', null::text),
    ('verb_ch_153', null::text),
    ('verb_ch_154', null::text),
    ('verb_ch_155', null::text),
    ('verb_ch_156', null::text),
    ('verb_ch_157', null::text),
    ('verb_ch_158', null::text),
    ('verb_ch_159', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 42 (8)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '42'::jsonb, 'instruction', 'Replace the following complex sentences or groups of sentences by simple sentences with the Infinitive Construction.')
       || jsonb_build_object('gord', 33)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_88', null::text),
    ('verb_gap_89', null::text),
    ('verb_gap_90', null::text),
    ('verb_gap_91', null::text),
    ('verb_gap_92', null::text),
    ('verb_gap_93', null::text),
    ('verb_gap_94', null::text),
    ('verb_gap_95', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise 43 (16)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '43'::jsonb, 'instruction', 'Translate the sentences from Russian into English, using the Infinitive Construction wherever possible.')
       || jsonb_build_object('gord', 34)
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ord_102', null::text),
    ('verb_ord_103', null::text),
    ('verb_ord_104', null::text),
    ('verb_ord_105', null::text),
    ('verb_ord_106', null::text),
    ('verb_ord_107', null::text),
    ('verb_ord_108', null::text),
    ('verb_ord_109', null::text),
    ('verb_ord_110', null::text),
    ('verb_ord_111', null::text),
    ('verb_ord_112', null::text),
    ('verb_ord_113', null::text),
    ('verb_ord_114', null::text),
    ('verb_ord_115', null::text),
    ('verb_ord_116', null::text),
    ('verb_ord_117', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise CS1 (14)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"CS1"'::jsonb, 'instruction', 'Put the verbs in brackets into the appropriate form of the Infinitive.')
       || jsonb_build_object('gord', 35)
       || jsonb_build_object('groupTitle', 'Complex Subject · 1')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_96', null::text),
    ('verb_gap_97', null::text),
    ('verb_gap_98', null::text),
    ('verb_gap_99', null::text),
    ('verb_gap_100', null::text),
    ('verb_gap_101', null::text),
    ('verb_gap_102', null::text),
    ('verb_gap_103', null::text),
    ('verb_gap_104', null::text),
    ('verb_gap_105', null::text),
    ('verb_gap_106', null::text),
    ('verb_gap_107', null::text),
    ('verb_gap_108', null::text),
    ('verb_gap_109', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise CS2 (11)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"CS2"'::jsonb, 'instruction', 'Rewrite the sentences using the Complex Subject, as in the model: It is reported that the delegation has left London. → The delegation is reported to have left London.')
       || jsonb_build_object('gord', 36)
       || jsonb_build_object('groupTitle', 'Complex Subject · 2')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_110', null::text),
    ('verb_gap_111', null::text),
    ('verb_gap_112', null::text),
    ('verb_gap_113', null::text),
    ('verb_gap_114', null::text),
    ('verb_gap_115', null::text),
    ('verb_gap_116', null::text),
    ('verb_gap_117', null::text),
    ('verb_gap_118', null::text),
    ('verb_gap_119', null::text),
    ('verb_gap_120', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise CS3 (27)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"CS3"'::jsonb, 'instruction', 'Put the verbs in brackets into the appropriate form of the Infinitive.')
       || jsonb_build_object('gord', 37)
       || jsonb_build_object('groupTitle', 'Complex Subject · 3')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_121', null::text),
    ('verb_gap_122', null::text),
    ('verb_gap_123', null::text),
    ('verb_gap_124', null::text),
    ('verb_gap_125', null::text),
    ('verb_gap_126', null::text),
    ('verb_gap_127', null::text),
    ('verb_gap_128', null::text),
    ('verb_gap_129', null::text),
    ('verb_gap_130', null::text),
    ('verb_gap_131', null::text),
    ('verb_gap_132', null::text),
    ('verb_gap_133', null::text),
    ('verb_gap_134', null::text),
    ('verb_gap_135', null::text),
    ('verb_gap_136', null::text),
    ('verb_gap_137', null::text),
    ('verb_gap_138', null::text),
    ('verb_gap_139', null::text),
    ('verb_gap_140', null::text),
    ('verb_gap_141', null::text),
    ('verb_gap_142', null::text),
    ('verb_gap_143', null::text),
    ('verb_gap_144', null::text),
    ('verb_gap_145', null::text),
    ('verb_gap_146', null::text),
    ('verb_gap_147', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise GA (25)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"GA"'::jsonb, 'instruction', 'Put the verbs in brackets into the correct form and fill in the preposition.')
       || jsonb_build_object('gord', 38)
       || jsonb_build_object('groupTitle', 'Worksheet · Gerund A')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_148', null::text),
    ('verb_gap_149', null::text),
    ('verb_gap_150', null::text),
    ('verb_gap_151', null::text),
    ('verb_gap_152', null::text),
    ('verb_gap_153', null::text),
    ('verb_gap_154', null::text),
    ('verb_gap_155', null::text),
    ('verb_gap_156', null::text),
    ('verb_gap_157', null::text),
    ('verb_gap_158', null::text),
    ('verb_gap_159', null::text),
    ('verb_gap_160', null::text),
    ('verb_gap_161', null::text),
    ('verb_gap_162', null::text),
    ('verb_gap_163', null::text),
    ('verb_gap_164', null::text),
    ('verb_gap_165', null::text),
    ('verb_gap_166', null::text),
    ('verb_gap_167', null::text),
    ('verb_gap_168', null::text),
    ('verb_gap_169', null::text),
    ('verb_gap_170', null::text),
    ('verb_gap_171', null::text),
    ('verb_gap_172', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise GB (20)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"GB"'::jsonb, 'instruction', 'Put the verbs in brackets into the correct form and fill in the preposition.')
       || jsonb_build_object('gord', 39)
       || jsonb_build_object('groupTitle', 'Worksheet · Gerund B')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_173', null::text),
    ('verb_gap_174', null::text),
    ('verb_gap_175', null::text),
    ('verb_gap_176', null::text),
    ('verb_gap_177', null::text),
    ('verb_gap_178', null::text),
    ('verb_gap_179', null::text),
    ('verb_gap_180', null::text),
    ('verb_gap_181', null::text),
    ('verb_gap_182', null::text),
    ('verb_gap_183', null::text),
    ('verb_gap_184', null::text),
    ('verb_gap_185', null::text),
    ('verb_gap_186', null::text),
    ('verb_gap_187', null::text),
    ('verb_gap_188', null::text),
    ('verb_gap_189', null::text),
    ('verb_gap_190', null::text),
    ('verb_gap_191', null::text),
    ('verb_gap_192', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise GC (9)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"GC"'::jsonb, 'instruction', 'Put the verbs in brackets into the correct form and fill in the preposition.')
       || jsonb_build_object('gord', 40)
       || jsonb_build_object('groupTitle', 'Worksheet · Gerund C')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_193', null::text),
    ('verb_gap_194', null::text),
    ('verb_gap_195', null::text),
    ('verb_gap_196', null::text),
    ('verb_gap_197', null::text),
    ('verb_gap_198', null::text),
    ('verb_gap_199', null::text),
    ('verb_gap_200', null::text),
    ('verb_gap_201', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise PC (10)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"PC"'::jsonb, 'instruction', 'Rewrite the sentences using a participle (clause).')
       || jsonb_build_object('gord', 41)
       || jsonb_build_object('groupTitle', 'Worksheet · Participles')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_gap_363', null::text),
    ('verb_gap_364', null::text),
    ('verb_gap_365', null::text),
    ('verb_gap_366', null::text),
    ('verb_gap_367', null::text),
    ('verb_gap_368', null::text),
    ('verb_gap_369', null::text),
    ('verb_gap_370', null::text),
    ('verb_gap_371', null::text),
    ('verb_gap_372', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- verbals: Exercise PE (14)
update exercises e
   set payload = e.payload
       || jsonb_build_object('group', '"PE"'::jsonb, 'instruction', 'Choose the correct participle (-ing or -ed).')
       || jsonb_build_object('gord', 42)
       || jsonb_build_object('groupTitle', 'Worksheet · Participles in use')
       || case when v.no is null then '{}'::jsonb
               when v.no ~ '^[0-9]+$' then jsonb_build_object('no', v.no::int)
               else jsonb_build_object('no', v.no) end
  from (values
    ('verb_ch_160', null::text),
    ('verb_ch_161', null::text),
    ('verb_ch_162', null::text),
    ('verb_ch_163', null::text),
    ('verb_ch_164', null::text),
    ('verb_ch_165', null::text),
    ('verb_ch_166', null::text),
    ('verb_ch_167', null::text),
    ('verb_ch_168', null::text),
    ('verb_ch_169', null::text),
    ('verb_ch_170', null::text),
    ('verb_ch_171', null::text),
    ('verb_ch_172', null::text),
    ('verb_ch_173', null::text)
  ) as v(lid, no)
 where e.legacy_id = v.lid
   and e.student_id is null
   and e.topic_id = (select id from topics where slug = 'verbals');

-- Exercise 1, пункт 2 у книзі містить ще й слово «ancient» (раніше було пропущене)
update exercises
   set payload = payload || '{"answer":"small ancient stone cottage","scrambled":["stone","ancient","small","cottage"],"hint":"Size → Age → Material → Noun"}'::jsonb
 where legacy_id = 'ord_1' and student_id is null
   and topic_id = (select id from topics where slug = 'adjectives');


-- ============================================================
--  ПІДТЕМИ
--  Кожна тема ділиться на підтеми з власною теорією та вправами.
--  Verbals розбито на три теми: Infinitive, Gerund, Participle.
-- ============================================================
alter table public.topics        add column if not exists subtopics jsonb not null default '[]'::jsonb;
alter table public.theory_blocks add column if not exists subtopic  text;
alter table public.exercises     add column if not exists subtopic  text;

-- ── Verbals → Infinitive / Gerund / Participle ──
insert into public.topics (slug, title, description, position)
values ('infinitive', 'Інфінітив (Infinitive)', 'Форми інфінітива, інфінітив із to і без to, його функції в реченні, складний додаток і складний підмет.', 7)
on conflict (slug) do update set title = excluded.title, description = excluded.description, position = excluded.position;
insert into public.topics (slug, title, description, position)
values ('gerund', 'Герундій (Gerund)', 'Форми й функції герундія, дієслова й вирази лише з -ing, прийменник + герундій, вибір між інфінітивом і -ing.', 8)
on conflict (slug) do update set title = excluded.title, description = excluded.description, position = excluded.position;
insert into public.topics (slug, title, description, position)
values ('participle', 'Дієприкметник (Participle)', 'Participle I і II: boring чи bored, дієприкметникові звороти.', 9)
on conflict (slug) do update set title = excluded.title, description = excluded.description, position = excluded.position;
update public.topics set position = 10 where slug = 'comparisons';

insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position, subtopic)
select (select id from public.topics where slug = 'infinitive'), tb.block_key, tb.title, tb.level, tb.kind, tb.content_json, tb.content_html, tb.position, null
  from public.theory_blocks tb join public.topics v on v.id = tb.topic_id
 where v.slug = 'verbals' and tb.block_key = 'th_1'
on conflict (topic_id, block_key) do nothing;
insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position, subtopic)
select (select id from public.topics where slug = 'infinitive'), tb.block_key, tb.title, tb.level, tb.kind, tb.content_json, tb.content_html, tb.position, null
  from public.theory_blocks tb join public.topics v on v.id = tb.topic_id
 where v.slug = 'verbals' and tb.block_key = 'th_18'
on conflict (topic_id, block_key) do nothing;
insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position, subtopic)
select (select id from public.topics where slug = 'gerund'), tb.block_key, tb.title, tb.level, tb.kind, tb.content_json, tb.content_html, tb.position, null
  from public.theory_blocks tb join public.topics v on v.id = tb.topic_id
 where v.slug = 'verbals' and tb.block_key = 'th_1'
on conflict (topic_id, block_key) do nothing;
insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position, subtopic)
select (select id from public.topics where slug = 'gerund'), tb.block_key, tb.title, tb.level, tb.kind, tb.content_json, tb.content_html, tb.position, null
  from public.theory_blocks tb join public.topics v on v.id = tb.topic_id
 where v.slug = 'verbals' and tb.block_key = 'th_18'
on conflict (topic_id, block_key) do nothing;
insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position, subtopic)
select (select id from public.topics where slug = 'participle'), tb.block_key, tb.title, tb.level, tb.kind, tb.content_json, tb.content_html, tb.position, null
  from public.theory_blocks tb join public.topics v on v.id = tb.topic_id
 where v.slug = 'verbals' and tb.block_key = 'th_1'
on conflict (topic_id, block_key) do nothing;
insert into public.theory_blocks (topic_id, block_key, title, level, kind, content_json, content_html, position, subtopic)
select (select id from public.topics where slug = 'participle'), tb.block_key, tb.title, tb.level, tb.kind, tb.content_json, tb.content_html, tb.position, null
  from public.theory_blocks tb join public.topics v on v.id = tb.topic_id
 where v.slug = 'verbals' and tb.block_key = 'th_18'
on conflict (topic_id, block_key) do nothing;

update public.theory_blocks tb set topic_id = (select id from public.topics where slug = 'infinitive')
  from public.topics v
 where v.id = tb.topic_id and v.slug = 'verbals' and tb.block_key in ('th_2', 'th_3', 'th_4', 'th_6', 'th_8', 'th_9', 'th_10');
update public.theory_blocks tb set topic_id = (select id from public.topics where slug = 'gerund')
  from public.topics v
 where v.id = tb.topic_id and v.slug = 'verbals' and tb.block_key in ('th_11', 'th_12', 'th_13', 'th_14', 'th_15');
update public.theory_blocks tb set topic_id = (select id from public.topics where slug = 'participle')
  from public.topics v
 where v.id = tb.topic_id and v.slug = 'verbals' and tb.block_key in ('th_16', 'th_17');

update public.exercises e set topic_id = (select id from public.topics where slug = 'gerund')
  from public.topics v
 where v.id = e.topic_id and v.slug = 'verbals' and e.student_id is null
   and e.legacy_id in ('verb_abcd_1', 'verb_abcd_2', 'verb_abcd_3', 'verb_abcd_4', 'verb_abcd_5', 'verb_abcd_6', 'verb_abcd_7', 'verb_abcd_8', 'verb_abcd_9', 'verb_abcd_10', 'verb_abcd_11', 'verb_abcd_12', 'verb_cr_12', 'verb_abcd_13', 'verb_cr_13', 'verb_abcd_14', 'verb_cr_14', 'verb_abcd_15', 'verb_abcd_16', 'verb_abcd_17', 'verb_abcd_18', 'verb_abcd_19', 'verb_abcd_20', 'verb_ord_118', 'verb_gap_148', 'verb_gap_149', 'verb_gap_150', 'verb_gap_151', 'verb_gap_152', 'verb_gap_153', 'verb_gap_154', 'verb_gap_155', 'verb_gap_156', 'verb_gap_157', 'verb_gap_158', 'verb_gap_159', 'verb_gap_160', 'verb_gap_161', 'verb_gap_162', 'verb_gap_163', 'verb_gap_164', 'verb_gap_165', 'verb_gap_166', 'verb_gap_167', 'verb_gap_168', 'verb_gap_169', 'verb_gap_170', 'verb_gap_171', 'verb_gap_172', 'verb_gap_173', 'verb_gap_174', 'verb_gap_175', 'verb_gap_176', 'verb_gap_177', 'verb_gap_178', 'verb_gap_179', 'verb_gap_180', 'verb_gap_181', 'verb_gap_182', 'verb_gap_183', 'verb_gap_184', 'verb_gap_185', 'verb_gap_186', 'verb_gap_187', 'verb_gap_188', 'verb_gap_189', 'verb_gap_190', 'verb_gap_191', 'verb_gap_192', 'verb_gap_193', 'verb_gap_194', 'verb_gap_195', 'verb_gap_196', 'verb_gap_197', 'verb_gap_198', 'verb_gap_199', 'verb_gap_200', 'verb_gap_201', 'verb_gap_202', 'verb_gap_203', 'verb_gap_204', 'verb_gap_205', 'verb_gap_207', 'verb_gap_208', 'verb_gap_211', 'verb_gap_212', 'verb_gap_215', 'verb_gap_228', 'verb_gap_231', 'verb_gap_233', 'verb_gap_234', 'verb_gap_235', 'verb_gap_236', 'verb_gap_237', 'verb_gap_238', 'verb_gap_240', 'verb_gap_241', 'verb_gap_242', 'verb_gap_243', 'verb_gap_245', 'verb_gap_246', 'verb_gap_249', 'verb_gap_251', 'verb_gap_252', 'verb_gap_253', 'verb_gap_255', 'verb_gap_256', 'verb_gap_258', 'verb_gap_259', 'verb_gap_260', 'verb_gap_261', 'verb_gap_262', 'verb_gap_263', 'verb_gap_264', 'verb_gap_265', 'verb_gap_266', 'verb_gap_267', 'verb_gap_268', 'verb_gap_269', 'verb_gap_270', 'verb_gap_271', 'verb_gap_272', 'verb_gap_273', 'verb_gap_274', 'verb_gap_275', 'verb_gap_276', 'verb_gap_277', 'verb_gap_278', 'verb_gap_279', 'verb_gap_280', 'verb_gap_281', 'verb_gap_282', 'verb_gap_283', 'verb_gap_284', 'verb_gap_285', 'verb_gap_286', 'verb_gap_287', 'verb_gap_288', 'verb_gap_289', 'verb_gap_290', 'verb_gap_291', 'verb_gap_292', 'verb_gap_293', 'verb_gap_294', 'verb_gap_295', 'verb_gap_296', 'verb_gap_297', 'verb_gap_299', 'verb_gap_300', 'verb_gap_301', 'verb_gap_303', 'verb_gap_304', 'verb_gap_305', 'verb_gap_306', 'verb_gap_310', 'verb_gap_311', 'verb_gap_312', 'verb_gap_313', 'verb_gap_314', 'verb_gap_315', 'verb_gap_316', 'verb_gap_317', 'verb_gap_318', 'verb_gap_319', 'verb_gap_320', 'verb_gap_321', 'verb_gap_322', 'verb_gap_323', 'verb_gap_325', 'verb_gap_326', 'verb_gap_327', 'verb_gap_328', 'verb_gap_329', 'verb_gap_330', 'verb_gap_331', 'verb_gap_334', 'verb_gap_335', 'verb_gap_336', 'verb_gap_337', 'verb_gap_338', 'verb_gap_339', 'verb_gap_340', 'verb_gap_341', 'verb_gap_342', 'verb_gap_343', 'verb_gap_346', 'verb_gap_347', 'verb_gap_348', 'verb_gap_349', 'verb_gap_350', 'verb_gap_351', 'verb_gap_352', 'verb_gap_356', 'verb_gap_357', 'verb_gap_360', 'verb_gap_362', 'verb_gap_373', 'verb_gap_374', 'verb_gap_375', 'verb_gap_377', 'verb_gap_379', 'verb_gap_381', 'verb_gap_384', 'verb_gap_385', 'verb_gap_388', 'verb_gap_389');
update public.exercises e set topic_id = (select id from public.topics where slug = 'infinitive')
  from public.topics v
 where v.id = e.topic_id and v.slug = 'verbals' and e.student_id is null
   and e.legacy_id in ('verb_ch_1', 'verb_cr_1', 'verb_gap_1', 'verb_ord_1', 'verb_ch_2', 'verb_cr_2', 'verb_gap_2', 'verb_ord_2', 'verb_ch_3', 'verb_cr_3', 'verb_gap_3', 'verb_ord_3', 'verb_ch_4', 'verb_cr_4', 'verb_gap_4', 'verb_ord_4', 'verb_ch_5', 'verb_cr_5', 'verb_gap_5', 'verb_ord_5', 'verb_ch_6', 'verb_cr_6', 'verb_gap_6', 'verb_ord_6', 'verb_ch_7', 'verb_cr_7', 'verb_gap_7', 'verb_ord_7', 'verb_ch_8', 'verb_cr_8', 'verb_gap_8', 'verb_ord_8', 'verb_ch_9', 'verb_cr_9', 'verb_gap_9', 'verb_ord_9', 'verb_ch_10', 'verb_cr_10', 'verb_gap_10', 'verb_ord_10', 'verb_ch_11', 'verb_cr_11', 'verb_gap_11', 'verb_ord_11', 'verb_ch_12', 'verb_gap_12', 'verb_ord_12', 'verb_ch_13', 'verb_gap_13', 'verb_ord_13', 'verb_ch_14', 'verb_gap_14', 'verb_ord_14', 'verb_ch_15', 'verb_cr_15', 'verb_gap_15', 'verb_ord_15', 'verb_ch_16', 'verb_gap_16', 'verb_ord_16', 'verb_ch_17', 'verb_gap_17', 'verb_ord_17', 'verb_ch_18', 'verb_gap_18', 'verb_ord_18', 'verb_ch_19', 'verb_gap_19', 'verb_ord_19', 'verb_ch_20', 'verb_gap_20', 'verb_ord_20', 'verb_ch_21', 'verb_gap_21', 'verb_ord_21', 'verb_ch_22', 'verb_gap_22', 'verb_ord_22', 'verb_ch_23', 'verb_gap_23', 'verb_ord_23', 'verb_ch_24', 'verb_gap_24', 'verb_ord_24', 'verb_ch_25', 'verb_gap_25', 'verb_ord_25', 'verb_ch_26', 'verb_gap_26', 'verb_ord_26', 'verb_ch_27', 'verb_gap_27', 'verb_ord_27', 'verb_ch_28', 'verb_gap_28', 'verb_ord_28', 'verb_ch_29', 'verb_gap_29', 'verb_ord_29', 'verb_ch_30', 'verb_gap_30', 'verb_ord_30', 'verb_ch_31', 'verb_gap_31', 'verb_ord_31', 'verb_ch_32', 'verb_gap_32', 'verb_ord_32', 'verb_ch_33', 'verb_gap_33', 'verb_ord_33', 'verb_ch_34', 'verb_gap_34', 'verb_ord_34', 'verb_ch_35', 'verb_gap_35', 'verb_ord_35', 'verb_ch_36', 'verb_gap_36', 'verb_ord_36', 'verb_ch_37', 'verb_gap_37', 'verb_ord_37', 'verb_ch_38', 'verb_gap_38', 'verb_ord_38', 'verb_ch_39', 'verb_gap_39', 'verb_ord_39', 'verb_ch_40', 'verb_gap_40', 'verb_ord_40', 'verb_ch_41', 'verb_gap_41', 'verb_ord_41', 'verb_ch_42', 'verb_gap_42', 'verb_ord_42', 'verb_ch_43', 'verb_gap_43', 'verb_ord_43', 'verb_ch_44', 'verb_gap_44', 'verb_ord_44', 'verb_ch_45', 'verb_gap_45', 'verb_ord_45', 'verb_ch_46', 'verb_gap_46', 'verb_ord_46', 'verb_ch_47', 'verb_gap_47', 'verb_ord_47', 'verb_ch_48', 'verb_gap_48', 'verb_ord_48', 'verb_ch_49', 'verb_gap_49', 'verb_ord_49', 'verb_ch_50', 'verb_gap_50', 'verb_ord_50', 'verb_ch_51', 'verb_gap_51', 'verb_ord_51', 'verb_ch_52', 'verb_gap_52', 'verb_ord_52', 'verb_ch_53', 'verb_gap_53', 'verb_ord_53', 'verb_ch_54', 'verb_gap_54', 'verb_ord_54', 'verb_ch_55', 'verb_gap_55', 'verb_ord_55', 'verb_ch_56', 'verb_gap_56', 'verb_ord_56', 'verb_ch_57', 'verb_gap_57', 'verb_ord_57', 'verb_ch_58', 'verb_gap_58', 'verb_ord_58', 'verb_ch_59', 'verb_gap_59', 'verb_ord_59', 'verb_ch_60', 'verb_gap_60', 'verb_ord_60', 'verb_ch_61', 'verb_gap_61', 'verb_ord_61', 'verb_ch_62', 'verb_gap_62', 'verb_ord_62', 'verb_ch_63', 'verb_gap_63', 'verb_ord_63', 'verb_ch_64', 'verb_gap_64', 'verb_ord_64', 'verb_ch_65', 'verb_gap_65', 'verb_ord_65', 'verb_ch_66', 'verb_gap_66', 'verb_ord_66', 'verb_ch_67', 'verb_gap_67', 'verb_ord_67', 'verb_ch_68', 'verb_gap_68', 'verb_ord_68', 'verb_ch_69', 'verb_gap_69', 'verb_ord_69', 'verb_ch_70', 'verb_gap_70', 'verb_ord_70', 'verb_ch_71', 'verb_gap_71', 'verb_ord_71', 'verb_ch_72', 'verb_gap_72', 'verb_ord_72', 'verb_ch_73', 'verb_gap_73', 'verb_ord_73', 'verb_ch_74', 'verb_gap_74', 'verb_ord_74', 'verb_ch_75', 'verb_gap_75', 'verb_ord_75', 'verb_ch_76', 'verb_gap_76', 'verb_ord_76', 'verb_ch_77', 'verb_gap_77', 'verb_ord_77', 'verb_ch_78', 'verb_gap_78', 'verb_ord_78', 'verb_ch_79', 'verb_gap_79', 'verb_ord_79', 'verb_ch_80', 'verb_gap_80', 'verb_ord_80', 'verb_ch_81', 'verb_gap_81', 'verb_ord_81', 'verb_ch_82', 'verb_gap_82', 'verb_ord_82', 'verb_ch_83', 'verb_gap_83', 'verb_ord_83', 'verb_ch_84', 'verb_gap_84', 'verb_ord_84', 'verb_ch_85', 'verb_gap_85', 'verb_ord_85', 'verb_ch_86', 'verb_gap_86', 'verb_ord_86', 'verb_ch_87', 'verb_gap_87', 'verb_ord_87', 'verb_ch_88', 'verb_gap_88', 'verb_ord_88', 'verb_ch_89', 'verb_gap_89', 'verb_ord_89', 'verb_ch_90', 'verb_gap_90', 'verb_ord_90', 'verb_ch_91', 'verb_gap_91', 'verb_ord_91', 'verb_ch_92', 'verb_gap_92', 'verb_ord_92', 'verb_ch_93', 'verb_gap_93', 'verb_ord_93', 'verb_ch_94', 'verb_gap_94', 'verb_ord_94', 'verb_ch_95', 'verb_gap_95', 'verb_ord_95', 'verb_ch_96', 'verb_gap_96', 'verb_ord_96', 'verb_ch_97', 'verb_gap_97', 'verb_ord_97', 'verb_ch_98', 'verb_gap_98', 'verb_ord_98', 'verb_ch_99', 'verb_gap_99', 'verb_ord_99', 'verb_ch_100', 'verb_gap_100', 'verb_ord_100', 'verb_ch_101', 'verb_gap_101', 'verb_ord_101', 'verb_ch_102', 'verb_gap_102', 'verb_ord_102', 'verb_ch_103', 'verb_gap_103', 'verb_ord_103', 'verb_ch_104', 'verb_gap_104', 'verb_ord_104', 'verb_ch_105', 'verb_gap_105', 'verb_ord_105', 'verb_ch_106', 'verb_gap_106', 'verb_ord_106', 'verb_ch_107', 'verb_gap_107', 'verb_ord_107', 'verb_ch_108', 'verb_gap_108', 'verb_ord_108', 'verb_ch_109', 'verb_gap_109', 'verb_ord_109', 'verb_ch_110', 'verb_gap_110', 'verb_ord_110', 'verb_ch_111', 'verb_gap_111', 'verb_ord_111', 'verb_ch_112', 'verb_gap_112', 'verb_ord_112', 'verb_ch_113', 'verb_gap_113', 'verb_ord_113', 'verb_ch_114', 'verb_gap_114', 'verb_ord_114', 'verb_ch_115', 'verb_gap_115', 'verb_ord_115', 'verb_ch_116', 'verb_gap_116', 'verb_ord_116', 'verb_ch_117', 'verb_gap_117', 'verb_ord_117', 'verb_ch_118', 'verb_gap_118', 'verb_ch_119', 'verb_gap_119', 'verb_ch_120', 'verb_gap_120', 'verb_ch_121', 'verb_gap_121', 'verb_ch_122', 'verb_gap_122', 'verb_ch_123', 'verb_gap_123', 'verb_ch_124', 'verb_gap_124', 'verb_ch_125', 'verb_gap_125', 'verb_ch_126', 'verb_gap_126', 'verb_ch_127', 'verb_gap_127', 'verb_ch_128', 'verb_gap_128', 'verb_ch_129', 'verb_gap_129', 'verb_ch_130', 'verb_gap_130', 'verb_ch_131', 'verb_gap_131', 'verb_ch_132', 'verb_gap_132', 'verb_ch_133', 'verb_gap_133', 'verb_ch_134', 'verb_gap_134', 'verb_ch_135', 'verb_gap_135', 'verb_ch_136', 'verb_gap_136', 'verb_ch_137', 'verb_gap_137', 'verb_ch_138', 'verb_gap_138', 'verb_ch_139', 'verb_gap_139', 'verb_ch_140', 'verb_gap_140', 'verb_ch_141', 'verb_gap_141', 'verb_ch_142', 'verb_gap_142', 'verb_ch_143', 'verb_gap_143', 'verb_ch_144', 'verb_gap_144', 'verb_ch_145', 'verb_gap_145', 'verb_ch_146', 'verb_gap_146', 'verb_ch_147', 'verb_gap_147', 'verb_ch_148', 'verb_ch_149', 'verb_ch_150', 'verb_ch_151', 'verb_ch_152', 'verb_ch_153', 'verb_ch_154', 'verb_ch_155', 'verb_ch_156', 'verb_ch_157', 'verb_ch_158', 'verb_ch_159', 'verb_gap_206', 'verb_gap_209', 'verb_gap_210', 'verb_gap_213', 'verb_gap_214', 'verb_gap_216', 'verb_gap_217', 'verb_gap_218', 'verb_gap_219', 'verb_gap_220', 'verb_gap_221', 'verb_gap_222', 'verb_gap_223', 'verb_gap_224', 'verb_gap_225', 'verb_gap_226', 'verb_gap_227', 'verb_gap_229', 'verb_gap_230', 'verb_gap_232', 'verb_gap_239', 'verb_gap_244', 'verb_gap_247', 'verb_gap_248', 'verb_gap_250', 'verb_gap_254', 'verb_gap_257', 'verb_gap_298', 'verb_gap_302', 'verb_gap_307', 'verb_gap_308', 'verb_gap_309', 'verb_gap_324', 'verb_gap_332', 'verb_gap_333', 'verb_gap_344', 'verb_gap_345', 'verb_gap_353', 'verb_gap_354', 'verb_gap_355', 'verb_gap_358', 'verb_gap_359', 'verb_gap_361', 'verb_gap_378', 'verb_gap_380', 'verb_gap_382', 'verb_gap_386');
update public.exercises e set topic_id = (select id from public.topics where slug = 'participle')
  from public.topics v
 where v.id = e.topic_id and v.slug = 'verbals' and e.student_id is null
   and e.legacy_id in ('verb_ch_160', 'verb_ch_161', 'verb_ch_162', 'verb_ch_163', 'verb_ch_164', 'verb_ch_165', 'verb_ch_166', 'verb_ch_167', 'verb_ch_168', 'verb_ch_169', 'verb_ch_170', 'verb_ch_171', 'verb_ch_172', 'verb_ch_173', 'verb_gap_363', 'verb_gap_364', 'verb_gap_365', 'verb_gap_366', 'verb_gap_367', 'verb_gap_368', 'verb_gap_369', 'verb_gap_370', 'verb_gap_371', 'verb_gap_372', 'verb_gap_376', 'verb_gap_383', 'verb_gap_387');

-- доступ, який учні мали до Verbals, переходить на три нові теми
insert into public.assignments (student_id, topic_id, max_level, theory_visible)
select a.student_id, n.id, a.max_level, a.theory_visible
  from public.assignments a
  join public.topics v on v.id = a.topic_id and v.slug = 'verbals'
  cross join public.topics n
 where n.slug in ('infinitive', 'gerund', 'participle')
on conflict (student_id, topic_id) do nothing;

-- стару тему видаляємо лише тоді, коли в ній не лишилось жодної вправи
delete from public.topics t
 where t.slug = 'verbals'
   and not exists (select 1 from public.exercises e where e.topic_id = t.id);

-- ── Визначення підтем ──
update public.topics set subtopics = '[{"slug":"adj_position","title":"Де стоїть прикметник: думка чи факт","description":"Позиція прикметника в реченні та різниця між оцінкою й фактом."},{"slug":"adj_order","title":"Порядок прикметників","description":"Коли прикметників кілька, їх ставлять у певному порядку (OSASCOMP)."},{"slug":"adj_compound","title":"Складні прикметники та іменник замість прикметника","description":"Compound adjectives, gold/golden, silk/silky і подібні."},{"slug":"adj_the","title":"The + прикметник і прикметники з обмеженою позицією","description":"Група людей (the rich), а також afraid, asleep, chief, elder."}]'::jsonb where slug = 'adjectives';
update public.topics set subtopics = '[{"slug":"adv_form","title":"Що таке прислівник і як він утворюється","description":"Види прислівників, суфікс -ly та його правопис."},{"slug":"adv_vs_adj","title":"Прислівник чи прикметник?","description":"Коли потрібен прикметник, коли прислівник, і слова з однією формою чи двома значеннями."},{"slug":"adv_place","title":"Місце прислівника в реченні","description":"Де стоять прислівники способу, частоти, місця й часу."},{"slug":"adv_degree","title":"Fairly, quite, rather, pretty","description":"Прислівники міри: як вони змінюють силу прикметника."}]'::jsonb where slug = 'adverbs';
update public.topics set subtopics = '[{"slug":"noun_plural","title":"Множина іменників: правопис","description":"Що таке іменник, які бувають іменники та чотири правила правопису множини."},{"slug":"noun_irreg","title":"Неправильна множина","description":"Форми, які треба вивчити напам''ять: man → men, foot → feet."},{"slug":"noun_foreign","title":"Запозичені та складені іменники","description":"Множина слів грецького й латинського походження та складених іменників."},{"slug":"noun_count","title":"Злічувані, незлічувані й узгодження з дієсловом","description":"Злічувані й незлічувані іменники, слова лише в однині чи лише у множині та форма дієслова."}]'::jsonb where slug = 'nouns';
update public.topics set subtopics = '[{"slug":"art_first","title":"A/an і the: перша та друга згадка","description":"Коли слухач ще не знає предмета (a/an) і коли вже знає (the). Також a/an у значенні «за»."},{"slug":"art_situation","title":"The: ясно з ситуації та єдині у своєму роді","description":"The nearest shop, the sun, the radio: що розуміється без пояснень."},{"slug":"art_places","title":"Home, school, the cinema: місця й повсякденні поняття","description":"Коли артикля немає (school, breakfast), а коли є (the cinema, the school)."},{"slug":"art_general","title":"Загальне чи конкретне: children чи the children","description":"Множина й незлічувані іменники: загалом чи про конкретні предмети. Де НЕ ставлять the."},{"slug":"art_names","title":"Назви без the й з the: країни, міста, океани, річки","description":"Географічні назви та власні імена."},{"slug":"art_buildings","title":"Будівлі, вулиці, організації, газети","description":"Артиклі з назвами пам''яток, вулиць, установ і видань."},{"slug":"art_mix","title":"Змішана практика: всі артиклі разом","description":"Вправи на всі правила про артиклі одразу, без окремої теорії.","mix":true}]'::jsonb where slug = 'articles';
update public.topics set subtopics = '[{"slug":"cmp_form","title":"Як утворити ступені порівняння","description":"Короткі й довгі прикметники, неправильні форми, ступені прислівників."},{"slug":"cmp_structures","title":"Конструкції порівняння","description":"Than, the … of/in, as … as, the same as, підсилювачі та подвійні форми."},{"slug":"cmp_likeas","title":"Like чи as?","description":"Два слова, які однаково перекладаються, але вживаються по-різному."},{"slug":"cmp_errors","title":"Типові помилки й підсумок","description":"Стоп-калька, відмінності між мовами і змішані вправи на всю тему."}]'::jsonb where slug = 'comparisons';
update public.topics set subtopics = '[{"slug":"modal_present","title":"Теперішній і майбутній час","description":"Уміння, дозвіл, прохання, пропозиції, обов''язок, заборона, порада, впевненість і припущення."},{"slug":"modal_past","title":"Минулий час","description":"Could і was able to, висновки про минуле, критика, втрачені можливості, необхідність у минулому."},{"slug":"modal_mix","title":"Змішана практика й тест у форматі ECCE","description":"Тестові завдання на всі модальні дієслова разом, без окремої теорії.","mix":true}]'::jsonb where slug = 'modal_verbs';
update public.topics set subtopics = '[{"slug":"pron_personal","title":"Особові, присвійні та зворотні займенники","description":"I/me, my/mine, myself, each other, it і there, дієслова з -self."},{"slug":"pron_demo","title":"This, these, that, those","description":"Вказівні займенники: близько чи далеко, тепер чи колись."},{"slug":"pron_qty","title":"Скільки: a lot of, many, much, few, little","description":"Кількісні слова зі злічуваними й незлічуваними іменниками."},{"slug":"pron_some","title":"Some, any, no, every і похідні","description":"Something, anybody, nowhere, everything: ствердження, питання, заперечення."},{"slug":"pron_both","title":"Both, all, either, neither, each, every","description":"Про двох і про всіх, а також both … and, either … or, neither … nor."},{"slug":"pron_other","title":"Other, another, one(s)","description":"Other, another, the other(s), others і заміна іменника на one/ones."}]'::jsonb where slug = 'pronouns';
update public.topics set subtopics = '[{"slug":"inf_forms","title":"Форми інфінітива: час і стан","description":"Simple, Continuous, Perfect, Passive: яку форму вибрати і які помилки типові."},{"slug":"inf_to","title":"З часткою to і без неї","description":"Після яких слів to зникає: модальні, let, make, see, had better та інші."},{"slug":"inf_func","title":"Функції інфінітива: мета, означення, обставина","description":"Інфінітив як підмет, мета, означення; too / enough; the first to do."},{"slug":"inf_obj","title":"Складний додаток: I want you to go","description":"Підмет + дієслово + іменник/займенник + інфінітив, а також після see, hear, feel."},{"slug":"inf_subj","title":"Складний підмет: He is said to be…","description":"He seems / is said / is likely to do: пасивні конструкції з інфінітивом."}]'::jsonb where slug = 'infinitive';
update public.topics set subtopics = '[{"slug":"ger_form","title":"Форми та функції герундія","description":"Simple і Perfect, active і passive; герундій як підмет, додаток, означення."},{"slug":"ger_verbs","title":"Дієслова та вирази, після яких тільки -ing","description":"Enjoy, avoid, mind, suggest, it''s no use, can''t help: список, який варто знати."},{"slug":"ger_prep","title":"Прийменник + герундій","description":"Після будь-якого прийменника: interested in doing, accused of lying, look forward to seeing."},{"slug":"ger_mix","title":"Інфінітив чи -ing?","description":"Дієслова, що поєднуються з обома формами: з тим самим значенням і зі зміною значення (stop, remember, try)."}]'::jsonb where slug = 'gerund';
update public.topics set subtopics = '[{"slug":"par_use","title":"Participle I та II: boring чи bored?","description":"-ing описує те, що викликає почуття, -ed — того, хто його відчуває."},{"slug":"par_clause","title":"Дієприкметникові звороти","description":"Having finished, …; the man standing next to me; the film directed by Adam."}]'::jsonb where slug = 'participle';

-- ── Блоки теорії → підтеми ──
update public.theory_blocks tb set subtopic = 'adj_position'
  from public.topics t where t.id = tb.topic_id and t.slug = 'adjectives' and tb.block_key in ('th_1', 'th_2', 'th_8');
update public.theory_blocks tb set subtopic = 'adj_order'
  from public.topics t where t.id = tb.topic_id and t.slug = 'adjectives' and tb.block_key in ('th_3');
update public.theory_blocks tb set subtopic = 'adj_compound'
  from public.topics t where t.id = tb.topic_id and t.slug = 'adjectives' and tb.block_key in ('th_4', 'th_5');
update public.theory_blocks tb set subtopic = 'adj_the'
  from public.topics t where t.id = tb.topic_id and t.slug = 'adjectives' and tb.block_key in ('th_6', 'th_7');
update public.theory_blocks tb set subtopic = 'adv_form'
  from public.topics t where t.id = tb.topic_id and t.slug = 'adverbs' and tb.block_key in ('th_8', 'th_9');
update public.theory_blocks tb set subtopic = 'adv_vs_adj'
  from public.topics t where t.id = tb.topic_id and t.slug = 'adverbs' and tb.block_key in ('th_10', 'th_12', 'th_11');
update public.theory_blocks tb set subtopic = 'adv_place'
  from public.topics t where t.id = tb.topic_id and t.slug = 'adverbs' and tb.block_key in ('th_13');
update public.theory_blocks tb set subtopic = 'adv_degree'
  from public.topics t where t.id = tb.topic_id and t.slug = 'adverbs' and tb.block_key in ('th_14');
update public.theory_blocks tb set subtopic = 'noun_plural'
  from public.topics t where t.id = tb.topic_id and t.slug = 'nouns' and tb.block_key in ('th_1', 'th_2');
update public.theory_blocks tb set subtopic = 'noun_irreg'
  from public.topics t where t.id = tb.topic_id and t.slug = 'nouns' and tb.block_key in ('th_3');
update public.theory_blocks tb set subtopic = 'noun_foreign'
  from public.topics t where t.id = tb.topic_id and t.slug = 'nouns' and tb.block_key in ('th_4');
update public.theory_blocks tb set subtopic = 'noun_count'
  from public.topics t where t.id = tb.topic_id and t.slug = 'nouns' and tb.block_key in ('th_5', 'th_6', 'th_7', 'th_9');
update public.theory_blocks tb set subtopic = 'art_first'
  from public.topics t where t.id = tb.topic_id and t.slug = 'articles' and tb.block_key in ('th_8', 'th_10');
update public.theory_blocks tb set subtopic = 'art_situation'
  from public.topics t where t.id = tb.topic_id and t.slug = 'articles' and tb.block_key in ('th_9', 'th_11');
update public.theory_blocks tb set subtopic = 'art_places'
  from public.topics t where t.id = tb.topic_id and t.slug = 'articles' and tb.block_key in ('th_12', 'th_13');
update public.theory_blocks tb set subtopic = 'art_general'
  from public.topics t where t.id = tb.topic_id and t.slug = 'articles' and tb.block_key in ('th_14', 'th_18');
update public.theory_blocks tb set subtopic = 'art_names'
  from public.topics t where t.id = tb.topic_id and t.slug = 'articles' and tb.block_key in ('th_15', 'th_16');
update public.theory_blocks tb set subtopic = 'art_buildings'
  from public.topics t where t.id = tb.topic_id and t.slug = 'articles' and tb.block_key in ('th_17');
update public.theory_blocks tb set subtopic = 'cmp_form'
  from public.topics t where t.id = tb.topic_id and t.slug = 'comparisons' and tb.block_key in ('th_2', 'th_3', 'th_4');
update public.theory_blocks tb set subtopic = 'cmp_structures'
  from public.topics t where t.id = tb.topic_id and t.slug = 'comparisons' and tb.block_key in ('th_1', 'th_5', 'th_6', 'th_7');
update public.theory_blocks tb set subtopic = 'cmp_likeas'
  from public.topics t where t.id = tb.topic_id and t.slug = 'comparisons' and tb.block_key in ('th_8');
update public.theory_blocks tb set subtopic = 'cmp_errors'
  from public.topics t where t.id = tb.topic_id and t.slug = 'comparisons' and tb.block_key in ('th_9', 'th_10');
update public.theory_blocks tb set subtopic = 'modal_present'
  from public.topics t where t.id = tb.topic_id and t.slug = 'modal_verbs' and tb.block_key in ('th_1', 'th_2', 'th_4', 'th_5', 'th_6', 'th_7', 'th_8', 'th_10', 'th_11', 'th_18');
update public.theory_blocks tb set subtopic = 'modal_past'
  from public.topics t where t.id = tb.topic_id and t.slug = 'modal_verbs' and tb.block_key in ('th_3', 'th_12', 'th_13', 'th_14');
update public.theory_blocks tb set subtopic = 'pron_personal'
  from public.topics t where t.id = tb.topic_id and t.slug = 'pronouns' and tb.block_key in ('th_1', 'th_2', 'th_3', 'th_5', 'th_6', 'th_7', 'th_8', 'th_9', 'th_19');
update public.theory_blocks tb set subtopic = 'pron_demo'
  from public.topics t where t.id = tb.topic_id and t.slug = 'pronouns' and tb.block_key in ('th_10');
update public.theory_blocks tb set subtopic = 'pron_qty'
  from public.topics t where t.id = tb.topic_id and t.slug = 'pronouns' and tb.block_key in ('th_11', 'th_12');
update public.theory_blocks tb set subtopic = 'pron_some'
  from public.topics t where t.id = tb.topic_id and t.slug = 'pronouns' and tb.block_key in ('th_13', 'th_14');
update public.theory_blocks tb set subtopic = 'pron_both'
  from public.topics t where t.id = tb.topic_id and t.slug = 'pronouns' and tb.block_key in ('th_16', 'th_17', 'th_18');
update public.theory_blocks tb set subtopic = 'pron_other'
  from public.topics t where t.id = tb.topic_id and t.slug = 'pronouns' and tb.block_key in ('th_15');
update public.theory_blocks tb set subtopic = 'inf_forms'
  from public.topics t where t.id = tb.topic_id and t.slug = 'infinitive' and tb.block_key in ('th_1', 'th_2', 'th_18');
update public.theory_blocks tb set subtopic = 'inf_to'
  from public.topics t where t.id = tb.topic_id and t.slug = 'infinitive' and tb.block_key in ('th_3');
update public.theory_blocks tb set subtopic = 'inf_func'
  from public.topics t where t.id = tb.topic_id and t.slug = 'infinitive' and tb.block_key in ('th_4', 'th_6');
update public.theory_blocks tb set subtopic = 'inf_obj'
  from public.topics t where t.id = tb.topic_id and t.slug = 'infinitive' and tb.block_key in ('th_8', 'th_9');
update public.theory_blocks tb set subtopic = 'inf_subj'
  from public.topics t where t.id = tb.topic_id and t.slug = 'infinitive' and tb.block_key in ('th_10');
update public.theory_blocks tb set subtopic = 'ger_form'
  from public.topics t where t.id = tb.topic_id and t.slug = 'gerund' and tb.block_key in ('th_1', 'th_11', 'th_18');
update public.theory_blocks tb set subtopic = 'ger_verbs'
  from public.topics t where t.id = tb.topic_id and t.slug = 'gerund' and tb.block_key in ('th_12');
update public.theory_blocks tb set subtopic = 'ger_prep'
  from public.topics t where t.id = tb.topic_id and t.slug = 'gerund' and tb.block_key in ('th_13');
update public.theory_blocks tb set subtopic = 'ger_mix'
  from public.topics t where t.id = tb.topic_id and t.slug = 'gerund' and tb.block_key in ('th_14', 'th_15');
update public.theory_blocks tb set subtopic = 'par_use'
  from public.topics t where t.id = tb.topic_id and t.slug = 'participle' and tb.block_key in ('th_1', 'th_16', 'th_18');
update public.theory_blocks tb set subtopic = 'par_clause'
  from public.topics t where t.id = tb.topic_id and t.slug = 'participle' and tb.block_key in ('th_17');

-- ── Вправи → підтеми ──
update public.exercises e set subtopic = 'adj_compound'
  from public.topics t where t.id = e.topic_id and t.slug = 'adjectives' and e.student_id is null
   and e.legacy_id in ('ch_1', 'ch_2', 'ch_3', 'ch_4', 'ch_5', 'ch_6', 'gap_10', 'gap_11', 'gap_12', 'gap_13', 'gap_14', 'gap_15', 'gap_16');
update public.exercises e set subtopic = 'adj_the'
  from public.topics t where t.id = e.topic_id and t.slug = 'adjectives' and e.student_id is null
   and e.legacy_id in ('gap_1', 'gap_2', 'gap_3', 'gap_4', 'gap_5', 'gap_6', 'gap_7', 'gap_8', 'gap_9');
update public.exercises e set subtopic = 'adj_position'
  from public.topics t where t.id = e.topic_id and t.slug = 'adjectives' and e.student_id is null
   and e.legacy_id in ('ord_1', 'ord_2', 'ord_3', 'ord_4', 'ord_5', 'ord_6', 'ord_7', 'ord_8', 'ord_9');
update public.exercises e set subtopic = 'adj_order'
  from public.topics t where t.id = e.topic_id and t.slug = 'adjectives' and e.student_id is null
   and e.legacy_id in ('ord_10', 'ord_11', 'ord_12', 'ord_13', 'ord_14');
update public.exercises e set subtopic = 'adv_vs_adj'
  from public.topics t where t.id = e.topic_id and t.slug = 'adverbs' and e.student_id is null
   and e.legacy_id in ('abcd_1', 'ch_7', 'abcd_2', 'ch_8', 'abcd_3', 'ch_9', 'abcd_4', 'ch_10', 'abcd_5', 'ch_11', 'abcd_6', 'ch_12', 'abcd_7', 'ch_13', 'abcd_8', 'ch_14', 'abcd_9', 'ch_15', 'abcd_10', 'ch_16', 'abcd_11', 'ch_17', 'abcd_12', 'ch_18', 'abcd_13', 'ch_19', 'abcd_14', 'ch_20', 'abcd_15', 'ch_21', 'abcd_16', 'ch_22', 'abcd_17', 'ch_23', 'abcd_18', 'ch_24', 'abcd_19', 'ch_25', 'abcd_20', 'ch_26', 'abcd_21', 'ch_27', 'abcd_22', 'ch_28', 'abcd_23', 'ch_29', 'abcd_24', 'ch_30', 'abcd_25', 'ch_31', 'abcd_26', 'ch_32', 'abcd_27', 'ch_33', 'abcd_28', 'ch_34', 'abcd_29', 'ch_35', 'abcd_30', 'abcd_31', 'abcd_32', 'abcd_33', 'abcd_34', 'abcd_35', 'abcd_36');
update public.exercises e set subtopic = 'adv_form'
  from public.topics t where t.id = e.topic_id and t.slug = 'adverbs' and e.student_id is null
   and e.legacy_id in ('gap_17', 'gap_18', 'gap_19', 'gap_20', 'gap_21', 'gap_22', 'gap_23');
update public.exercises e set subtopic = 'adv_place'
  from public.topics t where t.id = e.topic_id and t.slug = 'adverbs' and e.student_id is null
   and e.legacy_id in ('ord_15', 'ord_16', 'ord_17', 'ord_18', 'ord_19', 'ord_20', 'ord_21', 'ord_22', 'ord_23', 'ord_24', 'ord_25', 'ord_26', 'ord_27', 'ord_28', 'ch_36', 'ch_37', 'ch_38', 'ch_39', 'ch_40', 'ch_41', 'ch_42');
update public.exercises e set subtopic = 'adv_degree'
  from public.topics t where t.id = e.topic_id and t.slug = 'adverbs' and e.student_id is null
   and e.legacy_id in ('ord_30', 'ord_31', 'ch_43', 'ch_44', 'ch_45', 'ch_46', 'ch_47', 'ch_48', 'ch_49', 'ch_50', 'ch_51', 'ch_52', 'ch_53', 'ch_54');
update public.exercises e set subtopic = 'noun_count'
  from public.topics t where t.id = e.topic_id and t.slug = 'nouns' and e.student_id is null
   and e.legacy_id in ('abcd_1_nouns', 'ch_1_nouns', 'cr_22_nouns', 'ch_2_nouns', 'cr_23_nouns', 'abcd_3_nouns', 'ch_3_nouns', 'cr_24_nouns', 'abcd_4_nouns', 'ch_4_nouns', 'abcd_5_nouns', 'ch_5_nouns', 'abcd_6_nouns', 'ch_6_nouns', 'ch_7_nouns', 'ch_8_nouns', 'abcd_34_nouns', 'ch_9_nouns', 'abcd_35_nouns', 'ch_10_nouns', 'abcd_36_nouns', 'ch_11_nouns', 'ch_12_nouns', 'ch_13_nouns', 'ch_14_nouns', 'ch_15_nouns', 'ch_16_nouns', 'ch_17_nouns', 'ch_18_nouns', 'ch_19_nouns', 'ch_20_nouns', 'ch_21_nouns', 'gap_71_nouns', 'gap_72_nouns', 'gap_73_nouns', 'gap_74_nouns', 'gap_75_nouns', 'gap_76_nouns', 'gap_77_nouns', 'gap_78_nouns', 'gap_79_nouns', 'gap_80_nouns', 'gap_81_nouns', 'gap_82_nouns', 'gap_83_nouns', 'gap_84_nouns', 'gap_85_nouns', 'gap_86_nouns', 'gap_87_nouns', 'gap_88_nouns', 'gap_89_nouns', 'gap_90_nouns', 'gap_91_nouns', 'gap_92_nouns', 'gap_93_nouns', 'gap_94_nouns', 'gap_95_nouns', 'gap_96_nouns', 'gap_97_nouns', 'gap_98_nouns', 'gap_99_nouns', 'gap_100_nouns', 'gap_101_nouns');
update public.exercises e set subtopic = 'noun_plural'
  from public.topics t where t.id = e.topic_id and t.slug = 'nouns' and e.student_id is null
   and e.legacy_id in ('gap_1_nouns', 'abcd_2_nouns', 'gap_2_nouns', 'gap_3_nouns', 'gap_4_nouns', 'gap_5_nouns', 'gap_6_nouns', 'gap_7_nouns', 'gap_8_nouns', 'gap_9_nouns', 'gap_10_nouns', 'gap_11_nouns', 'gap_12_nouns', 'gap_13_nouns', 'gap_14_nouns', 'gap_15_nouns', 'gap_16_nouns', 'gap_17_nouns', 'gap_18_nouns', 'gap_19_nouns', 'gap_20_nouns', 'gap_21_nouns', 'gap_22_nouns', 'gap_23_nouns', 'gap_24_nouns', 'gap_25_nouns', 'gap_26_nouns', 'gap_27_nouns', 'gap_28_nouns', 'gap_29_nouns', 'gap_30_nouns', 'gap_31_nouns', 'gap_32_nouns', 'gap_33_nouns', 'gap_34_nouns');
update public.exercises e set subtopic = 'noun_foreign'
  from public.topics t where t.id = e.topic_id and t.slug = 'nouns' and e.student_id is null
   and e.legacy_id in ('ord_12_nouns', 'ord_13_nouns', 'ord_14_nouns', 'abcd_7_nouns', 'abcd_8_nouns', 'gap_47_nouns', 'gap_48_nouns', 'gap_49_nouns', 'gap_50_nouns', 'gap_51_nouns', 'gap_52_nouns', 'gap_53_nouns', 'gap_54_nouns', 'gap_55_nouns', 'gap_56_nouns', 'gap_57_nouns', 'gap_58_nouns', 'gap_59_nouns', 'gap_60_nouns', 'gap_61_nouns', 'gap_62_nouns', 'gap_63_nouns', 'gap_64_nouns', 'gap_65_nouns', 'gap_66_nouns', 'gap_67_nouns', 'gap_68_nouns', 'gap_69_nouns', 'gap_70_nouns');
update public.exercises e set subtopic = 'noun_irreg'
  from public.topics t where t.id = e.topic_id and t.slug = 'nouns' and e.student_id is null
   and e.legacy_id in ('gap_35_nouns', 'gap_36_nouns', 'gap_37_nouns', 'gap_38_nouns', 'gap_39_nouns', 'gap_40_nouns', 'gap_41_nouns', 'gap_42_nouns', 'gap_43_nouns', 'gap_44_nouns', 'gap_45_nouns', 'gap_46_nouns');
update public.exercises e set subtopic = 'art_mix'
  from public.topics t where t.id = e.topic_id and t.slug = 'articles' and e.student_id is null
   and e.legacy_id in ('abcd_9_nouns', 'cr_1_nouns', 'ord_1_nouns', 'abcd_10_nouns', 'cr_2_nouns', 'ord_2_nouns', 'abcd_11_nouns', 'cr_3_nouns', 'ord_3_nouns', 'abcd_12_nouns', 'cr_4_nouns', 'ord_4_nouns', 'abcd_13_nouns', 'cr_5_nouns', 'ord_5_nouns', 'abcd_14_nouns', 'cr_6_nouns', 'ord_6_nouns', 'abcd_15_nouns', 'cr_7_nouns', 'ord_7_nouns', 'abcd_16_nouns', 'cr_8_nouns', 'ord_8_nouns', 'abcd_17_nouns', 'cr_9_nouns', 'ord_9_nouns', 'abcd_18_nouns', 'cr_10_nouns', 'ord_10_nouns', 'abcd_19_nouns', 'cr_11_nouns', 'ord_11_nouns', 'abcd_20_nouns', 'cr_12_nouns', 'ord_15_nouns', 'abcd_21_nouns', 'cr_13_nouns', 'abcd_22_nouns', 'cr_14_nouns', 'abcd_23_nouns', 'cr_15_nouns', 'abcd_24_nouns', 'cr_16_nouns', 'abcd_25_nouns', 'cr_17_nouns', 'abcd_26_nouns', 'cr_18_nouns', 'abcd_27_nouns', 'cr_19_nouns', 'abcd_28_nouns', 'cr_20_nouns', 'abcd_29_nouns', 'cr_21_nouns', 'abcd_30_nouns', 'abcd_31_nouns', 'abcd_32_nouns', 'abcd_33_nouns', 'ch_201_nouns', 'ch_202_nouns', 'ch_203_nouns', 'ch_204_nouns', 'ch_205_nouns', 'ch_206_nouns', 'ch_207_nouns', 'ch_208_nouns', 'ch_209_nouns', 'ch_210_nouns', 'ch_211_nouns', 'ch_212_nouns', 'ch_213_nouns', 'ch_214_nouns', 'ch_215_nouns', 'ch_216_nouns', 'ch_217_nouns', 'ch_218_nouns', 'ch_219_nouns', 'ch_220_nouns', 'ch_221_nouns', 'ch_222_nouns', 'ch_223_nouns', 'ch_224_nouns', 'ch_225_nouns', 'ch_226_nouns', 'ch_227_nouns', 'ch_228_nouns', 'ch_229_nouns', 'ch_230_nouns', 'ch_231_nouns', 'ch_232_nouns', 'ch_233_nouns', 'ch_234_nouns', 'ch_235_nouns', 'ch_236_nouns', 'ch_237_nouns', 'ch_238_nouns', 'ch_239_nouns', 'ch_240_nouns', 'ch_241_nouns', 'ch_242_nouns', 'ch_243_nouns', 'ch_244_nouns', 'ch_245_nouns', 'ch_246_nouns', 'ch_247_nouns', 'ch_248_nouns', 'ch_249_nouns', 'ch_250_nouns', 'ch_251_nouns', 'ch_252_nouns', 'ch_253_nouns', 'ch_254_nouns', 'ch_255_nouns', 'ch_256_nouns', 'ch_257_nouns', 'ch_258_nouns', 'ch_259_nouns', 'ch_260_nouns', 'ch_261_nouns', 'ch_262_nouns', 'ch_263_nouns', 'ch_264_nouns', 'ch_265_nouns', 'ch_266_nouns', 'ch_267_nouns', 'ch_268_nouns', 'ch_269_nouns', 'ch_270_nouns', 'ch_271_nouns', 'ch_272_nouns', 'ch_273_nouns', 'ch_274_nouns', 'ch_275_nouns', 'ch_276_nouns', 'ch_277_nouns', 'ch_278_nouns', 'ch_279_nouns', 'ch_280_nouns', 'ch_281_nouns', 'ch_282_nouns', 'ch_283_nouns', 'ch_284_nouns', 'ch_285_nouns', 'ch_286_nouns', 'ch_287_nouns', 'ch_288_nouns', 'ch_289_nouns', 'ch_290_nouns', 'ch_291_nouns', 'ch_292_nouns', 'ch_293_nouns', 'ch_294_nouns', 'ch_295_nouns', 'ch_296_nouns', 'ch_297_nouns', 'ch_298_nouns', 'ch_299_nouns', 'ch_300_nouns', 'ch_301_nouns', 'ch_302_nouns', 'ch_303_nouns', 'ch_304_nouns', 'ch_305_nouns', 'ch_306_nouns', 'ch_307_nouns', 'ch_308_nouns', 'ch_309_nouns');
update public.exercises e set subtopic = 'art_first'
  from public.topics t where t.id = e.topic_id and t.slug = 'articles' and e.student_id is null
   and e.legacy_id in ('ch_22_nouns', 'gap_102_nouns', 'ch_23_nouns', 'gap_103_nouns', 'ch_24_nouns', 'gap_104_nouns', 'ch_25_nouns', 'gap_105_nouns', 'ch_26_nouns', 'gap_106_nouns', 'ch_27_nouns', 'gap_107_nouns', 'ch_28_nouns', 'gap_108_nouns', 'ch_29_nouns', 'gap_109_nouns', 'ch_30_nouns', 'ch_31_nouns', 'ch_32_nouns', 'ch_33_nouns', 'ch_34_nouns', 'ch_35_nouns', 'ch_36_nouns', 'ch_37_nouns', 'ch_38_nouns', 'ch_39_nouns', 'ch_40_nouns', 'ch_41_nouns', 'ch_42_nouns', 'ch_43_nouns', 'ch_44_nouns', 'ch_45_nouns', 'ch_46_nouns', 'ch_47_nouns', 'ch_48_nouns', 'ch_49_nouns', 'ch_50_nouns', 'ch_51_nouns', 'ch_52_nouns', 'ch_53_nouns', 'ch_54_nouns', 'ch_55_nouns', 'ch_56_nouns', 'ch_57_nouns', 'ch_58_nouns', 'ch_59_nouns', 'ch_60_nouns', 'ch_61_nouns', 'ch_62_nouns', 'ch_63_nouns', 'ch_64_nouns', 'ch_65_nouns', 'ch_66_nouns', 'ch_67_nouns', 'ch_68_nouns', 'ch_69_nouns', 'ch_70_nouns');
update public.exercises e set subtopic = 'art_situation'
  from public.topics t where t.id = e.topic_id and t.slug = 'articles' and e.student_id is null
   and e.legacy_id in ('gap_110_nouns', 'gap_111_nouns', 'gap_112_nouns', 'gap_113_nouns', 'gap_114_nouns', 'gap_115_nouns', 'gap_116_nouns', 'gap_117_nouns', 'gap_118_nouns', 'gap_119_nouns', 'gap_120_nouns', 'gap_121_nouns', 'gap_122_nouns', 'gap_123_nouns', 'gap_124_nouns', 'gap_125_nouns', 'gap_126_nouns', 'gap_127_nouns', 'ch_71_nouns', 'ch_72_nouns', 'ch_73_nouns', 'ch_74_nouns', 'ch_75_nouns', 'ch_76_nouns', 'ch_77_nouns', 'ch_78_nouns', 'ch_79_nouns', 'ch_80_nouns', 'ch_81_nouns', 'ch_82_nouns', 'ch_83_nouns', 'ch_84_nouns', 'ch_85_nouns', 'ch_86_nouns', 'ch_87_nouns', 'ch_88_nouns', 'ch_89_nouns', 'ch_90_nouns', 'ch_91_nouns', 'ch_92_nouns', 'ch_93_nouns', 'ch_94_nouns', 'ch_95_nouns', 'ch_96_nouns');
update public.exercises e set subtopic = 'art_places'
  from public.topics t where t.id = e.topic_id and t.slug = 'articles' and e.student_id is null
   and e.legacy_id in ('gap_128_nouns', 'gap_129_nouns', 'gap_130_nouns', 'gap_131_nouns', 'gap_132_nouns', 'gap_133_nouns', 'gap_134_nouns', 'ch_97_nouns', 'ch_98_nouns', 'ch_99_nouns', 'ch_100_nouns', 'ch_101_nouns', 'ch_102_nouns', 'ch_103_nouns', 'ch_104_nouns', 'ch_105_nouns', 'ch_106_nouns', 'ch_107_nouns', 'ch_108_nouns', 'ch_109_nouns', 'ch_110_nouns', 'ch_111_nouns', 'ch_112_nouns', 'ch_113_nouns', 'ch_114_nouns', 'ch_115_nouns', 'ch_116_nouns', 'ch_117_nouns', 'ch_118_nouns', 'ch_119_nouns', 'ch_120_nouns', 'ch_121_nouns', 'ch_122_nouns', 'ch_123_nouns', 'ch_124_nouns', 'ch_125_nouns');
update public.exercises e set subtopic = 'art_general'
  from public.topics t where t.id = e.topic_id and t.slug = 'articles' and e.student_id is null
   and e.legacy_id in ('gap_135_nouns', 'gap_136_nouns', 'gap_137_nouns', 'gap_138_nouns', 'gap_139_nouns', 'gap_140_nouns', 'gap_141_nouns', 'gap_142_nouns', 'gap_143_nouns', 'gap_144_nouns', 'ch_126_nouns', 'ch_127_nouns', 'ch_128_nouns', 'ch_129_nouns', 'ch_130_nouns', 'ch_131_nouns', 'ch_132_nouns', 'ch_133_nouns', 'ch_134_nouns', 'ch_135_nouns', 'ch_136_nouns', 'ch_137_nouns', 'ch_138_nouns', 'ch_139_nouns', 'ch_140_nouns', 'ch_141_nouns', 'ch_142_nouns', 'ch_143_nouns', 'ch_144_nouns', 'ch_145_nouns', 'ch_146_nouns', 'ch_147_nouns', 'ch_148_nouns', 'ch_149_nouns', 'ch_150_nouns', 'ch_151_nouns', 'ch_152_nouns', 'ch_153_nouns', 'ch_154_nouns');
update public.exercises e set subtopic = 'art_names'
  from public.topics t where t.id = e.topic_id and t.slug = 'articles' and e.student_id is null
   and e.legacy_id in ('gap_145_nouns', 'gap_146_nouns', 'gap_147_nouns', 'gap_148_nouns', 'gap_149_nouns', 'gap_150_nouns', 'gap_151_nouns', 'gap_152_nouns', 'gap_153_nouns', 'gap_154_nouns', 'gap_155_nouns', 'gap_156_nouns', 'gap_157_nouns', 'gap_158_nouns', 'ch_155_nouns', 'ch_156_nouns', 'ch_157_nouns', 'ch_158_nouns', 'ch_159_nouns', 'ch_160_nouns', 'ch_161_nouns', 'ch_162_nouns', 'ch_163_nouns', 'ch_164_nouns', 'ch_165_nouns', 'ch_166_nouns', 'ch_167_nouns', 'ch_168_nouns', 'ch_169_nouns', 'ch_170_nouns', 'ch_171_nouns', 'ch_172_nouns', 'ch_173_nouns', 'ch_174_nouns');
update public.exercises e set subtopic = 'art_buildings'
  from public.topics t where t.id = e.topic_id and t.slug = 'articles' and e.student_id is null
   and e.legacy_id in ('gap_159_nouns', 'gap_160_nouns', 'gap_161_nouns', 'gap_162_nouns', 'gap_163_nouns', 'gap_164_nouns', 'gap_165_nouns', 'ch_175_nouns', 'ch_176_nouns', 'ch_177_nouns', 'ch_178_nouns', 'ch_179_nouns', 'ch_180_nouns', 'ch_181_nouns', 'ch_182_nouns', 'ch_183_nouns', 'ch_184_nouns', 'ch_185_nouns', 'ch_186_nouns', 'ch_187_nouns', 'ch_188_nouns', 'ch_189_nouns', 'ch_190_nouns', 'ch_191_nouns', 'ch_192_nouns', 'ch_193_nouns', 'ch_194_nouns', 'ch_195_nouns', 'ch_196_nouns', 'ch_197_nouns', 'ch_198_nouns', 'ch_199_nouns', 'ch_200_nouns');
update public.exercises e set subtopic = 'modal_mix'
  from public.topics t where t.id = e.topic_id and t.slug = 'modal_verbs' and e.student_id is null
   and e.legacy_id in ('modal_abcd_10', 'modal_abcd_11', 'modal_abcd_12', 'modal_abcd_13', 'modal_abcd_14', 'modal_abcd_15', 'modal_abcd_16', 'modal_abcd_17', 'modal_abcd_18', 'modal_abcd_19', 'modal_abcd_20', 'modal_abcd_21', 'modal_abcd_22', 'modal_abcd_23', 'modal_abcd_24', 'modal_abcd_25', 'modal_abcd_26', 'modal_abcd_27', 'modal_abcd_28', 'modal_abcd_29', 'modal_abcd_30', 'modal_abcd_31', 'modal_abcd_32', 'modal_abcd_33', 'modal_abcd_34', 'modal_abcd_35', 'modal_abcd_36', 'modal_abcd_37', 'modal_abcd_38', 'modal_abcd_39', 'modal_abcd_40', 'modal_abcd_41');
update public.exercises e set subtopic = 'modal_present'
  from public.topics t where t.id = e.topic_id and t.slug = 'modal_verbs' and e.student_id is null
   and e.legacy_id in ('modal_ch_1', 'modal_cr_1', 'modal_gap_1', 'modal_ch_2', 'modal_cr_2', 'modal_gap_2', 'modal_ch_3', 'modal_cr_3', 'modal_gap_3', 'modal_ch_4', 'modal_cr_4', 'modal_gap_4', 'modal_ord_4', 'modal_ch_5', 'modal_cr_5', 'modal_gap_5', 'modal_ord_5', 'modal_ch_6', 'modal_gap_6', 'modal_ch_7', 'modal_gap_7', 'modal_ch_8', 'modal_cr_8', 'modal_gap_8', 'modal_ord_8', 'modal_ch_9', 'modal_cr_9', 'modal_gap_9', 'modal_ord_9', 'modal_ch_10', 'modal_cr_10', 'modal_gap_10', 'modal_ord_10', 'modal_ch_11', 'modal_cr_11', 'modal_gap_11', 'modal_ch_12', 'modal_cr_12', 'modal_gap_12', 'modal_ord_12', 'modal_ch_13', 'modal_gap_13', 'modal_ord_13', 'modal_ch_14', 'modal_gap_14', 'modal_ch_15', 'modal_gap_15', 'modal_ch_16', 'modal_gap_16', 'modal_ch_17', 'modal_gap_17', 'modal_ch_18', 'modal_gap_18', 'modal_ch_19', 'modal_gap_19', 'modal_ch_20', 'modal_gap_20', 'modal_ch_21', 'modal_gap_21', 'modal_ch_22', 'modal_gap_22', 'modal_ch_23', 'modal_gap_23', 'modal_gap_24', 'modal_gap_25', 'modal_gap_26', 'modal_gap_27', 'modal_ch_45', 'modal_ch_46', 'modal_gap_46', 'modal_gap_47', 'modal_ch_48', 'modal_gap_48', 'modal_gap_49', 'modal_ch_50', 'modal_gap_50', 'modal_ch_51', 'modal_gap_51', 'modal_ch_52', 'modal_gap_52', 'modal_ch_53', 'modal_ch_54', 'modal_ch_55', 'modal_gap_55', 'modal_ch_56', 'modal_gap_56', 'modal_ch_57', 'modal_ch_58', 'modal_ch_59', 'modal_ch_64', 'modal_ch_66', 'modal_ch_68', 'modal_ch_70', 'modal_ch_72', 'modal_ch_74');
update public.exercises e set subtopic = 'modal_past'
  from public.topics t where t.id = e.topic_id and t.slug = 'modal_verbs' and e.student_id is null
   and e.legacy_id in ('modal_ord_1', 'modal_ord_2', 'modal_ord_3', 'modal_cr_6', 'modal_ord_6', 'modal_cr_7', 'modal_ord_7', 'modal_ord_11', 'modal_cr_13', 'modal_ord_14', 'modal_ch_24', 'modal_ch_25', 'modal_ch_26', 'modal_ch_27', 'modal_ch_28', 'modal_gap_28', 'modal_ch_29', 'modal_gap_29', 'modal_ch_30', 'modal_gap_30', 'modal_ch_31', 'modal_gap_31', 'modal_ch_32', 'modal_gap_32', 'modal_ch_33', 'modal_gap_33', 'modal_ch_34', 'modal_gap_34', 'modal_ch_35', 'modal_gap_35', 'modal_ch_36', 'modal_gap_36', 'modal_ch_37', 'modal_gap_37', 'modal_ch_38', 'modal_gap_38', 'modal_ch_39', 'modal_gap_39', 'modal_ch_40', 'modal_gap_40', 'modal_ch_41', 'modal_gap_41', 'modal_ch_42', 'modal_gap_42', 'modal_ch_43', 'modal_gap_43', 'modal_ch_44', 'modal_gap_44', 'modal_gap_45', 'modal_ch_47', 'modal_ch_49', 'modal_gap_53', 'modal_gap_54', 'modal_gap_57', 'modal_ch_60', 'modal_ch_61', 'modal_ch_62', 'modal_ch_63', 'modal_ch_65', 'modal_ch_67', 'modal_ch_69', 'modal_ch_71', 'modal_ch_73');
update public.exercises e set subtopic = 'pron_personal'
  from public.topics t where t.id = e.topic_id and t.slug = 'pronouns' and e.student_id is null
   and e.legacy_id in ('pron_abcd_1', 'pron_cr_1', 'pron_abcd_2', 'pron_cr_2', 'pron_abcd_3', 'pron_cr_3', 'pron_abcd_4', 'pron_cr_4', 'pron_abcd_5', 'pron_cr_5', 'pron_abcd_6', 'pron_cr_6', 'pron_abcd_7', 'pron_cr_7', 'pron_abcd_8', 'pron_cr_8', 'pron_abcd_9', 'pron_cr_9', 'pron_abcd_10', 'pron_ord_13', 'pron_ord_14', 'pron_ord_15', 'pron_ord_16', 'pron_cr_17', 'pron_ord_17', 'pron_ord_18', 'pron_ord_19', 'pron_gap_27', 'pron_gap_28', 'pron_gap_29', 'pron_gap_30', 'pron_gap_31', 'pron_gap_32', 'pron_gap_33', 'pron_gap_34', 'pron_gap_35', 'pron_gap_36', 'pron_abcd_37', 'pron_gap_37', 'pron_abcd_38', 'pron_gap_38', 'pron_gap_39', 'pron_gap_40', 'pron_gap_41', 'pron_gap_42', 'pron_gap_43', 'pron_gap_44', 'pron_gap_45', 'pron_gap_46', 'pron_gap_47', 'pron_gap_48', 'pron_ch_90', 'pron_ch_91', 'pron_ch_92', 'pron_ch_93', 'pron_ch_94', 'pron_ch_95', 'pron_ch_96', 'pron_ch_97', 'pron_ch_98', 'pron_ch_99', 'pron_ch_100', 'pron_ch_101', 'pron_ch_102', 'pron_ch_103', 'pron_ch_104', 'pron_ch_105', 'pron_ch_106', 'pron_ch_107', 'pron_ch_108', 'pron_ch_109', 'pron_ch_110', 'pron_ch_111', 'pron_ch_112', 'pron_ch_113', 'pron_ch_114', 'pron_ch_115', 'pron_ch_116', 'pron_ch_117', 'pron_ch_118', 'pron_ch_119', 'pron_ch_120', 'pron_ch_121', 'pron_ch_122', 'pron_ch_123', 'pron_ch_124', 'pron_ch_125', 'pron_ch_126', 'pron_ch_127', 'pron_ch_128', 'pron_ch_129', 'pron_ch_130', 'pron_ch_131', 'pron_ch_132');
update public.exercises e set subtopic = 'pron_demo'
  from public.topics t where t.id = e.topic_id and t.slug = 'pronouns' and e.student_id is null
   and e.legacy_id in ('pron_ch_1', 'pron_ch_2', 'pron_ch_3', 'pron_ch_4', 'pron_ch_5', 'pron_ch_6', 'pron_ch_7', 'pron_ch_8', 'pron_ch_9', 'pron_ch_10', 'pron_abcd_11', 'pron_ch_11', 'pron_abcd_12', 'pron_ch_12', 'pron_ch_13', 'pron_ch_14', 'pron_ch_15', 'pron_ch_16', 'pron_ch_17', 'pron_ch_18', 'pron_ch_19', 'pron_ch_20', 'pron_ch_21', 'pron_ch_22', 'pron_ch_23', 'pron_ch_24', 'pron_ch_25');
update public.exercises e set subtopic = 'pron_some'
  from public.topics t where t.id = e.topic_id and t.slug = 'pronouns' and e.student_id is null
   and e.legacy_id in ('pron_gap_1', 'pron_gap_2', 'pron_gap_3', 'pron_gap_4', 'pron_gap_5', 'pron_gap_6', 'pron_gap_7', 'pron_gap_8', 'pron_gap_9', 'pron_gap_10', 'pron_gap_11', 'pron_cr_12', 'pron_gap_12', 'pron_cr_13', 'pron_gap_13', 'pron_abcd_14', 'pron_gap_14', 'pron_gap_15', 'pron_gap_16', 'pron_gap_17', 'pron_abcd_18', 'pron_gap_18', 'pron_abcd_19', 'pron_gap_19', 'pron_abcd_20', 'pron_gap_20', 'pron_abcd_21', 'pron_gap_21', 'pron_gap_22', 'pron_abcd_23', 'pron_gap_23', 'pron_gap_24', 'pron_gap_25', 'pron_gap_26', 'pron_ch_51', 'pron_ch_52', 'pron_ch_53', 'pron_ch_54', 'pron_ch_55', 'pron_ch_56', 'pron_ch_57', 'pron_ch_58', 'pron_ch_59', 'pron_ch_144', 'pron_ch_145', 'pron_ch_146', 'pron_ch_147', 'pron_ch_148', 'pron_ch_150');
update public.exercises e set subtopic = 'pron_both'
  from public.topics t where t.id = e.topic_id and t.slug = 'pronouns' and e.student_id is null
   and e.legacy_id in ('pron_ord_1', 'pron_ord_2', 'pron_ord_3', 'pron_ord_4', 'pron_ord_5', 'pron_ord_6', 'pron_ord_7', 'pron_ord_8', 'pron_ord_9', 'pron_ord_10', 'pron_ord_11', 'pron_ord_12', 'pron_cr_15', 'pron_cr_16', 'pron_abcd_22', 'pron_abcd_28', 'pron_abcd_29', 'pron_abcd_30', 'pron_abcd_31', 'pron_abcd_32', 'pron_abcd_34', 'pron_abcd_35', 'pron_abcd_36', 'pron_ch_60', 'pron_ch_61', 'pron_ch_62', 'pron_ch_63', 'pron_ch_64', 'pron_ch_65', 'pron_ch_66', 'pron_ch_67', 'pron_ch_68', 'pron_ch_69', 'pron_ch_70', 'pron_ch_71', 'pron_ch_72', 'pron_ch_73', 'pron_ch_74', 'pron_ch_75', 'pron_ch_76', 'pron_ch_77', 'pron_ch_78', 'pron_ch_79', 'pron_ch_80', 'pron_ch_81', 'pron_ch_82', 'pron_ch_83', 'pron_ch_84', 'pron_ch_85', 'pron_ch_86', 'pron_ch_87', 'pron_ch_88', 'pron_ch_89', 'pron_ch_149');
update public.exercises e set subtopic = 'pron_other'
  from public.topics t where t.id = e.topic_id and t.slug = 'pronouns' and e.student_id is null
   and e.legacy_id in ('pron_cr_10', 'pron_cr_11', 'pron_ord_20', 'pron_abcd_24', 'pron_abcd_25', 'pron_abcd_26', 'pron_abcd_27', 'pron_abcd_33', 'pron_gap_49', 'pron_gap_50', 'pron_gap_51', 'pron_gap_52', 'pron_gap_53', 'pron_gap_54', 'pron_ch_133', 'pron_ch_134', 'pron_ch_135', 'pron_ch_136', 'pron_ch_137', 'pron_ch_138', 'pron_ch_139', 'pron_ch_140', 'pron_ch_141', 'pron_ch_142', 'pron_ch_143');
update public.exercises e set subtopic = 'pron_qty'
  from public.topics t where t.id = e.topic_id and t.slug = 'pronouns' and e.student_id is null
   and e.legacy_id in ('pron_abcd_13', 'pron_cr_14', 'pron_abcd_15', 'pron_abcd_16', 'pron_abcd_17', 'pron_ch_26', 'pron_ch_27', 'pron_ch_28', 'pron_ch_29', 'pron_ch_30', 'pron_ch_31', 'pron_ch_32', 'pron_ch_33', 'pron_ch_34', 'pron_ch_35', 'pron_ch_36', 'pron_ch_37', 'pron_ch_38', 'pron_abcd_39', 'pron_ch_39', 'pron_abcd_40', 'pron_ch_40', 'pron_ch_41', 'pron_ch_42', 'pron_ch_43', 'pron_ch_44', 'pron_ch_45', 'pron_ch_46', 'pron_ch_47', 'pron_ch_48', 'pron_ch_49', 'pron_ch_50', 'pron_ch_151', 'pron_ch_152', 'pron_ch_153', 'pron_ch_154');
update public.exercises e set subtopic = 'ger_mix'
  from public.topics t where t.id = e.topic_id and t.slug = 'gerund' and e.student_id is null
   and e.legacy_id in ('verb_abcd_1', 'verb_abcd_2', 'verb_abcd_3', 'verb_abcd_4', 'verb_abcd_5', 'verb_abcd_6', 'verb_abcd_7', 'verb_abcd_8', 'verb_abcd_9', 'verb_abcd_10', 'verb_abcd_11', 'verb_abcd_12', 'verb_abcd_13', 'verb_abcd_14', 'verb_abcd_15', 'verb_abcd_16', 'verb_abcd_17', 'verb_abcd_18', 'verb_abcd_19', 'verb_abcd_20', 'verb_ord_118', 'verb_gap_203', 'verb_gap_207', 'verb_gap_208', 'verb_gap_211', 'verb_gap_212', 'verb_gap_234', 'verb_gap_238', 'verb_gap_243', 'verb_gap_245', 'verb_gap_246', 'verb_gap_249', 'verb_gap_251', 'verb_gap_252', 'verb_gap_253', 'verb_gap_255', 'verb_gap_256', 'verb_gap_258', 'verb_gap_259', 'verb_gap_260', 'verb_gap_262', 'verb_gap_264', 'verb_gap_265', 'verb_gap_266', 'verb_gap_267', 'verb_gap_268', 'verb_gap_269', 'verb_gap_270', 'verb_gap_271', 'verb_gap_272', 'verb_gap_273', 'verb_gap_274', 'verb_gap_275', 'verb_gap_276', 'verb_gap_277', 'verb_gap_279', 'verb_gap_280', 'verb_gap_282', 'verb_gap_283', 'verb_gap_285', 'verb_gap_287', 'verb_gap_288', 'verb_gap_289', 'verb_gap_290', 'verb_gap_291', 'verb_gap_292', 'verb_gap_293', 'verb_gap_294', 'verb_gap_295', 'verb_gap_299', 'verb_gap_300', 'verb_gap_301', 'verb_gap_304', 'verb_gap_305', 'verb_gap_306', 'verb_gap_310', 'verb_gap_311', 'verb_gap_312', 'verb_gap_314', 'verb_gap_315', 'verb_gap_316', 'verb_gap_318', 'verb_gap_319', 'verb_gap_320', 'verb_gap_321', 'verb_gap_322', 'verb_gap_326', 'verb_gap_327', 'verb_gap_328', 'verb_gap_329', 'verb_gap_330', 'verb_gap_334', 'verb_gap_335', 'verb_gap_336', 'verb_gap_337', 'verb_gap_339', 'verb_gap_340', 'verb_gap_342', 'verb_gap_346', 'verb_gap_347', 'verb_gap_348', 'verb_gap_349', 'verb_gap_356', 'verb_gap_357', 'verb_gap_360', 'verb_gap_362', 'verb_gap_377', 'verb_gap_379', 'verb_gap_381', 'verb_gap_384', 'verb_gap_385');
update public.exercises e set subtopic = 'ger_verbs'
  from public.topics t where t.id = e.topic_id and t.slug = 'gerund' and e.student_id is null
   and e.legacy_id in ('verb_cr_12', 'verb_cr_13', 'verb_cr_14', 'verb_gap_202', 'verb_gap_204', 'verb_gap_205', 'verb_gap_235', 'verb_gap_237', 'verb_gap_242', 'verb_gap_263', 'verb_gap_296', 'verb_gap_323', 'verb_gap_325', 'verb_gap_338', 'verb_gap_341', 'verb_gap_343', 'verb_gap_351', 'verb_gap_352');
update public.exercises e set subtopic = 'ger_prep'
  from public.topics t where t.id = e.topic_id and t.slug = 'gerund' and e.student_id is null
   and e.legacy_id in ('verb_gap_148', 'verb_gap_149', 'verb_gap_150', 'verb_gap_151', 'verb_gap_152', 'verb_gap_153', 'verb_gap_154', 'verb_gap_155', 'verb_gap_156', 'verb_gap_157', 'verb_gap_158', 'verb_gap_159', 'verb_gap_160', 'verb_gap_161', 'verb_gap_162', 'verb_gap_163', 'verb_gap_164', 'verb_gap_165', 'verb_gap_166', 'verb_gap_167', 'verb_gap_168', 'verb_gap_169', 'verb_gap_170', 'verb_gap_171', 'verb_gap_172', 'verb_gap_173', 'verb_gap_174', 'verb_gap_175', 'verb_gap_176', 'verb_gap_177', 'verb_gap_178', 'verb_gap_179', 'verb_gap_180', 'verb_gap_181', 'verb_gap_182', 'verb_gap_183', 'verb_gap_184', 'verb_gap_185', 'verb_gap_186', 'verb_gap_187', 'verb_gap_188', 'verb_gap_189', 'verb_gap_190', 'verb_gap_191', 'verb_gap_192', 'verb_gap_193', 'verb_gap_194', 'verb_gap_195', 'verb_gap_196', 'verb_gap_197', 'verb_gap_198', 'verb_gap_199', 'verb_gap_200', 'verb_gap_201', 'verb_gap_215', 'verb_gap_228', 'verb_gap_231', 'verb_gap_233', 'verb_gap_240', 'verb_gap_241', 'verb_gap_261', 'verb_gap_278', 'verb_gap_281', 'verb_gap_284', 'verb_gap_297', 'verb_gap_313', 'verb_gap_317', 'verb_gap_331', 'verb_gap_350', 'verb_gap_374', 'verb_gap_375', 'verb_gap_388', 'verb_gap_389');
update public.exercises e set subtopic = 'ger_form'
  from public.topics t where t.id = e.topic_id and t.slug = 'gerund' and e.student_id is null
   and e.legacy_id in ('verb_gap_236', 'verb_gap_286', 'verb_gap_303', 'verb_gap_373');
update public.exercises e set subtopic = 'inf_forms'
  from public.topics t where t.id = e.topic_id and t.slug = 'infinitive' and e.student_id is null
   and e.legacy_id in ('verb_ch_1', 'verb_gap_1', 'verb_ch_2', 'verb_gap_2', 'verb_ch_3', 'verb_gap_3', 'verb_ch_4', 'verb_gap_4', 'verb_ch_5', 'verb_gap_5', 'verb_ch_6', 'verb_gap_6', 'verb_ch_7', 'verb_gap_7', 'verb_ch_8', 'verb_gap_8', 'verb_ch_9', 'verb_gap_9', 'verb_ch_10', 'verb_gap_10', 'verb_ch_11', 'verb_gap_11', 'verb_ch_12', 'verb_gap_12', 'verb_ch_13', 'verb_gap_13', 'verb_ch_14', 'verb_gap_14', 'verb_ch_15', 'verb_gap_15', 'verb_ch_16', 'verb_gap_16', 'verb_ch_17', 'verb_ch_18', 'verb_ch_19', 'verb_ch_20', 'verb_ch_21', 'verb_ch_22', 'verb_ch_23', 'verb_ch_24', 'verb_ch_25', 'verb_ch_26', 'verb_ch_27', 'verb_ch_28', 'verb_ch_29', 'verb_ch_30');
update public.exercises e set subtopic = 'inf_to'
  from public.topics t where t.id = e.topic_id and t.slug = 'infinitive' and e.student_id is null
   and e.legacy_id in ('verb_cr_1', 'verb_ord_1', 'verb_cr_2', 'verb_ord_2', 'verb_cr_3', 'verb_ord_3', 'verb_ord_4', 'verb_ord_5', 'verb_cr_6', 'verb_ord_6', 'verb_ord_7', 'verb_ord_8', 'verb_cr_9', 'verb_ord_9', 'verb_cr_10', 'verb_ord_10', 'verb_cr_11', 'verb_ord_11', 'verb_ord_12', 'verb_ord_13', 'verb_ord_14', 'verb_ord_15', 'verb_ord_16', 'verb_gap_17', 'verb_ord_17', 'verb_gap_18', 'verb_ord_18', 'verb_gap_19', 'verb_ord_19', 'verb_gap_20', 'verb_ord_20', 'verb_gap_21', 'verb_ord_21', 'verb_gap_22', 'verb_ord_22', 'verb_gap_23', 'verb_ord_23', 'verb_gap_24', 'verb_gap_25', 'verb_gap_26', 'verb_gap_27', 'verb_gap_28', 'verb_gap_29', 'verb_gap_30', 'verb_ch_31', 'verb_gap_31', 'verb_ch_32', 'verb_gap_32', 'verb_ch_33', 'verb_ch_34', 'verb_ch_35', 'verb_ch_36', 'verb_ch_37', 'verb_ch_38', 'verb_ch_39', 'verb_ch_40', 'verb_ch_41', 'verb_ch_42', 'verb_ch_43', 'verb_ch_44', 'verb_ch_45', 'verb_ch_46', 'verb_ch_47', 'verb_ch_48', 'verb_ch_49', 'verb_ch_50', 'verb_ch_51', 'verb_ch_52', 'verb_ch_53', 'verb_ch_54', 'verb_ch_55', 'verb_ch_56', 'verb_ch_57', 'verb_ch_58', 'verb_ch_59', 'verb_ch_60', 'verb_ch_61', 'verb_ch_62', 'verb_ch_63', 'verb_ch_64', 'verb_ch_65', 'verb_ch_66', 'verb_ch_67', 'verb_gap_217', 'verb_gap_257', 'verb_gap_307', 'verb_gap_353');
update public.exercises e set subtopic = 'inf_func'
  from public.topics t where t.id = e.topic_id and t.slug = 'infinitive' and e.student_id is null
   and e.legacy_id in ('verb_cr_4', 'verb_cr_5', 'verb_cr_7', 'verb_cr_8', 'verb_ord_24', 'verb_ord_25', 'verb_ord_26', 'verb_ord_27', 'verb_ord_28', 'verb_ord_29', 'verb_ord_30', 'verb_ord_31', 'verb_ord_32', 'verb_gap_33', 'verb_ord_33', 'verb_gap_34', 'verb_ord_34', 'verb_gap_35', 'verb_ord_35', 'verb_gap_36', 'verb_ord_36', 'verb_gap_37', 'verb_ord_37', 'verb_gap_38', 'verb_ord_38', 'verb_gap_39', 'verb_ord_39', 'verb_gap_40', 'verb_ord_40', 'verb_gap_41', 'verb_ord_41', 'verb_gap_42', 'verb_ord_42', 'verb_gap_43', 'verb_ord_43', 'verb_gap_44', 'verb_ord_44', 'verb_gap_45', 'verb_ord_45', 'verb_gap_46', 'verb_ord_46', 'verb_gap_47', 'verb_ord_47', 'verb_gap_48', 'verb_ord_48', 'verb_gap_49', 'verb_ord_49', 'verb_gap_50', 'verb_ord_50', 'verb_gap_51', 'verb_ord_51', 'verb_gap_52', 'verb_ord_52', 'verb_gap_53', 'verb_ord_53', 'verb_gap_54', 'verb_ord_54', 'verb_gap_55', 'verb_ord_55', 'verb_gap_56', 'verb_ord_56', 'verb_gap_57', 'verb_ord_57', 'verb_gap_58', 'verb_ord_58', 'verb_gap_59', 'verb_ord_59', 'verb_ord_60', 'verb_ord_61', 'verb_ord_62', 'verb_ord_63', 'verb_ord_64', 'verb_ord_65', 'verb_ord_66', 'verb_ord_67', 'verb_ch_68', 'verb_ch_69', 'verb_ch_70', 'verb_ch_71', 'verb_ch_72', 'verb_ch_73', 'verb_ch_74', 'verb_ch_75', 'verb_ch_76', 'verb_ch_77', 'verb_ch_78', 'verb_ch_79', 'verb_ch_80', 'verb_ch_81', 'verb_ch_82', 'verb_ch_83', 'verb_ch_84', 'verb_ch_85', 'verb_ch_86', 'verb_ch_87', 'verb_ch_88', 'verb_ch_89', 'verb_ch_90', 'verb_ch_91', 'verb_ch_92', 'verb_ch_93', 'verb_ch_94', 'verb_ch_95', 'verb_ch_96', 'verb_ch_97', 'verb_ch_98', 'verb_ch_99', 'verb_ch_100', 'verb_ch_101', 'verb_ch_102', 'verb_ch_103', 'verb_ch_104', 'verb_ch_105', 'verb_ch_106', 'verb_ch_107', 'verb_ch_108', 'verb_ch_109', 'verb_ch_110', 'verb_ch_111', 'verb_ch_112', 'verb_ch_113', 'verb_ch_114', 'verb_ch_115', 'verb_ch_116', 'verb_ch_117', 'verb_ch_118', 'verb_ch_119', 'verb_gap_206', 'verb_gap_213', 'verb_gap_214', 'verb_gap_216', 'verb_gap_219', 'verb_gap_220', 'verb_gap_232', 'verb_gap_250', 'verb_gap_309', 'verb_gap_324', 'verb_gap_344', 'verb_gap_345', 'verb_gap_354', 'verb_gap_355', 'verb_gap_358', 'verb_gap_359', 'verb_gap_361');
update public.exercises e set subtopic = 'inf_subj'
  from public.topics t where t.id = e.topic_id and t.slug = 'infinitive' and e.student_id is null
   and e.legacy_id in ('verb_cr_15', 'verb_gap_96', 'verb_gap_97', 'verb_gap_98', 'verb_gap_99', 'verb_gap_100', 'verb_gap_101', 'verb_gap_102', 'verb_gap_103', 'verb_gap_104', 'verb_gap_105', 'verb_gap_106', 'verb_gap_107', 'verb_gap_108', 'verb_gap_109', 'verb_gap_110', 'verb_gap_111', 'verb_gap_112', 'verb_gap_113', 'verb_gap_114', 'verb_gap_115', 'verb_gap_116', 'verb_gap_117', 'verb_gap_118', 'verb_gap_119', 'verb_gap_120', 'verb_gap_121', 'verb_gap_122', 'verb_gap_123', 'verb_gap_124', 'verb_gap_125', 'verb_gap_126', 'verb_gap_127', 'verb_gap_128', 'verb_gap_129', 'verb_gap_130', 'verb_gap_131', 'verb_gap_132', 'verb_gap_133', 'verb_gap_134', 'verb_gap_135', 'verb_gap_136', 'verb_gap_137', 'verb_gap_138', 'verb_gap_139', 'verb_gap_140', 'verb_gap_141', 'verb_gap_142', 'verb_gap_143', 'verb_gap_144', 'verb_gap_145', 'verb_gap_146', 'verb_gap_147', 'verb_gap_218', 'verb_gap_227', 'verb_gap_229', 'verb_gap_230', 'verb_gap_239', 'verb_gap_247', 'verb_gap_248', 'verb_gap_254', 'verb_gap_298', 'verb_gap_332');
update public.exercises e set subtopic = 'inf_obj'
  from public.topics t where t.id = e.topic_id and t.slug = 'infinitive' and e.student_id is null
   and e.legacy_id in ('verb_gap_60', 'verb_gap_61', 'verb_gap_62', 'verb_gap_63', 'verb_gap_64', 'verb_gap_65', 'verb_gap_66', 'verb_gap_67', 'verb_gap_68', 'verb_ord_68', 'verb_gap_69', 'verb_ord_69', 'verb_gap_70', 'verb_ord_70', 'verb_gap_71', 'verb_ord_71', 'verb_gap_72', 'verb_ord_72', 'verb_gap_73', 'verb_ord_73', 'verb_gap_74', 'verb_ord_74', 'verb_gap_75', 'verb_ord_75', 'verb_gap_76', 'verb_ord_76', 'verb_gap_77', 'verb_ord_77', 'verb_gap_78', 'verb_ord_78', 'verb_gap_79', 'verb_ord_79', 'verb_gap_80', 'verb_ord_80', 'verb_gap_81', 'verb_ord_81', 'verb_gap_82', 'verb_ord_82', 'verb_gap_83', 'verb_ord_83', 'verb_gap_84', 'verb_ord_84', 'verb_gap_85', 'verb_ord_85', 'verb_gap_86', 'verb_ord_86', 'verb_gap_87', 'verb_ord_87', 'verb_gap_88', 'verb_ord_88', 'verb_gap_89', 'verb_ord_89', 'verb_gap_90', 'verb_ord_90', 'verb_gap_91', 'verb_ord_91', 'verb_gap_92', 'verb_ord_92', 'verb_gap_93', 'verb_ord_93', 'verb_gap_94', 'verb_ord_94', 'verb_gap_95', 'verb_ord_95', 'verb_ord_96', 'verb_ord_97', 'verb_ord_98', 'verb_ord_99', 'verb_ord_100', 'verb_ord_101', 'verb_ord_102', 'verb_ord_103', 'verb_ord_104', 'verb_ord_105', 'verb_ord_106', 'verb_ord_107', 'verb_ord_108', 'verb_ord_109', 'verb_ord_110', 'verb_ord_111', 'verb_ord_112', 'verb_ord_113', 'verb_ord_114', 'verb_ord_115', 'verb_ord_116', 'verb_ord_117', 'verb_ch_120', 'verb_ch_121', 'verb_ch_122', 'verb_ch_123', 'verb_ch_124', 'verb_ch_125', 'verb_ch_126', 'verb_ch_127', 'verb_ch_128', 'verb_ch_129', 'verb_ch_130', 'verb_ch_131', 'verb_ch_132', 'verb_ch_133', 'verb_ch_134', 'verb_ch_135', 'verb_ch_136', 'verb_ch_137', 'verb_ch_138', 'verb_ch_139', 'verb_ch_140', 'verb_ch_141', 'verb_ch_142', 'verb_ch_143', 'verb_ch_144', 'verb_ch_145', 'verb_ch_146', 'verb_ch_147', 'verb_ch_148', 'verb_ch_149', 'verb_ch_150', 'verb_ch_151', 'verb_ch_152', 'verb_ch_153', 'verb_ch_154', 'verb_ch_155', 'verb_ch_156', 'verb_ch_157', 'verb_ch_158', 'verb_ch_159', 'verb_gap_209', 'verb_gap_210', 'verb_gap_221', 'verb_gap_222', 'verb_gap_223', 'verb_gap_224', 'verb_gap_225', 'verb_gap_226', 'verb_gap_244', 'verb_gap_302', 'verb_gap_308', 'verb_gap_333', 'verb_gap_378', 'verb_gap_380', 'verb_gap_382', 'verb_gap_386');
update public.exercises e set subtopic = 'par_use'
  from public.topics t where t.id = e.topic_id and t.slug = 'participle' and e.student_id is null
   and e.legacy_id in ('verb_ch_160', 'verb_ch_161', 'verb_ch_162', 'verb_ch_163', 'verb_ch_164', 'verb_ch_165', 'verb_ch_166', 'verb_ch_167', 'verb_ch_168', 'verb_ch_169', 'verb_ch_170', 'verb_ch_171', 'verb_ch_172', 'verb_ch_173', 'verb_gap_376', 'verb_gap_387');
update public.exercises e set subtopic = 'par_clause'
  from public.topics t where t.id = e.topic_id and t.slug = 'participle' and e.student_id is null
   and e.legacy_id in ('verb_gap_363', 'verb_gap_364', 'verb_gap_365', 'verb_gap_366', 'verb_gap_367', 'verb_gap_368', 'verb_gap_369', 'verb_gap_370', 'verb_gap_371', 'verb_gap_372', 'verb_gap_383');
update public.exercises e set subtopic = 'cmp_form'
  from public.topics t where t.id = e.topic_id and t.slug = 'comparisons' and e.student_id is null
   and e.legacy_id in ('cmp_ex12_1', 'cmp_ex12_2', 'cmp_ex12_3', 'cmp_ex12_4', 'cmp_ex12_5', 'cmp_ex12_6', 'cmp_ex12_7', 'cmp_ex12_8', 'cmp_ex12_9', 'cmp_ex12_10', 'cmp_ex12_11', 'cmp_ex12_12', 'cmp_ex14_1', 'cmp_ex14_2', 'cmp_ex14_3', 'cmp_ex14_4', 'cmp_ex14_5', 'cmp_ex14_6', 'cmp_ex14_7', 'cmp_ex14_8', 'cmp_ex14_9', 'cmp_ex14_10', 'cmp_ex14_11', 'cmp_ex14_12', 'cmp_ex15_1', 'cmp_ex15_2', 'cmp_ex15_3', 'cmp_ex15_4', 'cmp_ex15_5', 'cmp_ex15_6', 'cmp_ex15_7', 'cmp_ex15_8', 'cmp_ex15_9', 'cmp_ex15_10');
update public.exercises e set subtopic = 'cmp_likeas'
  from public.topics t where t.id = e.topic_id and t.slug = 'comparisons' and e.student_id is null
   and e.legacy_id in ('cmp_ex18_1', 'cmp_ex18_2', 'cmp_ex18_3', 'cmp_ex18_4', 'cmp_ex18_5', 'cmp_ex18_6', 'cmp_ex18_7', 'cmp_ex18_8', 'cmp_ex18_9', 'cmp_ex18_10', 'cmp_ex18_11');
update public.exercises e set subtopic = 'cmp_errors'
  from public.topics t where t.id = e.topic_id and t.slug = 'comparisons' and e.student_id is null
   and e.legacy_id in ('cmp_ex19_1', 'cmp_ex20_1', 'cmp_ex19_2', 'cmp_ex20_2', 'cmp_ex19_3', 'cmp_ex20_3', 'cmp_ex19_4', 'cmp_ex20_4', 'cmp_ex19_5', 'cmp_ex20_5', 'cmp_ex19_6', 'cmp_ex20_6', 'cmp_ex19_7', 'cmp_ex20_7', 'cmp_ex19_8', 'cmp_ex20_8', 'cmp_ex19_9', 'cmp_ex20_9', 'cmp_ex19_10', 'cmp_ex20_10', 'cmp_ex19_11', 'cmp_ex20_11', 'cmp_ex19_12', 'cmp_ex20_12', 'cmp_ex19_13', 'cmp_ex20_13', 'cmp_ex19_14', 'cmp_ex20_14', 'cmp_ex19_15', 'cmp_ex20_15', 'cmp_ex19_16', 'cmp_ex20_16', 'cmp_ex19_17', 'cmp_ex20_17', 'cmp_ex20_18', 'cmp_ex21_1', 'cmp_ex21_2', 'cmp_ex21_3', 'cmp_ex21_4', 'cmp_ex21_5', 'cmp_ex21_6', 'cmp_ex21_7', 'cmp_ex21_8', 'cmp_ex21_9', 'cmp_ex21_10');
update public.exercises e set subtopic = 'cmp_structures'
  from public.topics t where t.id = e.topic_id and t.slug = 'comparisons' and e.student_id is null
   and e.legacy_id in ('cmp_ex13_1', 'cmp_ex13_2', 'cmp_ex13_3', 'cmp_ex13_4', 'cmp_ex13_5', 'cmp_ex13_6', 'cmp_ex13_7', 'cmp_ex13_8', 'cmp_ex16_1', 'cmp_ex16_2', 'cmp_ex16_3', 'cmp_ex16_4', 'cmp_ex16_5', 'cmp_ex16_6', 'cmp_ex16_7', 'cmp_ex16_8', 'cmp_ex16_9', 'cmp_ex16_10', 'cmp_ex17_1', 'cmp_ex17_2', 'cmp_ex17_3', 'cmp_ex17_4', 'cmp_ex17_5');

-- Контроль: у кожній підтемі кількість блоків теорії та вправ
select t.slug as topic, s.sub as subtopic,
       (select count(*) from public.theory_blocks b where b.topic_id = t.id and b.subtopic = s.sub) as theory,
       (select count(*) from public.exercises e where e.topic_id = t.id and e.subtopic = s.sub and e.student_id is null) as exercises
  from public.topics t
  cross join lateral jsonb_array_elements(t.subtopics) with ordinality as x(j, ord)
  cross join lateral (select x.j->>'slug' as sub) s
 where t.slug in ('adjectives', 'adverbs', 'nouns', 'articles', 'comparisons', 'modal_verbs', 'pronouns', 'infinitive', 'gerund', 'participle')
 order by t.position, x.ord;

-- Вправи й блоки без підтеми (мало б бути 0 у темах з підтемами)
select t.slug, count(*) filter (where e.subtopic is null) as exercises_without_subtopic
  from public.exercises e join public.topics t on t.id = e.topic_id
 where e.student_id is null and t.slug in ('adjectives', 'adverbs', 'nouns', 'articles', 'comparisons', 'modal_verbs', 'pronouns', 'infinitive', 'gerund', 'participle')
 group by t.slug having count(*) filter (where e.subtopic is null) > 0;

-- Контроль: скільки вправ отримали групу «Exercise N» (після всіх змін)
select t.slug, count(*) filter (where e.payload ? 'group') as grouped, count(*) as total
  from exercises e join topics t on t.id = e.topic_id
 where e.student_id is null
 group by t.slug, t.position order by t.position;

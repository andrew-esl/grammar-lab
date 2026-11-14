-- 15_exercise_groups.sql
-- Групування вправ за номерами з підручника («Exercise N»).
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

-- Exercise 1, пункт 2 у книзі містить ще й слово «ancient» (раніше було пропущене)
update exercises
   set payload = payload || '{"answer":"small ancient stone cottage","scrambled":["stone","ancient","small","cottage"],"hint":"Size → Age → Material → Noun"}'::jsonb
 where legacy_id = 'ord_1' and student_id is null
   and topic_id = (select id from topics where slug = 'adjectives');

-- Контроль: скільки вправ отримали групу
select t.slug, count(*) filter (where e.payload ? 'group') as grouped, count(*) as total
  from exercises e join topics t on t.id = e.topic_id
 where e.student_id is null and t.slug in ('adjectives','adverbs','nouns','articles','comparisons')
 group by t.slug order by t.slug;

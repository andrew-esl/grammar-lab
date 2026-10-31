-- ============================================================
--  Зробити власний акаунт викладачем
--
--  ПЕРЕД запуском створіть собі акаунт у Supabase:
--  Authentication → Users → Add user → Create new user
--    Email:    ваша пошта
--    Password: ваш пароль
--    Auto Confirm User: УВІМКНУТИ (інакше доведеться підтверджувати листом)
--
--  Потім підставте свою пошту в рядок нижче і запустіть.
-- ============================================================

update public.profiles p
   set role = 'teacher',
       full_name = coalesce(p.full_name, 'Андрій Антонов')
  from auth.users u
 where u.id = p.id
   and u.email = 'ПОСТАВТЕ_СЮДИ_СВОЮ_ПОШТУ';

-- Перевірка: має бути один рядок із role = teacher
select u.email, p.role, p.full_name
  from public.profiles p
  join auth.users u on u.id = p.id
 order by p.role;

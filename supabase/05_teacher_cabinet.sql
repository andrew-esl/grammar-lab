-- ============================================================
--  Патч під кабінет викладача
--  1) ЗАКРИВАЄ ДІРКУ: учень міг змінити собі role на 'teacher'
--  2) додає email у profiles (кабінету треба бачити пошту учня,
--     а таблиця auth.users з браузера недоступна)
--  Ідемпотентний: повторний запуск нічого не зламає.
-- ============================================================

-- ---------- 1. Захист ролі ----------

-- Стара політика дозволяла оновлювати власний профіль без обмежень,
-- зокрема поле role. Учням оновлювати профіль не потрібно взагалі.
drop policy if exists profiles_update_self on public.profiles;

-- Викладач може редагувати лише своїх учнів і лише як учнів:
-- не може зробити учня викладачем чи передати іншому викладачеві.
drop policy if exists profiles_teacher_manage on public.profiles;
create policy profiles_teacher_manage on public.profiles for update
  using (public.owns_student(id))
  with check (role = 'student' and teacher_id = auth.uid());

-- Друга лінія оборони: роль і належність до викладача змінюються
-- тільки з SQL Editor або серверної функції (там auth.uid() порожній),
-- навіть якщо колись зʼявиться помилкова політика.
create or replace function public.guard_profile_role()
returns trigger language plpgsql as $$
begin
  if auth.uid() is not null
     and (new.role is distinct from old.role
          or new.teacher_id is distinct from old.teacher_id) then
    raise exception 'Зміна ролі чи викладача заборонена';
  end if;
  return new;
end;
$$;

drop trigger if exists trg_guard_profile_role on public.profiles;
create trigger trg_guard_profile_role
  before update on public.profiles
  for each row execute function public.guard_profile_role();

-- ---------- 2. Email у профілі ----------

alter table public.profiles add column if not exists email text;

update public.profiles p
   set email = u.email
  from auth.users u
 where u.id = p.id and p.email is distinct from u.email;

create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, role, full_name, teacher_id, email)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'role', 'student'),
    new.raw_user_meta_data->>'full_name',
    nullif(new.raw_user_meta_data->>'teacher_id','')::uuid,
    new.email
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

-- Перевірка: має бути ваш рядок із role = teacher і заповненим email
select email, role, full_name from public.profiles order by role desc;

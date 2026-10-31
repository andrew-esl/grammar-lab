-- ============================================================
--  Grammar Lab — схема бази даних
--  Виконувати в Supabase: SQL Editor → New query → вставити → Run
--  Скрипт ідемпотентний: повторний запуск нічого не зламає.
-- ============================================================

-- ------------------------------------------------------------
-- 1. ДОВІДКОВА ФУНКЦІЯ: порядок рівнів
-- ------------------------------------------------------------
create or replace function public.level_rank(l text)
returns int language sql immutable as $$
  select case l
    when 'elementary'   then 0
    when 'intermediate' then 1
    when 'advanced'     then 2
    else 99
  end;
$$;

-- ------------------------------------------------------------
-- 2. ТАБЛИЦІ
-- ------------------------------------------------------------

-- Профілі. Один рядок на кожного користувача з auth.users.
create table if not exists public.profiles (
  id          uuid primary key references auth.users(id) on delete cascade,
  role        text not null default 'student' check (role in ('teacher','student')),
  full_name   text,
  note        text,                                    -- приватна нотатка викладача про учня
  teacher_id  uuid references public.profiles(id) on delete set null,
  created_at  timestamptz not null default now()
);

-- Теми (відповідають теперішнім файлам data/*.js)
create table if not exists public.topics (
  id          uuid primary key default gen_random_uuid(),
  slug        text unique not null,                    -- "adjectives"
  title       text not null,                           -- "Прикметники (Adjectives)"
  description text,
  position    int not null default 0,                  -- порядок у меню
  created_at  timestamptz not null default now()
);

-- Блоки теорії
create table if not exists public.theory_blocks (
  id           uuid primary key default gen_random_uuid(),
  topic_id     uuid not null references public.topics(id) on delete cascade,
  block_key    text not null,                          -- "th_1" зі старих файлів
  title        text not null,
  level        text not null check (level in ('elementary','intermediate','advanced')),
  content_html text not null,
  position     int not null default 0,
  unique (topic_id, block_key)
);

-- Вправи. payload — тіло вправи у тому ж вигляді, що й зараз у data/*.js,
-- тому рушій не доведеться вчити новому формату.
create table if not exists public.exercises (
  id         uuid primary key default gen_random_uuid(),
  topic_id   uuid not null references public.topics(id) on delete cascade,
  legacy_id  text,                                     -- "gap_12_nouns", для звірки після міграції
  type       text not null check (type in ('order','choice','gap','cross','abcd')),
  level      text not null check (level in ('elementary','intermediate','advanced')),
  payload    jsonb not null,
  position   int not null default 0,
  -- NULL  → спільна вправа, доступна всім, кому призначено тему
  -- uuid  → персональна вправа цього учня (згенерована або додана вручну)
  student_id uuid references public.profiles(id) on delete cascade,
  source     text not null default 'book' check (source in ('book','generated','manual')),
  created_by uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now()
);

-- Призначення теми учневі: що саме йому відкрито
create table if not exists public.assignments (
  id              uuid primary key default gen_random_uuid(),
  student_id      uuid not null references public.profiles(id) on delete cascade,
  topic_id        uuid not null references public.topics(id) on delete cascade,
  max_level       text not null default 'advanced' check (max_level in ('elementary','intermediate','advanced')),
  theory_visible  boolean not null default true,
  created_at      timestamptz not null default now(),
  unique (student_id, topic_id)
);

-- Точкові винятки: сховати окрему вправу від окремого учня
create table if not exists public.exercise_overrides (
  student_id  uuid not null references public.profiles(id) on delete cascade,
  exercise_id uuid not null references public.exercises(id) on delete cascade,
  hidden      boolean not null default true,
  primary key (student_id, exercise_id)
);

-- Спроби: кожне натискання «Перевірити»
create table if not exists public.attempts (
  id          bigserial primary key,
  student_id  uuid not null references public.profiles(id) on delete cascade,
  exercise_id uuid not null references public.exercises(id) on delete cascade,
  answer      text,
  is_correct  boolean not null,
  created_at  timestamptz not null default now()
);

-- потрібен, щоб повторний імпорт контенту оновлював рядки, а не дублював їх
create unique index if not exists uq_exercises_legacy_shared
  on public.exercises (legacy_id) where student_id is null;

create index if not exists idx_theory_topic     on public.theory_blocks(topic_id);
create index if not exists idx_ex_topic         on public.exercises(topic_id);
create index if not exists idx_ex_student       on public.exercises(student_id);
create index if not exists idx_assign_student   on public.assignments(student_id);
create index if not exists idx_attempts_student on public.attempts(student_id, created_at desc);
create index if not exists idx_attempts_ex      on public.attempts(exercise_id);
create index if not exists idx_profiles_teacher on public.profiles(teacher_id);

-- ------------------------------------------------------------
-- 3. ДОПОМІЖНІ ФУНКЦІЇ ДЛЯ ПРАВ ДОСТУПУ
--    security definer — щоб політики не зверталися рекурсивно
--    до тієї ж таблиці, на якій висять.
-- ------------------------------------------------------------
create or replace function public.is_teacher()
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'teacher');
$$;

create or replace function public.owns_student(sid uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.profiles p where p.id = sid and p.teacher_id = auth.uid());
$$;

-- Чи відкрита тема учневі і до якого рівня
create or replace function public.topic_allowed(tid uuid, lvl text, need_theory boolean default false)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (
    select 1 from public.assignments a
    where a.student_id = auth.uid()
      and a.topic_id = tid
      and public.level_rank(lvl) <= public.level_rank(a.max_level)
      and (not need_theory or a.theory_visible)
  );
$$;

-- ------------------------------------------------------------
-- 4. RLS
-- ------------------------------------------------------------
alter table public.profiles            enable row level security;
alter table public.topics              enable row level security;
alter table public.theory_blocks       enable row level security;
alter table public.exercises           enable row level security;
alter table public.assignments         enable row level security;
alter table public.exercise_overrides  enable row level security;
alter table public.attempts            enable row level security;

-- --- profiles ---
drop policy if exists profiles_select on public.profiles;
create policy profiles_select on public.profiles for select
  using (id = auth.uid() or public.owns_student(id));

drop policy if exists profiles_update_self on public.profiles;
create policy profiles_update_self on public.profiles for update
  using (id = auth.uid()) with check (id = auth.uid() and role = 'student' or id = auth.uid());

drop policy if exists profiles_teacher_manage on public.profiles;
create policy profiles_teacher_manage on public.profiles for update
  using (public.owns_student(id)) with check (public.owns_student(id));

-- --- topics ---
drop policy if exists topics_select on public.topics;
create policy topics_select on public.topics for select
  using (
    public.is_teacher()
    or exists (select 1 from public.assignments a where a.student_id = auth.uid() and a.topic_id = topics.id)
  );

drop policy if exists topics_write on public.topics;
create policy topics_write on public.topics for all
  using (public.is_teacher()) with check (public.is_teacher());

-- --- theory_blocks ---
-- Учень бачить блок, лише якщо тему призначено, теорію не приховано
-- і рівень блоку не вищий за його максимальний.
drop policy if exists theory_select on public.theory_blocks;
create policy theory_select on public.theory_blocks for select
  using (
    public.is_teacher()
    or public.topic_allowed(theory_blocks.topic_id, theory_blocks.level, true)
  );

drop policy if exists theory_write on public.theory_blocks;
create policy theory_write on public.theory_blocks for all
  using (public.is_teacher()) with check (public.is_teacher());

-- --- exercises ---
drop policy if exists exercises_select on public.exercises;
create policy exercises_select on public.exercises for select
  using (
    public.is_teacher()
    or (
      -- персональна вправа цього учня
      exercises.student_id = auth.uid()
      and public.topic_allowed(exercises.topic_id, exercises.level, false)
    )
    or (
      -- спільна вправа: тема призначена, рівень підходить, вправу не сховано
      exercises.student_id is null
      and public.topic_allowed(exercises.topic_id, exercises.level, false)
      and not exists (
        select 1 from public.exercise_overrides o
        where o.student_id = auth.uid() and o.exercise_id = exercises.id and o.hidden
      )
    )
  );

drop policy if exists exercises_write on public.exercises;
create policy exercises_write on public.exercises for all
  using (public.is_teacher()) with check (public.is_teacher());

-- --- assignments ---
drop policy if exists assignments_select on public.assignments;
create policy assignments_select on public.assignments for select
  using (student_id = auth.uid() or public.owns_student(student_id));

drop policy if exists assignments_write on public.assignments;
create policy assignments_write on public.assignments for all
  using (public.owns_student(student_id)) with check (public.owns_student(student_id));

-- --- exercise_overrides ---
drop policy if exists overrides_select on public.exercise_overrides;
create policy overrides_select on public.exercise_overrides for select
  using (student_id = auth.uid() or public.owns_student(student_id));

drop policy if exists overrides_write on public.exercise_overrides;
create policy overrides_write on public.exercise_overrides for all
  using (public.owns_student(student_id)) with check (public.owns_student(student_id));

-- --- attempts ---
-- Учень пише тільки свої спроби і не може їх правити чи видаляти.
drop policy if exists attempts_insert on public.attempts;
create policy attempts_insert on public.attempts for insert
  with check (student_id = auth.uid());

drop policy if exists attempts_select on public.attempts;
create policy attempts_select on public.attempts for select
  using (student_id = auth.uid() or public.owns_student(student_id));

-- ------------------------------------------------------------
-- 5. АВТОСТВОРЕННЯ ПРОФІЛЮ ПРИ РЕЄСТРАЦІЇ
-- ------------------------------------------------------------
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, role, full_name, teacher_id)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'role', 'student'),
    new.raw_user_meta_data->>'full_name',
    nullif(new.raw_user_meta_data->>'teacher_id','')::uuid
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

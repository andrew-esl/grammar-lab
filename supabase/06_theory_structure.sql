-- ============================================================
--  Структурована теорія
--
--  Раніше блок теорії був просто шматком HTML. Тепер він може мати
--  тип (kind) і дані (content_json), з яких сайт малює картки
--  випадків, кольорову формулу, блок «стоп-калька» тощо.
--
--  Старі блоки не чіпаємо: kind = 'prose' означає «показати
--  content_html як було», тож усі теми працюють далі без змін.
-- ============================================================

alter table public.theory_blocks
  add column if not exists kind text not null default 'prose',
  add column if not exists content_json jsonb;

alter table public.theory_blocks drop constraint if exists theory_blocks_kind_check;
alter table public.theory_blocks add constraint theory_blocks_kind_check
  check (kind in ('prose', 'hero', 'cases', 'formula', 'traps'));

-- content_html лишається обовʼязковим лише для звичайних блоків:
-- у структурованих увесь зміст лежить у content_json.
alter table public.theory_blocks alter column content_html drop not null;

alter table public.theory_blocks drop constraint if exists theory_blocks_content_check;
alter table public.theory_blocks add constraint theory_blocks_content_check
  check (kind = 'prose' and content_html is not null
      or kind <> 'prose' and content_json is not null);

select kind, count(*) from public.theory_blocks group by kind;

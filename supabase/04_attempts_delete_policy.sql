-- ============================================================
--  Хто може стирати історію спроб
--
--  Учень — НЕ може: інакше він стер би саме ту статистику помилок,
--  заради якої вона й ведеться.
--  Викладач — може очистити прогрес свого учня і свій власний.
-- ============================================================

drop policy if exists attempts_delete on public.attempts;
create policy attempts_delete on public.attempts for delete
  using (
    public.owns_student(student_id)
    or (student_id = auth.uid() and public.is_teacher())
  );

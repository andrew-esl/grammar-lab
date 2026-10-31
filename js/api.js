// ==================== ДОСТУП ДО БАЗИ ====================
// Єдине місце, де сайт спілкується з Supabase. Рушій про базу не знає:
// він отримує той самий обʼєкт TOPICS_DATA, що раніше лежав у data/*.js.

const sb = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Профіль того, хто увійшов: { id, role, full_name }
let CURRENT_PROFILE = null;

async function apiSignIn(email, password) {
  const { error } = await sb.auth.signInWithPassword({ email: email.trim(), password });
  if (error) throw error;
}

async function apiSignOut() {
  await sb.auth.signOut();
  location.reload();
}

async function apiLoadProfile() {
  const { data: { user } } = await sb.auth.getUser();
  if (!user) return null;
  const { data, error } = await sb
    .from("profiles")
    .select("id, role, full_name")
    .eq("id", user.id)
    .maybeSingle();
  if (error) throw error;
  CURRENT_PROFILE = data ? { ...data, email: user.email } : null;
  return CURRENT_PROFILE;
}

// Збирає TOPICS_DATA у форматі, який очікує рушій.
// База сама віддає лише те, що дозволено цьому користувачеві:
// теми без призначення, блоки теорії вище рівня та сховані вправи
// просто не потраплять у відповідь.
async function apiLoadContent() {
  const [topicsRes, theoryRes, exRes] = await Promise.all([
    sb.from("topics").select("id, slug, title, description, position").order("position"),
    sb.from("theory_blocks").select("topic_id, block_key, title, level, content_html, position").order("position"),
    sb.from("exercises").select("id, topic_id, legacy_id, type, level, payload, position, source").order("position"),
  ]);
  for (const r of [topicsRes, theoryRes, exRes]) if (r.error) throw r.error;

  const byId = {};
  const data = {};

  for (const t of topicsRes.data) {
    const topic = {
      id: t.slug,
      title: t.title,
      description: t.description,
      theory: [],
      exercises: { order: [], choice: [], gap: [], cross: [], abcd: [] },
    };
    byId[t.id] = topic;
    data[t.slug] = topic;
  }

  for (const b of theoryRes.data) {
    const topic = byId[b.topic_id];
    if (!topic) continue;
    topic.theory.push({
      id: b.block_key,
      title: b.title,
      level: b.level,
      contentHtml: b.content_html,
    });
  }

  for (const e of exRes.data) {
    const topic = byId[e.topic_id];
    if (!topic || !topic.exercises[e.type]) continue;
    const item = { ...e.payload };
    item.id = e.legacy_id || e.id;   // id для DOM і прогресу
    item.__uuid = e.id;              // справжній ключ рядка — для запису спроб
    item.level = e.level;
    item.__source = e.source;        // book | generated | manual
    topic.exercises[e.type].push(item);
  }

  return data;
}

// Які вправи вже зараховані: беремо з історії спроб.
async function apiLoadSolved() {
  const { data, error } = await sb
    .from("attempts")
    .select("exercise_id")
    .eq("is_correct", true);
  if (error) throw error;
  return new Set(data.map(r => r.exercise_id));
}

// Пишемо КОЖНУ спробу, і правильну, і помилкову — з неї складається
// статистика у кабінеті викладача.
async function apiRecordAttempt(uuid, answer, isCorrect) {
  if (!uuid || !CURRENT_PROFILE) return;
  const { error } = await sb.from("attempts").insert({
    student_id: CURRENT_PROFILE.id,
    exercise_id: uuid,
    answer: answer == null ? null : String(answer).slice(0, 500),
    is_correct: isCorrect,
  });
  // Невдалий запис статистики не повинен ламати заняття — лише лог.
  if (error) console.warn("attempt не записано:", error.message);
}

async function apiResetTopicProgress(exerciseUuids) {
  if (!exerciseUuids.length || !CURRENT_PROFILE) return;
  const { error } = await sb
    .from("attempts")
    .delete()
    .eq("student_id", CURRENT_PROFILE.id)
    .in("exercise_id", exerciseUuids);
  if (error) throw error;
}

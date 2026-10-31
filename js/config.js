// Параметри підключення до Supabase.
// Обидва значення публічні за задумом: вони все одно потрапляють у браузер.
// Захист даних тримається не на них, а на політиках доступу (RLS) у базі —
// без входу в систему анонімний ключ не повертає жодного рядка.
const SUPABASE_URL = "https://erxeayguufacoqootglz.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_fsgpz4zwuYMYTkft0nd3iQ_XL_Q7cEe";

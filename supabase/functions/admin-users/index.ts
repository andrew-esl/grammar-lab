// ============================================================
//  Edge Function: admin-users
//  Дії викладача з акаунтами учнів, які неможливо виконати з браузера:
//    create_student — створити учня з паролем
//    set_password   — змінити пароль учневі
//    delete_student — видалити учня разом з усією його історією
//
//  Службовий ключ Supabase підставляє сам у змінну середовища
//  SUPABASE_SERVICE_ROLE_KEY — у код, репозиторій чи браузер він не потрапляє.
//  Кожен виклик перевіряє, що його робить викладач, і що учень — саме його.
// ============================================================

import { createClient } from "npm:@supabase/supabase-js@2";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

const json = (body: unknown, status = 200) =>
  new Response(JSON.stringify(body), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });

class HttpError extends Error {
  constructor(public status: number, message: string) { super(message); }
}

const MIN_PASSWORD = 8;

function checkPassword(p: unknown): string {
  if (typeof p !== "string" || p.length < MIN_PASSWORD) {
    throw new HttpError(400, `Пароль має містити щонайменше ${MIN_PASSWORD} символів.`);
  }
  return p;
}

function checkEmail(e: unknown): string {
  const s = typeof e === "string" ? e.trim().toLowerCase() : "";
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(s)) throw new HttpError(400, "Некоректна адреса пошти.");
  return s;
}

// deno-lint-ignore no-explicit-any
type Admin = any;

async function requireTeacher(admin: Admin, authHeader: string | null) {
  const token = (authHeader || "").replace(/^Bearer\s+/i, "");
  if (!token) throw new HttpError(401, "Потрібен вхід у систему.");

  const { data: { user }, error } = await admin.auth.getUser(token);
  if (error || !user) throw new HttpError(401, "Сесія недійсна. Увійдіть знову.");

  const { data: prof } = await admin.from("profiles").select("role").eq("id", user.id).maybeSingle();
  if (!prof || prof.role !== "teacher") throw new HttpError(403, "Дія доступна лише викладачеві.");
  return user;
}

async function requireOwnStudent(admin: Admin, teacherId: string, studentId: unknown) {
  if (typeof studentId !== "string" || !studentId) throw new HttpError(400, "Не вказано учня.");
  const { data: prof } = await admin
    .from("profiles").select("id, role, teacher_id").eq("id", studentId).maybeSingle();
  if (!prof || prof.role !== "student" || prof.teacher_id !== teacherId) {
    throw new HttpError(404, "Учня не знайдено серед ваших.");
  }
  return studentId;
}

export async function handle(req: Request, admin: Admin): Promise<Response> {
  if (req.method === "OPTIONS") return new Response("ok", { headers: CORS });
  if (req.method !== "POST") return json({ error: "Лише POST." }, 405);

  try {
    const teacher = await requireTeacher(admin, req.headers.get("Authorization"));
    const body = await req.json().catch(() => ({}));

    switch (body.action) {
      case "create_student": {
        const email = checkEmail(body.email);
        const password = checkPassword(body.password);
        const full_name = typeof body.full_name === "string" ? body.full_name.trim().slice(0, 120) : null;

        const { data, error } = await admin.auth.admin.createUser({
          email,
          password,
          email_confirm: true,            // учень заходить одразу, без листа-підтвердження
          user_metadata: {
            role: "student",              // роль задає сервер, а не браузер
            full_name: full_name || null,
            teacher_id: teacher.id,
          },
        });
        if (error) {
          if (/already|registered|exists/i.test(error.message)) {
            throw new HttpError(409, "Користувач із такою поштою вже існує.");
          }
          throw new HttpError(400, error.message);
        }
        return json({ ok: true, student_id: data.user.id, email });
      }

      case "set_password": {
        const id = await requireOwnStudent(admin, teacher.id, body.student_id);
        const password = checkPassword(body.password);
        const { error } = await admin.auth.admin.updateUserById(id, { password });
        if (error) throw new HttpError(400, error.message);
        return json({ ok: true });
      }

      case "delete_student": {
        const id = await requireOwnStudent(admin, teacher.id, body.student_id);
        // профіль, призначення і спроби видаляються каскадом
        const { error } = await admin.auth.admin.deleteUser(id);
        if (error) throw new HttpError(400, error.message);
        return json({ ok: true });
      }

      default:
        throw new HttpError(400, "Невідома дія.");
    }
  } catch (e) {
    if (e instanceof HttpError) return json({ error: e.message }, e.status);
    console.error(e);
    return json({ error: "Внутрішня помилка сервера." }, 500);
  }
}

Deno.serve((req) => {
  const url = Deno.env.get("SUPABASE_URL");
  const key = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!url || !key) return json({ error: "На сервері не налаштовано ключі Supabase." }, 500);
  const admin = createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } });
  return handle(req, admin);
});

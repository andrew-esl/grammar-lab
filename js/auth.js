// ==================== ВХІД ====================
// Поки користувач не увійшов, сайт не показує нічого: база без
// авторизації не віддає ні тем, ні теорії, ні вправ.

function showLogin(message) {
  document.getElementById("app-shell").classList.add("hidden");
  const box = document.getElementById("login-screen");
  box.classList.remove("hidden");
  const err = document.getElementById("login-error");
  if (message) {
    err.textContent = message;
    err.classList.remove("hidden");
  } else {
    err.classList.add("hidden");
  }
  document.getElementById("login-email").focus();
}

function setLoginBusy(busy) {
  const btn = document.getElementById("login-submit");
  btn.disabled = busy;
  btn.textContent = busy ? "Входимо…" : "Увійти";
}

async function handleLogin(event) {
  if (event) event.preventDefault();
  const email = document.getElementById("login-email").value;
  const password = document.getElementById("login-password").value;
  if (!email || !password) return showLogin("Вкажіть пошту і пароль.");

  setLoginBusy(true);
  try {
    await apiSignIn(email, password);
    await bootApp();
  } catch (e) {
    const msg = /Invalid login/i.test(e.message || "")
      ? "Неправильна пошта або пароль."
      : "Не вдалося увійти: " + (e.message || e);
    showLogin(msg);
  } finally {
    setLoginBusy(false);
  }
}

// Головний запуск: перевіряємо сесію, тягнемо профіль і контент.
async function bootApp() {
  let profile;
  try {
    profile = await apiLoadProfile();
  } catch (e) {
    return showLogin("Помилка зʼєднання з базою: " + (e.message || e));
  }
  if (!profile) return showLogin();

  document.getElementById("login-screen").classList.add("hidden");
  document.getElementById("app-shell").classList.remove("hidden");
  document.getElementById("user-badge").textContent =
    (profile.full_name || profile.email) + (profile.role === "teacher" ? " · викладач" : "");

  // Кнопку скидання прогресу бачить лише викладач:
  // учень не повинен мати змоги стерти історію своїх помилок.
  document.getElementById("reset-btn").classList.toggle("hidden", profile.role !== "teacher");

  try {
    await loadDataAndRender();
  } catch (e) {
    document.getElementById("current-topic-title").textContent = "Помилка завантаження";
    console.error(e);
    alert("Не вдалося завантажити матеріали: " + (e.message || e));
  }
}

window.addEventListener("DOMContentLoaded", () => {
  document.getElementById("login-form").addEventListener("submit", handleLogin);
  bootApp();
});

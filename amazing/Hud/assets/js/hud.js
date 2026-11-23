console.log("MERIDIAN HUD LOADED");

// КЭШИРОВАНИЕ ЭЛЕМЕНТОВ
const elements = {
    hud: document.getElementById("hud"),
    time: document.getElementById("time"),
    date: document.getElementById("date"),
    hpFill: document.getElementById("hp-fill"),
    hpValue: document.getElementById("hp-value"),
    armorFill: document.getElementById("armor-fill"),
    armorValue: document.getElementById("armor-value"),
    money: document.getElementById("money"),
    nickname: document.getElementById("nickname"),
    playerId: document.getElementById("player-id")
};

/* TIME */
function updateTime() {
    const now = new Date();

    const h = String(now.getHours()).padStart(2, '0');
    const m = String(now.getMinutes()).padStart(2, '0');
    const s = String(now.getSeconds()).padStart(2, '0');

    if (elements.time) elements.time.innerText = `${h}:${m}:${s}`;
    
    if (elements.date) {
        const day = String(now.getDate()).padStart(2, '0');
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const year = String(now.getFullYear()).slice(2);
        elements.date.innerText = `${day}.${month}.${year}`;
    }

    setTimeout(updateTime, 1000 - now.getMilliseconds());
}
updateTime();

/* УТИЛИТА ДЛЯ СТАТУС-БАРОВ */
function updateBar(fillEl, valueEl, value) {
    if (!fillEl || !valueEl) return;
    const validValue = Math.max(0, Math.min(100, Math.floor(Number(value) || 0)));
    fillEl.style.width = `${validValue}%`;
    valueEl.innerText = validValue;
}

/* HP */
function setHealth(value) {
    updateBar(elements.hpFill, elements.hpValue, value);
}

/* ARMOR */
function setArmor(value) {
    updateBar(elements.armorFill, elements.armorValue, value);
}

/* MONEY */
function setMoney(value) {
    if (!elements.money) return;
    const cleanMoney = parseInt(value, 10) || 0;
    elements.money.innerText = cleanMoney.toLocaleString('ru-RU');
}

/* NICKNAME */
function setNickname(name) {
    if (elements.nickname && name !== undefined) {
        elements.nickname.innerText = String(name);
    }
}

/* ID */
function setID(id) {
    if (elements.playerId) elements.playerId.innerText = String(id);
}

/* ADMIN */
function setAdmin(state) {
    if (!elements.playerId) return;
    const isAdmin = !!state;
    elements.playerId.classList.toggle("admin", isAdmin);
    elements.playerId.classList.toggle("player", !isAdmin);
}

/* ПЕРЕКЛЮЧЕНИЕ РЕЖИМА ХУДА (Авторизация / Полный вход) */
function toggleHudMode(isAuth) {
    const hudContainer = document.querySelector('.hud');
    if (!hudContainer) return;
    
    if (isAuth) {
        hudContainer.classList.add("auth-mode");
    } else {
        hudContainer.classList.remove("auth-mode");
    }
}

/* DEFAULT INITIALIZATION */
// Строку toggleHudMode(true) убрали, так как класс теперь зашит в HTML изначально
setNickname("Sergey_Chyorny");
setID(6);
setMoney(58541857);
setAdmin(false);
setHealth(100);
setArmor(100);

/* CEF / PAWN INTERFACE (Приём данных от сервера) */
window.addEventListener("DOMContentLoaded", () => {
    if (typeof cef !== 'undefined') {
        cef.on("hud:setHealth", (value) => setHealth(value));
        cef.on("hud:setArmor", (value) => setArmor(value));
        cef.on("hud:setMoney", (value) => setMoney(value));
        cef.on("hud:setNickname", (name) => setNickname(name));
        cef.on("hud:setID", (id) => setID(id));
        cef.on("hud:setAdmin", (state) => setAdmin(state));
        cef.on("hud:toggleAuthMode", (state) => toggleHudMode(state));
    } else {
        console.log("CEF не обнаружен. Худ запущен в обычном браузере.");
    }
});

/* НА ВСЯКИЙ СЛУЧАЙ */
window.updateHUD = (data) => {
    if (!data) return;
    if (data.nickname !== undefined) setNickname(data.nickname);
    if (data.id !== undefined)       setID(data.id);
    if (data.hp !== undefined)       setHealth(data.hp);
    if (data.armor !== undefined)    setArmor(data.armor);
    if (data.money !== undefined)    setMoney(data.money);
    if (data.admin !== undefined)    setAdmin(data.admin);
    if (data.authMode !== undefined) toggleHudMode(data.authMode);
};

/* ГЛОБАЛЬНАЯ РЕГИСТРАЦИЯ */
window.setHealth = setHealth;
window.setArmor = setArmor;
window.setMoney = setMoney;
window.setNickname = setNickname;
window.setID = setID;
window.setAdmin = setAdmin;
window.toggleHudMode = toggleHudMode;
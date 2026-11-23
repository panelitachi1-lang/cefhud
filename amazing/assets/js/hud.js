// ================= CONFIG =================
const HUD_CONFIG = {
    DATE_UPDATE_INTERVAL_MS: 500,
    CIRCLE_RADIUS: 180,
    HEALTH_MAX: 100
};

const circumference = 2 * Math.PI * HUD_CONFIG.CIRCLE_RADIUS;
const numberFormatter = new Intl.NumberFormat('ru-RU');

const hasCEF = typeof cef !== 'undefined' && cef.on;


// ================= VUE =================
const main = new Vue({
    el: ".amazing-main-hud-block",

    data: {
        active: true,
        health: 0,
        id: 0,
        name: "",
        currentDate: "",
        currentTime: "",
        armour: 0,
        wanted: 0,
        money: 0,
        weapon: 0,
        ammo: "",
        isAdmin: false
    },

    computed: {
        healthCircleLength() {
            return circumference;
        },

        healthStrokeDashoffset() {
            const percent = Math.min(100, Math.max(0, this.health)) / 100;
            return circumference * (1 - percent);
        },

        isWeaponFire() {
            return (this.weapon >= 22 && this.weapon <= 38) ||
                   this.weapon === 41 ||
                   this.weapon === 42;
        },

        idClass() {
            return {
                'admin-id': this.isAdmin,
                'user-id': !this.isAdmin
            };
        }
    },

    methods: {
        getInterface() {
            return this.removeUnderscores(this.name);
        },

        removeUnderscores(str) {
            return str ? str.replace(/_/g, ' ') : '';
        },

        formatNumber(value) {
            return numberFormatter.format(value);
        },

        // ⭐ НОВАЯ ЛОГИКА ДАТЫ/ВРЕМЕНИ — КАК НА МАКЕТЕ
        updateDateTime() {
            const now = new Date();

            // === ДАТА: DD.MM.YY ===
            const day = String(now.getDate()).padStart(2, '0');
            const month = String(now.getMonth() + 1).padStart(2, '0');
            const year = String(now.getFullYear()).slice(-2);

            this.currentDate = `${day}.${month}.${year}`;

            // === ВРЕМЯ: HH:MM:SS ===
            const hours = String(now.getHours()).padStart(2, '0');
            const minutes = String(now.getMinutes()).padStart(2, '0');
            const seconds = String(now.getSeconds()).padStart(2, '0');

            this.currentTime = `${hours}:${minutes}:${seconds}`;
        }
    },

    mounted() {
        this.updateDateTime();

        setInterval(() => {
            this.updateDateTime();
        }, HUD_CONFIG.DATE_UPDATE_INTERVAL_MS);

        if (!hasCEF) {
            console.warn('CEF bridge not available');
            return;
        }

        // ===== CEF EVENTS =====
        cef.on("Lethality(executeEvent['main.hud.active'])", v => this.active = v);
        cef.on("Lethality(executeEvent['main.hud.wanted'])", v => this.wanted = v);
        cef.on("Lethality(executeEvent['main.hud.id'])", v => this.id = v);
        cef.on("Lethality(executeEvent['main.hud.name'])", v => this.name = v);
        cef.on("Lethality(executeEvent['main.hud.admin'])", v => this.isAdmin = v);
    }
});


// ================= INIT HUD =================
if (typeof cef !== 'undefined') {
    cef.emit("game:hud:setComponentVisible", "interface", false);
    cef.emit("game:hud:setComponentVisible", "radar", true);
    cef.emit("game:data:pollPlayerStats", true, 50);
}


// ================= PLAYER STATS =================
if (hasCEF) {
    cef.on("game:data:playerStats",
        (hp, maxHp, arm, breath, wanted, weapon, ammo, maxAmmo, money, speed) => {

        main.health = Math.round(hp);
        main.armour = Math.round(arm);
        main.money = money;
        main.weapon = weapon;

        const remainingAmmo = Math.max(0, maxAmmo - ammo);
        main.ammo = `${ammo}/${remainingAmmo}`;

        if (typeof state !== 'undefined') {
            state.speed = speed;
        }

        if (typeof updateSpeedometer === 'function') {
            updateSpeedometer();
        }
    });
}

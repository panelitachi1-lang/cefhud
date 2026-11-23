class UltimateNotifier {
    constructor() {
        this.sideBox = document.getElementById('notify-side-container');
        this.centerBox = document.getElementById('notify-center-container');
        this.epBox = document.getElementById('ep-full-wrapper');

        this.miniSymbols = {
            0: "✓",
            1: "X",
            2: "?",
            3: "!"
        };
    }

    sendMini(type, title, msg, time = 5000, pos = 'side') {
        const el = document.createElement('div');
        el.className = `mini-notify type-${type}`;

        const symbol = this.miniSymbols[type] || "i";

        el.innerHTML = `
            <div class="notify-icon-small">${symbol}</div>
            <div class="notify-content">
                <h2>${title}</h2>
                <p>${msg}</p>
            </div>
        `;

        const target = pos === 'center' ? this.centerBox : this.sideBox;

        if (pos === 'center') target.prepend(el);
        else target.appendChild(el);

        setTimeout(() => el.classList.add('show'), 10);

        setTimeout(() => {
            el.classList.remove('show');
            setTimeout(() => el.remove(), 400);
        }, time);
    }

    sendFull(type, title, msg, time = 7000) {
        const old = this.epBox.querySelector('.ep-overlay');
        if (old) old.remove();

        const mode = type === 1 ? 'warning' : 'hint';
        const symbol = type === 1 ? '!' : '?';

        const el = document.createElement('div');
        el.className = `ep-overlay ep-${mode}`;
        el.innerHTML = `
            <div class="ep-icon">${symbol}</div>
            <div class="ep-content">
                <h2>${title}</h2>
                <p>${msg}</p>
            </div>
        `;

        this.epBox.appendChild(el);
        setTimeout(() => el.classList.add('show'), 10);

        setTimeout(() => {
            el.classList.remove('show');
            setTimeout(() => el.remove(), 800);
        }, time);
    }
}

const Notify = new UltimateNotifier();

if (typeof cef !== 'undefined') {
    cef.on("notify:mini", (t, tit, txt, tm, pos) => Notify.sendMini(t, tit, txt, tm, pos));
    cef.on("notify:full", (t, tit, txt, tm) => Notify.sendFull(t, tit, txt, tm));
}
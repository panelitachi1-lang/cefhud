
if (typeof cef === 'undefined') {
    window.cef = {
        _events: {},
        emit: function(name, ...args) {
            console.log(`[CEF EMIT] ${name}`, args);
        },
        on: function(name, callback) {
            this._events[name] = callback;
            console.log(`[CEF ON] ${name}`);
        },
        set_focus: function(state) {
            console.log(`[CEF FOCUS] ${state}`);
        },
        test: function(color, msg, cat) {
            if (this._events['send:chat:message']) {
                this._events['send:chat:message'](color, msg, cat || '');
            }
        }
    };
}

const CHAT_COMMANDS = [
    { name: '/me',  desc: 'Действие персонажа',   isAdmin: false },
    { name: '/do',  desc: 'Описание сцены',        isAdmin: false },
    { name: '/b',   desc: 'Вне игры (OOC)',        isAdmin: false },
    { name: '/s',   desc: 'Кричать',               isAdmin: false },
    { name: '/w',   desc: 'Шептать',               isAdmin: false },
    { name: '/pm',  desc: 'Личное сообщение',      isAdmin: false, args: [{ name: 'ID игрока' }, { name: 'Текст' }] },
    { name: '/r',   desc: 'Рация фракции',         isAdmin: false },
    { name: '/f',   desc: 'Чат семьи',             isAdmin: false },
    { name: '/q',   desc: 'Выйти из игры',         isAdmin: false },
    { name: '/stats', desc: 'Статистика',          isAdmin: false },
    { name: '/veh', desc: 'Статус транспорта',     isAdmin: false },
    { name: '/give', desc: 'Передать деньги',      isAdmin: false, args: [{ name: 'ID игрока' }, { name: 'Сумма' }] },
    { name: '/alogin', desc: 'Вход в админку',     isAdmin: true },
    { name: '/kick',   desc: 'Кикнуть игрока',     isAdmin: true, args: [{ name: 'ID' }, { name: 'Причина' }] },
    { name: '/ban',    desc: 'Заблокировать',       isAdmin: true, args: [{ name: 'ID' }, { name: 'Причина' }] },
    { name: '/goto',   desc: 'Телепорт к игроку',  isAdmin: true, args: [{ name: 'ID' }] },
    { name: '/gethere',desc: 'Притянуть игрока',   isAdmin: true, args: [{ name: 'ID' }] },
    { name: '/agl', isAdmin: true, args: [{ name: 'ID игрока' }, { name: 'Действие', options: [{ value: 0, name: 'Забрать' }, { value: 1, name: 'Выдать' }] }] },
    { name: '/aincar', isAdmin: true, args: [{ name: 'ID транспорта' }, { name: 'Место', options: [{ value: 0, name: 'Водительское' }, { value: 1, name: 'Пассажирское спереди' }, { value: 2, name: 'Сзади слева' }, { value: 3, name: 'Сзади справа' }] }] },
    { name: '/applyanim', isAdmin: true, args: [{ name: 'ID игрока' }, { name: 'Название IFP' }, { name: 'Анимация' }, { name: 'Loop', options: [{ value: 0, name: 'Выключить' }, { value: 1, name: 'Включить' }] }] }
];

const LAYOUT_MAP = {
    'й':'q','ц':'w','у':'e','к':'r','е':'t','н':'y','г':'u','ш':'i','щ':'o','з':'p',
    'ф':'a','ы':'s','в':'d','а':'f','п':'g','р':'h','о':'j','л':'k','д':'l',
    'я':'z','ч':'x','с':'c','м':'v','и':'b','т':'n','ь':'m',
    'Й':'Q','Ц':'W','У':'E','К':'R','Е':'T','Н':'Y','Г':'U','Ш':'I','Щ':'O','З':'P',
    'Ф':'A','Ы':'S','В':'D','А':'F','П':'G','Р':'H','О':'J','Л':'K','Д':'L',
    'Я':'Z','Ч':'X','С':'C','М':'V','И':'B','Т':'N','Ь':'M'
};

const FADE_DELAY   = 12000;
const MAX_MESSAGES = 100;

new Vue({
    el: '.chat-wrap',
    data: {
        chatInput: '',
        chatShowInput: false,
        chatShowSettings: false,
        chatVisible: true,
        lang: 'EN',
        chatMessages: [],
        chatFilteredCommands: [],
        history: [],
        historyIdx: -1,
        fadeTimers: {},
        settings: {
            showTime: false,
            chatHeight: 28,
            chatWidth: 500,
            fontSize: 14,
        }
    },

    computed: {
        chatStyle() {
            return {
                maxHeight: this.settings.chatHeight + 'vh',
                fontSize: this.settings.fontSize + 'px',
                overflowY: this.chatShowInput ? 'auto' : 'hidden',
                background: this.chatShowInput ? 'rgba(15,15,15,0.55)' : 'transparent',
            };
        },
        containerStyle() {
            return {
                width: this.settings.chatWidth + 'px',
                display: this.chatVisible ? 'flex' : 'none',
            };
        },
        showHintsBox() {
            return this.chatInput.startsWith('/')
                && (this.chatFilteredCommands.length > 0 || this.currentArgOptions);
        },
        currentArgOptions() {
            const parts = this.chatInput.split(' ');
            if (parts.length < 2) return null;
            const cmd = CHAT_COMMANDS.find(c => c.name === parts[0].toLowerCase());
            if (!cmd || !cmd.args) return null;
            const argIdx = parts.length - 2;
            const currentArg = cmd.args[argIdx];
            if (currentArg && currentArg.options) {
                const val = parts[parts.length - 1].toLowerCase();
                return currentArg.options.filter(o => o.name.toLowerCase().includes(val));
            }
            return null;
        }
    },

    methods: {
        saveSettings() {
            try { localStorage.setItem('aw_chat_v2', JSON.stringify(this.settings)); } catch(e) {}
        },
        loadSettings() {
            try {
                const s = localStorage.getItem('aw_chat_v2');
                if (s) this.settings = Object.assign({}, this.settings, JSON.parse(s));
            } catch(e) {}
        },

        formatColors(text) {
            let escaped = text
                .replace(/&/g, '&amp;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;');
            let raw = escaped.replace(
                /\{([A-Fa-f0-9]{6})\}/g,
                '</span><span style="color:#$1">'
            );
            return '<span>' + raw + '</span>';
        },

        addMessage(color, message, category) {
            const now = new Date();
            const hh  = String(now.getHours()).padStart(2, '0');
            const mm  = String(now.getMinutes()).padStart(2, '0');
            const id  = Date.now() + Math.random();

            let clean = message;
            if (category !== 'Система' && !message.includes('Скриншот')) {
                clean = message.replace(/^(\d+[\s,]{1,2}\d+[\s,]{1,2}\d+[\s,]{0,2})/, '').trim();
            }

            let finalColor = (color && color.length >= 6) ? color : 'FFFFFF';
            if (clean.startsWith('[R] '))          finalColor = '54B367';
            if (clean.startsWith('[Департамент]')) finalColor = 'FF8282';
            if (clean.startsWith('[A] '))          finalColor = 'FF4444';
            if (clean.startsWith('[A]'))           finalColor = 'FF4444';

            const fColor  = `#${finalColor}`;
            const catHtml = category
                ? `<span style="color:rgba(255,255,255,0.5)">[${category}] </span>`
                : '';

            this.chatMessages.push({
                id,
                time: `[${hh}:${mm}] `,
                text: `<span style="color:${fColor}">${catHtml}${this.formatColors(clean)}</span>`,
                fading: false
            });

            if (this.chatMessages.length > MAX_MESSAGES) {
                this.chatMessages.shift();
            }

            this.$nextTick(() => {
                const el = this.$refs.chatMessages;
                if (el) el.scrollTop = el.scrollHeight;
            });
        },

        _scheduleFade(id) {},
        _stopAllFades() {},
        _startAllFades() {},

        filterCommands() {
            if (this.chatInput.startsWith('.')) {
                let res = '/';
                for (const ch of this.chatInput.substring(1)) {
                    res += LAYOUT_MAP[ch] || ch;
                }
                this.chatInput = res;
            }

            const parts = this.chatInput.split(' ');
            const val   = parts[0].toLowerCase();

            if (this.chatInput.startsWith('/')) {
                this.chatFilteredCommands = CHAT_COMMANDS
                    .filter(c => c.name.startsWith(val))
                    .slice(0, 6);
            } else {
                this.chatFilteredCommands = [];
            }

            this.lang = /[а-яёА-ЯЁ]/.test(this.chatInput) ? 'RU' : 'EN';
        },

        selectCommand(name) {
            this.chatInput = name + ' ';
            this.filterCommands();
            this.$nextTick(() => document.getElementById('chat-input').focus());
        },

        selectOption(optName) {
            const parts = this.chatInput.split(' ');
            parts[parts.length - 1] = optName;
            this.chatInput = parts.join(' ') + ' ';
            this.$nextTick(() => document.getElementById('chat-input').focus());
        },

        handleKeyDown(e) {
            switch (e.key) {
                case 'Enter': {
                    e.preventDefault();
                    const msg = this.chatInput.trim();
                    if (msg) {
                        if (this.history[this.history.length - 1] !== msg) {
                            this.history.push(msg);
                            if (this.history.length > 30) this.history.shift();
                        }
                        cef.emit('send:chat:message:result', msg);
                    }
                    this.closeChat();
                    break;
                }
                case 'Escape':
                    e.preventDefault();
                    this.closeChat();
                    break;
                case 'ArrowUp':
                    e.preventDefault();
                    if (this.historyIdx < this.history.length - 1) {
                        this.historyIdx++;
                        this.chatInput = this.history[this.history.length - 1 - this.historyIdx];
                    }
                    break;
                case 'ArrowDown':
                    e.preventDefault();
                    if (this.historyIdx > 0) {
                        this.historyIdx--;
                        this.chatInput = this.history[this.history.length - 1 - this.historyIdx];
                    } else {
                        this.historyIdx = -1;
                        this.chatInput = '';
                    }
                    break;
                case 'Tab':
                    e.preventDefault();
                    if (this.currentArgOptions && this.currentArgOptions.length > 0) {
                        this.selectOption(this.currentArgOptions[0].name);
                    } else if (this.chatFilteredCommands.length > 0) {
                        this.selectCommand(this.chatFilteredCommands[0].name);
                    }
                    break;
            }
        },

        openChat(prefix) {
            this.chatShowInput = true;
            this._stopAllFades();
            this.chatInput = prefix || '';
            this.historyIdx = -1;
            cef.set_focus(true);
            this.$nextTick(() => {
                const el = document.getElementById('chat-input');
                if (el) {
                    el.focus();
                    el.selectionStart = el.selectionEnd = this.chatInput.length;
                }
                const chat = this.$refs.chatMessages;
                if (chat) chat.scrollTop = chat.scrollHeight;
            });
        },

        closeChat() {
            this.chatShowInput    = false;
            this.chatShowSettings = false;
            this.chatInput        = '';
            this.historyIdx       = -1;
            this.chatFilteredCommands = [];
            cef.set_focus(false);
            cef.emit('chat:closed');
            this._startAllFades();
        }
    },

    mounted() {
        this.loadSettings();

        window.addEventListener('keydown', (e) => {
            if (this.chatShowInput) return;
            if (e.keyCode === 84 || e.keyCode === 117) {
                e.preventDefault();
                this.openChat('');
            }
        });

        cef.on('send:chat:message', (color, message, category) => {
            this.addMessage(color, message, category || '');
        });

        cef.on('chat:clear', () => {
            this.chatMessages = [];
            Object.keys(this.fadeTimers).forEach(id => clearTimeout(this.fadeTimers[id]));
            this.fadeTimers = {};
        });

        cef.on('chat:setVisible', (visible) => {
            this.chatVisible = visible === 1 || visible === true;
        });

        cef.on('chat:openInput', () => {
            this.openChat('');
        });

        cef.on('chat:closeInput', () => {
            this.closeChat();
        });

        setTimeout(() => {
            if (typeof cef !== 'undefined') {
                cef.emit('chat:ready');
            }
        }, 150);
    }
});

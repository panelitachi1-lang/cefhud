// Главное событие. Порядок аргументов должен СТРОГО совпадать с cef_emit_event в Pawn
cef.on("updateNametag", (id, x, y, z, isMasked, viewerIsAdmin, name, hp, passport, arm, isAdmin, vipType, isWriting, afkTime) => {
    
    let container = document.getElementById("nametags-app");
    let playerEl = document.getElementById(`player-${id}`);

    // Если игрока еще нет на экране — создаем его блок
    if (!playerEl) {
        container.insertAdjacentHTML('beforeend', `
            <div class="player-tag" id="player-${id}">
                <div class="header-row">
                    <div class="afk-block" style="display:none;">
                        <img src="images/nametag/afk.png" class="icon-afk">
                        <span class="afk-time">00:00</span>
                    </div>
                    <img src="images/nametag/admin.png" class="icon-admin" style="display:none;">
                    <img src="images/nametag/vip.png" class="icon-vip" style="display:none;">
                    <img src="images/nametag/black.png" class="icon-black-vip" style="display:none;">
                </div>
                <div class="activity-row">
                    <img src="images/nametag/writing.png" class="icon-writing" style="display:none;">
                </div>
                <div class="name-box">
                    <div class="admin-view-nick" style="display:none; color: #ff4b4b; font-size: 10px;"></div>
                    <div class="nickname"></div>
                    <div class="mask-info" style="display:none;">
                        <span class="passport-number"></span>
                    </div>
                </div>
                <div class="status-bars">
                    <div class="bar-container hp-bg"><div class="bar-fill hp-color"></div></div>
                    <div class="bar-container arm-bg" style="display:none;"><div class="bar-fill arm-color"></div></div>
                </div>
            </div>
        `);
        playerEl = document.getElementById(`player-${id}`);
    }

    // 1. Позиционирование (используем встроенную функцию CEF для 3D -> 2D)
    let screen = cef.get_screen_pos(x, y, z);
    
    if (!screen || !screen.visible) {
        playerEl.style.display = "none";
        return;
    }

    playerEl.style.left = `${screen.x}px`;
    playerEl.style.top = `${screen.y}px`;
    playerEl.style.display = "flex";

    // 2. Логика МАСКИ и НИКА
    let nickEl = playerEl.querySelector(".nickname");
    let maskEl = playerEl.querySelector(".mask-info");
    let adminView = playerEl.querySelector(".admin-view-nick");

    if (isMasked) {
        nickEl.style.display = "none";
        maskEl.style.display = "block";
        playerEl.querySelector(".passport-number").innerText = `#${passport}`;

        if (viewerIsAdmin) {
            adminView.innerText = name;
            adminView.style.display = "block";
        } else {
            adminView.style.display = "none";
        }
    } else {
        nickEl.style.display = "block";
        nickEl.innerText = name;
        maskEl.style.display = "none";
        adminView.style.display = "none";
    }

    // 3. Полоски HP и Брони
    playerEl.querySelector(".hp-color").style.width = `${hp}%`;
    if (arm > 2) {
        playerEl.querySelector(".arm-bg").style.display = "block";
        playerEl.querySelector(".arm-color").style.width = `${arm}%`;
    } else {
        playerEl.querySelector(".arm-bg").style.display = "none";
    }

    // 4. Иконки статусов
    playerEl.querySelector(".icon-admin").style.display = isAdmin ? "block" : "none";
    playerEl.querySelector(".icon-vip").style.display = (vipType === 1) ? "block" : "none";
    playerEl.querySelector(".icon-black-vip").style.display = (vipType === 2) ? "block" : "none";
    playerEl.querySelector(".icon-writing").style.display = isWriting ? "block" : "none";

    // 5. AFK Таймер
    let afkBlock = playerEl.querySelector(".afk-block");
    if (afkTime > 0) {
        afkBlock.style.display = "flex";
        let min = Math.floor(afkTime / 60);
        let sec = afkTime % 60;
        playerEl.querySelector(".afk-time").innerText = `${min}:${sec < 10 ? '0'+sec : sec}`;
    } else {
        afkBlock.style.display = "none";
    }
});

cef.on("removeNametag", (id) => {
    let el = document.getElementById(`player-${id}`);
    if (el) el.remove();
});

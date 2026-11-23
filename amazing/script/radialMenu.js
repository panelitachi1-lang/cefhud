(() => {
  const STYLE_ID = "radial-v2-style";
  const ROOT_ID = "radial-v2-root";
  const SVG_NS = "http://www.w3.org";

  const SIZE = 600;
  const CX = SIZE / 2;
  const CY = SIZE / 2;
  const OUTER_R = 240; 
  const INNER_R = 135; 
  const ICON_R = 185; 

  let visible = false;
  let currentMode = "main";
  let currentTargetId = -1;
  let currentTargetName = "";
  let activeIndex = -1;
  
  const SLOT_COUNT = 8;
  const ROTATION_DEG = -22.5; 

  const refs = { root: null, svgGroup: null, iconLayer: null, center: null };

  function ensureStyle() {
    if (document.getElementById(STYLE_ID)) return;
    const style = document.createElement("style");
    style.id = STYLE_ID;
    style.textContent = `
      #${ROOT_ID} {
        position: fixed; inset: 0; display: flex; align-items: center; justify-content: center;
        background: rgba(0, 0, 0, 0.35); z-index: 999999; font-family: 'Montserrat', sans-serif;
        display: none;
      }
      #${ROOT_ID}[data-visible="true"] { display: flex; }
      .radial-v2-wrap { position: relative; width: ${SIZE}px; height: ${SIZE}px; user-select: none; }

      .radial-v2-sector {
        fill: rgba(255, 255, 255, 0.08);
        stroke: rgba(255, 255, 255, 0.05);
        stroke-width: 1.2;
        transition: fill 0.15s ease;
      }
      .radial-v2-sector.active { fill: rgba(255, 255, 255, 0.15); }

      .radial-v2-icon {
        position: absolute; width: 54px; height: 54px;
        transform: translate(-50%, -50%);
        display: flex; align-items: center; justify-content: center;
        color: rgba(255, 255, 255, 0.85);
        transition: all 0.15s ease;
        pointer-events: none;
      }
      .radial-v2-icon i { font-size: 34px; }
      .radial-v2-icon.active { color: #ff6d1d; transform: translate(-50%, -50%) scale(1.2); text-shadow: 0 0 15px rgba(255, 109, 29, 0.4); }

      .radial-v2-center {
        position: absolute; top: 50%; left: 50%;
        width: ${INNER_R * 2 - 10}px; height: ${INNER_R * 2 - 10}px;
        transform: translate(-50%, -50%);
        background: #ff6d1d;
        border-radius: 50%;
        display: flex; flex-direction: column; align-items: center; justify-content: center;
        color: #fff; cursor: pointer;
        box-shadow: 0 0 40px rgba(255, 109, 29, 0.35);
      }
      .radial-v2-center i { font-size: 85px; line-height: 1; }
      .radial-v2-center span { font-weight: 600; font-size: 22px; margin-top: -5px; }
    `;
    document.head.appendChild(style);
  }

  function getActions() {
    return [
      { id: 0, icon: "groups", label: "Игроки" },
      { id: 1, icon: "podcasts", label: "Связь" },
      { id: 2, icon: "watch", label: "Аксессуары" },
      { id: 3, icon: "directions_run", label: "Анимации" },
      { id: 4, icon: "face", label: "Персонаж" },
      { id: 5, icon: "bolt", label: "Действия" },
      { id: 6, icon: "medication", label: "Инвентарь" },
      { id: 7, icon: "favorite", label: "Здоровье" }
    ];
  }

  function polar(radius, angleDeg) {
    const a = (Math.PI / 180) * angleDeg;
    return { x: CX + radius * Math.cos(a), y: CY + radius * Math.sin(a) };
  }

  function sectorPath(startDeg, endDeg) {
    const p1 = polar(OUTER_R, startDeg);
    const p2 = polar(OUTER_R, endDeg);
    const p3 = polar(INNER_R, endDeg);
    const p4 = polar(INNER_R, startDeg);
    return [`M ${p1.x} ${p1.y}`, `A ${OUTER_R} ${OUTER_R} 0 0 1 ${p2.x} ${p2.y}`, `L ${p3.x} ${p3.y}`, `A ${INNER_R} ${INNER_R} 0 0 0 ${p4.x} ${p4.y}`, `Z`].join(" ");
  }

  function render() {
    ensureStyle();
    if (!refs.root) {
      const root = document.createElement("div");
      root.id = ROOT_ID;
      root.innerHTML = `<div class="radial-v2-wrap"><svg width="${SIZE}" height="${SIZE}"><g class="svg-g"></g></svg><div class="icon-layer"></div><div class="radial-v2-center"><i class="material-icons">close</i><span>Закрыть</span></div></div>`;
      document.body.appendChild(root);
      refs.root = root;
      refs.svgGroup = root.querySelector(".svg-g");
      refs.iconLayer = root.querySelector(".icon-layer");
      refs.center = root.querySelector(".radial-v2-center");
      
      root.addEventListener("mousemove", (e) => {
          if (!visible) return;
          const rect = refs.root.getBoundingClientRect();
          const dx = (e.clientX - rect.left) - CX;
          const dy = (e.clientY - rect.top) - CY;
          const dist = Math.hypot(dx, dy);
          let newIdx = -1;
          if (dist > INNER_R && dist < OUTER_R + 40) {
            let deg = (Math.atan2(dy, dx) * 180) / Math.PI;
            deg = (deg + 360 + 90 - ROTATION_DEG) % 360;
            newIdx = Math.floor(deg / (360 / SLOT_COUNT));
          }
          if (newIdx !== activeIndex) {
            activeIndex = newIdx;
            refs.svgGroup.querySelectorAll(".radial-v2-sector").forEach(s => s.classList.toggle("active", Number(s.dataset.index) === activeIndex));
            refs.iconLayer.querySelectorAll(".radial-v2-icon").forEach(ic => ic.classList.toggle("active", Number(ic.dataset.index) === activeIndex));
          }
      });

      root.addEventListener("mousedown", (e) => {
        if (!visible || e.button !== 0) return;
        if (activeIndex >= 0) {
          const actions = getActions();
          try { cef.emit("radial:action", currentMode, actions[activeIndex].id, currentTargetId); } catch (_) {}
          hide();
        }
      });

      refs.center.addEventListener("click", hide);
    }

    refs.svgGroup.innerHTML = "";
    refs.iconLayer.innerHTML = "";
    const actions = getActions();
    const step = 360 / SLOT_COUNT;

    for (let i = 0; i < SLOT_COUNT; i++) {
      const start = ROTATION_DEG + i * step;
      const path = document.createElementNS(SVG_NS, "path");
      path.setAttribute("d", sectorPath(start - 90, start + step - 90));
      path.setAttribute("class", "radial-v2-sector");
      path.dataset.index = i;
      refs.svgGroup.appendChild(path);

      const action = actions[i];
      if (action) {
        const pos = polar(ICON_R, start + step / 2 - 90);
        const iconWrap = document.createElement("div");
        iconWrap.className = "radial-v2-icon";
        iconWrap.dataset.index = i;
        iconWrap.style.left = `${pos.x}px`;
        iconWrap.style.top = `${pos.y}px`;
        iconWrap.innerHTML = `<i class="material-icons">${action.icon}</i>`;
        refs.iconLayer.appendChild(iconWrap);
      }
    }
  }

  function show(mode, targetId, targetName) {
    currentMode = mode || "main";
    currentTargetId = targetId || -1;
    currentTargetName = targetName || "";
    render();
    refs.root.dataset.visible = "true";
    visible = true;
    try { cef.set_focus(true); } catch (_) {}
  }

  function hide() {
    if (refs.root) refs.root.dataset.visible = "false";
    visible = false;
    activeIndex = -1;
    try { cef.set_focus(false); } catch (_) {}
  }

  // Регистрация CEF событий
  if (typeof cef !== "undefined" && typeof cef.on === "function") {
    cef.on("radial:open", (mode, tid, tname) => show(mode, tid, tname));
    cef.on("radial:hide", hide);
  }

  // Обработка клавиши R (82) и ESC (27)
  document.addEventListener("keyup", (e) => {
    const code = e.keyCode || e.which;
    if (code === 27 && visible) { hide(); return; }
    if (code === 82) { // Кнопка R
      if (visible) {
        hide();
      } else {
        try { 
           cef.emit("radial:requestOpen"); 
        } catch (_) {
           // Если CEF нет (тест в браузере), открываем принудительно
           show("main");
        }
      }
    }
  });

  // Инициализируем структуру сразу
  render();

})();

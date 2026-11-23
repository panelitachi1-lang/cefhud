let activeIndex = 0;
let currentBalance = 0;
const cards = document.querySelectorAll('.card');

// Разделение пробелами
function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
}

cef.on("atm:show", (balance) => {
    currentBalance = balance;
    document.getElementById("bank-balance").innerText = formatNumber(balance) + " P";
    document.getElementById("atm-main").style.display = "flex";
    cef.set_focus(true);
});
cef.on("atm:updateFines", (count, sum, saleCount, saleSum) => {
    // Вставляем данные в модалку "Оплата всех штрафов"
    document.getElementById("fines-count").innerText = count;
    document.getElementById("fines-sum").innerText = formatNumber(sum) + " P";
    
    document.getElementById("fines-sale-count").innerText = saleCount;
    document.getElementById("fines-sale-sum").innerText = formatNumber(saleSum) + " P";
    
    // Если штрафов 0, можно заблокировать кнопку "Оплатить"
    const payBtn = document.getElementById("modal-main-btn");
    if (count === 0 && window.currentType === 6) {
        payBtn.style.opacity = "0.5";
        payBtn.style.pointerEvents = "none";
    } else {
        payBtn.style.opacity = "1";
        payBtn.style.pointerEvents = "auto";
    }
});
cef.on("atm:setFines", (count, sum, saleCount, saleSum) => {
    // Находим элементы по ID и меняем их текст
    document.getElementById("fines-count").innerText = count;
    document.getElementById("fines-sum").innerText = formatNumber(sum) + " P";
    
    document.getElementById("fines-sale-count").innerText = saleCount;
    document.getElementById("fines-sale-sum").innerText = formatNumber(saleSum) + " P";

    // Теперь, когда цифры обновились, открываем само окно (модалку)
    openInput(6); 
});
// Управление мышью (навел — подсветилось)
cards.forEach((card, index) => {
    card.addEventListener('mouseenter', () => {
        cards[activeIndex].classList.remove('active');
        activeIndex = index;
        card.classList.add('active');
    });
});

function sendAction(type, amount) {
    cef.emit("game:CallbackATMAction", `${type} ${amount}`);
}

function openInput(type) {
    window.currentType = type;
    
    const moneyInfo = document.getElementById("modal-info-money");
    const fineInfo = document.getElementById("modal-info-fine");
    const allFinesInfo = document.getElementById("modal-info-all-fines");
    const quickBtns = document.getElementById("modal-quick-btns");
    const inputField = document.getElementById("sum-field");
    const mainBtn = document.getElementById("modal-main-btn");
    const title = document.getElementById("modal-title");

    // Скрываем абсолютно всё перед отрисовкой нужного типа
    [moneyInfo, fineInfo, allFinesInfo, quickBtns, inputField].forEach(el => el.style.display = "none");

    if (type === 6) { 
        // ОКНО: ОПЛАТА ВСЕХ ШТРАФОВ
        title.innerText = "Оплата всех штрафов";
        allFinesInfo.style.display = "block";
        mainBtn.innerText = "Оплатить";
        
        // Пример данных (в будущем будешь получать их из CEF события)
    } 
    else if (type === 5) { 
        // ОКНО: ОДИН ШТРАФ
        title.innerText = "Оплатить штраф";
        fineInfo.style.display = "block";
        inputField.style.display = "block";
        mainBtn.innerText = "Оплатить";
    } 
    else { 
        // ОКНО: ДЕНЬГИ (Снять/Положить)
        title.innerText = (type === 1) ? "Снять со счета" : "Положить на счет";
        moneyInfo.style.display = "block";
        quickBtns.style.display = "grid";
        inputField.style.display = "block";
        mainBtn.innerText = (type === 1) ? "Снять" : "Пополнить";
        document.getElementById("modal-balance-val").innerText = formatNumber(currentBalance) + " P";
    }

    document.getElementById("modal-bg").style.display = "flex";
    // Ставим фокус в инпут только если он виден
    if (type !== 6) setTimeout(() => inputField.focus(), 10);
}

function setSum(amount) {
    document.getElementById("sum-field").value = amount;
}
function confirmSum() {
    let val = document.getElementById("sum-field").value;
    
    // Проверка на пустые значения или текст
    if (!val || isNaN(val) || parseInt(val) <= 0) {
        // Можно добавить визуальную тряску окна, если сумма 0
        return; 
    }

    if (window.currentType === 6) {
        // Если это окно всех штрафов - подтверждаем оплату всех (тип 7)
        sendAction(7, 0); 
    } else {
        // Для Снять/Положить/Телефон - шлем тип и сумму
        sendAction(window.currentType, parseInt(val));
    }
    
    closeInput(); // Закрываем модалку после нажатия
}

function closeInput() {
    document.getElementById("modal-bg").style.display = "none";
    document.getElementById("sum-field").value = "";
    // Возвращаем фокус на всё окно, чтобы Q/E снова работали
    cef.set_focus(true); 
}

function closeATM() {
    document.getElementById("modal-bg").style.display = "none"; // Прячем модалку на всякий случай
    document.getElementById("atm-main").style.display = "none"; // Прячем весь банкомат
    cef.set_focus(false);
    cef.emit("game:CallbackATMAction", "100 0");
}

document.addEventListener('keydown', (e) => {
    // Проверяем, открыто ли сейчас модальное окно
    const isModalOpen = document.getElementById("modal-bg").style.display === "flex";

    if (e.keyCode === 27) { // Клавиша ESC
        if (isModalOpen) {
            // Если модалка открыта — закрываем ТОЛЬКО её и возвращаемся к меню
            closeInput();
        } else {
            // Если модалка закрыта — закрываем весь банкомат
            closeATM();
        }
        return; // Прерываем выполнение, чтобы не сработали другие условия
    }

    if (!isModalOpen) {
        // Управление основным меню (Q, E, Enter)
        if (e.keyCode === 81 || e.keyCode === 69) { // Q (81) / E (69)
            cards[activeIndex].classList.remove('active');
            if (e.keyCode === 81) activeIndex = (activeIndex > 0) ? activeIndex - 1 : cards.length - 1;
            else activeIndex = (activeIndex < cards.length - 1) ? activeIndex + 1 : 0;
            cards[activeIndex].classList.add('active');
        }
        if (e.keyCode === 13) cards[activeIndex].click(); // Enter открывает модалку
    } else {
        // Управление внутри модалки
        if (e.keyCode === 13) confirmSum(); // Enter подтверждает сумму
    }
});

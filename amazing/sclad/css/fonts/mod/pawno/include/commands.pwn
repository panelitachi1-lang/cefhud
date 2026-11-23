/*
    commands.pwn
    Административные команды для панели
    Версия: 1.0
*/

#include <a_samp>

// Временные определения (замените на реальные из вашего кода)
#define ADM_MODER 1
#define ADM_ADMIN 2
#define ADM_SUPER_ADMIN 3
#define ADM_GRAND_ADMIN 4
#define ADM_TOP 5

#define D_APANEL 3856 // Замените на правильный ID

// Цвета
#define COLOR_RED 0xFF0000FF
#define COLOR_BLUE 0x0000FFFF
#define COLOR_GREEN 0x33AA33FF
#define COLOR_YELLOW 0xFFFF00FF
#define COLOR_WHITE 0xFFFFFFFF

// Внешние переменные (должны быть определены в основном файле)
forward OnGameModeInit();
forward OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);

// === ОСНОВНЫЕ КОМАНДЫ АДМИН-ПАНЕЛИ ===

CMD:apanel(playerid, params[])
{
    #pragma unused params

    // Проверка доступа (замените PI на вашу переменную)
    // if(PlayerInfo[playerid][pAdmin] < ADM_MODER)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    // Показываем админ-панель
    new string[2048];
    format(string, sizeof(string),
        "{FFFFFF}Управление VIP игроками\n\
        {FFFFFF}(Пусто)\n\
        {FFFFFF}Управление лидерами\n\
        {FFFFFF}Все лидеры (БД)\n\
        {FFFFFF}Список команд\n\
        {FFFFFF}Настройки администратора\n\
        {FFFFFF}Управление сервером\n\
        {FFFFFF}Все администраторы\n\
        {FFFFFF}Слушать игроков\n\
        {FFFFFF}Логи администраторов\n\
        {FFFFFF}Отдых администратора\n\
        {FFFFFF}Мастерская (MP)\n\
        {FFFFFF}Мастерская (MP)\n\
        {FFFFFF}Управление мероприятием\n\
        {FFFFFF}Статистика работ\n\
        {FFFFFF}Установить погоду\n\
        {FFFFFF}Временная лидерка\n\
        {FFFFFF}Временная работа\n\
        {FFFFFF}Прослушка работы\n\
        {FFFFFF}Прослушка организаций\n\
        {FFFFFF}Статистика недвижимости\n\
        {FFFFFF}Управление лидерами");

    ShowPlayerDialog(playerid, D_APANEL, DIALOG_STYLE_LIST,
        "{FFCC00}Административная панель", string, "Выбрать", "Отмена");
    return 1;
}

// === КОМАНДЫ ДЛЯ НОВЫХ ФУНКЦИЙ (кейсы 13-21) ===

CMD:aendevent(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_SUPER_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    ShowPlayerDialog(playerid, 6100, DIALOG_STYLE_LIST,
        "Управление мероприятием",
        "Завершить текущее мероприятие\n\
        Начать DM мероприятие\n\
        Начать гонку\n\
        Начать событие\n\
        Настройки мероприятия",
        "Выбрать", "Отмена");
    return 1;
}

CMD:ajobstats(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    new string[1024];
    format(string, sizeof(string), "Выберите опцию:\n\n");
    strcat(string, "Показать всех на работах\n");
    strcat(string, "Показать по конкретной работе\n");
    strcat(string, "Статистика всех работ\n");
    strcat(string, "Топ работ по игрокам");

    ShowPlayerDialog(playerid, 6101, DIALOG_STYLE_LIST,
        "Статистика работ", string, "Выбрать", "Отмена");
    return 1;
}

CMD:asetweather(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_SUPER_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    ShowPlayerDialog(playerid, 6102, DIALOG_STYLE_LIST,
        "Установка погоды",
        "Экстра солнечно (ID: 0)\n\
        Солнечно (ID: 1)\n\
        Облачно (ID: 2)\n\
        Пасмурно (ID: 3)\n\
        Дождливо (ID: 4)\n\
        Ливень (ID: 5)\n\
        Гроза (ID: 6)\n\
        Туманно (ID: 7)\n\
        Ясно (ID: 8)\n\
        Жарко (ID: 9)\n\
        Холодно (ID: 10)\n\
        Ветрено (ID: 11)\n\
        Снег (ID: 16)\n\
        Снегопад (ID: 17)\n\
        Ввести ID вручную",
        "Выбрать", "Отмена");
    return 1;
}

CMD:atempleader(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_SUPER_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    new string[512];
    format(string, sizeof(string), "Выберите организацию:\n\n");

    strcat(string, "LSPD - Полиция Лос-Сантоса\n");
    strcat(string, "FBI - Федеральное бюро\n");
    strcat(string, "Army - Армия США\n");
    strcat(string, "EMS - Скорая помощь\n");
    strcat(string, "GOV - Правительство\n");
    strcat(string, "Мафия - Итальянская семья\n");
    strcat(string, "Якудза - Японская группировка\n");
    strcat(string, "Grove Street - Уличная банда\n");
    strcat(string, "Ballas - Уличная банда\n");
    strcat(string, "Vagos - Уличная банда\n");
    strcat(string, "Снять временную лидерку");

    ShowPlayerDialog(playerid, 6103, DIALOG_STYLE_LIST,
        "Временная лидерка", string, "Выбрать", "Отмена");
    return 1;
}

CMD:atempjob(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    new string[512];
    format(string, sizeof(string), "Выберите временную работу (2 часа):\n\n");

    strcat(string, "Развозчик пиццы - $500/рейс\n");
    strcat(string, "Водитель автобуса - $750/рейс\n");
    strcat(string, "Водитель грузовика - $1000/рейс\n");
    strcat(string, "Таксист - $600/клиент\n");
    strcat(string, "Дальнобойщик - $1500/рейс\n");
    strcat(string, "Механик - $800/ремонт\n");
    strcat(string, "Рыбак - $700/улов\n");
    strcat(string, "Строитель - $900/задание\n");
    strcat(string, "Охранник - $850/смена\n");
    strcat(string, "Пожарный - $950/задание\n");
    strcat(string, "Снять временную работу");

    ShowPlayerDialog(playerid, 6104, DIALOG_STYLE_LIST,
        "Временная работа", string, "Выбрать", "Отмена");
    return 1;
}

CMD:alistenjob(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_SUPER_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    // Получаем статус прослушки
    new status = GetPVarInt(playerid, "ListenJobChat");

    new info[256];
    format(info, sizeof(info),
        "Текущий статус: %s\n\nВы хотите включить или выключить прослушку чата работ?\n\nВнимание: Вы будете видеть все сообщения из чата работ (/jobchat)",
        (status == 1) ? ("{33AA33}ВКЛЮЧЕНА") : ("{FF0000}ВЫКЛЮЧЕНА"));

    ShowPlayerDialog(playerid, 6105, DIALOG_STYLE_MSGBOX,
        "Прослушка чата работ", info, "Включить", "Выключить");
    return 1;
}

CMD:alistenorg(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_SUPER_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    new status = GetPVarInt(playerid, "ListenOrgChat");

    new info[256];
    format(info, sizeof(info),
        "Текущий статус: %s\n\nВы хотите включить или выключить прослушку чата организаций?\n\nВнимание: Вы будете видеть все сообщения из чата организаций (/f)",
        (status == 1) ? ("{33AA33}ВКЛЮЧЕНА") : ("{FF0000}ВЫКЛЮЧЕНА"));

    ShowPlayerDialog(playerid, 6106, DIALOG_STYLE_MSGBOX,
        "Прослушка чата организаций", info, "Включить", "Выключить");
    return 1;
}

CMD:apropertystats(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    ShowPlayerDialog(playerid, 6107, DIALOG_STYLE_LIST,
        "Статистика недвижимости",
        "Общая статистика домов\n\
        Список купленных домов\n\
        Список свободных домов\n\
        Самые дорогие дома (топ-10)\n\
        Статистика бизнесов\n\
        Статистика гаражей\n\
        Поиск дома по владельцу",
        "Выбрать", "Отмена");
    return 1;
}

CMD:aleaderslist(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_MODER)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    new string[2048];
    format(string, sizeof(string), "Выберите опцию:\n\n");
    strcat(string, "Показать лидеров онлайн\n");
    strcat(string, "Показать всех лидеров (из БД)\n");
    strcat(string, "Лидеры по организациям\n");
    strcat(string, "Статистика лидерства\n");
    strcat(string, "Проверить активность лидеров");

    ShowPlayerDialog(playerid, 6108, DIALOG_STYLE_LIST,
        "Управление лидерами", string, "Выбрать", "Отмена");
    return 1;
}

// === ДОПОЛНИТЕЛЬНЫЕ АДМИН КОМАНДЫ ===

CMD:leaders(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_MODER)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    SendClientMessage(playerid, COLOR_BLUE, "Используйте /aleaderslist для управления лидерами");
    return 1;
}

CMD:ahelp(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_MODER)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    SendClientMessage(playerid, COLOR_GREEN, "Админ-команды открываются через /apanel");
    return 1;
}

CMD:ears(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_MODER)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    SendClientMessage(playerid, COLOR_BLUE, "Слушать игроков - функция в разработке");
    return 1;
}

CMD:alogs(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_MODER)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    SendClientMessage(playerid, COLOR_BLUE, "Логи администраторов - функция в разработке");
    return 1;
}

CMD:resadm(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_MODER)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    SendClientMessage(playerid, COLOR_BLUE, "Отдых администратора - функция в разработке");
    return 1;
}

CMD:mp(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_MODER)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    SendClientMessage(playerid, COLOR_BLUE, "Мастерская (MP) - функция в разработке");
    return 1;
}

CMD:saveacc(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_SUPER_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    SendClientMessage(playerid, COLOR_GREEN, "Сохранение всех аккаунтов...");
    // Здесь код сохранения аккаунтов
    return 1;
}

CMD:gmx(playerid, params[])
{
    #pragma unused params

    // if(PlayerInfo[playerid][pAdmin] < ADM_SUPER_ADMIN)
    //     return SendClientMessage(playerid, COLOR_RED, "У вас нет доступа!");

    SendClientMessage(playerid, COLOR_GREEN, "Рестарт сервера...");
    SendRconCommand("gmx");
    return 1;
}

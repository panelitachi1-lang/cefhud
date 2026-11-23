// ============================================================================
// callbacks.pwn - Система авторизации и регистрации
// ============================================================================

#include <a_mysql>

// Подключаем определения из этой же папки
#include "definitions.pwn"        // для констант и перечислений

// Если нужны глобальные определения из других папок:
#include "C:\Users\Кикерс\Desktop\SPACE MOD\gamemodes\amazingcopy.pwn"
// или
#include "../../gamemodes/amazingcopy.pwn"  // если всё в основном файле

// ============================================================================
// Проверка аккаунта при входе
// ============================================================================
#if !defined callback::
    #define callback::%0(%1) forward %0(%1); public %0(%1)
#endif

callback::CheckAccount(playerid)
{
    if(!cache_num_rows())
    {
        cefdialog(playerid,
            D_REGISTER,
            DIALOG_STYLE_PASSWORD,
            "Регистрация",
            "Добро пожаловать на сервер {FF9945}Space Russia\n\
            {FFFFFF}Чтобы начать игру Вам необходимо пройти регистрацию\n\n\
            Введите пароль для Вашего аккаунта\n\
            Он будет запрашиваться каждый раз, когда Вы входите на сервер\n\n\
            {FF9945}Примечания:\n{FFFFFF}\
            • Пароль может состоять из латинских символов\n\
            • Пароль чувствителен к регистру\n\
            • Длина пароля от 6-ти до 15-ти символов",
            "Далее",
            "Отмена"
        );
    }
    else
    {
        PI[playerid][pLoginAttempts] = 3;
        cefdialog(playerid,
            D_LOGIN,
            DIALOG_STYLE_PASSWORD,
            "Авторизация",
            "Вы зарегистрированы на нашем сервере.\nВведите ваш пароль ниже.",
            "Принять",
            "Отмена"
        );
    }
}

// ============================================================================
// Проверка пароля при входе
// ============================================================================
callback::CheckAccountLogin(playerid)
{
    GetPlayerIp(playerid, PI[playerid][pIP], 16);

    if(!cache_num_rows())
    {
        // Неверный пароль
        PI[playerid][pLoginAttempts]--;
        if(PI[playerid][pLoginAttempts] <= 0)
        {
            SendClientMessage(playerid, COLOR_RED, "Вы исчерпали все попытки ввода пароля. Вы будете отключены от сервера.");
            Kick(playerid);
            return 1;
        }
        return cefdialog(playerid,
            D_LOGIN,  // = 2
            DIALOG_STYLE_PASSWORD,
            "Пароль неверный",
            "Вы зарегистрированы на нашем сервере.\nВведите Ваш пароль ниже.",
            "Принять",
            "Отмена"
        );
    }

    // Загружаем данные из БД
    // Основные данные
    cache_get_value_name_int(0, "id", PI[playerid][pID]);
    cache_get_value_name_int(0, "admin", PI[playerid][pAdmin]);
    cache_get_value_name_int(0, "level", PI[playerid][pLevel]);
    cache_get_value_name_int(0, "exp", PI[playerid][pExp]);
    cache_get_value_name_int(0, "cash", PI[playerid][pCash]);
    cache_get_value_name_int(0, "bank", PI[playerid][pBank]);
    cache_get_value_name_int(0, "warn", PI[playerid][pWarn]);
    cache_get_value_name_int(0, "jail", PI[playerid][pJail]);
    cache_get_value_name_int(0, "jailtime", PI[playerid][pJailTime]);
    cache_get_value_name_int(0, "wanted", PI[playerid][pWanted]);
    cache_get_value_name_int(0, "wantedtime", PI[playerid][pWantedTime]);

    // Пол, возраст, модель
    cache_get_value_name_int(0, "sex", PI[playerid][pSex]);
    cache_get_value_name_int(0, "age", PI[playerid][pAge]);
    cache_get_value_name_int(0, "model", PI[playerid][pModel]);
    cache_get_value_name_int(0, "memberskin", PI[playerid][pMemberSkin]);

    // Фракция, лидерство, ранг
    cache_get_value_name_int(0, "leader", PI[playerid][pLeader]);
    cache_get_value_name_int(0, "templeader", PI[playerid][pTempLeader]);
    cache_get_value_name_int(0, "member", PI[playerid][pMember]);
    cache_get_value_name_int(0, "rank", PI[playerid][pRank]);

    // Почта и реферал
    cache_get_value_name(0, "mail", PI[playerid][pMail], 64);
    cache_get_value_name(0, "referal", PI[playerid][pReferal], 24);

    // Лицензии
    cache_get_value_name_int(0, "pcara", PI[playerid][pCarA]);
    cache_get_value_name_int(0, "pcarb", PI[playerid][pCarB]);
    cache_get_value_name_int(0, "pcarc", PI[playerid][pCarC]);
    cache_get_value_name_int(0, "pcard", PI[playerid][pCarD]);

    // Навыки оружия
    cache_get_value_name_int(0, "sdpistol", PI[playerid][SKILL_SD_PISTOL]);
    cache_get_value_name_int(0, "deserteagle", PI[playerid][SKILL_DEAGLE]);
    cache_get_value_name_int(0, "shotgun", PI[playerid][SKILL_SHOTGUN]);
    cache_get_value_name_int(0, "mp5", PI[playerid][SKILL_MP5]);
    cache_get_value_name_int(0, "ak47", PI[playerid][SKILL_AK47]);
    cache_get_value_name_int(0, "m4", PI[playerid][SKILL_M4]);
    cache_get_value_name_int(0, "pistol", PI[playerid][pPistolSkill]);
    cache_get_value_name_int(0, "microuzi", PI[playerid][pUziSkill]);

    // Доп. данные
    cache_get_value_name_int(0, "credits", PI[playerid][pCredits]);
    cache_get_value_name_int(0, "vip", PI[playerid][pVip]);
    cache_get_value_name_int(0, "viptime", PI[playerid][pVipTime]);
    cache_get_value_name_int(0, "hunger", PI[playerid][pHunger]);
    cache_get_value_name(0, "heal", PI[playerid][pHealStr], 11);
    PI[playerid][pHeal] = floatstr(PI[playerid][pHealStr]);

    cache_get_value_name_int(0, "drugs", PI[playerid][pDrugs]);
    cache_get_value_name_int(0, "patron", PI[playerid][pPatron]);
    cache_get_value_name_int(0, "job", PI[playerid][pJob]);
    cache_get_value_name_int(0, "family", PI[playerid][pFamily]);
    cache_get_value_name_int(0, "familysozd", PI[playerid][pFamilySozd]);
    cache_get_value_name_int(0, "familyzam", PI[playerid][pFamilyZam]);

    // Позиция
    cache_get_value_name_int(0, "pInt", PI[playerid][pInt]);
    cache_get_value_name_int(0, "pWorld", PI[playerid][pWorld]);
    cache_get_value_name_float(0, "PosX", PI[playerid][pPos][0]);
    cache_get_value_name_float(0, "PosY", PI[playerid][pPos][1]);
    cache_get_value_name_float(0, "PosZ", PI[playerid][pPos][2]);

    // Устанавливаем флаги
    PlayerLogged[playerid] = true;
    PI[playerid][pLoginAttempts] = 0;

    // Получаем текущую дату для входа
    new datavhod[15];
    format(datavhod, sizeof(datavhod), "%s", date("%dd.%mm.%yyyy", gettime()));
    strmid(PI[playerid][pVhData], datavhod, 0, 15);

    // Обновляем счёт игрока
    SetPlayerScore(playerid, PI[playerid][pLevel]);

    // Спавним игрока
    SpawnPlayer(playerid);

    // Устанавливаем навыки оружия
    SetPlayerSkillLevel(playerid, WEAPON_COLT45, PI[playerid][pPistolSkill]);
    SetPlayerSkillLevel(playerid, WEAPON_SILENCED, PI[playerid][SKILL_SD_PISTOL]);
    SetPlayerSkillLevel(playerid, WEAPON_DEAGLE, PI[playerid][SKILL_DEAGLE]);
    SetPlayerSkillLevel(playerid, WEAPON_SHOTGUN, PI[playerid][SKILL_SHOTGUN]);
    SetPlayerSkillLevel(playerid, WEAPON_MP5, PI[playerid][SKILL_MP5]);
    SetPlayerSkillLevel(playerid, WEAPON_AK47, PI[playerid][SKILL_AK47]);
    SetPlayerSkillLevel(playerid, WEAPON_M4, PI[playerid][SKILL_M4]);
    SetPlayerSkillLevel(playerid, WEAPON_UZI, PI[playerid][pUziSkill]);

    return 1;
}

// ============================================================================
// Загрузка админ-данных
// ============================================================================
callback::LoadPlayerAdmin(playerid)
{
    if(!cache_num_rows()) return 0;

    new level;
    cache_get_value_name_int(0, "level", level);

    // Если уровень админа больше, чем в аккаунте - обновляем
    if(level > PI[playerid][pAdmin])
    {
        PI[playerid][pAdmin] = level;
    }

    return 1;
}

// ============================================================================
// Проверка админ-пароля
// ============================================================================
callback::CheckAlogin(playerid)
{
    if(!cache_num_rows())
    {
        SendErr(playerid, "У вас нет админ прав.");
        return 0;
    }

    cefdialog(playerid,
        D_ADMINREG,  // = 57
        DIALOG_STYLE_PASSWORD,
        "Панель администратора",
        "Введите админ пароль",
        "Далее",
        "Отмена"
    );
    return 1;
}

// ============================================================================
// Проверка админ-пароля (вход)
// ============================================================================
callback::CheckAloginD(playerid)
{
    if(!cache_num_rows())
    {
        SendErr(playerid, "Пароль неверный.");
        return 0;
    }

    AdminLogged[playerid] = true;

    new level[32];
    format(level, sizeof(level), "[Админ-функции] Уровень доступа: %d", PI[playerid][pAdmin]);
    SendClientMessage(playerid, -1, level);

    return 1;
}

// ============================================================================
// Проверка существования почты
// ============================================================================
callback::CheckEmailExists(playerid)
{
    if(cache_num_rows())
    {
        return cefdialog(playerid,
            D_MAIL,  // = 9233 (используем твой существующий диалог для почты)
            DIALOG_STYLE_INPUT,
            "Адрес почтового ящика занят",
            "Введите другой адрес электронной почты.",
            "Принять",
            ""
        );
    }

    cache_get_value_name(0, "mail", PI[playerid][pMail], 64);
    cefdialog(playerid,
        D_SEX,  // = 4
        DIALOG_STYLE_MSGBOX,
        "Выбор пола",
        "Выберите свой пол",
        "Мужской",
        "Женский"
    );
    return 1;
}

// ============================================================================
// Регистрация с промокодом
// ============================================================================
callback::OnPlayerRegister(playerid, response)
{
    if(response == 1)
    {
        if(cache_num_rows() <= 0)
        {
            return cefdialog(playerid,
                D_PROMOCODE,  // нужно добавить в твой enum, пока используем D_NULL
                DIALOG_STYLE_INPUT,
                "Промокод",
                "Если Вас на сервер пригласил {FF9945}друг{FFFFFF} или {1e90ff}ютубер{FFFFFF}, или у Вас имеется промокод, \nто Вы можете ввести его в поле ниже, {FF9945}получив за него награду\n\nВы также можете сделать это после регистрации при помощи команды {99cc00} /menu (7-й пункт) {FFFFFF}до 5-го уровня включительно",
                "Ввести",
                "Пропустить"
            );
        }

        new query[] = "UPDATE `promocodes` SET `promocode_uses` = `promocode_uses` + 1 WHERE `id` = %d;";
        new promo_query[sizeof query + 10];
        new promo_id;

        cache_get_value_name_int(0, "id", promo_id);
        mysql_format(dbHandle, promo_query, sizeof promo_query, query, promo_id);
        mysql_tquery(dbHandle, promo_query, "", "");

        SendClientMessage(playerid, COLOR_GREEN, "Вы успешно указали пригласившего!");

        new msg1[128], msg2[128];
        format(msg1, sizeof(msg1), "По достижении 5-го уровня Вы и Ваш друг получите по %s!", "10000");
        format(msg2, sizeof(msg2), "А по достижении 10-го уровня Вы и Ваш друг получите по %s!", "25000");
        SendClientMessage(playerid, COLOR_YELLOW, msg1);
        SendClientMessage(playerid, COLOR_YELLOW, msg2);
    }

    // Убираем спектейт и ставим на спавн
    TogglePlayerSpectating(playerid, 0);

    // Спавн в стартовой локации
    SetPlayerPos(playerid, 1934.3679, 2139.9944, 16.0301);
    SetPlayerFacingAngle(playerid, 88.5724);
    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);
    SetCameraBehindPlayer(playerid);

    // Выбор скина
    ChooseRegisterSkin(playerid);
    return 1;
}

// ============================================================================
// Регистрация нового игрока
// ============================================================================
stock RegisterPlayer(playerid)
{
    // Получаем IP
    GetPlayerIp(playerid, PI[playerid][pRegIP], 16);
    GetPlayerIp(playerid, PI[playerid][pIP], 16);

    // Стартовые бонусы
    PI[playerid][pCash] = 5000; // BONUS_CASH
    PI[playerid][pBank] = 0;
    PI[playerid][pLevel] = 1; // BONUS_LVL
    PI[playerid][pExp] = 0;

    // Стартовые права (все категории)
    PI[playerid][pCarA] = 1;
    PI[playerid][pCarB] = 1;
    PI[playerid][pCarC] = 1;
    PI[playerid][pCarD] = 1;

    // Стартовые навыки оружия (макс)
    PI[playerid][SKILL_SD_PISTOL] = 999;
    PI[playerid][SKILL_DEAGLE] = 999;
    PI[playerid][SKILL_SHOTGUN] = 999;
    PI[playerid][SKILL_MP5] = 999;
    PI[playerid][SKILL_AK47] = 999;
    PI[playerid][SKILL_M4] = 999;
    PI[playerid][pPistolSkill] = 999;
    PI[playerid][pUziSkill] = 999;

    // Дата регистрации
    format(PI[playerid][pRegData], 15, "%s", date("%dd.%mm.%yyyy", gettime()));

    // SQL запрос на вставку
    new query_registration[] = "INSERT INTO `accounts` \
        (`name`, `password`, `regip`, `ip`, `datareg`, `sex`, `age`, `model`, `mail`, `referal`, \
        `cash`, `level`, `pcara`, `pcarb`, `pcarc`, `pcard`, \
        `sdpistol`, `deserteagle`, `shotgun`, `mp5`, `ak47`, `m4`, `pistol`, `microuzi`) \
        VALUES ('%e', '%e', '%e', '%e', '%s', %d, %d, %d, '%e', '%e', \
        %d, %d, %d, %d, %d, %d, \
        %d, %d, %d, %d, %d, %d, %d, %d)";

    new fmt_query[1024];
    mysql_format(dbHandle, fmt_query, sizeof(fmt_query), query_registration,
        PI[playerid][pName], PI[playerid][pPassword],
        PI[playerid][pRegIP], PI[playerid][pIP], PI[playerid][pRegData],
        PI[playerid][pSex], PI[playerid][pAge], PI[playerid][pModel],
        PI[playerid][pMail], PI[playerid][pReferal],
        PI[playerid][pCash], PI[playerid][pLevel],
        PI[playerid][pCarA], PI[playerid][pCarB], PI[playerid][pCarC], PI[playerid][pCarD],
        PI[playerid][SKILL_SD_PISTOL], PI[playerid][SKILL_DEAGLE],
        PI[playerid][SKILL_SHOTGUN], PI[playerid][SKILL_MP5],
        PI[playerid][SKILL_AK47], PI[playerid][SKILL_M4],
        PI[playerid][pPistolSkill], PI[playerid][pUziSkill]
    );

    mysql_tquery(dbHandle, fmt_query, "OnPlayerRegisterInsert", "i", playerid);

    return 1;
}

// ============================================================================
// Колбэк после вставки нового аккаунта
// ============================================================================
callback::OnPlayerRegisterInsert(playerid)
{
    PI[playerid][pID] = cache_insert_id();
    PlayerLogged[playerid] = true;
    PlayerRegistered[playerid] = 0;

    // Приветственные сообщения
    SendClientMessage(playerid, COLOR_GREEN, "Добро пожаловать на Space Russia");
    SendClientMessage(playerid, COLOR_WHITE, "Если у Вас есть вопросы, то Вы можете воспользоваться командами /help и /ask");
    SendClientMessage(playerid, COLOR_WHITE, "Для поиска необходимого места воспользуйтесь командой /gps");

    // Устанавливаем счёт
    SetPlayerScore(playerid, PI[playerid][pLevel]);

    // Приветственный диалог (используем D_RULES_1 или другой свободный)
    cefdialog(playerid,
        D_RULES_1,  // = 987
        DIALOG_STYLE_MSGBOX,
        "Приветствуем!",
        "Приветствуем Вас в игре {ff9945}Space Russia!\n\
        {FFFFFF}Для обустройства Вам необходимо найти работу и заработать первые деньги для покупки {ff9945}квартиры и транспорта\n\
        {FFFFFF}Используйте {ff9945}/gps {FFFFFF}для навигации",
        "Начать игру",
        ""
    );

    // Спавн
    SpawnPlayer(playerid);

    return 1;
}

// ============================================================================
// Выбор скина при регистрации
// ============================================================================
stock ChooseRegisterSkin(playerid)
{
    new skinlist[512];

    if(PI[playerid][pSex] == 1) // Мужской
    {
        strcat(skinlist, "14\tКостюм\n");
        strcat(skinlist, "20\tРабочий\n");
        strcat(skinlist, "21\tСпортивный\n");
        strcat(skinlist, "22\tБайкер\n");
        strcat(skinlist, "23\tБомж\n");
        strcat(skinlist, "24\tГот\n");
        strcat(skinlist, "25\tХиппи\n");
        strcat(skinlist, "26\tМафиози\n");
        strcat(skinlist, "27\tКовбой\n");
        strcat(skinlist, "28\tКоп\n");
    }
    else // Женский
    {
        strcat(skinlist, "12\tДеловой\n");
        strcat(skinlist, "13\tПовседневный\n");
        strcat(skinlist, "41\tСпортивный\n");
        strcat(skinlist, "55\tРокерша\n");
        strcat(skinlist, "56\tКовбойша\n");
        strcat(skinlist, "57\tКоп\n");
        strcat(skinlist, "58\tМедик\n");
        strcat(skinlist, "68\tСтриптизерша\n");
        strcat(skinlist, "69\tОфициантка\n");
        strcat(skinlist, "76\tТаксистка\n");
    }

    ShowPlayerDialog(playerid,
        D_SKIN_SELECT,  // нужно добавить в enum, пока используем D_SKILLS = 9
        DIALOG_STYLE_LIST,
        "Выбор скина", skinlist, "Выбрать", "");

    return 1;
}

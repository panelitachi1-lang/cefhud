#if defined _aggmain_client_included
    #endinput
#endif
#define _aggmain_client_included

#define AGG_PACKET_CUSTOM (225)

#define AGG_EVENT_NEON_CREATE   (0)
#define AGG_EVENT_NEON_REMOVE   (1)
#define AGG_EVENT_EMBLEM_CREATE (4)
#define AGG_EVENT_EMBLEM_REMOVE (5)
#define AGG_EVENT_CLIENT_CHECK  (8)
#define AGG_EVENT_MASK_CREATE   (9)
#define AGG_EVENT_MASK_REMOVE   (10)
#define AGG_EVENT_SMOKE_CREATE  (11)
#define AGG_EVENT_SMOKE_REMOVE  (12)
#define AGG_EVENT_STAGE_CREATE  (13)
#define AGG_EVENT_STAGE_REMOVE  (14)
#define AGG_EVENT_ALPHA_PED     (15)

stock AGG_SendNeonCreate(playerid, vehicleid, r, g, b, a)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_NEON_CREATE);
    BS_WriteUint16(bs, vehicleid);
    BS_WriteUint8(bs, r);
    BS_WriteUint8(bs, g);
    BS_WriteUint8(bs, b);
    BS_WriteUint8(bs, a);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendNeonRemove(playerid, vehicleid)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_NEON_REMOVE);
    BS_WriteUint16(bs, vehicleid);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendEmblemCreate(playerid, targetid, const texture[])
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_EMBLEM_CREATE);
    BS_WriteUint16(bs, targetid);
    BS_WriteString8(bs, texture);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendEmblemRemove(playerid, targetid)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_EMBLEM_REMOVE);
    BS_WriteUint16(bs, targetid);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendMaskCreate(playerid, targetid, const text[])
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_MASK_CREATE);
    BS_WriteUint16(bs, targetid);
    BS_WriteString8(bs, text);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendMaskRemove(playerid, targetid)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_MASK_REMOVE);
    BS_WriteUint16(bs, targetid);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendSmokeCreate(playerid, vehicleid, r, g, b, a)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_SMOKE_CREATE);
    BS_WriteUint16(bs, vehicleid);
    BS_WriteUint8(bs, r);
    BS_WriteUint8(bs, g);
    BS_WriteUint8(bs, b);
    BS_WriteUint8(bs, a);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendSmokeRemove(playerid, vehicleid)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_SMOKE_REMOVE);
    BS_WriteUint16(bs, vehicleid);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendStageCreate(playerid, vehicleid, Float:engine_acceleration, Float:max_gear_velocity, Float:traction_multiplier, Float:brake_deceleration)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_STAGE_CREATE);
    BS_WriteUint16(bs, vehicleid);
    BS_WriteFloat(bs, engine_acceleration);
    BS_WriteFloat(bs, max_gear_velocity);
    BS_WriteFloat(bs, traction_multiplier);
    BS_WriteFloat(bs, brake_deceleration);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendStageRemove(playerid, vehicleid)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_STAGE_REMOVE);
    BS_WriteUint16(bs, vehicleid);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}

stock AGG_SendAlphaPed(playerid, alpha)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new BitStream:bs = BS_New();
    BS_WriteUint8(bs, AGG_PACKET_CUSTOM);
    BS_WriteUint8(bs, AGG_EVENT_ALPHA_PED);
    BS_WriteUint8(bs, alpha);
    PR_SendPacket(bs, playerid);
    BS_Delete(bs);
    return 1;
}
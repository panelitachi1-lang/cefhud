/* ========================================================================== *\
	Vehicle Speed Booster

| Description:


| License:
	Copyright (c) 2016-2017 Double V

	This software is provided 'as-is', without any express or implied
	warranty. In no event will the authors be held liable for any damages
	arising from the use of this software.

	Permission is granted to anyone to use this software for any purpose,
	including commercial applications, and to alter it and redistribute it
	freely, subject to the following restrictions:

	1.	The origin of this software must not be misrepresented; you must not
		claim that you wrote the original software. If you use this software
		in a product, an acknowledgement in the product documentation would be
		appreciated but is not required.
	2.	Altered source versions must be plainly marked as such, and must not be
		misrepresented as being the original software.
	3.	This notice may not be removed or altered from any source distribution.

| Metadata:
	[Functions]:
		Stock:
			-
		Static:
			-
		Public:
			- @_TDW_BOOSTER_SPEED_UPDATE
			- OnPlayerStateChange
		Hooks:
			-
	[Callbacks]:
		- TDWVH_BOOST@OnPlayerStateChange
	[Definitions]:
		- _TDW_BOOSTER_SPEED_UPDATE
		- _TDW_BOOSTER_MIN_SPEED
		- _TDW_BOOSTER_BOOST_SPEED
		- _TDW_BOOSTER_INACCURACY
	[Enumerations]:
		-
	[Macros]:
		-
	[Tags]:
		-
	[Variables]:
		Global scope:
			-
		Static scope:
			- TDW_g_sTimerName
	[Natives]:
		-
	[Operators]:
		-
| Dependencies:
	-
\* ========================================================================== */

#if defined _inc_tdw_vyboost
	// I remove this constant because the compiler automatically generates it.
	//   github.com/Zeex/pawn/issues/107
	#undef _inc_tdw_vyboost
#endif

#if defined _TDW_VH_SYS_VEHICLE_SPEED_BOOST
	#endinput
#endif

#define _TDW_VH_SYS_VEHICLE_SPEED_BOOST

#include "tdw_vehicle"

// Modules
#include "tdw_vsa_data"
#include "tdw_vmath"
#include "tdw_vutils"

// -----------------------------------------------------------------------------
// Definitions:

#if !defined _TDW_BOOSTER_SPEED_UPDATE
	#define _TDW_BOOSTER_SPEED_UPDATE (450)
#else
	#assert (0 <= _TDW_BOOSTER_SPEED_UPDATE)
#endif

#if !defined _TDW_BOOSTER_MIN_SPEED
	#define _TDW_BOOSTER_MIN_SPEED (5.0)
#else
	#assert (0 <= _TDW_BOOSTER_MIN_SPEED)
#endif

#if !defined _TDW_BOOSTER_BOOST_SPEED
	#define _TDW_BOOSTER_BOOST_SPEED (10.0)
#endif

#if !defined _TDW_BOOSTER_INACCURACY
	#define _TDW_BOOSTER_INACCURACY (0.15)
#endif

// -----------------------------------------------------------------------------
// Static scope:

static stock
	TDW_g_sTimerName[] = !"_TDW_BOOSTER_SPEED_UPDATE_";

// -----------------------------------------------------------------------------
enum eBOOST
{
	boost_time,
	min_speed,
	boost_speed,
	inaccuracy
}
new PLAYER_BOOST[MAX_PLAYERS][eBOOST];
// -----------------------------------------------------------------------------
// Hooks:

// OnPlayerStateChange hook
#if defined TDWVH_BOOST@OnPlayerStateChange
	forward TDWVH_BOOST@OnPlayerStateChange(playerid, newstate, oldstate);
#endif

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if (newstate == PLAYER_STATE_DRIVER) {
		new vehicleid = GetPlayerVehicleID(playerid);

		if (GetModelStaticType(GetVehicleModel(vehicleid)) == CAR || GetModelStaticType(GetVehicleModel(vehicleid)) == MOTORBIKE)
			_TDW_BOOSTER_SPEED_UPDATE_(playerid, vehicleid);
	}

	#if defined TDWVH_BOOST@OnPlayerStateChange
		TDWVH_BOOST@OnPlayerStateChange(playerid, newstate, oldstate);
	#endif

	return 1;
}

#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif

#define OnPlayerStateChange TDWVH_BOOST@OnPlayerStateChange

// OnPlayerConnect hook
#if defined TDWVH_BOOST@OnPlayerConnect
	forward TDWVH_BOOST@OnPlayerConnect(playerid);
#endif

public OnPlayerConnect(playerid)
{
	PLAYER_BOOST[playerid][boost_time] = _TDW_BOOSTER_SPEED_UPDATE;
	PLAYER_BOOST[playerid][min_speed] = floatround(_TDW_BOOSTER_MIN_SPEED);
	PLAYER_BOOST[playerid][boost_speed] = floatround(_TDW_BOOSTER_BOOST_SPEED);
	PLAYER_BOOST[playerid][inaccuracy] = floatround(_TDW_BOOSTER_INACCURACY);

	#if defined TDWVH_BOOST@OnPlayerConnect
		TDWVH_BOOST@OnPlayerConnect(playerid);
	#endif

	return 1;
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect TDWVH_BOOST@OnPlayerConnect

// -----------------------------------------------------------------------------
// Internal:

forward _TDW_BOOSTER_SPEED_UPDATE_(playerid, vehicleid);
public _TDW_BOOSTER_SPEED_UPDATE_(playerid, vehicleid)
{
	static
		Float:z_angle,
		keys, __keys,
		Float:z_angle_old[MAX_VEHICLES],
		Float:angle_tmp,
		Float:tmp,
		Float:speed;
	if (0 == GetVehicleZAngle(vehicleid, z_angle)) return 0;
	GetPlayerKeys(playerid, keys, __keys, __keys);
	if (keys & KEY_SPRINT) 
	{
		tmp = z_angle_old[vehicleid] = floatround(floatabs(floatadd(z_angle_old[vehicleid], /*_TDW_BOOSTER_INACCURACY*/ PLAYER_BOOST[playerid][inaccuracy])));
		angle_tmp = floatround(floatabs(z_angle));
		if (_:(tmp > angle_tmp || tmp < angle_tmp) == 0) 
		{
			speed = GetVehicleSpeed(vehicleid);
			if (_:(speed < PLAYER_BOOST[playerid][min_speed]/*_TDW_BOOSTER_MIN_SPEED*/ || IsVehicleBackwordsDirection(vehicleid)) == 0)
			{
				SetVehicleSpeed(vehicleid, speed + PLAYER_BOOST[playerid][boost_speed]/*_TDW_BOOSTER_BOOST_SPEED*/);
			}
		}
	}
	z_angle_old[vehicleid] = z_angle;
	return SetTimerEx(TDW_g_sTimerName, /*_TDW_BOOSTER_SPEED_UPDATE*/PLAYER_BOOST[playerid][boost_time], false, !"ii", playerid, vehicleid);
}

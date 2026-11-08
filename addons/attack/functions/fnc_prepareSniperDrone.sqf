/*/////////////////////////////////////////////////
Author: Bernhard
			   
File: fnc_prepareSniperDrone.sqf
Parameters: drone to prepare for sniping
Return: none

Example:
	_this call grad_drones_util_fnc_prepareSniperDrone;  // in drone's Execute field

*///////////////////////////////////////////////

params ["_drone"];

[_drone,"SetWeapon",["srifle_GM6_ghex_F","","","",["5Rnd_127x108_APDS_Mag",5],[],""]] call lxws_fnc_droneWeapon;
// _drone selectWeaponTurret ["srifle_GM6_ghex_F", [0], "srifle_GM6_ghex_F"];	// select sniper rifle per default (instead of laser designator)
// _drone selectWeapon "srifle_GM6_ghex_F";	

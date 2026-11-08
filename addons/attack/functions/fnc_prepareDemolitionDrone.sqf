/*/////////////////////////////////////////////////
Author: Bernhard
			   
File: fnc_prepareDemolitionDrone.sqf
Parameters: drone to prepare for demolition
Return: none

Example:
	_this call grad_drones_attack_fnc_prepareDemolitionDrone;  // in drone's Execute field

*///////////////////////////////////////////////

params ["_drone"];

private _demoBlock = "ModuleExplosive_DemoCharge_F" createVehicle position _drone;	// spawn demolition block
_demoBlock attachTo [_drone, [0, 0.03, 0.14]];			// attach to drone
_demoBlock setVectorDirAndUp [[-1,0,0], [0,0,1]];	// rotate 90°
[_demoBlock, { { _x addCuratorEditableObjects [[_this], false] } forEach allCurators; }] remoteExec ["call", 2];  // make object visible to Zeus

// create impact craters for exploding drones
private _explosive = (attachedObjects _demoBlock)#0;
_explosive addEventHandler ["Explode", {_this call craters_fnc_deform;}];

_drone addMPEventHandler ["MPKilled", {		// when drone dies...
	params ["_drone", "_killer", "_instigator", "_useEffects"];
	{ _x setDamage 1; } forEach (attachedObjects _drone);	// ...trigger explosive charge
}];

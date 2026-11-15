/*/////////////////////////////////////////////////
Author: Bernhard
			   
File: fnc_spawnDroneSwarm.sqf

Parameters: 
	_templateDrone	 	drone that will serve as the template to spawn other drones (DEFAULT objNull)
	_spawnerObjects 	array of drone spawner objects (objects on which position to spawn the drones) (DEFAULT [])
	_target 			target object towards which the drones will move (DEFAULT objNull)
	_side 				side at which the drone swarm will spawn (DEFAULT east); is ignored if _templateDrone is given

Return: none

Example:
	for "_i" from 1 to 5 do { [_myDarter] call grad_drones_attack_fnc_spawnDroneSwarm; };		// spawn 5x more Darters around the given one

	[objNull, _spawnerObjects, thisList#0, east] call grad_drones_attack_fnc_spawnDroneSwarm;	//  for use within the OnActivation field of a trigger

*///////////////////////////////////////////////

params [
		["_templateDrone", objNull, [objNull]], 
		["_spawnerObjects", [], []], 
		["_target", objNull, [objNull]], 
		["_side", east, [east]]
	]; 

// set type of drone to spawn
private _droneClass = "O_UAV_01_F";	// default drone type
if (!isNull _templateDrone) then {
	_droneClass = typeOf _templateDrone;
};

// set group to spawn into
private _group = createGroup _side;
if (!isNull _templateDrone) then {
	_group = group _templateDrone;
};

// spawn drones
if (_spawnerObjects isEqualTo []) then {
	_spawnerObjects pushBack _templateDrone;	
};
{
	private _spawnerObj = _x;
	private _drone = [getPos _spawnerObj, getDir _spawnerObj, _droneClass, _group, false] call BIS_fnc_spawnVehicle;
	// TODO Implementierung mit createVehicle und createVehicleCrew

	private _dronePos = getPos (_drone#0);
	_drone#0 setPos [_dronePos#0, _dronePos#1, getPos _spawnerObj select 2];	// BIS_fnc_spawnVehicle spawns drones in the air; this is not always what we want

	if (_spawnerObj isKindOf "Air") then {
		_drone#0 engineOn (isEngineOn _spawnerObj);
	};

	if (!isNull _target) then {
		_drone#0 call grad_drones_attack_fnc_prepareDemolitionDrone;
	};
} forEach _spawnerObjects;

// if _target is given, send drone swarm there to attack 
if (!isNull _target) then {
	private _waypoint = _group addWaypoint [getPos _target, 50];
	_waypoint call grad_drones_attack_fnc_makeSuicideWaypoint;
};


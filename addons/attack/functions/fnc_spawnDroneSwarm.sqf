/*/////////////////////////////////////////////////
Author: Bernhard
			   
File: fnc_spawnDroneSwarm.sqf

Parameters: 
	_spawnerObjects 	array of drone spawner objects (objects on which position to spawn the drones)
	_target 			target object towards which the drones will move

Return: none

Example:
	[_spawnerObjects, thisList#0] call grad_drones_attack_fnc_spawnDroneSwarm;

*///////////////////////////////////////////////

params ["_spawnerObjects", "_target"];

private _group = createGroup east;
{
	private _spawnerObj = _x;
	private _drone = [getPos _spawnerObj, getDir _spawnerObj, "O_UAV_01_F", _group] call BIS_fnc_spawnVehicle;
	_drone#0 setPos (getPos _spawnerObj);
	_drone#0 call grad_drones_attack_fnc_prepareDemolitionDrone;
	
} forEach _spawnerObjects;

private _waypoint = _group addWaypoint [getPos _target, 50];
_waypoint call grad_drones_attack_fnc_makeSuicideWaypoint;

/*/////////////////////////////////////////////////
Author: Bernhard
			   
File: fnc_deleteLockOnCircle.sqf
Parameters: _circleCenter - helper object at the center of the circle to delete
Return: none

Example:
	[_circleCenter] call grad_drones_attack_fnc_deleteLockOnCircle;

*///////////////////////////////////////////////

params ["_circleCenter"];

{ deleteVehicle _x } forEach (attachedObjects _circleCenter);	// this includes _lockOnTriggerCircle
deleteVehicle _circleCenter;

private _lockOnTriggerCircleMarker = _circleCenter getVariable ["LockOnTriggerCircleMarkerName", ""];
deleteMarker _lockOnTriggerCircleMarker;

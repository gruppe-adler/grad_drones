#include "..\script_component.hpp"
/*/////////////////////////////////////////////////
Author: Bernhard
			   
File: fnc_createLockOnCircle.sqf
Parameters: _waypoint		- at which to create the circle
 			_lockOnRadius	- radius of the circle

Return: a list like:
		[
			_circleCenter, 			// helper object at circle center
			_circleObject3D, 		// 3D circle object
			_circleMarkerName2D		// 2D map marker name
		]			 

Example:
	[_waypoint, _lockOnRadius] call grad_drones_attack_fnc_createLockOnCircle;

*///////////////////////////////////////////////

params ["_waypoint", "_lockOnRadius"];

// 3D circle for curator camera (Zeus)
private _helper = createVehicle ["Sign_Sphere200cm_F", getWPPos _waypoint, [], 0, "CAN_COLLIDE"];	// helper object to attach circle to
_helper remoteExec ["hideObject", 0];		// hide circle for everyone
private _lockOnTriggerCircle = createSimpleObject ["\a3\Modules_F_Curator\Ordnance\surfaceMortar.p3d", getWPPos _waypoint];
_lockOnTriggerCircle attachTo [_helper, [0, 0, 0]];	// attach circle to helper object
_lockOnTriggerCircle remoteExec ["hideObject", 0];		// hide circle for everyone

private _lockOnTriggerCircleMarker = "";
private _lockOnTriggerCircleMarkerName = format ["lockOnTriggerCircleMarker_%1_%2", _waypoint, diag_tickTime];	// name for 2D circle marker on map

// show circle for all Zeuses
["zen_common_execute", 
	[{
		if (isNull curatorCamera) exitWith {};	// keep hidden if not in Zeus mode
		params ["_lockOnTriggerCircle", "_lockOnRadius", "_lockOnTriggerCircleMarkerName"];
		_lockOnTriggerCircle setObjectScale _lockOnRadius/40;			// scale to proper size (circle has a 17m radius by default)				
		_lockOnTriggerCircle hideObject false;

		// 2D circle on map
		_lockOnTriggerCircleMarker = createMarkerLocal [_lockOnTriggerCircleMarkerName, getWPPos _waypoint];
		_lockOnTriggerCircleMarker setMarkerShapeLocal "ELLIPSE";
		_lockOnTriggerCircleMarker setMarkerSizeLocal [_lockOnRadius, _lockOnRadius];
		_lockOnTriggerCircleMarker setMarkerAlphaLocal 0.7;
		_lockOnTriggerCircleMarker setMarkerColorLocal "ColorYellow";
		_lockOnTriggerCircleMarker setMarkerBrushLocal "SolidBorder";
	}, 
	[_lockOnTriggerCircle, _lockOnRadius, _lockOnTriggerCircleMarkerName]], 
	allCurators
] call CBA_fnc_targetEvent;

// store lock-on circle info in helper variable (for later deletion/editing)
_helper setVariable ["LockOnTriggerWaypoint", _waypoint, true];
_helper setVariable ["LockOnTriggerCircleMarkerName", _lockOnTriggerCircleMarkerName, true];

[_helper, _lockOnTriggerCircleMarker];	// return value

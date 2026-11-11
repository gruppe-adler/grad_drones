#include "script_component.hpp"


// list of suicide drones and their targets
// format: [[_drone, _target]];
GVAR(SuicideDrones) = [];
publicVariable QGVAR(SuicideDrones);


if (!hasInterface) exitWith {};


// draw red line between suicide drone and its target (and react to waypoints being edited)
["zen_curatorDisplayLoaded", {	// wait for player to open Zeus for the 1st time as we need to check if zeus, and we cannot do that at mission time 0 due to race-condition
	
	// draw in 3D space
	addMissionEventHandler ["Draw3D", {
		if (isNull curatorCamera) exitWith {};	// only draw when in Zeus mode
		{
			_x params ["_drone", "_target"];
			drawLine3D [ASLToAGL getPosASL _drone, ASLToAGL getPosASL _target, [1,0,0,1], 10];
		} forEach GVAR(SuicideDrones);
	}];


	// draw on map (2D space)
	[{!isNull (findDisplay 312 displayCtrl 50)}, {
		private _map = findDisplay 312 displayCtrl 50;
		_map ctrlAddEventHandler ["Draw", toString {
			private _map = (_this#0);
			// (_this#0) drawLine [getPos zeus1, getPos drone1, [1,0,0,1]];
			{
				_x params ["_drone", "_target"];
				_map drawLine [getPos _drone, getPos _target, [1,0,0,1], 8];
			} forEach GVAR(SuicideDrones);
		}];	
	}, nil, 
	// timeout time and code
	5, 
	{ diag_log "initPlayerLocal.sqf: Couldn't register draw handler for suicide drone targets on Zeus map" }
	] call CBA_fnc_waitUntilAndExecute;

	// remember which waypoint was last selected by Zeus
	(getAssignedCuratorLogic player) addEventHandler ["CuratorWaypointSelectionChanged", {
		params ["_curator", "_group", "_waypointID"];

	}];

	// move green circles when suicide waypoints move
	(getAssignedCuratorLogic player) addEventHandler ["CuratorWaypointEdited", {
		params ["_curator", "_group", "_waypointID"];

		private _movedWaypoint = [_group,_waypointID];
		private _LockOnCircles = _group getVariable ["LockOnCircles", []];
		{
			private _circleCenter = objectFromNetId _x;
			private _waypoint = _circleCenter getVariable ["LockOnTriggerWaypoint", objNull];
			if (_waypoint isEqualTo _movedWaypoint) then {
				_circleCenter setPos (getWPPos _waypoint);	// will implicitly move the green 3D circle
				private _lockOnTriggerCircleMarker = _circleCenter getVariable ["LockOnTriggerCircleMarkerName", ""];
				_lockOnTriggerCircleMarker setMarkerPos (getWPPos _waypoint);	// move 2D circle on map
			};
		} forEach _LockOnCircles;
	}];

	// react to Zeus deleting waypoints
	(getAssignedCuratorLogic player) addEventHandler ["CuratorWaypointDeleted", {
		params ["_curator", "_group", "_waypointID"];

		private _deletedWaypoint = [_group,_waypointID];
		private _LockOnCircles = _group getVariable ["LockOnCircles", []];
		{
			private _circleCenter = objectFromNetId _x;
			private _waypoint = _circleCenter getVariable ["LockOnTriggerWaypoint", objNull];
			private _shallDelete = (_waypoint isEqualTo _deletedWaypoint) || !(_waypoint in (waypoints _group));
			if (_shallDelete) then {
				[_circleCenter] call FUNC(deleteLockOnCircle);	// remove green lock-on circles
			};			
		} forEach _LockOnCircles;
	}];

    [_thisType, _thisId] call CBA_fnc_removeEventHandler;	// remove event immediately
}] call CBA_fnc_addEventHandlerArgs;



// ACE menu with Zeus utilities
private _prepareDemolitionDroneAction = ["prepareDemolitinDrone","Prepare Demolition Drone","\A3\Drones_F\Air_F_Gamma\UAV_01\Data\UI\Map_UAV_01_CA.paa",{ { _x call FUNC(prepareDemolitionDrone); } forEach curatorSelected#0; },{"UAV_01_base_F" call EFUNC(util,curatorSelectedIsKindOf);}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _prepareDemolitionDroneAction] call ace_interact_menu_fnc_addActionToZeus;

private _prepareSniperDroneAction = ["prepareSniperDrone","Prepare Sniper Drone","\lxWS\air_f_lxWS\Data\UI\UAV_02_CA.paa",{ { _x call FUNC(prepareSniperDrone); } forEach curatorSelected#0; },{"UAV_02_Base_lxWS" call EFUNC(util,curatorSelectedIsKindOf);}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _prepareSniperDroneAction] call ace_interact_menu_fnc_addActionToZeus;

private _makeSuicideWaypointAction = ["makeSuicideWaypoint","Make Suicide Waypoint","\A3\ui_f\data\igui\cfg\simpleTasks\types\destroy_ca.paa",{ { _x call FUNC(makeSuicideWaypoint); } forEach curatorSelected#2; },{ true /* define condition */}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", "ZeusWaypoints"], _makeSuicideWaypointAction] call ace_interact_menu_fnc_addActionToZeus;

private _detonateDroneAction = ["detonateDrone","Detonate Drone","\A3\ui_f\data\igui\cfg\simpleTasks\types\destroy_ca.paa", { (vehicle remoteControlled player) setDamage 1;  },{ ((attachedObjects vehicle remoteControlled player) select { _x isKindOf "ModuleExplosive_DemoCharge_F"}) isNotEqualTo [] }] call ace_interact_menu_fnc_createAction;
 ["UAV_01_base_F", 1, ["ACE_SelfActions"], _detonateDroneAction, true] call ace_interact_menu_fnc_addActionToClass;

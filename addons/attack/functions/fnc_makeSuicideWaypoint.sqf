/*/////////////////////////////////////////////////
Author: Bernhard
			   
File: fnc_makeSuicideWaypoint.sqf
Parameters: waypoint to be changed into the suicide attack target
Return: none

Example:
	_waypoint call grad_drones_attack_fnc_makeSuicideWaypoint;

*///////////////////////////////////////////////

params ["_waypointGroup","_waypointIndex"];

// plausibility check
private _vics = assignedVehicles _waypointGroup;
if !(_vics#0 isKindOf "UAV_01_base_F") exitWith {
	diag_log format ["fn_makeSuicideWaypoint.sqf: Type %1 does not support suicide waypoint", typeOf (_vics#0)];
};

private _waypoint = _this;
private _lockOnRadius = 50;		// at what radius will drone try to find a target to lock onto
private _timeout = 60;			// when to stop trying to reach the lock-on zone (in seconds)


// visualize circle for Zeus at which target lock-on will be attempted
private _circles = [_waypoint, _lockOnRadius] call grad_drones_attack_fnc_createLockOnCircle;


// store lock circles on group object
_circles params ["_circleCenter", "_lockOnTriggerCircleMarker"];
private _existingSuicideWaypoints = _waypointGroup getVariable ["LockOnCircles", []];
_existingSuicideWaypoints pushBack (netId _circleCenter);
_waypointGroup setVariable ["LockOnCircles", _existingSuicideWaypoints, true];


// steer drone into target if it is close enough
[{ 	// condition code
	params ["_waypointGroup", "_circleCenter", "_lockOnRadius"];
	private _dronePos = getPos leader (_waypointGroup);
	private _distance = ( _dronePos distance2D (getPos _circleCenter) ); 	// if drone to waypoint distance gets below lock on radius
	_distance < _lockOnRadius;	// condition at which the suicide drone will start searching for targets
}, 	
{ 
	params ["_waypointGroup", "_circleCenter", "_lockOnRadius"];

	[_circleCenter] call grad_drones_attack_fnc_deleteLockOnCircle;	// remove green lock-on circles

	private _searchRadius = _lockOnRadius*1.5;

	// visualize search radius for Zeus
	private _search4TargetsCircle = createSimpleObject ["\a3\Modules_F_Curator\Ordnance\surfaceHowitzer.p3d", getPos _circleCenter];
	_search4TargetsCircle remoteExec ["hideObject", 0];				// hide circle for everyone
	// show circle for Zeus
	["zen_common_execute", [{
			params ["_search4TargetsCircle", "_searchRadius"];
			private _hide = isNull curatorCamera;	// hide if not in Zeus mode
			_search4TargetsCircle hideObject _hide;
			if (!_hide) then {	playSound "Beep_Target"; };	// notification sound
			_search4TargetsCircle setObjectScale _searchRadius/80;			// scale to proper size (circle has a 17m radius by default)

			// 2D circle on map
			_search4TargetsCircleMarker = createMarkerLocal [format ["search4TargetsCircleMarker_%1_%2", _waypoint, diag_tickTime], getPos _circleCenter];
			_search4TargetsCircleMarker setMarkerShapeLocal "ELLIPSE";
			_search4TargetsCircleMarker setMarkerSizeLocal [_searchRadius, _searchRadius];
			_search4TargetsCircleMarker setMarkerAlphaLocal 0.7;
			_search4TargetsCircleMarker setMarkerColorLocal "ColorYellow";
			_search4TargetsCircleMarker setMarkerBrushLocal "SolidBorder";


			// blink circles to indicate different meaning (searching for targets)
			[_search4TargetsCircle, _search4TargetsCircleMarker] spawn {
				params ["_search4TargetsCircle", "_search4TargetsCircleMarker"];
				for "_i" from 1 to 10 do { 
					sleep 0.3;
					_search4TargetsCircle hideObject (_i%2 > 0);
					_search4TargetsCircleMarker setMarkerAlphaLocal (_i%2 * 0.7);
				};
				
				sleep 0.6;				
				// delete after blinking
				deleteVehicle _search4TargetsCircle; 
				deleteMarker _search4TargetsCircleMarker;
			};
		}, 
		[_search4TargetsCircle, _searchRadius]], 
		allCurators
	] call CBA_fnc_targetEvent;


	// prepare target list
	private _potentialTargets = nearestObjects [getPos _circleCenter, ["CAManBase", "Car", "Tank", "StaticWeapon", "Helicopter", "Plane", "Ship"], _searchRadius, true];
	private _aliveTargets = _potentialTargets select { alive _x };
	{
		private _drone = _x;

		// acquire target
		private _visibleTargets = _aliveTargets select { [objNull, "VIEW"] checkVisibility [getPosASL _drone, getPosASL _x] != 0 };		// check line-of-sight
		private _target = selectRandom _visibleTargets;
		if (isNil "_target") exitWith {
			[{ 
				["zen_common_showMessage", ["No target for suicide drone found"], allCurators] call CBA_fnc_targetEvent;	// send message to all curators
			}, [], 1] call CBA_fnc_waitAndExecute;	// wait 1s to not collide with beep sound and red circle appearing
		};
		
		_drone setVariable ["suicideTarget", _target, true];

		// maintain list of drones with targets
		SuicideDrones pushBack [_drone, _target];
		publicVariable "SuicideDrones";	
		[{	// garbage collector for dead drones/targets
			private _filterCode = { 
				_x params ["_drone", "_target"]; 
				(!alive _drone) || { !alive _target }; 
			};
			private _elementsWithDeadMembers = SuicideDrones select _filterCode;
			SuicideDrones = SuicideDrones - _elementsWithDeadMembers;
			publicVariable "SuicideDrones";
		}, 5] call CBA_fnc_addPerFrameHandler;

		// kill drone once it collides with the target
		_drone addEventHandler ["EpeContactStart", {
			params ["_drone", "_collisionObject", "_selection1", "_selection2", "_force", "_reactForce", "_worldPos"];
			private _target = _drone getVariable ["suicideTarget", objNull];
			if (_target == _collisionObject) then {
				_drone setDamage 1;
			};		
		}];	

		// add loop to lock on to target (inspired by Drongo's work but heavily modified)
		private _isInfantry = _target isKindOf "CAManBase";
		[{
			params ["_args", "_handle"];
			_args params ["_drone", "_target", "_isInfantry"];

			if (_isInfantry && { (_drone distance2D _target) < 1 } ) then { _drone setDamage 1; };	// infantry needs special handling because it is so tiny that collision will take to long and look weird

			if ((!alive _drone) || { !alive _target } ) then {			
				[_handle] call CBA_fnc_removePerFrameHandler;	// exit loop
			};

			private _forwardVector = vectorNormalized ((getPos _target) vectorDiff (getPos _drone));
			_pullForce = _forwardVector vectorMultiply 50;
			_drone addForce [_pullForce, [0,0,0]];

		}, 0, [_drone, _target, _isInfantry]] call CBA_fnc_addPerFrameHandler;
	} forEach (assignedVehicles _waypointGroup);
}, 
[_waypointGroup, _circleCenter, _lockOnRadius, _timeout], 	// parameter list (for condition and code)

// timeout time and code
_timeout, 
{
	params ["_waypointGroup", "_circleCenter", "_lockOnRadius", "_timeout"];
	["zen_common_showMessage", [format ["Suicide waypoint not reached before timeout of %1 seconds", _timeout]], allCurators] call CBA_fnc_targetEvent;	// send message to all curators
	[_circleCenter] call grad_drones_attack_fnc_deleteLockOnCircle;	// remove green lock-on circles
}
] call CBA_fnc_waitUntilAndExecute;

/*/////////////////////////////////////////////////
Author: Bernhard
			   
File: fnc_curatorSelectedIsKindOf.sqf
Parameters: _type to compare the selected item against
Return: boolean

Example:
	"Man" call grad_drones_util_fnc_curatorSelectedIsKindOf;

*///////////////////////////////////////////////

params ["_type"];

private _ret = false;

private _selectedObjects = curatorSelected#0;	// first list member are all selected objects
if (_selectedObjects isNotEqualTo []) then {
	_ret = (_selectedObjects#0 isKindOf _type);	// compare first selected object against given type
};

_ret;

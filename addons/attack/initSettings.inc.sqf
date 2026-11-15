/*
[
    QGVAR(enable),
    "CHECKBOX",
    [LSTRING(enable_displayName), LSTRING(enable_description)],
    [LSTRING(GradDrones), LSTRING(subCategory)],
    false,
    true,
    {[] call FUNC(startMonitor);}
] call CBA_fnc_addSetting;

[
    QGVAR(degradeDistance),
    "SLIDER",
    [LSTRING(degradeDistance_displayName), LSTRING(degradeDistance_description)],
    [LSTRING(GradDrones), LSTRING(subCategory)],
    [100, 5000, 800, 0],
    true
] call CBA_fnc_addSetting;
*/

[
    QGVAR(lockOnRadius),
    "SLIDER",
    [LSTRING(lockOnRadius_displayName), LSTRING(lockOnRadius_description)],
    [LSTRING(GradDrones), LSTRING(subCategory)],
    [30, 200, 50, 0]
] call CBA_fnc_addSetting;

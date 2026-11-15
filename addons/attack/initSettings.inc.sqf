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
*/

[
    QGVAR(lockOnRadius),
    "SLIDER",
    [LSTRING(lockOnRadius_displayName), LSTRING(lockOnRadius_description)],
    [LSTRING(GradDrones), LSTRING(subCategory)],
    [30, 200, 50]
] call CBA_fnc_addSetting;

[
    QGVAR(pullForceRatio),
    "SLIDER",
    [LSTRING(pullForceRatio_displayName), LSTRING(pullForceRatio_description)],
    [LSTRING(GradDrones), LSTRING(subCategory)],
    [0.1, 1, 0.3]
] call CBA_fnc_addSetting;

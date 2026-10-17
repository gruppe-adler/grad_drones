#include "script_component.hpp"

// class CfgPatches
// {
// 	class ADDON
// 	{
// 		name = QUOTE(ADDON);
// 		units[] = 
// 		{
// 		};
// 		weapons[] = {};
// 		requiredVersion = REQUIRED_VERSION;
// 		requiredAddons[] = {};
// 		authors[] = AUTHOR;
//         VERSION_CONFIG;
// 	};
// };


class CfgPatches
{
    class grad_drones
    {
        author = "Bernhard aka b-mayr-1984";
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] =
        {
            // "rhs_c_weapons", "rhs_c_heavyweapons","rhs_sounds", "UK3CB_Factions_Vehicles_Ural"
        };
    };
};

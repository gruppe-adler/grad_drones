#include "script_component.hpp"

class CfgPatches
{
    class ADDON
    {
		name = QUOTE(ADDON);
        authors[] = AUTHOR;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main", "ace_interact_menu", "zen_common", "grad_drones_util", "functions_f_lxws"
        };
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

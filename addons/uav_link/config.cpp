#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        author = CSTRING(TacticalTrainingTeam);
        url = CSTRING(URL);
        authors[] = {"Andx"};

        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        units[] = {};
        weapons[] = {};

        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

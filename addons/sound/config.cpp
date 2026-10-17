#include "script_component.hpp"


class CfgPatches
{
    class grad_drones
    {
        author = "Bernhard aka b-mayr-1984";
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {
                "A3_Air_F_Gamma_UAV_01", "A3_Air_F_Orange_UAV_01"
            };
    };
};


/*
example from: configFile >> "CfgVehicles" >> "I_E_UAV_06_F"
soundEngineOffExt[] = {"\z\grad_modTemplate\addons\main\data\dronesound_10.ogg",2.5,1,200};
soundEngineOffExt[] = {"A3\Sounds_F_Orange\Vehicles\Air\UAV_06\UAV_06_Eng_Off_Ext",0.316228,1,50};
soundEngineOffInt[] = {"A3\Sounds_F_Orange\Vehicles\Air\UAV_06\UAV_06_Eng_Off_Int",0.158489,1,10};
soundEngineOffInt[] = {"A3\Sounds_F_Orange\Vehicles\Air\UAV_01\Uav_01_Eng_Off_Ext",0.158489,1,10};
soundEngineOnExt[] = {"A3\Sounds_F_Orange\Vehicles\Air\UAV_06\UAV_06_Eng_On_Ext",0.316228,1,50};
soundEngineOnInt[] = {"A3\Sounds_F_Orange\Vehicles\Air\UAV_06\UAV_06_Eng_On_Int",0.158489,1,10};
soundEngineOnInt[] = {"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Eng_On_Int",0.158489,1,10};
*/

class CfgVehicles {
    class UAV_01_base_F;
    // NATO Darter
    class B_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        // soundEngineOnInt[] = {QPATHTOF(data\dronesound_10.ogg), 0.5, 1, 10};
        soundEngineOffExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        // soundEngineOffInt[] = {QPATHTOF(data\dronesound_10.ogg), 0.5, 1, 10};
        
        // class Sounds {
        //     class EngineExt {
        //         sound[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        //         attenuationEffectSpeed = 5;
        //         distanceFilter = "softDryAttenuationFilter";
        //         frequency = "0.8 + (rpm/2)"; 
        //         volume = "engineOn*camPos"; 
        //     };
        // };
    };
    // CSAT Darter
    class O_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        soundEngineOffExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // AAF Darter
    class I_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        soundEngineOffExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // LDF Darter
    class I_E_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        soundEngineOffExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
     // IDAP Darter
    class C_IDAP_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        soundEngineOffExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // Civilian Darter
    class CIV_UAV_01_lxWS: UAV_01_base_F {
        soundEngineOnExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        soundEngineOffExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
   // ION Darter
    class ION_UAV_01_lxWS: UAV_01_base_F {
        soundEngineOnExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        soundEngineOffExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // MJTF Darter (Woodland Camouflage)
    class EF_B_UAV_01_MJTF_Wdl: UAV_01_base_F {
        soundEngineOnExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        soundEngineOffExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // MJTF Darter (Desert Camouflage)
    class EF_B_UAV_01_MJTF_Des: UAV_01_base_F {
        soundEngineOnExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        soundEngineOffExt[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {QPATHTOF(data\dronesound_10.ogg), 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
};

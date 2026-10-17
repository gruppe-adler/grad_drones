class CfgPatches {
    class STyx2909_darter_louder_sounds {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"A3_Air_F_Gamma_UAV_01", "A3_Air_F_Orange_UAV_01"};
    };
};

class CfgVehicles {
    class UAV_01_base_F;
    // NATO Darter
    class B_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        soundEngineOffExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // CSAT Darter
    class O_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        soundEngineOffExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // AAF Darter
    class I_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        soundEngineOffExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // LDF Darter
    class I_E_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        soundEngineOffExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
     // IDAP Darter
    class C_IDAP_UAV_01_F: UAV_01_base_F {
        soundEngineOnExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        soundEngineOffExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // Civilian Darter
    class CIV_UAV_01_lxWS: UAV_01_base_F {
        soundEngineOnExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        soundEngineOffExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
   // ION Darter
    class ION_UAV_01_lxWS: UAV_01_base_F {
        soundEngineOnExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        soundEngineOffExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // MJTF Darter (Woodland Camouflage)
    class EF_B_UAV_01_MJTF_Wdl: UAV_01_base_F {
        soundEngineOnExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        soundEngineOffExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
    // MJTF Darter (Desert Camouflage)
    class EF_B_UAV_01_MJTF_Des: UAV_01_base_F {
        soundEngineOnExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        soundEngineOffExt[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
        
        class Sounds {
            class EngineExt {
                sound[] = {"\ar2darter\data\dronesound_10.ogg", 2.5, 1, 200};
                attenuationEffectSpeed = 5;
                distanceFilter = "softDryAttenuationFilter";
                frequency = "0.8 + (rpm/2)"; 
                volume = "engineOn*camPos"; 
            };
        };
    };
};

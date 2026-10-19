// #include "script_component.hpp"


class CfgPatches
{
    class ADDON
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


class CfgVehicles {
	class All;
	class AllVehicles: All {};
	class Air: AllVehicles {};
	class Helicopter: Air {};
	class Helicopter_Base_F: Helicopter {};
	class UAV_01_base_F: Helicopter_Base_F {
		class Sounds
		{
			class Engine_Idle_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Eng_01_Ext.wss",
					14.125376,
					1,
					250
				};
			};
			class Engine_01_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Eng_01_Ext.wss",
					17.782794,
					1,
					250
				};
			};
			class Engine_02_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Eng_02_Ext.wss",
					17.782794,
					1,
					250
				};
			};
			class Engine_03_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Eng_03_Ext.wss",
					19.952624,
					1,
					250
				};
			};
			class Engine_Lateral_Movement_01_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Engine_Lateral_Movement_Ext.wss",
					10,
					1,
					250
				};
			};
			class WindNoise_01_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_WindNoise_01_Ext.wss",
					14.125375,
					1,
					250
				};
			};
			class Rotors_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Rotors_01.wss",
					3.1622776,
					3.2,
					250
				};
			};
			class scrubLand_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Scrub_Land_Ext.wss",
					1.7782794,
					1,
					50
				};
			};
			class scrubTree_01_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Scrub_Tree_01_Ext.wss",
					11.220185,
					1,
					50
				};
			};
			class scrubTree_02_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Scrub_Tree_02_Ext.wss",
					11.220185,
					1,
					50
				};
			};
			class scrubBuilding_01_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Scrub_Object_01.wss",
					1.7782794,
					1,
					50
				};
			};
			class scrubBuilding_02_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Scrub_Object_03.wss",
					1.5848932,
					1,
					50
				};
			};
			class scrubObject_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Scrub_Object_01.wss",
					1.7782794,
					1,
					50
				};
			};
			class scrubArmor_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Air\Uav_01\Uav_01_Scrub_Land_Ext.wss",
					1.7782794,
					1,
					50
				};
			};
			class Rain_Ext
			{
				sound[]=
				{
					"A3\Sounds_F_Orange\Vehicles\Shared\Rain\Vehicles_Rain_02.wss",
					2.5118864,
					1,
					15
				};
			};
		};
    };
};

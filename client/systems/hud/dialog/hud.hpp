﻿/*
	@file Version: 1.0
	@file Name: hud.hpp
	@file Author: [404] Deadbeat
	@file Created: 11/09/2012 04:23
	@file Args:
*/

#define hud_status_idc 3600
#define hud_vehicle_idc 3601

class WastelandHud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";
	
	class controlsBackground {
		class WastelandHud_Vehicle:w_RscText
		{
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
			y = safeZoneY + (safeZoneH * (1 - (0.30 / SafeZoneH)));
			w = 0.4;
			h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		class WastelandHud_Status:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.17 / SafeZoneW)));
			y = safeZoneY + (safeZoneH * (1 - (0.40 / SafeZoneH)));
			w = 0.14; 
			h = 0.40;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "<img size='2' image='client\icons\blood\hp_100.paa'/><br/>100 <img image='client\icons\water.paa'/><br/>200 <img image='\CA\misc\data\icons\picture_money_CA.paa'/>";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
	};
};

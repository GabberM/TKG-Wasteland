
//	@file Version: 1.0
//	@file Name: playerHud.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 11/09/2012 04:23
//	@file Args:

disableSerialization;
private["_ui","_hud","_food","_water","_healthICON","_foodICON","_waterICON"];

_healthICON = 100;
_foodICON = 100;
_waterICON = 100;

while {true} do
{
    1000 cutRsc ["WastelandHud","PLAIN"];
    _ui = uiNameSpace getVariable "WastelandHud";
    _vitals = _ui displayCtrl 3600;
    _hudVehicle = _ui displayCtrl 3601;
    
    //Calculate Health 0 - 100
    _decimalPlaces = 2;
    _health = damage player;
    _health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    _health = 100 - (_health * 100);
    
	if(_health <= 100 && _health > 75) then {
		_healthICON = 100;
	} else {
		if(_health <= 75 && _health > 50) then {
			_healthICON = 75;
		} else {
			if(_health <= 50 && _health > 25) then {
				_healthICON = 50;
			} else {
				if(_health <= 25 && _health > 0) then {
					_healthICON = 25;
				} else {
					_healthICON = 0;
				};
			};
		};
	};
	
	if(hungerLevel <= 100 && hungerLevel > 75) then {
		_foodICON = 100;
	} else {
		if(hungerLevel <= 75 && hungerLevel > 50) then {
			_foodICON = 75;
		} else {
			if(hungerLevel <= 50 && hungerLevel > 25) then {
				_foodICON = 50;
			} else {
				if(hungerLevel <= 25 && hungerLevel > 0) then {
					_foodICON = 25;
				} else {
					_foodICON = 0;
				};
			};
		};
	};
	
	if(thirstLevel <= 100 && thirstLevel > 75) then {
		_waterICON = 100;
	} else {
		if(thirstLevel <= 75 && thirstLevel > 50) then {
			_waterICON = 75;
		} else {
			if(thirstLevel <= 50 && thirstLevel > 25) then {
				_waterICON = 50;
			} else {
				if(thirstLevel <= 25 && thirstLevel > 0) then {
					_waterICON = 25;
				} else {
					_waterICON = 0;
				};
			};
		};
	};
	
	_vitals ctrlSetStructuredText parseText format ["
	<img size='2.5' image='client\icons\blood\hp_%1.paa'/><br/><br/>
	<img size='2.5' image='client\icons\food\fd_%2.paa'/><br/><br/>
	<img size='2.5' image='client\icons\water\trs_%3.paa'/><br/><br/>
	", _healthICON, _foodICON, _waterICON];
	
    _vitals ctrlCommit 0;
     
/*
    if(player != vehicle player) then
    {
        _tempString = "";
        _yOffset = 0.24;
        _vehicle = assignedVehicle player;

        {
            _tempString = format ["%1 %2 <img size='0.8' image='client\icons\arrow.paa'/><br/>",_tempString, (name _x)];
            _yOffset = _yOffset + 0.04;
        } forEach crew _vehicle;

        _hudVehicle ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _hudVehicle ctrlSetPosition [_x, _y, 0.4, 0.65];
        _hudVehicle ctrlCommit 0;
    };
*/
    sleep 1;
};
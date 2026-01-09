params ["_type"];

_display = findDisplay 3200002;
_ctrlGroup = _display displayCtrl 2300;

{
	ctrlDelete _x;
}forEach (allControls _ctrlGroup);


_class = typeOf ER32_previewVehicle;

_cfg = nil;
_features = [];
switch (_type) do {
	case 0: {
		_cfg = configfile >> "CfgVehicles" >> _class >> "TextureSources";
		_textureSources = "true" configClasses _cfg;
		
		{
			_sourceName = configName _x;
			_displayName = getText (_x >> "displayName");
			
			if (_displayName != "") then {
				_features pushBack [_sourceName,_displayName];
			};
		}forEach _textureSources;
	};
	case 1: {
		_cfg = configFile >> "CfgVehicles" >> _class >> "AnimationSources";
		_animationSources = "true" configClasses _cfg;
		
		{
			_sourceName = configName _x;
			_displayName = getText (_x >> "displayName");
			
			if (_displayName != "") then {
				_features pushBack [_sourceName,_displayName];
			};
		}forEach _animationSources;
	};
	case 2: {
		_features = ER32_previewVehicle getCompatiblePylonMagazines 0;
	};
	default {
		_cfg = configfile >> "CfgVehicles" >> _class >> "TextureSources";
		_textureSources = "true" configClasses _cfg;
		
		{
			_sourceName = configName _x;
			_displayName = getText (_x >> "displayName");
			
			if (_displayName != "") then {
				_features pushBack [_sourceName,_displayName];
			};
		}forEach _textureSources;
	};
};

_rowH = 0.035;
_y = 0;

hint format ["%1",_features];

_map = missionNamespace getVariable ["ER32_selectedAnimationStates", createHashMap];

_checkboxes = [];
{
	_sourceName = _x select 0;
	_displayName = _x select 1;
	
	if (_type == 2) then {
		_displayName = _sourceName;
	};
	
	_phase = [0,1] select _checked; 
	
	_phase = if (_map in [_map]) then {_map getOrDefault [_sourceName, -1]} else {-1};
	if (_phase < 0) then {_phase = ER32_previewVehicle animationSourcePhase _sourceName;};
	
	_sourceName cbChecked (_phase > 0.5);
	
	uiNamespace setVariable ["ER32_uiSync", true];
	
	_chk = _display ctrlCreate ["RscCheckBox", -1, _ctrlGroup];
	_txt = _display ctrlCreate ["RscText", -1, _ctrlGroup];
	
	_selected = missionNamespace getVariable ["ER32_selectedTextureSource",""];
	
	if (_sourceNamme isEqualTo _selected) then {
		_chk cbSetChecked true;
	};
	
	_chk ctrlSetPosition [0,_y,0.03,_rowH];
	_chk ctrlCommit 0;
	
	_txt ctrlSetPosition [0.04,_y,0.14,_rowH];
	_txt ctrlSetText _displayName;
	_txt ctrlCommit 0;
	
	_y = _y + _rowH;
	
	_chk setVariable ["ER32_Garage_source", _sourceName];
	_chk setVariable ["ER32_Garage_type", _type];
	
	_chk ctrlAddEventHandler ["CheckedChanged", {
		params ["_ctrl", "_checked"];
		
		if (uiNamespace getVariable ["ER32_uiSync", false]) exitWith {};
		
		_type = _ctrl getVariable ["ER32_Garage_type",0];
		_sourceName = _ctrl getVariable ["ER32_Garage_source",""];
		
		_group = ctrlParentControlsGroup _ctrl;
		
		{
			if ((_x != _ctrl) && (_type == 0)) then {
				_x cbSetChecked false;
			};
		}forEach (_group getVariable ["textureCheckboxes", []]);
		
		
		_vehicle = ER32_previewVehicle;
		switch (_type) do {
			case 0: {
				[_vehicle, [_ctrl getVariable "ER32_Garage_source", 1]] call BIS_fnc_initVehicle;
				missionNamespace setVariable ["ER32_selectedTextureSource", _sourceName];
			};
			case 1: {
				
				_vehicle animateSource [_sourceName, _phase, true];
				_map = missionNamespace getVariable ["ER32_selectedAnimationStates", createHashMap];
				_map set [_src, _phase];
				missionNamespace setVariable ["ER32_selectedAnimationStates", _map];
			};
		};
	}];
	
	_checkboxes pushBack _chk;
}forEach _features;

_ctrlGroup setVariable ["textureCheckboxes", _checkboxes];
uiNamespace setVariable ["ER32_uiSync", false];



params ["_type"];

private _display = findDisplay 3200002;
if (isNull _display) exitWith {};

private _ctrlGroup = _display displayCtrl 2300;
if (isNull _ctrlGroup) exitWith {};

// Clear old rows
{ ctrlDelete _x } forEach (allControls _ctrlGroup);

private _vehicle = ER32_previewVehicle;
private _class = typeOf _vehicle;

private _features = [];

switch (_type) do {

    // 0 = Textures (TextureSources)
    case 0: {
        private _cfg = configFile >> "CfgVehicles" >> _class >> "TextureSources";
        {
            private _sourceName = configName _x;
            private _displayName = getText (_x >> "displayName");
            if (_displayName != "") then {
                _features pushBack [_sourceName, _displayName];
            };
        } forEach ("true" configClasses _cfg);
    };

    // 1 = Attachments (AnimationSources with displayName)
    case 1: {
        private _cfg = configFile >> "CfgVehicles" >> _class >> "AnimationSources";
        {
            private _sourceName = configName _x;
            private _displayName = getText (_x >> "displayName");
            if (_displayName != "") then {
                _features pushBack [_sourceName, _displayName];
            };
        } forEach ("true" configClasses _cfg);
    };

    // 2 = Pylons (not checkbox UI)
    case 2: {
        private _features = ER32_previewVehicle getCompatiblePylonMagazines 0;
    };

    default {
        // fallback to textures
        [_type] call ER32_fnc_garage_buildFeatureList;
        if (true) exitWith {};
    };
};

private _rowH = 0.035;
private _y = 0;

if (_type < 2) then {
	
	private _selectedTexture = missionNamespace getVariable ["ER32_selectedTextureSource", ""];
	private _animMap = missionNamespace getVariable ["ER32_selectedAnimationStates", createHashMap];
	
	private _checkboxes = [];
	{
		private _sourceName  = _x select 0;
		private _displayName = _x select 1;

		// Create controls
		private _chk = _display ctrlCreate ["RscCheckBox", -1, _ctrlGroup];
		private _txt = _display ctrlCreate ["RscText", -1, _ctrlGroup];

		// Position (relative to controlsGroup)
		_chk ctrlSetPosition [0, _y, 0.03, _rowH];
		_chk ctrlCommit 0;

		_txt ctrlSetPosition [0.04, _y, 0.14, _rowH];
		_txt ctrlSetText _displayName;
		_txt ctrlCommit 0;

		// Store metadata on checkbox
		_chk setVariable ["ER32_Garage_type", _type];
		_chk setVariable ["ER32_Garage_source", _sourceName];

		// Restore checked state (IMPORTANT)
		uiNamespace setVariable ["ER32_uiSync", true];

		if (_type == 0) then {
			// Textures: check the stored selected source
			_chk cbSetChecked (_sourceName isEqualTo _selectedTexture);
		};

		if (_type == 1) then {
			// Animations: check stored phase if exists; else read current preview
			private _phase = _animMap getOrDefault [_sourceName, -1];
			if (_phase < 0) then { _phase = _vehicle animationSourcePhase _sourceName; };
			_chk cbSetChecked (_phase > 0.5);
		};

		uiNamespace setVariable ["ER32_uiSync", false];

		// Event handler
		_chk ctrlAddEventHandler ["CheckedChanged", {
			params ["_ctrl", "_checked"];
			if (uiNamespace getVariable ["ER32_uiSync", false]) exitWith {};

			private _type = _ctrl getVariable ["ER32_Garage_type", 0];
			private _src  = _ctrl getVariable ["ER32_Garage_source", ""];

			private _veh = ER32_previewVehicle;

			switch (_type) do {

				// Textures: radio selection
				case 0: {
					if (_checked == 0) exitWith {}; // ignore unchecking the active one

					// Uncheck others in this list
					private _group = ctrlParentControlsGroup _ctrl;
					{
						if (_x != _ctrl) then { _x cbSetChecked false; };
					} forEach (_group getVariable ["textureCheckboxes", []]);

					// Apply + store
					[_veh, [_src, 1]] call BIS_fnc_initVehicle;
					missionNamespace setVariable ["ER32_selectedTextureSource", _src];
				};

				// Animations: independent toggles
				case 1: {
					private _phase = [0, 1] select _checked;

					_veh animateSource [_src, _phase, true];

					private _map = missionNamespace getVariable ["ER32_selectedAnimationStates", createHashMap];
					_map set [_src, _phase];
					missionNamespace setVariable ["ER32_selectedAnimationStates", _map];
				};
			};
		}];

		_checkboxes pushBack _chk;

		_y = _y + _rowH;

	} forEach _features;

	// Needed for texture radio-uncheck logic
	_ctrlGroup setVariable ["textureCheckboxes", _checkboxes];
}else{
	uiNamespace setVariable ["ER32_uiSync", true];
	
	private _currentPylonMagazines = getPylonMagazines _vehicle;
	private _pylonCount = count _currentPylonMagazines;
	
	private _storedPylons = missionNamespace getVariable ["ER32_selectedPylonLoadout", []];
	
	if ((count _storedPylons) != _pylonCount) then {_storedPylons = +_currentPylonMagazines;};
	
	for "_slot" from 1 to _pylonCount do {
		private _label = format ["Pylon %1", _slot];
		
		//Label
		private _txt = _display ctrlCreate ["RscText", -1, _ctrlGroup];
		_txt ctrlSetPosition [0, _y, 0.07, _rowH];
		_txt ctrlSetText _label;
		_txt ctrlCommit 0;
		
		//Combo
		private _combo = _display ctrlCreate ["RscCombo", -1, _ctrlGroup];
		_combo ctrlSetPosition [0.075, _y, 0.105, _rowH];
		_combo ctrlCommit 0;
		
		_combo setVariable ["ER32_PylonSlot", _slot];
		
		//Fill options
		lbClear _combo;
		private _idxEmpty = _combo lbAdd "Empty";
		_combo lbSetData [_idxEmpty, ""];
		
		private _choices = _vehicle getCompatiblePylonMagazines _slot;
		
		{
			private _mag = _x;
			private _dn = getText (configFile >> "CfgMagazines" >> _mag >> "displayName");
			if (_dn == "") then {_dn = _mag;};
			
			private _i = _combo lbAdd _dn;
			_combo lbSetData [_i, _mag];
		}forEach _choices;
		
		//Select stored/current
		private _wanted = _stored select (_slot -1);
		private _selectIndex = 0;
		
		for "_i" from 0 to (lbSize _combo - 1) do {
			if ((_combo lbData _i) isEqualTo _wanted) exitWith {_selectIndex = _i;};
		};
		_combo lbSetCurSel _selectIndex;
		
		//Apply on change
		_combo ctrlAddEventHandler ["LBSelChanged", {
			params ["_ctrl", "_index"];
			if (uiNamespace getVariable ["ER32_uiSync", false]) exitWith {};
			
			private _vehicle = ER32_previewVehicle;
			private _slot = _ctrl getVariable ["ER32_PylonSlot", 1];
			private _mag = _ctrl lbData _index;;
			
			missionNamespace setVariable ["ER32_selectedPylonLoadout", getPylonMagazines _vehicle];
		}];
		
		_y = _y + _rowH;
	};
	
	uiNamespace setVariable ["ER32_uiSync", false];
};
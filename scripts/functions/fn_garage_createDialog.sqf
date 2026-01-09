_display = findDisplay 3200001;
_listbox_vehicles = _display displayCtrl 1500;
_index = lbCurSel _listbox_vehicles;

if (_index < 0) exitWith {hint "No Vehicle selected!"};

_newClass = typeOf ER32_previewVehicle;
_oldClass = missionNamespace getVariable ["ER32_selectedVehicleClass",""];

if (_oldClass isNotEqualTo _newClass) then {
	missionNamespace setVariable ["ER32_selectedTextureSource", ""];
	missionNamespace setVariable ["ER32_selectedAnimationStates", createHashMap];
	missionNamespace setVariable ["ER32_selectedPylonLoadout", []];
};

missionNamespace setVariable ["ER32_selectedVehicleClass", _newClass];

createDialog "ER32_Garage";

/*
	0 ... Textures
	1 ... Attachments
	2 ... Pylons
*/

[0] call ER32_fnc_garage_buildFeatureList;


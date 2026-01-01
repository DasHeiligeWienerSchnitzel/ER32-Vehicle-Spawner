params ["_control", "_index"];

if (_index < 0) exitWith {};

_display = findDisplay 3200001;

_edit_ammo_amount = _display displayCtrl 1400;
_dropdown_magazines = _display displayCtrl 2100;
_listbox_vehicles = _display displayCtrl 1500;

_index_ammo = lbCurSel _dropdown_magazines;
_index_vehicle = lbCurSel _listbox_vehicles;

_ammoClass = _dropdown_magazines lbData _index_ammo;
_vehicleClass = _listbox_vehicles lbData _index_vehicle;

_magazines = getArray (configFile >> "CfgVehicles" >> _vehicleClass >> "Turrets" >> "MainTurret" >> "magazines");

_magCounts = {_x isEqualTo _ammoClass} count _magazines;


ER32_ignoreEditChange = true;
_edit_ammo_amount ctrlSetText str _magCounts;
ER32_ignoreEditChange = false;
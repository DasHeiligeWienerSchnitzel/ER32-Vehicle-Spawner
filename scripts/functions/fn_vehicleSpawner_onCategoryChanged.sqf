params ["_control", "_index"];

if (_index < 0) exitWith {};

private _display = findDisplay 3200001;
private _listbox_vehicles = _display displayCtrl 1500;
lbClear _listbox_vehicles;

// selected category from category listbox
private _selectedCategory = _control lbData _index;

// loop predefined list
{
    private _vehicleClass = _x select 0;
    private _category     = _x select 1;

    if (_category isEqualTo _selectedCategory) then {
        private _displayName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");
        private _lbIndex = _listbox_vehicles lbAdd _displayName;
        _listbox_vehicles lbSetData [_lbIndex, _vehicleClass];
    };
} forEach ER32_vehicleList;

_display = findDisplay 3200001;
_listbox_vehicles = _display displayCtrl 1500;
_listbox_cargo = _display displayCtrl 1503;
_text_cargo_amount = _display displayCtrl 1010;
_index = lbCurSel _listbox_vehicles;

if (_index < 0) exitWith {};

_vehicle_class = _listbox_vehicles lbData _index;
_cargo_space = getNumber (configFile >> "CfgVehicles" >> _vehicle_class >> "ace_cargo_space");
_listbox_cargo_size = lbSize _listbox_cargo;

_names = ER32_list apply {_x select 0};

_combined_cargo_size = 0;
for "_i" from 0 to (_listbox_cargo_size - 1) do {
	_listbox_cargo_entry = _listbox_cargo lbData _i;
	_index = _names find _listbox_cargo_entry;
	_var = (ER32_list select _index) select 1;
	_cargo_size = getNumber (configFile >> "CfgVehicles" >> _var >> "ace_cargo_size");
	_combined_cargo_size = _combined_cargo_size + _cargo_size;
};

_text = format ["%1/%2",_combined_cargo_size,_cargo_space - 1];
_text_cargo_amount ctrlSetText _text;

if (_combined_cargo_size > _cargo_space) then {
	_text_cargo_amount ctrlSetTextColor [1,0,0,1];
}else{
	_text_cargo_amount ctrlSetTextColor [1,1,1,1];
};
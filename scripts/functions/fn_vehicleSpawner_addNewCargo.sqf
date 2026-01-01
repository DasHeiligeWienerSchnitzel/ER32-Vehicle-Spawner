_display = findDisplay 3200001;
_dropdown_cargo = _display displayCtrl 2101;
_index = lbCurSel _dropdown_cargo;
_selected_cargo = ER32_list select _index;

_listbox_cargo = _display displayCtrl 1503;
_index = _listbox_cargo lbAdd (_selected_cargo select 0);
_listbox_cargo lbSetData [_index, _selected_cargo select 0];

call ER32_fnc_vehicleSpawner_updateCargoAmount;
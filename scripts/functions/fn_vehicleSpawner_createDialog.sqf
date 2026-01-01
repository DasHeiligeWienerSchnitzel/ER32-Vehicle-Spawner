createDialog "ER32_VehicleSpawner";	
_display = findDisplay 3200001;



//Create Preview Camera
ER32_previewCamera = "camera" camCreate [0,0,0];
ER32_previewCamera cameraEffect ["Internal", "Back", "ER32_pip"];

ER32_previewCamera camSetFov 0.5;
ER32_previewCamera camCommit 0;



//Listbox Categories
_listbox_categories = _display displayCtrl 1501;
lbClear _listbox_categories;


_categories = [];
{
	//_category = getText (configFile >> "CfgVehicles" >> _x >> "vehicleClass");
	_categories pushBack (_x select 1);
} forEach ER32_vehicleList;

_categories = _categories arrayIntersect _categories;

{
	_index = _listbox_categories lbAdd _x;
	_listbox_categories lbSetData [_index, _x];
} forEach _categories;

_listbox_categories lbSetCurSel 0;



//Listbox Spawnpoints
_listbox_spawnpoints = _display displayCtrl 1502;
lbClear _listbox_spawnpoints;

{
	_index = _listbox_spawnpoints lbAdd (_x select 0);
	_listbox_spawnpoints lbSetData [_index, _x select 0];
} forEach ER32_spawnpoints;

_listbox_spawnpoints lbSetCurSel 0;



//Cargo Categories
_dropdown_cargo = _display displayCtrl 2101;
lbClear _dropdown_cargo;

{
	_index = _dropdown_cargo lbAdd (_x select 0);
	_dropdown_cargo lbSetData [_index, _x select 0];
} forEach ER32_list;

_dropdown_cargo lbSetCurSel 0;
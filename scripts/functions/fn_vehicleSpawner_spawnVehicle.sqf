_display = findDisplay 3200001;
_listbox_vehicles = _display displayCtrl 1500;
_index = lbCurSel _listbox_vehicles;
_classname = _listbox_vehicles lbData _index;



//Check if spawnpoint is blocked
_listbox_spawnpoints = _display displayCtrl 1502;
_index = lbCurSel _listbox_spawnpoints;
_spawnpoint = (ER32_spawnpoints select _index) select 1;

_nearestObjects = nearestObjects [_spawnpoint, [], 5];

if (count _nearestObjects > 1) exitWith {hint "Spawn Point Obstructed"};



///Spawn Vehicle
_vehicle = createVehicle [
	_classname,
	position _spawnpoint,
	[],
	0,
	"CAN_COLLIDE"
];



//Clear Inventory
_checkbox_clearInventory = _display displayCtrl 2800;
_checked = cbChecked _checkbox_clearInventory;
if (_checked == true) then {
	clearItemCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
};



//Ammo
{
    _vehicle removeMagazineTurret [_x select 0, _x select 1, _x select 2];
} forEach magazinesAllTurrets _vehicle;

{
    _vehicle addMagazineTurret [_x select 0, _x select 1, _x select 2];
} forEach magazinesAllTurrets ER32_previewVehicle;



//Add Cargo
_listbox_cargo_size = lbSize 1503;
_cargo_space = getNumber (configFile >> "CfgVehicles" >> _classname >> "ace_cargo_space");
_maximum_cargo = _listbox_cargo_size min _cargo_space;

//[_vehicle,_maximum_cargo] call ace_cargo_fnc_setSize;
//hint format ["%1\n%2\n%3",_listbox_cargo_size,_cargo_space - 1,_maximum_cargo];

for "_i" from 0 to (_maximum_cargo - 1) do {
	_cargo_selection_name = lbData [1503,_i];
	_names = ER32_list apply {_x select 0};
	_list_index = _names find _cargo_selection_name;
	_cargo_selection = ER32_list select _list_index;
	_cargo_classname = _cargo_selection select 1;
	_cargo_inventory = _cargo_selection select 2;
		
	_cargo = createVehicle [
		_cargo_classname,
		position _vehicle,
		[],
		0,
		"NONE"
	];
	
	if (count _cargo_inventory > 0) then {
		clearItemCargoGlobal _cargo;
		clearWeaponCargoGlobal _cargo;
		clearMagazineCargoGlobal _cargo;
		clearBackpackCargoGlobal _cargo;	
			
		{
			_ItemClass = _x select 0;
						
			if (isClass (configFile >> "CfgWeapons" >> _ItemClass)) then {
				if (getNumber (configFile >> "CfgWeapons" >> _ItemClass >> "type") == 0) then {
					_cargo addItemCargoGlobal _x;
				}else{
					_cargo addWeaponCargoGlobal _x;
				};
			}else{
				if (isClass (configFile >> "CfgMagazines" >> _ItemClass)) then {
					_cargo addMagazineCargoGlobal _x;
				}else{
					if (isClass (configFile >> "CFGVehicles" >> _ItemClass >> "isBackpack")) then {
						_cargo addBackpackCargoGlobal _x;
					};
				};
			};
		} forEach _cargo_inventory;
	};
	
	[_cargo, _vehicle] call ace_cargo_fnc_loadItem;
};
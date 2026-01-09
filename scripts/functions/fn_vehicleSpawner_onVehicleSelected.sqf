params ["_control", "_index"];

if (_index < 0) exitWith {};

_display = findDisplay 3200001;
_listbox_vehicles = _display displayCtrl 1500;

_vehicleClass = _control lbData _index;


if (!isNil "ER32_previewVehicle") then {
	deleteVehicle ER32_previewVehicle;
};

_previewLocation = [0,0,0];
if (count ER32_previewLocations > 0) then {
	_vehicleList_index = ER32_vehicleList findIf {(_x select 0) == _vehicleClass};
	_previewLocationType = (ER32_vehicleList select _vehicleList_index) select 2;
	_previewLocation = ER32_previewLocations select _previewLocationType;
	//hint format ["%1\n%2\n%3\n%4",_vehicleClass,_vehicleList_index,_previewLocationType,_previewLocation];
};



ER32_previewVehicle = createVehicleLocal [
	_vehicleClass,
	_previewLocation,
	[],
	0,
	"CAN_COLLIDE"
];

ER32_previewVehicle enableSimulation false;
ER32_previewVehicle allowDamage false;



///Positioning Camera
private _bbox = boundingBoxReal ER32_previewVehicle;
private _size = (_bbox#1#1) max (_bbox#1#0);
private _distance = _size * 2.5;

ER32_previewCamera cameraEffect ["Internal", "Back", "ER32_pip"];
ER32_previewCamera camSetTarget ER32_previewVehicle;
ER32_previewCamera camSetRelPos [0, _distance, _size * 0.6];
ER32_previewCamera camCommit 0;




//Magazines
_dropdown_magazines = _display displayCtrl 2100;
lbClear _dropdown_magazines;

_magazines = getArray (configFile >> "CfgVehicles" >> _vehicleClass >> "Turrets" >> "MainTurret" >> "magazines");
_magazines = _magazines arrayIntersect _magazines;


{
	_index = _dropdown_magazines lbAdd _x;
	_dropdown_magazines lbSetData [_index, _x];
} forEach _magazines;

_dropdown_magazines lbSetCurSel 0;

call ER32_fnc_vehicleSpawner_onAmmoChanged;
call ER32_fnc_vehicleSpawner_updateCargoAmount;
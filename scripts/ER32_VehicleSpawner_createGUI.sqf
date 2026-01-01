params ["_spawner"];

_spawner addAction [
	"Spawn Vehicle",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		call ER32_fnc_VehicleSpawner_createDialog;
	},
	nil,
	1.5,
	true,
	true,
	"",
	"true",
	5
];
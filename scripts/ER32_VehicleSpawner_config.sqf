/*
List Structure: [classname,category,type]
Type:
	0 ... land
	1 ... air
	2 ... water
*/

ER32_vehicleList = [
	["B_MRAP_01_F",							"Car",		0],
	["B_MRAP_01_gmg_F",						"Car",		0],
	["B_MRAP_01_hmg_F",						"Car",		0],
	["B_LSV_01_unarmed_F",					"Car",		0],
	["B_LSV_01_AT_F",						"Car",		0],
	["B_LSV_01_armed_F",					"Car",		0],
	["B_Quadbike_01_F",						"Car",		0],
	["B_APC_Wheeled_01_cannon_F",			"APC",		0],
	["B_APC_Tracked_01_CRV_F",				"Support",	0],
	["B_Heli_Light_01_F",					"Air",		1],
	["B_Heli_Light_01_dynamicLoadout_F",	"Air",		1],
	["B_Heli_Attack_01_dynamicLoadout_F",	"Air",		1],
	["B_Boat_Armed_01_minigun_F",			"Boat",		2]
];

//[Display Name, Variable Name]
ER32_spawnpoints = [
	["Vehicle Spawnpoint 1",vehicle_spawnpoint_1],
	["Vehicle Spawnpoint 2",vehicle_spawnpoint_2],
	["Vehicle Spawnpoint 3",vehicle_spawnpoint_3]
];

//Leave array empty to use [0,0,0] location.
ER32_previewLocations = [ER32_previewLocation_land,ER32_previewLocation_air,ER32_previewLocation_water];
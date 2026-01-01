if (!isNil "ER32_previewVehicle") then {
	deleteVehicle ER32_previewVehicle;
	ER32_previewVehicle = nil;
};

if (!isNil "ER32_previewCamera") then {
	camDestroy ER32_previewCamera;
	ER32_previewCamera = nil;
};
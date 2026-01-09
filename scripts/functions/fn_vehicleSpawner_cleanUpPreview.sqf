if (!isNil "ER32_previewVehicle") then {
	deleteVehicle ER32_previewVehicle;
	ER32_previewVehicle = nil;
};

if (!isNil "ER32_previewCamera") then {
	ER32_previewCamera cameraEffect ["Terminate", "Back"];
	camDestroy ER32_previewCamera;
	ER32_previewCamera = nil;
};
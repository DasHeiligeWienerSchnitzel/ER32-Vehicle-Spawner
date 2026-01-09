if (!isNil "ER32_previewCamera" && {!isNull ER32_previewCamera}) then {
    ER32_previewCamera cameraEffect ["Terminate","Back"];
    camDestroy ER32_previewCamera;
    ER32_previewCamera = nil;
};

ER32_previewCamera = "camera" camCreate [0,0,0];
ER32_previewCamera camSetFov 0.5;
ER32_previewCamera cameraEffect ["Internal", "Back", "ER32_pip"];
ER32_previewCamera camCommit 0;

private _disp = findDisplay 3200001;
diag_log format ["ER32 initPreviewCamera: display=%1", _disp];

if (!isNull _disp) then {
    private _pic = _disp displayCtrl 1200;
    diag_log format ["ER32 initPreviewCamera: pic=%1", _pic];

    if (!isNull _pic) then {
        _pic ctrlSetText "#(argb,512,512,1)r2t(ER32_pip,1)";
    };
};
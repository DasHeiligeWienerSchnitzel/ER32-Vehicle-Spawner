class ER32_VehicleSpawner
{
	idd = 3200001
	movingEnabled = 0;
	enableSimulation = 1;
	
	onUnload = "call ER32_fnc_cleanUpPreview";
	
	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Schnitzel, v1.063, #Mahujo)
		////////////////////////////////////////////////////////

		class ER32_VehicleSpawner_Text_Background: RscText
		{
			idc = 1000;

			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.4};
		};
		class ER32_VehicleSpawner_Text_Header: RscText
		{
			idc = 1001;

			text = "Vehicle Spawner"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,0,0.8};
		};
		class ER32_VehicleSpawner_Picture_PIP: RscPicture
		{
			idc = 1200;

			text = "#(argb,512,512,1)r2t(ER32_pip,1)";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class ER32_VehicleSpawner_Frame: RscFrame
		{
			idc = 1800;

			text = "Preview Window"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.264 * safezoneH;
		};
		class ER32_VehicleSpawner_ListBox: RscListBox
		{
			idc = 1500;
			onLBSelChanged = "_this call ER32_fnc_vehicleSpawner_onVehicleSelected";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.4};
		};
		class ER32_VehicleSpawner_Frame_Selector: RscFrame
		{
			idc = 1801;

			text = "Vehicle Selector"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class ER32_VehicleSpawner_Button_Spawn: RscButton
		{
			idc = 1600;
			action = "call ER32_fnc_vehicleSpawner_spawnVehicle";

			text = "Spawn"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0.7,0,0.8};
		};
		class ER32_VehicleSpawner_Listbox_Categories: RscXListBox
		{
			idc = 1501;
			onLBSelChanged = "_this call ER32_fnc_vehicleSpawner_onCategoryChanged";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ER32_VehicleSpawner_Listbox_Spawnpoints: RscXListBox
		{
			idc = 1502;
			onLBSelChanged = "_this call ER32_fnc_vehicleSpawner_onSpawnpointChanged";

			x = 0.303547 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ER32_VehicleSpawner_Frame_Spawnpoints: RscFrame
		{
			idc = 1802;

			text = "Spawnpoint"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ER32_VehicleSpawner_Button_X: RscButton
		{
			idc = 1601;
			action = "closeDialog 2";
			text = "X"; //--- ToDo: Localize;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,0.8};
		};
		class ER32_VehicleSpawner_Slider_Preview: RscSlider
		{
			idc = 1900;
			onSliderPosChanged = "call ER32_fnc_vehicleSpawner_previewSlider";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class ER32_VehicleSpawner_Background_Slider_Preview: RscText
		{
			idc = 1005;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class ER32_VehicleSpawner_Frame_Slider_Preview: RscFrame
		{
			idc = 1803;
			text = "Rotation"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ER32_VehicleSpawner_Checkbox_ClearInventory: RscCheckbox
		{
			idc = 2800;
			checked = 1;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ER32_VehicleSpawner_Textbox_ClearInventory: RscText
		{
			idc = 1006;
			text = "Clear Inventory"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class ER32_VehicleSpawner_Background_Checkbox_ClearInventory: RscText
		{
			idc = 1007;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class ER32_VehicleSpawner_Dropdown_Ammo: RscCombo
		{
			idc = 2100;
			onLBSelChanged = "_this call ER32_fnc_vehicleSpawner_onAmmoChanged";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ER32_VehicleSpawner_Edit_Ammo: RscEdit
		{
			idc = 1400;
			onEditChanged = "_this call ER32_fnc_onAmmoEditChanged";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class ER32_VehicleSpawner_Frame_Ammo: RscFrame
		{
			idc = 1804;
			text = "Ammo Type"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ER32_VehicleSpawner_Frame_AmmoAmount: RscFrame
		{
			idc = 1805;
			text = "Amount"; //--- ToDo: Localize;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ER32_VehicleSpawner_Listbox_Cargo: RscListBox
		{
			idc = 1503;

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class ER32_VehicleSpawner_Dropdown_Cargo: RscCombo
		{
			idc = 2101;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ER32_VehicleSpawner_Button_Cargo: RscButton
		{
			idc = 1602;
			text = "Add"; //--- ToDo: Localize;
			action = "call ER32_fnc_vehicleSpawner_addNewCargo";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.2,0.3,0.38,0.8};
		};
		class ER32_VehicleSpawner_Text_Cargo_Amount: RscText
		{
			idc = 1010;
			style = ST_CENTER;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.8};
		};
		class ER32_VehicleSpawner_52Stuff: RscButton
		{
			idc = 1603;
			text = "5-2 Stuff"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0,70,0.8};
		};
		class ER32_VehicleSpawner_Button_Garage: RscButton
		{
			idc = 1604;
			text = "Garage"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class ER32_VehicleSpawner_Button_Cargo_RemoveAll: RscButton
		{
			idc = 1605;
			text = "Remove all"; //--- ToDo: Localize;
			action = "true call ER32_fnc_vehicleSpawner_removeEntry";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,-1,-1,0.8};
		};
		class ER32_VehicleSpawner_Button_Cargo_RemoveSelected: RscButton
		{
			idc = 1606;
			text = "Remove selected"; //--- ToDo: Localize;
			action = "false call ER32_fnc_vehicleSpawner_removeEntry";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,-1,-1,0.8};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};



params ["_control", "_index"];

if (_index < 0) exitWith {};

_display = findDisplay 3200001;
_listbox_spawnpoint = _display displayCtrl 1502;

_selected_spawnpoint = (ER32_spawnpoints select _index) select 1;

_nearestObjects = nearestObjects [_selected_spawnpoint, [], 5];

if (count _nearestObjects > 1) then {
	_listbox_spawnpoint lbSetColor [_index, [1,0,0,1]];
}else{
	_listbox_spawnpoint lbSetColor [_index, [0,1,0,1]];
};
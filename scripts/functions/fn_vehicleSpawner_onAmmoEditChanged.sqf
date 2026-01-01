params ["_ctrl", "_requestedAmount"];

if (!isNil "ER32_ignoreEditChange" && {ER32_ignoreEditChange}) exitWith {};

_request = parseNumber _requestedAmount;
if (_request < 0) exitWith {};

_display = findDisplay 3200001;

_dropdown_magazines = _display displayCtrl 2100;
_index_magazine = lbCurSel _dropdown_magazines;

if (_index_magazine < 0) exitWith {};

_magClass = _dropdown_magazines lbData _index_magazine;

_currentAmount = {_x isEqualTo _magClass} count magazinesAllTurrets ER32_previewVehicle;

_chars = toArray _requestedAmount;
_digits = [];

{
	if (_x >= 48 && _x <= 57) then {
		_digits pushBack _x;
	};
} forEach _chars;

if (_digits isEqualTo []) exitWith {};


_newAmount = parseNumber (toString _digits);

_difference = _newAmount - _currentAmount;

if (_difference > 0) then {
	for "_i" from 1 to _difference do {
		ER32_previewVehicle addMagazineTurret [_magClass, [-1]];
	};
};

if (_difference < 0) then {
	for "_i" from 1 to (-_difference) do {
		ER32_previewVehicle removeMagazineTurret [_magClass, [-1]];
	};
};
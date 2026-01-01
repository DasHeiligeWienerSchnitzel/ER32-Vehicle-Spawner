params ["_removeAll"];

if (_removeAll == true) then {
	lbClear 1503;
}else{
	lbDelete [1503, lbCurSel 1503];
};
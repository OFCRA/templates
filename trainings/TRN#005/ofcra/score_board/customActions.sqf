doNothing = {
	// ne fait rien
	hint "GO";
};

doAddIA2Group = {
	private["_name","_tgt"];
	_name = _this select 0;
	
	_tgt = missionNamespace getVariable [_name, objNull];
	_tgt joinAs [(group player), 3];
	_tgt setskill ["endurance",1];
	_tgt setskill ["courage",1];
	_tgt setskill ["general",1];
};
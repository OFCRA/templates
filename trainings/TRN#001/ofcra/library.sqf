////////// NE PAS TOUCHER EN DESSOUS

ofcra_fnc_log = {
	private ["_msg", "_level"];
	_msg  = _this select 0;
	_level = _this select 1;
	
	[_msg,"systemChat",true,true] call BIS_fnc_MP;
	_log_line = '[OFCRA] ' + _level + ': ' + _msg;
	diag_log  _log_line;
};


ofcra_fnc_cargo_opening_end_mission = {
	private ["_opener", "_cargo"];
	_cargo = _this select 0;
	_opener = _this select 1;
	_side = side _opener;
	
	hint format ['%1 a ouvert %2',(name (_opener)),(str _cargo)];
	if (_side == west) then {
		[] call ofcra_scoreboard_display;
	}
};


ofcra_fnc_mission_end = {
	createdialog "ScoreBoard";
	waitUntil { !dialog };
};


ofcra_scoreboard_display = {
	[[],"ofcra_fnc_mission_end",true,true] call BIS_fnc_MP;
};


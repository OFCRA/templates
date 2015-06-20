////// CONFIGURATION MISSION_TOOLKIT OFCRA

// gears_infantry: équipement automatisé des infanteries
OFCRA_GI_UNITES_CIBLES = "HUMAINS+IA";			// parmi {HUMAINS+IA|HUMAINS}
OFCRA_GI_LISTE_INFANTERIE_EXCEPTIONS = ["journaliste", "civ"];		// tableau de noms d'unités entre-guillemets à ne pas équiper, ex: ["nom1", "nom2"]
OFCRA_GI_TENUES_BLUEFOR = "UCP";			// parmi {UCP|OCP|SOC|MARPAT_WOOD|MARPAT_DESERT}
OFCRA_GI_TENUES_REDFOR = "VDV";				// parmi {VDV|VDV-M|MSV_DIGITAL|MSV_FLORA|M88}

// gears_vehicles: équipement automatisé des véhicules
OFCRA_GV_LISTE_VEHICULES_EXCEPTIONS = [];		// tableau de noms d'unités véhicules entre-guillemets à ne pas équiper le cargo, ex: ["nom1", "nom2"]

// score_board: définition du tableau des scores et des objectifs
OFCRA_SC_DUREE_MISSION = [0, 30, 0]; // [heures, minutes, secondes], ex: [1,30,15] pour une durée d' 1h30min15s avant l'affichage du tableau des scores

doAddIA2Group = {
	private["_name","_tgt"];
	_name = _this select 0;
	
	_tgt = missionNamespace getVariable [_name, objNull];
	_tgt joinAs [(group player), 12];
	_tgt setskill ["endurance",1];
	_tgt setskill ["courage",1];
	_tgt setskill ["general",1];
};

OFCRA_SC_LISTE_OBJECTIFS = [
	[30, "REDFOR", "ACTION", "Libérer de ses liens", "journaliste", 0, {["journaliste"] call doAddIA2Group;} ],
	[70, "REDFOR", "DANS_ZONE", "Journaliste en zone d'extraction", "lz", ["LISTE",["journaliste"]]],
	[100, "BLUEFOR", "HORS_ZONE", "Journaliste non libéré", "lz", ["LISTE",["journaliste"]]],
	//[-200, "BLUEFOR", "ACTION", "Journaliste assasiné", "journaliste", 0, {[] call doNothing;} ]
	[-200, "BLUEFOR", "PENALITE", "Journaliste assasiné"]
];


////// CONFIGURATION ADDONS EXTERNES

// TAW_VIEWDISTANCE
tawvd_disablenone = true;
tawvd_maxRange = 6000;

// TASK FORCE ARROWHEAD RADIO
TF_no_auto_long_range_radio = 1;



//// EXECUTION MISSION_TOOLKIT OFCRA
// si vous commentez la ligne ci-dessous, le mission_toolkit sera inactif
execVM "OFCRA\ofcra.sqf"; 



if (isServer) then {
	checkNoCheat = {
		private["_target","_victim","_killer","_res","_dist"];
		_victim = _this select 0;
		_killer = _this select 1;
		_safeDist = 20;
		_res = false;
		_resF = false;
		_target = missionNamespace getVariable [_victim , objNull];
		_smallestDist = 9999999;
		_smallestMan = 0;
		
		_kdist = _target distance _killer;
		[(name _killer) + " has shot at " + (str _kdist), "INFO"] call ofcra_fnc_log;
		
		if (_kdist > _safeDist) then {
			{
				_dist = _target distance _x;
				if ((_dist < _smallestDist) and (side _x == east) and (alive _x)) then {
					_smallestDist = _dist;
					_smallestMan = name _x;
				};
			} forEach allUnits;
			["Friend '" + _smallestMan + "' was the closest allied: " + (str _smallestDist) + " m.", "INFO"] call ofcra_fnc_log;
		};
		if ((_kdist < _safeDist) or (_kdist < _smallestDist) or (_safeDist < _smallestDist)) then {
			ofcra_sc_scores = missionNamespace getVariable "ofcra_sc_scores";
			ofcra_sc_scores set [((count ofcra_sc_scores) - 1), true];
			missionNamespace setVariable ["ofcra_sc_scores", ofcra_sc_scores];
			publicVariableServer "ofcra_sc_scores";
			[] call ofcra_scoreboard_display;
		};
	};

		
	{
		_target = missionNamespace getVariable [_x , objNull];
		_target addEventHandler ["Killed",{["journaliste",_this select 1] call checkNoCheat;}];
	} forEach ["journaliste"];
	
};
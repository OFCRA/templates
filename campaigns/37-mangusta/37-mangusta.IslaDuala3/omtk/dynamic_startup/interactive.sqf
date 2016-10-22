OMTK_DS_CHOSEN_SPAWN_FOR_PLAYER = 0;
OMTK_DS_VEHICLES_MAX_NB = -1;
OMTK_DS_VEHICLES_MAX_NB_PER_GROUP = -1;
OMTK_DS_CHOSEN_VEHICLES = [];


omtk_ds_interactive_mode = {
	
	if (isServer) then {	
		{
			if ( (locked _x) < 2) then {
				_x lock 2;
				_x setVariable ['omtk_lock', 1];
			};
	 	} foreach vehicles;
	};

	_already_processed = missionNamespace getVariable ["omtk_ds_interactive_process", false];
	_class = typeOf player;
	if (hasInterface && !_already_processed && _class in ["B_officer_F", "O_officer_F", "B_Soldier_SL_F", "O_Soldier_SL_F"]) then {
		createDialog "InteractiveStartUp";
	};
};

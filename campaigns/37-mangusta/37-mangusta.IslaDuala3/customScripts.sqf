if (hasInterface) then {
	
	doNothing = {
		// empty
	};


/* Hereafter an example to manage Flag value
	doSomethingThenSetFlagsValue = {
		hint "The object location is GRID#XXX-YYY";
		[1, true] call omtk_setFlagResult; // set flag 1 to true
		[2, false] call omtk_setFlagResult; // set flag 2 to false
	};
*/

/* Hereafter an example to take the control of an IA
	takeHostageControl = {
		_hostage = missionNamespace getVariable ["hostage", objNull];
		if (!isNil "_hostage") then {
			_hostage enableAI "MOVE";
			_hostage allowDamage true;
			(group _hostage) setCombatMode "BLUE";
		
			_groupToJoin = group player;
			_freeId = (count units _groupToJoin);
			_hostage joinAs [_groupToJoin, _freeId];
		};
	};

	if (side player == EAST) then {
		_hostage = missionNamespace getVariable ["hostage", objNull];
		_txt = "<t color='#0000FF'>Add the hostage to your group</t>";
		_action = _hostage addAction[_txt, {call takeHostageControl;}, []];
	};
*/

/* Hereafter an example to manage the drop of an item inside a specific cargo, ammo box etc...
	insertObject = {
		_container = _this select 0;
		_item = _this select 1;
		if ( (_container == "container_name") && (_item == "item_class") ) then {
			[1, true] call omtk_setFlagResult;
		};
	};

	if (side player == West) then {
		player addEventHandler ["Put", {[str (_this select 1), _this select 2] call insertObject;}];
	};
*/

};

omtk_hide_Billy = {
	_Billy = missionNamespace getVariable ["Billy", objNull];
	if (!isnil("_Billy")) then {
		_Billy allowDamage false;
		_Billy setPos ([8067, 558, 0]);
	};
};

if (isServer) then {
	_Billy = missionNamespace getVariable ["Billy", objNull];
	_position = selectRandom [
		[794.296, 5054.871, 4.360],
		[1309.058, 4371.545, 0]
	];
		
	_Billy setPos (_position);
	[omtk_hide_Billy, [], 40] call KK_fnc_setTimeout; // protect Billy 1h30 later
};

doNothing = {
	// ne fait rien
};

doGetInfo = {
	hint "Contact etabli !";
};


if (hasInterface) then {
	validateObject = {
		_container = _this select 0;
		_item = _this select 1;
		if ( (_container == "obj_1608021") && (_item == "DemoCharge_Remote_Mag") ) then {
			[1, true] call omtk_setFlagResult;
		};
		
	};

	if (side player == West) then {
		player addEventHandler ["Put", {[str (_this select 1), _this select 2] call validateObject;}]; 
	};
};

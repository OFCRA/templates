doNothing = {
	// ne fait rien
};

doGetDataBluefor = {
	hint "Information récupérée";
	_contact = missionNamespace getVariable ["obj_1608031", objNull];
	if (!isNil("_contact")) then {
		_contact enableAI "MOVE";
	};
};

doGetDataRedfor = {
		hint "Information récupérée";
		_data = missionNamespace getVariable ["obj_1608032", objNull];
		if (!isNil("_data")) then {
			deleteVehicle _data;
		};
};

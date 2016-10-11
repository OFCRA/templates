doNothing = {
	// ne fait rien
};

if (isServer) then {
	doThompsonInvincible = {
		_object = missionNamespace getVariable ["thompson", nil];
		if (!isNil("_object")) then {
			_object allowDamage false;
			_object addVest "rhsusf_iotv_ucp";
			_object addHeadgear "rhsusf_ach_helmet_ucp";
		};
	};

	[doThompsonInvincible, [], 5400] call KK_fnc_setTimeout;
};

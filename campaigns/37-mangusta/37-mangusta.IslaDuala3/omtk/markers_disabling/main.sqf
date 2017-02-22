["markers_disabling start", "INFO", false] call omtk_log;

if (hasInterface) then {
	//onDoubleClick "";
	onMapSingleClick {_shift};
};

["markers_disabling end", "INFO", false] call omtk_log;

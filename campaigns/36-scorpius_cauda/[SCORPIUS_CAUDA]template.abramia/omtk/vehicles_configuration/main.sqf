["vehicles_configurations start", "INFO", false] call omtk_log;

{
	_x disableTIEquipment true;
} foreach vehicles;

["vehicles_configurations end", "INFO", false] call omtk_log;

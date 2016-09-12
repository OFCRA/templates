["Terminate"] call BIS_fnc_EGSpectator;

if (!isNil("OMTK_LOADOUT")) then {
  player setUnitLoadout OMTK_LOADOUT;
};

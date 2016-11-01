////// OMTK CONFIGURATION

// tactical_paradrop: définition des limitations de zones (optionnelles)
OMTK_TP_BLUEFOR_RESTRICTIONS = [
  //[x_coordinate, y_coordinate, radius_in_m],
];

OMTK_TP_REDFOR_RESTRICTIONS = [
  //[x_coordinate, y_coordinate, radius_in_m],
];

// score_board: objectives and mission duration
// OMTK_SB_MISSION_DURATION_OVERRIDE = [0, 1, 0]; // [hours, minutes, seconds]

execVM "customScripts.sqf";

OMTK_SB_LIST_OBJECTIFS = [
  [5, "BLUEFOR", "DESTRUCTION", "Destroy 1x Shilka", ["LIST", ["shilka"]] ],
  [5, "REDFOR", "ACTION", "Get the report", "intel_docs", 0, {[] call takeIntel;}],
  [3, "BLUEFOR+REDFOR", "INSIDE", "Capture Merkez downtown", "cap_area", ["DIFF", 1] ],
  [2, "BLUEFOR", "DESTRUCTION", "Supremacy Bonus", ["REDFOR", 5] ],
  [2, "REDFOR", "DESTRUCTION", "Supremacy Bonus", ["BLUEFOR", 5] ]
];

OMTK_LM_BLUEFOR_OB = [
  ["PER_GROUP", 1],
  ["APC: 1x M-113 (M2) - 10 pax", 3, ["rhsusf_m113d_usarmy"]],
  ["CAR: 2x M-1025 (M2 + MK19) - 8 pax", 3, ["rhsusf_m1025_d_m2", "rhsusf_m1025_d_Mk19"]]
];

OMTK_LM_REDFOR_OB = [
  ["PER_GROUP", 1],
  ["APC: 1x BTR-80 - 9 pax", 3, ["rhs_btr80_msv"]],
  ["CAR: 1x GAZ-233014 (PKM/GP30) - 7 pax", 3, ["rhs_tigr_sts_3camo_msv"]]
];

////// SPECIAL CONFIGURATION
setTerrainGrid 3.125;

OMTK_WARMUP_MENU = [
	["OMTK MENU", true],
	["Warmup: side is ready", [2], "", -5, [["expression", "[] call omtk_wu_set_ready;"]], "1", "1"]
];

OMTK_MARKERS_MENU = [
	["OMTK MENU", true],
	["Process markers", [2], "", -5, [["expression", "[] call omtk_ds_process_markers_mode;"]], "1", "1"]
];

// EXTERNAL ADDONS
RscSpectator_allowFreeCam = true;
//cutrsc ['RscSpectator','plain'];

// TASK FORCE ARROWHEAD RADIO
#include "\task_force_radio\functions\common.sqf";
tf_no_auto_long_range_radio = true;

[player, [missionNamespace, "OMTK_LOADOUT"]] call BIS_fnc_saveInventory;

//// OMTK EXECUTION
execVM "omtk\load_modules.sqf";

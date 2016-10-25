////// OMTK CONFIGURATION

// tactical_paradrop: définition des limitations de zones (optionnelles)
OMTK_TP_BLUEFOR_RESTRICTIONS = [
  //[x_coordinate, y_coordinate, radius_in_m],
];

OMTK_TP_REDFOR_RESTRICTIONS = [
  //[x_coordinate, y_coordinate, radius_in_m],
];

// score_board: objectives and mission duration
// OMTK_SB_MISSION_DURATION_OVERRIDE = [0, 0, 0]; // [hours, minutes, seconds]

execVM "customScripts.sqf";

OMTK_SB_LIST_OBJECTIFS = [
  [5, "BLUEFOR", "SURVIVAL", "Protect Billy DITOUGADI", ["LIST", ["Billy"]] ],
  [5, "REDFOR", "DESTRUCTION", "Kill Billy DITOUGADI", ["LIST", ["Billy"]] ],
  [3, "BLUEFOR+REDFOR", "INSIDE", "Capture Vestinga", "vestinga_area", ["DIFF", 1] ],
  [2, "BLUEFOR", "DESTRUCTION", "Supremacy Bonus", ["REDFOR", 5] ],
  [2, "REDFOR", "DESTRUCTION", "Supremacy Bonus", ["BLUEFOR", 5] ]
];

OMTK_LM_BLUEFOR_OB = [
  ["PER_GROUP", 1],
  ["AIR: 1x UH-60M Blackhawk - 10x pax", 2, ["RHS_UH60M_d"]],
  ["IFV: 1x M2A3 Bradley - 10x pax", 2, ["RHS_M2A3"]],
  ["APC: 1x M-113 (M2) - 10 pax", 2, ["rhsusf_m113d_usarmy"]],
  ["APC: 1x M-117 - 7 pax", 3, ["rhsusf_M1117_D"]],
  ["MRAP: 1x RG-33 (M2) - 8 pax", 3, ["rhsusf_rg33_m2_d"]],
  ["CAR: 2x M-1025 (M2 + MK19) - 8 pax", 3, ["rhsusf_m1025_d_m2", "rhsusf_m1025_d_Mk19"]],
  ["CAR: 1x M-1097 (unarmed) - 8 pax", 4, ["rhsusf_m998_d_2dr_halftop"]]
];

OMTK_LM_REDFOR_OB = [
  ["PER_GROUP", 1],
  ["AIR: 1x Mi-8MT - 9x pax", 2, ["RHS_Mi8mt_vv"]],
  ["IFV: 1x BMP-3 (late) - 9x pax", 2, ["rhs_bmp3_late_msv"]],
  ["APC: 1x BTR-80 - 9 pax", 2, ["rhs_btr80_msv"]],
  ["APC: 1x BRDM-2 - 9 pax", 3, ["rhsgref_BRDM2_msv"]],
  ["APC: 1x BRDM-2 (AT) - 7 pax", 2, ["rhsgref_BRDM2_ATGM_msv"]],
  ["CAR: 1x GAZ-233011 (PKP/GP25) - 7 pax", 3, ["rhs_tigr_sts_3camo_msv"]],
  ["CAR: 1x UAZ (unarmed) - 7 pax", 4, ["rhs_uaz_open_MSV_01"]]
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

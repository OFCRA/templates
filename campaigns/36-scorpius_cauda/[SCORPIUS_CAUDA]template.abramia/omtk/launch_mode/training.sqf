omtk_lm_training_mode = {
	if (hasInterface) then {
		_omtk_mode_txt = format ["<t shadow='1' shadowColor='#CCA0FF'>- - - TRAINING MODE - - -</t>"];
		_omtk_mode_txt = parseText _omtk_mode_txt;
		_omtk_mode_txt = composeText [_omtk_mode_txt];
		[_omtk_mode_txt,0,0,30,2] spawn BIS_fnc_dynamicText;
		
		setPlayerRespawnTime 20;
  };
};

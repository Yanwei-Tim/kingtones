package com.kingtone.jw.biz.common;

import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;

public class HelpAC extends SSIAction {
	
	public String toHelpIndex(){
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "帮助", 
				"进入【帮助】页面");
		return "index";
	}

}

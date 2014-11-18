package com.kingtone.jw.platform.bs.impl;

import java.util.List;

import com.kingtone.jw.platform.bs.ButtonBS;
import com.kingtone.jw.platform.dao.ButtonDAO;
import com.kingtone.jw.platform.domain.Button;
import com.kingtone.ssi.bizservice.SSIBizService;

public class ButtonBSImpl extends SSIBizService implements ButtonBS {
	private ButtonDAO buttonDAO;
	
	public void addButton(Button button) throws Exception {
		// TODO Auto-generated method stub
		buttonDAO.addButton(button);
	}
	public void setButtonDAO(ButtonDAO buttonDAO) {
		this.buttonDAO = buttonDAO;
	}
		
	
	public List queryButtonID(String role_id) throws Exception {
		// TODO Auto-generated method stub
		return buttonDAO.queryButtonID(role_id);
	}

}

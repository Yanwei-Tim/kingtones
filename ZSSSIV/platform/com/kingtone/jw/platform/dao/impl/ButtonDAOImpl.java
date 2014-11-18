package com.kingtone.jw.platform.dao.impl;

import java.util.List;

import com.kingtone.jw.platform.dao.ButtonDAO;
import com.kingtone.jw.platform.domain.Button;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.ssi.dao.SSIOrmDao;

public class ButtonDAOImpl extends SSIOrmDao implements ButtonDAO {

	
	public void updateRoleButton(Button button) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("buttonAdd", button);
	}

	
	public List queryButtonListChecked(Button button) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList("queryButtonListChecked",button);
		return list;
		
	}



	
	public List queryButtonID(String role_id) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("queryRoleButton",role_id);
	}

	
	public void insertRoleButton(Button button) throws Exception {
		this.getSqlMapClientTemplate().insert("insertRoleButton",button);
		
	}

	
	public void deleteRoleButton(Button button) throws Exception {
		this.getSqlMapClientTemplate().delete("deleteRoleButton", button);
		
	}

	
	public void addButton(Button button) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("buttonAdd", button);
	}

}

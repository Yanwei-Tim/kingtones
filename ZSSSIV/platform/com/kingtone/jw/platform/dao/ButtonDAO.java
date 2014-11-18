package com.kingtone.jw.platform.dao;

import java.util.List;

import com.kingtone.jw.platform.domain.Button;
import com.kingtone.jw.platform.domain.Menu;

public interface ButtonDAO {
	public void addButton(Button button)throws Exception;;
	public List queryButtonListChecked(Button button) throws Exception;
	public List queryButtonID(String roleID)throws Exception;
	public void updateRoleButton(Button button)throws Exception;
	public void deleteRoleButton(Button button)throws Exception;
	public void insertRoleButton(Button button)throws Exception;
}

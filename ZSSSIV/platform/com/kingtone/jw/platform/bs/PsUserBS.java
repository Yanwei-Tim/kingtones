package com.kingtone.jw.platform.bs;

import java.util.List;

import com.kingtone.jw.platform.domain.JqUser;
import com.kingtone.jw.platform.domain.Organization;

public interface PsUserBS {

	public List findJqUser(JqUser jquser,int skipindex, int maxindex) throws Exception;
	public int findJqByCandA(JqUser jquser) throws Exception;
	public void addUserJq(JqUser jquser) throws Exception;
	public JqUser findJqUserByID(String id) throws Exception;
	public int findJqByUserxg(JqUser jquser) throws Exception;
	public void editUser(JqUser jquser) throws Exception;
	public int findJqDispatchCount(JqUser jquser) throws Exception;
	public void delUser(String userids) throws Exception;
	public List getOrganAll() throws Exception;
	public List getOrganAllbyId(String pId) throws Exception;
	public void importOrgan(JqUser jquser) throws Exception;
	public int findJqListCount(JqUser jquser) throws Exception;
}

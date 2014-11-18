package com.kingtone.jw.platform.bs.impl;

import java.util.List;

import com.kingtone.jw.platform.bs.PsUserBS;
import com.kingtone.jw.platform.dao.PsUserDAO;
import com.kingtone.jw.platform.domain.JqUser;
import com.kingtone.jw.platform.domain.Organization;
import com.kingtone.ssi.bizservice.SSIBizService;

public class PsUserBSImpl extends SSIBizService implements PsUserBS {

	private PsUserDAO psUserDAO;

	public void setPsUserDAO(PsUserDAO psUserDAO) {
		this.psUserDAO = psUserDAO;
	}

	@Override
	public List findJqUser(JqUser jquser,int skipindex, int maxindex) throws Exception {
		return psUserDAO.findJqUser(jquser,skipindex,maxindex);

	}

	@Override
	public void addUserJq(JqUser jquser) throws Exception {
		psUserDAO.addUserJq(jquser);
		
	}

	@Override
	public int findJqByCandA(JqUser jquser) throws Exception {
		return psUserDAO.findJqByCandA(jquser);
	}

	@Override
	public JqUser findJqUserByID(String id) throws Exception {
		return psUserDAO.findJqUserByID(id);

	}

	@Override
	public int findJqByUserxg(JqUser jquser) throws Exception {
		return psUserDAO.findJqByUserxg(jquser);
		
	}

	@Override
	public void editUser(JqUser jquser) throws Exception {
		psUserDAO.editUser(jquser);
		
	}

	@Override
	public int findJqDispatchCount(JqUser jquser) throws Exception {
		return psUserDAO.findJqDispatchCount(jquser);
	}

	@Override
	public void delUser(String userids) throws Exception {
		String[] userArray = userids.split("split");
        for(int i=0;i<userArray.length;i++){
        	psUserDAO.delUser(userArray[i]);
        }
		
	}

	@Override
	public List getOrganAll() throws Exception {
		return psUserDAO.getOrganAll();

	}

	@Override
	public List getOrganAllbyId(String pId) throws Exception {
		return psUserDAO.getOrganAllbyId(pId);

	}

	@Override
	public void importOrgan(JqUser jquser) throws Exception {
		psUserDAO.importOrgan(jquser);		
	}

	@Override
	public int findJqListCount(JqUser jquser) throws Exception {
		return psUserDAO.findJqListCount(jquser);
	}

}

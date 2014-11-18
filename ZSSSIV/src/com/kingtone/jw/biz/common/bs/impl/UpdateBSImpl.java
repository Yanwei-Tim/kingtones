package com.kingtone.jw.biz.common.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.common.bs.UpdateBS;
import com.kingtone.jw.biz.common.dao.UpdateDAO;
import com.kingtone.jw.biz.common.domain.JwUpdate;
import com.kingtone.jw.biz.xajw.dao.JwUserDAO;



import com.kingtone.ssi.bizservice.SSIBizService;
import com.kingtone.ssi.util.IDUtil;

public class UpdateBSImpl extends SSIBizService implements UpdateBS {
	public UpdateDAO updateDAO;

	public void addJwUpdate(JwUpdate jwupdate) throws Exception {
		jwupdate.setId(IDUtil.newID());
		this.updateDAO.addJwUpdate(jwupdate);
		
		
	}

	public void changeState(String id) throws Exception {
		this.updateDAO.changeState(id);
		
	}

	public void changeState() throws Exception {
		this.updateDAO.changeState();
		
	}

	public void delJwUpdate(String userIds) throws Exception {
		this.updateDAO.delJwUpdate(userIds);
		
	}

	public void editJwUpdate(JwUpdate jwupdate) throws Exception {
		this.updateDAO.editJwUpdate(jwupdate);
		
	}

	public JwUpdate findJwUpdateById(String id) throws Exception {
		// TODO Auto-generated method stub
		return this.updateDAO.findJwUpdateById(id);
	}

	public List findJwUpdateList(JwUpdate jwupdate, int skipindex, int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.updateDAO.findJwUpdateList(jwupdate, skipindex, maxindex);
	}

	public List findJwUpdateList(JwUpdate jwupdate) throws Exception {
		// TODO Auto-generated method stub
		return this.updateDAO.findJwUpdateList(jwupdate);
	}

	public int findJwUpdateListCount(JwUpdate jwupdate) throws Exception {
		// TODO Auto-generated method stub
		return this.updateDAO.findJwUpdateListCount(jwupdate);
		}

	public void setUpdateDAO(UpdateDAO updateDAO) {
		this.updateDAO = updateDAO;
	}
	
	
}

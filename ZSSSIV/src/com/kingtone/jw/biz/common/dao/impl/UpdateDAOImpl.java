package com.kingtone.jw.biz.common.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.biz.common.dao.UpdateDAO;
import com.kingtone.jw.biz.common.domain.JwUpdate;
import com.kingtone.ssi.dao.SSIOrmDao;



public class UpdateDAOImpl extends SSIOrmDao implements UpdateDAO{

	public void addJwUpdate(JwUpdate jwupdate) throws Exception {
		this.getSqlMapClientTemplate().insert("addJwUpdate", jwupdate);
		
	}

	public void changeState(String id) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("changeState", id);
	}

	public void changeState() throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("changeState1");
	}

	public void delJwUpdate(String userIds) throws Exception {
		this.getSqlMapClientTemplate().delete("delJwUpdate", userIds);
		
	}

	public void editJwUpdate(JwUpdate jwupdate) throws Exception {
		this.getSqlMapClientTemplate().update("editJwUpdate", jwupdate);
		
	}

	public JwUpdate findJwUpdateById(String id) throws Exception {
		return (JwUpdate) this.getSqlMapClientTemplate().queryForObject(
				"findJwUpdateById", id);
	}

	public List findJwUpdateList(JwUpdate jwupdate, int skipindex, int maxindex) throws Exception {
		List list =new ArrayList();
		list=this.getSqlMapClientTemplate().queryForList(
				"findJwUpdateList", jwupdate);
		return list;
	}

	public List findJwUpdateList(JwUpdate jwupdate) throws Exception {
		List list =new ArrayList();
		list=this.getSqlMapClientTemplate().queryForList(
				"findJwUpdateList1", jwupdate);
		return list;
	}

	public int findJwUpdateListCount(JwUpdate jwupdate) throws Exception {
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwUpdateListCount", jwupdate).toString());
	}

	
}

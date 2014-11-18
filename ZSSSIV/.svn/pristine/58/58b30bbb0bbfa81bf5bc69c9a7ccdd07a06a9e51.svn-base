package com.kingtone.jw.biz.common.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.common.bs.SjcjBS;
import com.kingtone.jw.biz.common.dao.SjcjDAO;
import com.kingtone.jw.biz.common.domain.Spcj;
import com.kingtone.jw.biz.common.domain.Tpcj;
import com.kingtone.jw.platform.dao.UnitDAO;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.ssi.bizservice.SSIBizService;

public class SjcjBSImpl extends SSIBizService implements SjcjBS {
	public SjcjDAO sjcjDAO;
	public UnitDAO unitDAO;

	public void setSjcjDAO(SjcjDAO sjcjDAO)throws Exception {
		this.sjcjDAO = sjcjDAO;
	}

	public boolean deleteSpcj(int id, String filepath) throws Exception {
		this.sjcjDAO.deleteSpcj(id);
		java.io.File f = new java.io.File(filepath);
		return f.delete();
	}

	public boolean deleteTpcj(int id, String filepath) throws Exception {
		this.sjcjDAO.deleteTpcj(id);
		java.io.File f = new java.io.File(filepath);
		return f.delete();
	}

	public List findAllSpcjPage(User user, Spcj spcj, int skipindex, int maxindex) throws Exception {
		List allSubUnits = unitDAO.findAllSubUnitsByParentId(user.getUnitID());
		// TODO Auto-generated method stub
		return this.sjcjDAO.findAllSpcjPage(user,spcj,unitDAO.findAllSubUnitsByParentId(user.getUnitID()), skipindex, maxindex);
	}

	public int findAllSpcjPageCount(User user,Spcj spcj) throws Exception {
		// TODO Auto-generated method stub
		return this.sjcjDAO.findAllSpcjPageCount(user,spcj,unitDAO.findAllSubUnitsByParentId(user.getUnitID()));
	}

	public List findAllTpcjPage(User user,Tpcj tpcj, int skipindex, int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.sjcjDAO.findAllTpcjPage(user,tpcj,unitDAO.findAllSubUnitsByParentId(user.getUnitID()), skipindex, maxindex);
	}

	public int findAllTpcjPageCount(User user,Tpcj tpcj) throws Exception {
		// TODO Auto-generated method stub
		return this.sjcjDAO.findAllTpcjPageCount(user,tpcj,unitDAO.findAllSubUnitsByParentId(user.getUnitID()));
	}

	public Spcj findSpcjById(int id) throws Exception {
		// TODO Auto-generated method stub
		return this.sjcjDAO.findSpcjById(id);
	}

	public Tpcj findTpcjById(int id) throws Exception {
		// TODO Auto-generated method stub
		return this.sjcjDAO.findTpcjById(id);
	}

	public List findAllNode(String parent_id) throws Exception {
		// TODO Auto-generated method stub
//		return this.sjcjDAO.finaAllNode(parent_id);
		return this.unitDAO.findAllSubUnitsByParentId(parent_id);
	}

	public void setUnitDAO(UnitDAO unitDAO) {
		this.unitDAO = unitDAO;
	}
	
}

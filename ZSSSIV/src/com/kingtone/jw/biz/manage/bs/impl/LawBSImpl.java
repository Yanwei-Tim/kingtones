package com.kingtone.jw.biz.manage.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.manage.bs.LawBS;
import com.kingtone.jw.biz.manage.dao.LawDAO;
import com.kingtone.jw.biz.manage.domain.Law;
import com.kingtone.ssi.bizservice.SSIBizService;

public class LawBSImpl extends SSIBizService implements LawBS {
	

	/** 法律法规DAO	 */
	public LawDAO lawDAO;
	
	/**
	 * DAO注入
	 * @param lawDAO
	 */
	public void setLawDAO(LawDAO lawDAO) {
		this.lawDAO = lawDAO;
	}

	/**
	 * 获取通讯录一览
	 */
	public List findLawList(Law law, int skipIndex, int maxIndex) throws Exception {
		
		return this.lawDAO.findLawList(law, skipIndex, maxIndex);
	}

	/**
	 * 获取通讯录记录统计
	 */
	public int findLawListCount(Law law) throws Exception {
		return lawDAO.findLawListCount(law);
	}

	/**
	 * 通讯录记录删除
	 */
	public void delLaw(String lawID) throws Exception {
		lawDAO.delLaw(lawID);
		
	}


	public int findLawCountByCode(String code) throws Exception {
		
		return  lawDAO.findLawCountByCode(code);
	}


	public void insertLaw(Law law) throws Exception {
		this.lawDAO.insertLaw(law);
		
	}


	/**
	 * 通訊錄查詢通過通訊錄id
	 */
	public Law findLawByLawID(String lawID) throws Exception {
		return this.lawDAO.findLawByLawID(lawID);
	}


	public void updateLaw(Law law) throws Exception {
		this.lawDAO.updateLaw(law);
		
	}

	
	
}

package com.kingtone.jw.biz.manage.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.kingtone.jw.biz.manage.dao.LawDAO;
import com.kingtone.jw.biz.manage.domain.Law;
import com.kingtone.ssi.dao.SSIOrmDao;

public class LawDAOImpl extends SSIOrmDao implements LawDAO {

	/**
	 * 法律法规记录查询
	 */
	public List findLawList(Law law,int skipIndex,int maxIndex) throws Exception{
		List lawList = new ArrayList();
		
		lawList =this.getSqlMapClientTemplate().queryForList("findLawList",law,skipIndex,maxIndex);
		return lawList;
	}

	/**
	 * 法律法规记录统计
	 */
	public int findLawListCount(Law law) throws Exception {
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findLawListCount", law).toString());
	}

	/**
	 * 删除法律法规记录的操作
	 */
	public void delLaw(String lawID) throws Exception {
		this.getSqlMapClientTemplate().delete("delLawByLawID",lawID);
		
	}

	public int findLawCountByCode(String name) throws Exception {
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findLawByLawCode", name).toString());
	}

	/**
	 * 	 法律法规記錄的插入
	 */
	public void insertLaw(Law law) throws Exception {
		this.getSqlMapClientTemplate().insert("insertLaw", law);
		
	}
	
	/**
	 * 法律法规查詢通過法律法规id
	 */
	public Law findLawByLawID(String lawID)throws Exception{
		return (Law)this.getSqlMapClientTemplate().queryForObject("findLawByLawID",lawID);
	}

	public void updateLaw(Law law) throws Exception {
		this.getSqlMapClientTemplate().update("updateLaw",law);
		
	}


}

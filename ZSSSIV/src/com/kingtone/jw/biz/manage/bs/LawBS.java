package com.kingtone.jw.biz.manage.bs;

import java.util.List;

import com.kingtone.jw.biz.manage.domain.Law;

public interface LawBS {

	public List findLawList(Law law,int skipIndex,int maxIndex)throws Exception;
	
	public int findLawListCount(Law law)throws Exception;
	
	public void delLaw(String lawID)throws Exception;
	
	public int findLawCountByCode(String code)throws Exception;
	
	public void insertLaw(Law law)throws Exception;
	
	public Law findLawByLawID(String lawID)throws Exception;
	
	public void updateLaw(Law law)throws Exception;
}

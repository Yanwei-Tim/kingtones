package com.kingtone.jw.platform.bs;

import java.util.List;

import com.kingtone.jw.platform.domain.JqUser;
import com.kingtone.jw.platform.domain.Organization;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.domain.UserLog;

public interface PSBS {

	public String findHead() throws Exception;
	public List findPulicSituation(Organization organ) throws Exception;
	public List findJqList(Organization organ, int skipindex, int maxindex) throws Exception;
	public int findJqByCode(String code) throws Exception;
	public void addJq(Organization organ) throws Exception;
	public Organization findJqById(String id) throws Exception;
	public int findJqByCodeJq(Organization organ) throws Exception;
	public void editOrgan(Organization organ) throws Exception;
	public int findJqSonCount(Organization organ) throws Exception;
	public int findJqUserCount(Organization organ) throws Exception;
	public void delOrgan(String orgIds) throws Exception;
	public List getOrganAll() throws Exception;
	public List getOrganAllbyId(String pId) throws Exception;
	public void importOrgan(Organization organ) throws Exception;
	public int findJqListCount(Organization organ) throws Exception;
}

/**
 * 文件名：UnitDAO.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.platform.dao;

import java.util.List;

import com.kingtone.jw.platform.domain.Organization;



/**
 * <p>
 * 警情dao层接口
 * </p>
 * 
 * @author 于李鹏yulipeng@kingtoneinfo.com
 * 
 */
public interface PSDAO {

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
	public void delOrgan(String orgid) throws Exception;
	public List getOrganAll() throws Exception;
	public List getOrganAllbyId(String pId) throws Exception;
	public void importOrgan(Organization organ) throws Exception;
	public int findJqListCount(Organization organ) throws Exception;
}

/**
 * 文件名：ResourceDAO.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.platform.dao;

import java.util.List;

import com.kingtone.jw.platform.domain.Resource;


/**
 * <p>[描述信息：说明类的基本功能]</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Aug 20, 2008 1:34:18 PM
 */
public interface ResourceDAO {
	public List findResourceList(Resource  resource_bak, int skipindex,
			int maxindex) throws Exception;

	public int findResourceListCount(Resource   resource_bak) throws Exception;

	public void addResource(Resource   resource_bak) throws Exception;

	public void editResource(Resource   resource_bak) throws Exception;

	public void delResource(String  resourceIds) throws Exception;

	public Resource findResourceById(String id) throws Exception;
	public List queryResourceList()throws Exception;
	
}

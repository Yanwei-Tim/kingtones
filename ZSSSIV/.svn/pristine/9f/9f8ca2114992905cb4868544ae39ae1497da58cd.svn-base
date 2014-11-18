package com.kingtone.jw.service.dao;

import java.util.HashMap;
import java.util.List;

import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.domain.SynchEnvelop;
/**
 * 
 * Title:同步数据--DAO接口
 * Description:提供同步数据等功能
 * Author: 朱金华 - zhujinhua@kingtoneinfo.com
 * Date: Jun 2, 2011
 */
public interface SynchDAO {
	/**
	 * Description:查询同步列表
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param request
	 * @return
	 * @throws Exception
	 */
	/*同步数据*/
	public SynchEnvelop querySynchList(SynchEnvelop request)throws Exception;
	/*根据用户同步数据*/
	public SynchEnvelop querySynchList(SynchEnvelop request,String username)throws Exception;
	/*查找根节点更新时间*/
	public String queryRootBizUpdateDate()throws Exception;
	/*查找警务角色更新时间*/
	public String queryRoleBizUpdateDate(String account)throws Exception;		
	
	/**
	 * 
	 * 通過角色ID获取需要同步的数据
	 * @param roleId: 角色ID
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 19, 2011
	 */
	public SynchEnvelop querySynchListByRoleId(String roleId)throws Exception;
	
	/**
	 * 
	 * 通過角色ID获取中SYSTEM_SQLITE_SYNCH表中的同步信息
	 * @param roleId：角色ID
	 * @return 返回对应角色ID的最新同步信息
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 21, 2011
	 */
	public List querySqliteSynchListByRoleId(String roleId)throws Exception;
	
	/**
	 * 
	 * 更新SYSTEM_SQLITE_SYNCH中的同步信息
	 * @param synchMap: 更新的表数据
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 21, 2011
	 */
	public void updateSqliteSyncInfo(HashMap<String, String> synchMap)throws Exception;
	
	/**
	 * 
	 * 通过角色ID查找警务角色更新时间
	 * @param roleId
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 21, 2011
	 */
	public String queryRoleBizUpdateDateByRoleId(String roleId)throws Exception;
	
	 /**
	 * 获取警务用户的角色ID
	 * @param userAccount：用户账号
	 * @return 用户角色ID
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 27, 2011
	 */
	public String queryRoleIdByUserName(String userAccount) throws Exception;
}

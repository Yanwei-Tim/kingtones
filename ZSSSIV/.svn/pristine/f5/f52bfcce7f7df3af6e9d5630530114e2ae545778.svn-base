/**
 * 文件名：LoginDAO.java
 * 创建人：陈萧如(chenxiaoru@kingtoneinfo.com)
 * 创建时间：Dec 31, 2011
 * 版权所有：西安联合信息技术股份有限公司
*/
package com.kingtone.jw.service.dao;

import java.util.List;
import java.util.Map;

/**
 * <p>类描述</p>
 *
 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
 * @date: Dec 31, 2011
 */
public interface LoginDAO {
	/**
	 * 获取验证警务用户密码信息。
	 * 
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @param password: 密码
	 * @throws Exception
	 * 
	 * @return List<Object>
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 6, 2011
	 */
	public List<Object> queryJWUserWithPsw(String columnKey, String keyValue, String password) throws Exception;
	
	/**
	 * 更新警务人员的ISLOCKED信息。
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @param lockFlag:锁定信息值（1：锁定；0：正常）
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 6, 2011
	 */
	public int updateUserLock(String columnKey, String keyValue, String lockFlag) throws Exception;
	
	/**
	 * 
	 * 更新警务人员的LOGIN_FAILED_COUNT信息。
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @param count: 新LOGIN_FAILED_COUNT值
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 7, 2011
	 */
	public int updateUserLoginFailedCount(String columnKey, String keyValue, int count) throws Exception;
	
	/**
	 * 获取警务用户名对应数据信息。
	 * 
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 6, 2011
	 */
	public List<Object> queryJWUserByName(String columnKey, String keyValue) throws Exception;
	
	/**
	 * 获取验证警务用户的注册手机信息。
	 * 
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @param expansionMap:扩展验证点
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 6, 2011
	 */
	public List<Object> queryExpansionValidateResult(String columnKey, String keyValue, Map expansionMap) throws Exception;
	
	/**
	 * 
	 * 根据所给SQL语句，返回对应的查询结果
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public List<Object> findListBySQL(String sql) throws Exception;
	
	/**
	 * 
	 * 更新数据库的操作。
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public int executeSQLforUpdate(String sql) throws Exception;
}

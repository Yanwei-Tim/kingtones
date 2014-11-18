/**
 * 文件名：LoginDAOImpl.java
 * 创建人：陈萧如(chenxiaoru@kingtoneinfo.com)
 * 创建时间：Dec 31, 2011
 * 版权所有：西安联合信息技术股份有限公司
*/
package com.kingtone.jw.service.dao.impl;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.jdbc.core.RowMapper;

import com.kingtone.jw.service.dao.LoginDAO;
import com.kingtone.ssi.dao.SSIDAO;

/**
 * 登录操作相关DAO实现类
 *
 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
 * @date: Dec 31, 2011
 */
public class LoginDAOImpl extends SSIDAO implements LoginDAO {
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
	@SuppressWarnings("unchecked")
	public List<Object> queryJWUserWithPsw(String columnKey, String keyValue, String password)
			throws Exception {
		String sql = "SELECT NAME,PSW,SJHM,SJCM,JMKH,JZ,XZQH,ACCOUNT,XB,DESCRIPTION,JW_ROLE_ID,LOADTIME,ISLOCKED,LOGIN_FAILED_COUNT,SFZH FROM jw_user WHERE "+columnKey+" = '"
				+ keyValue + "' AND PSW='" + password + "'";
		List list = this.query(sql, new RowMaper());
		return list;
	}
	
	
	private static class RowMaper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			HashMap<String, String> dataMap = new HashMap<String, String>();
			ResultSetMetaData rsMeta = rs.getMetaData();
			int columnCount = rsMeta.getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				String colName = rsMeta.getColumnName(i);
				String colValue = rs.getString(i);
				// 说明 BUSINESS_CONFIG 中的两个字段不同步到终端
				dataMap.put(colName, colValue);
			}
			return dataMap;
		}
	}
	
	/**
	 * 更新数据库警务用户locked信息。
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @param lockFlag: 锁定flag (1:锁定； 0：正常)
	 * @return
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on Dec 6, 2011 8:50:13 AM
	 */
	public int updateUserLock(String columnKey, String keyValue, String lockFlag)
			throws Exception {
		String jwLockUpdateSql = "update jw_user set ISLOCKED = '"+lockFlag+"' where "+columnKey+" = '"+keyValue+"'";
		if(keyValue!=null && lockFlag!=null)
			return this.getJdbcTemplate().update(jwLockUpdateSql);
		return 0;
	}
	
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
	public int updateUserLoginFailedCount(String columnKey, String keyValue, int count)
			throws Exception {
		if(keyValue!=null){
			String loginFailedCountUpdateSql = "UPDATE jw_user SET LOGIN_FAILED_COUNT = "+count+" WHERE "+columnKey+" = '"+keyValue+"'";
			return this.getJdbcTemplate().update(loginFailedCountUpdateSql);
		}
		return 0;
	}
	
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
	@SuppressWarnings("unchecked")
	public List<Object> queryExpansionValidateResult(String columnKey, String keyValue,
			Map expansionMap) throws Exception {
		String sql = "SELECT NAME,PSW,SJHM,SJCM,JMKH,JZ,XZQH,ACCOUNT,XB,DESCRIPTION,JW_ROLE_ID,LOADTIME,ISLOCKED,LOGIN_FAILED_COUNT FROM jw_user WHERE "+columnKey+" = '"
				+ keyValue + "' ";
		Set keySet = expansionMap.keySet();
		// 组装扩展查询条件。
		for (Iterator iterator = keySet.iterator(); iterator.hasNext();) {
			String key = (String)iterator.next();
			String value = (String) expansionMap.get(key);
			if(key!=null&&value!=null){
				sql += "AND " + key + " = '" +value+"' ";
			}
		}
		List list = this.query(sql, new RowMaper());
		return list;
	}
	
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
	@SuppressWarnings("unchecked")
	public List<Object> queryJWUserByName(String columnKey, String keyValue) throws Exception {
		String sql = "SELECT NAME,PSW,SJHM,SJCM,JMKH,JZ,XZQH,ACCOUNT,XB,DESCRIPTION,JW_ROLE_ID,LOADTIME,ISLOCKED,LOGIN_FAILED_COUNT FROM jw_user WHERE " + columnKey+" = '"
				+ keyValue + "'";
		List list = this.query(sql, new RowMaper());
		return list;
	}
	
	/**
	 * 
	 * 根据所给SQL语句 返回对应的查询结果
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public List<Object> findListBySQL(String sql) throws Exception {
		List<Object> list = this.query(sql, new RowMaper());
		return list;
	}
	
	/**
	 * 
	 * 更新数据库的操作
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public int executeSQLforUpdate(String sql) throws Exception {
		return this.update(sql);
	}
}

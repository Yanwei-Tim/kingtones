/**
 * 文件名：LoginBS.java
 * 创建人：陈萧如 - chenxiaoru@kingtoneinfo.com
 * 创建时间：Dec 31, 2011
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.service.bs.login;


/**
 * 登录信息相关业务逻辑层
 *
 * @author 陈萧如 - chenxiaoru@kingtoneinfo.com
 * @version 1.0 Created on 31 28, 2011
 */
public interface LoginBS {
	/**
	 * 更新警务用户的lock信息。
	 * 
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @param lockflag:锁定flag
	 *            (1:锁定； 0：正常)
	 * @return
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on Dec 6, 2011 8:55:13 AM
	 */
	public String updateUserLock(String columnKey, String keyValue, String lockflag);
	
	/**
	 * 更新用户登录失败状态。
	 * 
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 7, 2011
	 */
	public void updateJWUserLoginFailedStatus(String columnKey, String keyValue)throws Exception;
	
	/**
	 * 验证用户登录信息。
	 * 
	 * @param xmlStr
	 * @return
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 6, 2011
	 */
	@SuppressWarnings("unchecked")
	public String loginValidate(String xmlStr);
	
	/**
	 * 更新用户密码
	 * 
	 * @param userAccount:用户帐号
	 * @param oldPassword:旧密码
	 * @param newPassword:新密码
	 * 
	 * @return
	 */
	public String changePssword(String userAccount, String oldPassword,
			String newPassword);
	
	/**
	 * 更具设备串码更新用户密码。
	 * 
	 * @param sjcm
	 * @param newPassword
	 * @return
	 * @CODE_001: SQL语句异常或数据库连接异常！
	 * @CODE_005: 密碼修改成功！
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: 2012-03-19
	 */
	public String changePsswordBySJCM(String sjcm, String newPassword);
}

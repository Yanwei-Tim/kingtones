/**
 * 文件名：LoginBS.java
 * 创建人：陈萧如 - chenxiaoru@kingtoneinfo.com
 * 创建时间：Dec 28, 2011
 * 版权所有：西安联合信息技术股份有限公司
 */

package com.kingtone.jw.service.bs.login.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kingtone.jw.service.bs.login.LoginBS;
import com.kingtone.jw.service.bs.login.LoginConstants;
import com.kingtone.jw.service.dao.LoginDAO;
import com.kingtone.jw.service.domain.LoginEnvelop;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.jw.service.util.XmlParseTool;
import com.kingtone.ssi.log.SSILogger;

/**
 * 登录信息业务逻辑层
 *
 * @author 陈萧如 - chenxiaoru@kingtoneinfo.com
 * @version 1.0 Created on Dec 28, 2011
 */
public class LoginBSImpl implements LoginBS{
	
	
	private LoginDAO loginDAO;
	
	/**
	 * 
	 * 注入DAO实现类
	 * 
	 * @param loginDAO
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Dec 31, 2011
	 */
	public void setLoginDAO(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}

	/**
	 * 当用户登录验证失败时，根据用户数据中的失败计数记录更新其状态： --
	 * 失败计数大于或等于一个指定次数（这里默认设为3），将锁定该用户并将失败计数自加1。 --
	 * 失败计数小于一个指定次数（这里默认设为3，将失败计数自加1。
	 * 
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 7, 2011
	 */
	@SuppressWarnings("unchecked")
	public void updateJWUserLoginFailedStatus(String columnKey, String keyValue)
			throws Exception {
		String sql = "SELECT LOGIN_FAILED_COUNT FROM jw_user WHERE " + columnKey+" = '"
				+ keyValue + "'";
		List<Object> findResListBySQL = loginDAO.findListBySQL(sql);
		if (findResListBySQL != null && findResListBySQL.size() > 0) {
			for (int i = 0; i < findResListBySQL.size(); i++) {
				Map result = (HashMap) findResListBySQL.get(i);
				Integer failedCount = Integer.valueOf((String) result
						.get("LOGIN_FAILED_COUNT"));
				if (failedCount >= (LoginConstants.LOGIN_FAILED_COUNT - 1)) {
					// 锁定用户。
					loginDAO.updateUserLock(columnKey, keyValue, LoginConstants.LOGIN_LOCKED);
				}
				// 用户登录失败计数自加1。
				loginDAO.updateUserLoginFailedCount(columnKey, keyValue,
						failedCount + 1);
			}
		}
	}
	
	/**
	 * 更新警务用户的lock信息。
	 * 
	 * @param columnKey:标识用户的主键列名（这里是手机串码或者用户账号）
	 * @param keyValue: 对应唯一主键的值
	 * @param lockflag:锁定flag
	 *            (1:锁定； 0：正常)
	 * @return
	 * @CODE_001: SQL语句异常或数据库连接异常！
	 * @CODE_007: 更新用户锁定状态成功！
	 * @CODE_008: 更新用户数据不存在！
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on Dec 6, 2011 8:55:13 AM
	 */
	public String updateUserLock(String columnKey, String keyValue, String lockflag) {
		String flag = LoginConstants.CODE_008;
		try {
			if (loginDAO.updateUserLock(columnKey, keyValue, lockflag) == 1) {
				flag = LoginConstants.CODE_007;
			}
			if(lockflag.equals(LoginConstants.UNLOCKED)){ // 解锁用户同时将登录失败次数置为0。
				loginDAO.updateUserLoginFailedCount(columnKey, keyValue,0);
			}
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
		}
		return flag;
	}
	
	/**
	 * 验证用户登录信息。
	 * 
	 * @param xmlStr
	 * @return
	 * @CODE_001: SQL语句异常或数据库连接异常！
	 * @CODE_002: 用户帐号不存在！
	 * @CODE_003: 请输入匹配的注册手机信息！
	 * @CODE_004: 用户密码错误！
	 * @CODE_009: 该用户已被锁定，不能登录！
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 6, 2011
	 */
	@SuppressWarnings("unchecked")
	public String loginValidate(String xmlStr) {
		String returnValue = "";
		LoginEnvelop request = new LoginEnvelop();
		XmlParseTool.toObj(xmlStr, request);
		try {
			// 获取是否需要验证用户名标识 add in 2012-03-16
			boolean shouldValidateUser = request.isShouldValidateUser();
			// 获取警务用户数据的主键列名
			String validateUserKey = LoginConstants.ACCOUNT_COLUMN;
			// 注册手机Map信息
			Map expansion = request.getDetail();
			// 对应主键列名的值
			String validatKeyValue = request.getUserID();
			if(!shouldValidateUser){
				validateUserKey = LoginConstants.SJCM_COLUMN;
				validatKeyValue = (String) expansion.get(LoginConstants.SJCM_COLUMN);
			}
			
			// 1.验证对应用户是否存在。
			List<Object> user = loginDAO.queryJWUserByName(validateUserKey, validatKeyValue);
			if (user == null || user.size() == 0) {
				return LoginConstants.CODE_002;
			}

			// 2.验证用户是否是登录锁定用户。
			Map result = (HashMap) user.get(0);
			String lockFlag = (String) result.get("ISLOCKED");
			if (lockFlag.equals(LoginConstants.LOGIN_LOCKED))
				// 该用户已连续三次登录失败，被锁定。
				return LoginConstants.CODE_009;
			else if(lockFlag.equals(LoginConstants.SERVER_LOCKED)){
				// 该用户已被设置被盗锁定，不能登录！
				return LoginConstants.CODE_010;
			}
			
			// 3.如果注册手机匹配验证设置不为空，验证注册手机信息。
			if ((shouldValidateUser && !expansion.isEmpty()) || (!shouldValidateUser && expansion.size() > 1)) {
				List<Object> expansionList = loginDAO
						.queryExpansionValidateResult(validateUserKey, validatKeyValue, expansion);
				if (expansionList == null || expansionList.size() == 0) {
					// 更新用户登录失败计数信息。
					CommonTool.loginBS.updateJWUserLoginFailedStatus(validateUserKey, validatKeyValue);
					return LoginConstants.CODE_003;
				}
			}
			
			// 4.验证用户密码。
			String psw = request.getPsw();
			List<Object> userWithPsw = loginDAO.queryJWUserWithPsw(validateUserKey,
					validatKeyValue, psw);
			if (userWithPsw == null || userWithPsw.size() == 0) {
				// 更新用户登录失败计数信息。
				CommonTool.loginBS.updateJWUserLoginFailedStatus(validateUserKey, validatKeyValue);
				return LoginConstants.CODE_004;
			}
			
			// 5.验证成功
			// 验证成功的返回对象
			LoginEnvelop le = new LoginEnvelop();;
			le.setTableList(userWithPsw);
			returnValue = XmlParseTool.toXml(le);
			// 将用户登录失败计数重置为0。
			loginDAO.updateUserLoginFailedCount(validateUserKey, validatKeyValue, 0);

			// 6.录入用户登录信息，更新jw_log表信息。
			if (request.getBizTag() == null)
				request.setBizTag("0");
			CommonTool.logDAO.InsertAddLog(request);

		} catch (Exception e) {
			e.printStackTrace();
			return LoginConstants.CODE_001;
		}
		return returnValue;
	}
	
	/**
	 * @deprecated: 更新用户密码 ( 修改自废弃方法：executeSQLforUpdate(String sql) )。
	 * @param userAccount:用户帐号
	 * @param oldPassword:旧密码
	 * @param newPassword:新密码
	 * 
	 * @return
	 * @CODE_001: SQL语句异常或数据库连接异常！
	 * @CODE_005: 密碼修改成功！
	 * @CODE_006: 更新密码验证失败，用户名或原密码错误！
	 */
	public String changePssword(String userAccount, String oldPassword,
			String newPassword) {
		String flag = LoginConstants.CODE_006;
		try {
			// 验证用户旧登录信息。
			List<Object> user = loginDAO.queryJWUserWithPsw(LoginConstants.ACCOUNT_COLUMN,
					userAccount, oldPassword);
			if (user == null || user.size() == 0) {
				// 更新密码验证失败，用户名或原密码错误。
				return flag;
			}
			// 设置新密码。
			String sql = "UPDATE jw_user SET PSW='" + newPassword
					+ "' WHERE ACCOUNT = '" + userAccount + "'";
			if (CommonTool.loginDAO.executeSQLforUpdate(sql) == 1) {
				// 密码修改成功
				flag = LoginConstants.CODE_005;
			}
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			flag = LoginConstants.CODE_001;
		}
		return flag;
	}
	
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
	public String changePsswordBySJCM(String sjcm, String newPassword){
		String flag = LoginConstants.CODE_001;
		// 设置新密码。
		String sql = "UPDATE jw_user SET PSW='" + newPassword
				+ "' WHERE sjcm = '" + sjcm + "'";
		try {
			if (CommonTool.loginDAO.executeSQLforUpdate(sql) >= 1) {
				// 密码修改成功
				flag = LoginConstants.CODE_005;
			}
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
		}
		return flag;
	}
}

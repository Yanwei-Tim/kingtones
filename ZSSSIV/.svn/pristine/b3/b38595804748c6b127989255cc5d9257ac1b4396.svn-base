/**
 * 文件名：SSIAction.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.security;

import java.util.ArrayList;
import java.util.List;

import org.acegisecurity.GrantedAuthority;
import org.acegisecurity.GrantedAuthorityImpl;
import org.acegisecurity.userdetails.UserDetails;
import org.acegisecurity.userdetails.UserDetailsService;
import org.acegisecurity.userdetails.UsernameNotFoundException;
import org.apache.commons.lang.Validate;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.dao.DataAccessException;

import com.kingtone.jw.platform.dao.*;
import com.kingtone.jw.platform.domain.*;

/**
 * <p>[描述信息：说明类的基本功能]</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Aug 27, 2008 9:48:45 PM
 */
public class SSIUserDetailService implements UserDetailsService,InitializingBean {

	private AccountDAO accountDAO = null;

	private UserDAO userDAO = null;

	private RoleDAO roleDAO = null;

	public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	/**
	 * <p>[描述方法实现的功能]</p>
	 * 
	 * @see org.acegisecurity.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 27, 2008 9:48:45 PM
	 */
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		try {
			Account account = accountDAO.queryAccountByUsername(username);
			String userId = account.getUser_id();
			User user = userDAO.queryUserByuserId(userId);
			if (account == null || user == null)
				throw new UsernameNotFoundException("User [" + username + "] not found.");
			// 获取角色列表，设置人员角色
			List<Role> roleList = roleDAO.queryRoleListOfUser(user);
			List<GrantedAuthority> gaList = new ArrayList<GrantedAuthority>();
			for (Role r : roleList) {
				gaList.add(new GrantedAuthorityImpl(r.getRole_id()));
			}
			// 如果用户存在，则为每个用户添加系统用户角色。当前实现，每个用户都有一个sysUserRole的角色。
			// gaList.add(new GrantedAuthorityImpl("SYS_USER"));
			GrantedAuthority[] ga = (GrantedAuthority[]) gaList.toArray(new GrantedAuthority[gaList.size()]);
			// 构造UserDetails
			SSIUserDetails userDetails = new SSIUserDetails(account, user);
			userDetails.setAuthorities(ga);
			return userDetails;
		} catch (Exception e) {
			if (e.getCause() instanceof DataAccessException)
				throw (DataAccessException) e.getCause();
			else
				throw new UsernameNotFoundException("Error to access Account data.");
		}
	}

	public void afterPropertiesSet() throws Exception {
		Validate.notNull(this.accountDAO, "accountDAO must be set");
	}
}

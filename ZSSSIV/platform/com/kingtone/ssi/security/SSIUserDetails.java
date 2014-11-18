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

import java.util.Date;

import org.acegisecurity.GrantedAuthority;
import org.acegisecurity.userdetails.UserDetails;
import org.apache.commons.lang.Validate;

import com.kingtone.jw.platform.domain.*;


/**
 * <p>[描述信息：说明类的基本功能]</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Aug 27, 2008 9:59:22 PM
 */
public class SSIUserDetails implements UserDetails {

	private Account account = null;

	private User user = null;

	private UserAccount userAccount = null;

	private GrantedAuthority[] grantedAuthorities = null;

	public SSIUserDetails(Account account, User user) {
		Validate.notNull(account, "account required");
		Validate.notNull(user, "user required");
		this.account = account;
		this.user = user;
		userAccount = new UserAccount();
		userAccount.setUser(this.user);
		userAccount.setAccount(this.account);
	}

	/**
	 * <p>获取帐户所拥有的角色信息。</p>
	 * 
	 * @see org.acegisecurity.userdetails.UserDetails#getAuthorities()
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 27, 2008 9:59:22 PM
	 */
	public GrantedAuthority[] getAuthorities() {
		return this.grantedAuthorities;
	}

	/**
	 * <p>设置帐户所拥有的角色信息。</p>
	 * 
	 * @param grantedAuthorities
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 27, 2008 10:01:17 PM
	 */
	public void setAuthorities(GrantedAuthority[] grantedAuthorities) {
		this.grantedAuthorities = grantedAuthorities;
	}

	/**
	 * <p>获取帐户密码</p>
	 * 
	 * @see org.acegisecurity.userdetails.UserDetails#getPassword()
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 27, 2008 9:59:22 PM
	 */
	public String getPassword() {
		return this.account.getPassword();
	}

	/**
	 * <p>获取用户登陆名</p>
	 * 
	 * @see org.acegisecurity.userdetails.UserDetails#getUsername()
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 27, 2008 9:59:22 PM
	 */
	public String getUsername() {
		return this.account.getUsername();
	}

	/**
	 * <p>是否帐户未过期。</p>
	 * 
	 * @see org.acegisecurity.userdetails.UserDetails#isAccountNonExpired()
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 27, 2008 9:59:22 PM
	 */
	public boolean isAccountNonExpired() {
		Date expiredDate = this.account.getExpired_date();
		if (expiredDate == null) {
			return true;
		} else {
			long time = expiredDate.getTime();
			long current = new Date().getTime();
			if (time > current)
				return true;
			else
				return false;
		}
	}

	/**
	 * <p>是否帐户未被锁定。</p>
	 * 
	 * @see org.acegisecurity.userdetails.UserDetails#isAccountNonLocked()
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 27, 2008 9:59:22 PM
	 */
	public boolean isAccountNonLocked() {
		return !this.account.isLocked();
	}

	/**
	 * <p>是否认证信息（密码）过期，默认为不过期。</p>
	 * 
	 * @see org.acegisecurity.userdetails.UserDetails#isCredentialsNonExpired()
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 27, 2008 9:59:22 PM
	 */
	public boolean isCredentialsNonExpired() {
		return true;
	}

	/**
	 * <p>是否帐户信息启用。</p>
	 * 
	 * @see org.acegisecurity.userdetails.UserDetails#isEnabled()
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 27, 2008 9:59:22 PM
	 */
	public boolean isEnabled() {
		return this.account.isEnabled();
	}

	public UserAccount getUserAccount() {
		return userAccount;
	}
}

/**
 * 文件名：AccountDAO.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.platform.dao;

import java.util.List;

import com.kingtone.jw.platform.domain.Account;

/**
 * <p>对帐户信息进行维护。</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Aug 20, 2008 1:34:18 PM
 */
public interface AccountDAO {

	public List findAccountList(Account account_bak, int skipindex, int maxindex)
			throws Exception;

	public int findAccountListCount(Account account_bak) throws Exception;

	public void addAccount(Account account_bak) throws Exception;

	public void editAccount(Account account_bak) throws Exception;

	public void delAccount(String accountIds) throws Exception;

	public Account findAccountById(String id) throws Exception;

	public Account findAccountByuserid(String id) throws Exception;

	public Account queryAccountByUsername(String username);

}

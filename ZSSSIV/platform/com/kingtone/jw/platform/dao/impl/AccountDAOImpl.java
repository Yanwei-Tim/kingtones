package com.kingtone.jw.platform.dao.impl;

import java.util.List;

import com.kingtone.jw.platform.dao.AccountDAO;
import com.kingtone.jw.platform.domain.Account;
import com.kingtone.ssi.dao.SSIOrmDao;

public class AccountDAOImpl extends SSIOrmDao implements AccountDAO {

	public void addAccount(Account account_bak) throws Exception {
		this.getSqlMapClientTemplate().insert("accountAdd", account_bak);

	}

	public void delAccount(String accountIds) throws Exception {
		this.getSqlMapClientTemplate().delete("accountDelete", accountIds);

	}

	public void editAccount(Account account_bak) throws Exception {
		this.getSqlMapClientTemplate().update("accountUpdate",account_bak);

	}

	public Account findAccountById(String id) throws Exception {
		return (Account)this.getSqlMapClientTemplate().queryForObject("findAccountByID",id);
	}

	public List findAccountList(Account account_bak, int skipindex,int maxindex)
			throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList("findAllAccounPage",account_bak, skipindex, maxindex);
        return list;
	}

	public int findAccountListCount(Account account_bak) throws Exception {
		int n= Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("findAccounPageCount",account_bak).toString());
        return n;
	}

	public Account findAccountByuserid(String id) throws Exception {
		return (Account)this.getSqlMapClientTemplate().queryForObject("findAccountByuserid",id);
	}

	public Account queryAccountByUsername(String username) {
		return (Account)this.getSqlMapClientTemplate().queryForObject("queryAccountByUsername",username);
	}

}

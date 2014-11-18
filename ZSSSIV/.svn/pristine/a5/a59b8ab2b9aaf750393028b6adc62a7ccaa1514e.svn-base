package com.kingtone.jw.biz.manage.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.kingtone.jw.biz.manage.dao.AddressDAO;
import com.kingtone.jw.biz.manage.domain.Address;
import com.kingtone.ssi.dao.SSIOrmDao;

public class AddressDAOImpl extends SSIOrmDao implements AddressDAO {

	/**
	 * 通讯录记录查询
	 */
	public List findAddressList(Address address,int skipIndex,int maxIndex) throws Exception{
		List addressList = new ArrayList();
		
		addressList =this.getSqlMapClientTemplate().queryForList("findAddressList",address,skipIndex,maxIndex);
		return addressList;
	}

	/**
	 * 通讯录记录统计
	 */
	public int findAddressListCount(Address address) throws Exception {
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findAddressListCount", address).toString());
	}

	/**
	 * 删除通讯录记录的操作
	 */
	public void delAddress(String addID) throws Exception {
		this.getSqlMapClientTemplate().delete("delAddressByAddID",addID);
		
	}

	public int findAddressCountByName(Address address) throws Exception {
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findAddressByName", address).toString());
	}

	/**
	 * 	 通訊錄記錄的插入
	 */
	public void insertAddress(Address address) throws Exception {
		this.getSqlMapClientTemplate().insert("insertAddress", address);
		
	}
	
	/**
	 * 通訊錄查詢通過通訊錄id
	 */
	public Address findAddressByAddID(String addID)throws Exception{
		return (Address)this.getSqlMapClientTemplate().queryForObject("findAddressByAddID",addID);
	}

	public void updateAddress(Address address) throws Exception {
		this.getSqlMapClientTemplate().update("updateAddress",address);
		
	}

	
}

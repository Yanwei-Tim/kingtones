package com.kingtone.jw.biz.manage.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.manage.bs.AddressBS;
import com.kingtone.jw.biz.manage.dao.AddressDAO;
import com.kingtone.jw.biz.manage.domain.Address;
import com.kingtone.ssi.bizservice.SSIBizService;

public class AddressBSImpl extends SSIBizService implements AddressBS {
	
	public AddressDAO addressDAO;
	
	/**
	 * @param addressDAO the addressDAO to set
	 */
	public void setAddressDAO(AddressDAO addressDAO) {
		this.addressDAO = addressDAO;
	}


	/**
	 * 获取通讯录一览
	 */
	public List findAddressList(Address address, int skipIndex, int maxIndex) throws Exception {
		
		return this.addressDAO.findAddressList(address, skipIndex, maxIndex);
	}

	/**
	 * 获取通讯录记录统计
	 */
	public int findAddressListCount(Address address) throws Exception {
		return addressDAO.findAddressListCount(address);
	}

	/**
	 * 通讯录记录删除
	 */
	public void delAddress(String addID) throws Exception {
		addressDAO.delAddress(addID);
		
	}


	public int findAddressCountByName(Address address) throws Exception {
		
		return  addressDAO.findAddressCountByName(address);
	}


	public void insertAddress(Address address) throws Exception {
		this.addressDAO.insertAddress(address);
		
	}


	/**
	 * 通訊錄查詢通過通訊錄id
	 */
	public Address findAddressByAddID(String addID) throws Exception {
		return this.addressDAO.findAddressByAddID(addID);
	}


	public void updateAddres(Address address) throws Exception {
		this.addressDAO.updateAddress(address);
		
	}


	
}

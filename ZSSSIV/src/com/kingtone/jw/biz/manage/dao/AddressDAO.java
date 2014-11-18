package com.kingtone.jw.biz.manage.dao;

import java.util.List;

import com.kingtone.jw.biz.manage.domain.Address;

public interface AddressDAO {

	public List findAddressList(Address address, int skipIndex,int maxIndex)throws Exception;
	
	public int findAddressListCount(Address address)throws Exception;
	
	public void delAddress(String addID)throws Exception;
	
	public int findAddressCountByName(Address address) throws Exception;
	
	public void insertAddress(Address address)throws Exception;
	
	public Address findAddressByAddID(String addID)throws Exception;
	
	public void updateAddress(Address address)throws Exception;
}

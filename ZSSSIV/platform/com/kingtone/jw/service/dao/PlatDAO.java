package com.kingtone.jw.service.dao;

import java.util.List;

import com.kingtone.jw.service.domain.PnNotice;

public interface PlatDAO {

	public void load_PnMap() throws Exception;
	public void InsertNotice(PnNotice notice) throws Exception;
	public void InsertOffLine(String message_id,String account) throws Exception;
	public List getUserList(String id)throws Exception;
	public PnNotice getNotice(String message_id)throws Exception;
	public void delNotice(String account,String message_id)throws Exception;
}

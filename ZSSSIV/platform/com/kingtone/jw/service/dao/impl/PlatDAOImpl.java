package com.kingtone.jw.service.dao.impl;

import java.rmi.server.UID;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kingtone.jw.service.dao.PlatDAO;
import com.kingtone.jw.service.domain.InsertEnvelop;
import com.kingtone.jw.service.domain.PnNotice;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.ssi.dao.SSIDAO;

public class PlatDAOImpl extends SSIDAO implements PlatDAO {

	
	private String newID(){
		return new UID().toString();
	}
	
	public void load_PnMap() throws Exception {
		// TODO Auto-generated method stub
		List list = this.queryForList(CommonTool.pnSql);// 业务
		Map pnMap = new HashMap();
		for(int i=0;i<list.size();i++){
			Map map =(Map)list.get(i);
			pnMap.put(map.get("ACCOUNT"), "");
		}
		CommonTool.pnMap = pnMap;
	}


	public void InsertNotice(PnNotice notice) throws Exception {
		// TODO Auto-generated method stub
		String pnSql = "insert into ssi_message_pn(message_id,apikey,title,message,uri,b_id) values(";
		String message_id = notice.getMessage_id();
		String apikey = notice.getApikey();
		String title = notice.getTitle();
		String message = notice.getMessage();
		String uri = notice.getUri();
		String b_id = notice.getB_id();
		pnSql+="'"+message_id+"','"+apikey+"','"+title+"','"+message+"','"+uri+"','"+b_id+"')";
		if(b_id!=null && message_id!=null)
			this.getJdbcTemplate().update(pnSql);
	}
	public void InsertOffLine(String message_id,String account)throws Exception{
		String pnSql = "insert into ssi_user_m_message(account,message_id) values('"
						+ account+"','"+message_id+"')";
		if(account!=null && message_id!=null)
			this.getJdbcTemplate().update(pnSql);
	}

	public List getUserList(String id) throws Exception {
		// TODO Auto-generated method stub
		String sql = "select * from ssi_user_m_message where account='"+id+"'";
		List list = this.getJdbcTemplate().queryForList(sql);
		return list;
	}

	public PnNotice getNotice(String message_id) throws Exception {
		// TODO Auto-generated method stub
		String sql = "select * from ssi_message_pn where message_id='"+message_id+"'";
		List list = this.getJdbcTemplate().queryForList(sql);
		PnNotice notice = new PnNotice();
		Map map = (Map) list.get(0);
		notice.setApikey(map.get("APIKEY").toString());
		notice.setB_id(map.get("B_ID").toString());
		notice.setMessage(map.get("MESSAGE").toString());
		notice.setMessage_id(message_id);
		notice.setTitle(map.get("TITLE").toString());
		return notice;
	}

	public void delNotice(String account, String message_id) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete ssi_user_m_message where message_id='"+message_id+"' and account='"+account+"'";
		this.getJdbcTemplate().execute(sql);
	}

}

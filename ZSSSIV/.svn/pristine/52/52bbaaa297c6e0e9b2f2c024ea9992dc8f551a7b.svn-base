package com.kingtone.jw.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import com.kingtone.androidpn.server.xmpp.push.NotificationManager;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.service.domain.PnNotice;
import com.kingtone.jw.service.util.CommonTool;

/**
 * 消息推送
 * @author Administrator
 *
 */
public class PushPn {
	private static PushPn instance ;
	public synchronized static PushPn getInstance() {
	    if (instance == null) {
	    	instance = new PushPn();
	    }
	    return instance;
	}
	
	/**
	 * 记录推送消息记录
	 * @param notice
	 * @throws Exception
	 */
	public void addNotice(PnNotice notice) throws Exception{
		CommonTool.platDAO.InsertNotice(notice);
	}
	
	/**
	 * 消息推送，未推送成功用户记录到数据库中，等待下次连接后推送
	 * @param notice
	 * @param personList
	 * @throws Exception
	 */
	public void messagePush(PnNotice notice,List personList) throws Exception{
		NotificationManager notict = new NotificationManager();
		 String apiKey = ResourceBundle.getBundle("configes").getString("apiKey");
		 notice.setApikey(apiKey);
		 Map ma = CommonTool.pnMap;
		for(int i=0;i<personList.size();i++){
			JwUser user = (JwUser) personList.get(i);
			String uri = user.getAccount()+","+notice.getMessage_id()+","+notice.getB_id();
			CommonTool.platDAO.InsertOffLine(notice.getMessage_id(), user.getAccount().toString());
			boolean result = notict.sendNotifcationToUser(apiKey, user.getAccount().toString(), 
					notice.getTitle(), notice.getMessage(), uri);
			Thread.sleep(6000);
		}
	}
	
	/**
	 * 用户连接后检查是否有未发送信息，有为发送信息调用发送方法发送。
	 * @param account
	 * @throws Exception
	 */
	public  void sendMessage(String account) throws Exception{
		String id = account.split("@")[0];
		List list = CommonTool.platDAO.getUserList(id);
		List accountList = new ArrayList();
		JwUser user = new JwUser();
		user.setAccount(id);
		accountList.add(user);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				Map map = (Map)list.get(i);
				String message_id = map.get("MESSAGE_ID").toString();
				PnNotice notice = CommonTool.platDAO.getNotice(message_id);
				notice.setUri(account+","+message_id+","+notice.getB_id());
				
				this.messagePush(notice, accountList);
			}
		}
	}
	
}

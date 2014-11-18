package com.kingtone.jw.platform.dpn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.ServletRequestUtils;
import org.xmpp.packet.Presence;

import com.kingtone.androidpn.server.bs.UserPNBS;
import com.kingtone.androidpn.server.console.vo.SessionVO;
import com.kingtone.androidpn.server.domain.User;
import com.kingtone.androidpn.server.xmpp.presence.PresenceManager;
import com.kingtone.androidpn.server.xmpp.push.NotificationManager;
import com.kingtone.androidpn.server.xmpp.session.ClientSession;
import com.kingtone.androidpn.server.xmpp.session.Session;
import com.kingtone.androidpn.server.xmpp.session.SessionManager;
import com.kingtone.jw.biz.service.util.Tools;
import com.kingtone.ssi.action.SSIAction;

@SuppressWarnings("unchecked")
public class JwUserPNAC extends SSIAction{
    private UserPNBS userPNBS;
    private User user;
	private List rows = new ArrayList();
	protected String total = "0";
	protected String page;
	protected String rp;
	// 查询关键字
	private String query;
	// 查询关键字类型
	private String qtype;

//    public UserController() {
//        userService = ServiceLocator.getUserService();
//    }
	private NotificationManager notificationManager;

    public JwUserPNAC() {
        notificationManager = new NotificationManager();
    } 
    
    public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public List getRows() {
		return rows;
	}


	public void setRows(List rows) {
		this.rows = rows;
	}


	public String getTotal() {
		return total;
	}


	public void setTotal(String total) {
		this.total = total;
	}


	public String getPage() {
		return page;
	}


	public void setPage(String page) {
		this.page = page;
	}


	public String getRp() {
		return rp;
	}


	public void setRp(String rp) {
		this.rp = rp;
	}


	public String getQuery() {
		return query;
	}


	public void setQuery(String query) {
		this.query = query;
	}


	public String getQtype() {
		return qtype;
	}


	public void setQtype(String qtype) {
		this.qtype = qtype;
	}


	
	
	public UserPNBS getUserPNBS() {
		return userPNBS;
	}


	public void setUserPNBS(UserPNBS userPNBS) {
		this.userPNBS = userPNBS;
	}


	/**
	 * 警务push queryUserListAction
	 * 
	 * @author hanliqiang@kingtoneinfo.com
	 * 
	 */
	public String queryUserPNList()throws Exception{
		User user = new User();
		if("id".equals(qtype)){
			user.setEmail(query);
		}else if("userName".equals(qtype)){
			user.setUsername(query);
		}
		PresenceManager presenceManager = new PresenceManager();
		rows.clear();
		List userPushList = userPNBS.findUserList(user, (Integer.parseInt(page) - 1)
				* (Integer.parseInt(rp)), (Integer.parseInt(rp)));
		Map m = new HashMap();
		String str1 = "\"http://"+this.getRequest().getLocalAddr()+":"+this.getRequest().getLocalPort()+this.getRequest().getContextPath()+"/";
		m.put("1", "<IMG SRC="+str1+"platform/images/dpn/user-online.png"+"\">");
		m.put("2", "<IMG SRC="+str1+"platform/images/dpn/user-offline.png"+"\">");
//		m.put("2", "<IMG SRC=\"http://localhost:8080/SSIV/"+"platform/images/dpn/user-offline.png"+"\">");
//		m.put("1", "在线");
//		m.put("2", "离线");
		for (Object object : userPushList) {
			User userPushResult = (User) object;
			Map map = new HashMap();
			if (presenceManager.isAvailable(userPushResult)) {
				userPushResult.setOnline1("1");
            } else {
            	userPushResult.setOnline1("2");
            }
			map.put("id", userPushResult.getId());
			map.put("cell", new Object[]{
					m.get(userPushResult.getOnline1()),
					userPushResult.getId(),
					userPushResult.getUserName(),
					userPushResult.getEmail(),
					!"".equals(userPushResult.getCreatedDate()) && null != userPushResult.getCreatedDate()?Tools.formatDate(userPushResult.getCreatedDate()):""
			});
			rows.add(map);
		}
		total = userPNBS.findUserPNCount(user)+"";
		return JSON;
	}
	
	
	public String send() throws Exception {
        String broadcast = ServletRequestUtils.getStringParameter(this.getRequest(),
                "broadcast", "Y");
        String username = ServletRequestUtils.getStringParameter(this.getRequest(),
                "username");
        String title = ServletRequestUtils.getStringParameter(this.getRequest(), "title");
        String message = ServletRequestUtils.getStringParameter(this.getRequest(),
                "message");
        String uri = ServletRequestUtils.getStringParameter(this.getRequest(), "uri");

        String apiKey = ResourceBundle.getBundle("config").getString(
				"apiKey");

        if (broadcast.equalsIgnoreCase("Y")) {
            notificationManager.sendBroadcast(apiKey, title, message, uri);
        } else {
            notificationManager.sendNotifcationToUser(apiKey, username, title,
                    message, uri);
        }
       
        return JSON;
    }
	
	public String getSessinList()throws Exception{
		HttpServletRequest request = this.getRequest();
		ClientSession[] sessions = new ClientSession[0];
	    sessions = SessionManager.getInstance().getSessions().toArray(sessions);
	    List<SessionVO> voList = new ArrayList<SessionVO>();
//        Map m = new HashMap();
//        m.put("1", "在线");
//        m.put("2", "离线");
	    for (ClientSession sess : sessions) {
            SessionVO vo = new SessionVO();
            vo.setUsername(sess.getUsername());
            vo.setResource(sess.getAddress().getResource());
            // Status
            if (sess.getStatus() == Session.STATUS_CONNECTED) {
                vo.setStatus("CONNECTED");
            } else if (sess.getStatus() == Session.STATUS_AUTHENTICATED) {
                vo.setStatus("AUTHENTICATED");
            } else if (sess.getStatus() == Session.STATUS_CLOSED) {
                vo.setStatus("CLOSED");
            } else {
                vo.setStatus("UNKNOWN");
            }
            // Presence
            if (!sess.getPresence().isAvailable()) {
                vo.setPresence("Offline");
            } else {
                Presence.Show show = sess.getPresence().getShow();
                if (show == null) {
                    vo.setPresence("Online");
                } else if (show == Presence.Show.away) {
                    vo.setPresence("Away");
                } else if (show == Presence.Show.chat) {
                    vo.setPresence("Chat");
                } else if (show == Presence.Show.dnd) {
                    vo.setPresence("Do Not Disturb");
                } else if (show == Presence.Show.xa) {
                    vo.setPresence("eXtended Away");
                } else {
                    vo.setPresence("Unknown");
                }
            }
            vo.setClientIP(sess.getHostAddress());
            vo.setCreatedDate(sess.getCreationDate());
            Map map = new HashMap();
            //map.put("id", vo.getUsername());
            map.put("cell", new Object[]{
            	vo.getUsername(),vo.getResource(),vo.getStatus(),
            	vo.getPresence(),vo.getClientIP(),vo.getCreatedDate()	
            });
            rows.add(map);
        }
		return JSON;
	}
	
}

//package com.kingtone.androidpn.server.console.controller;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import com.kingtone.androidpn.server.bs.UserPNBS;
//import com.kingtone.androidpn.server.domain.User;
//import com.kingtone.androidpn.server.xmpp.presence.PresenceManager;
//import com.kingtone.ssi.action.SSIAction;
//
///** 
// * A controller class to process the user related requests.  
// *
// * @author Sehwan Noh (devnoh@gmail.com)
// */
//public class UserController extends SSIAction {
//
//    private UserPNBS userPNBS;
//    private User user;
//	private List rows = new ArrayList();
//	protected String total = "0";
//	protected String page;
//	protected String rp;
//	// 查询关键字
//	private String query;
//	// 查询关键字类型
//	private String qtype;
//
////    public UserController() {
////        userService = ServiceLocator.getUserService();
////    }
//
//    public User getUser() {
//		return user;
//	}
//
//
//	public void setUser(User user) {
//		this.user = user;
//	}
//
//
//	public List getRows() {
//		return rows;
//	}
//
//
//	public void setRows(List rows) {
//		this.rows = rows;
//	}
//
//
//	public String getTotal() {
//		return total;
//	}
//
//
//	public void setTotal(String total) {
//		this.total = total;
//	}
//
//
//	public String getPage() {
//		return page;
//	}
//
//
//	public void setPage(String page) {
//		this.page = page;
//	}
//
//
//	public String getRp() {
//		return rp;
//	}
//
//
//	public void setRp(String rp) {
//		this.rp = rp;
//	}
//
//
//	public String getQuery() {
//		return query;
//	}
//
//
//	public void setQuery(String query) {
//		this.query = query;
//	}
//
//
//	public String getQtype() {
//		return qtype;
//	}
//
//
//	public void setQtype(String qtype) {
//		this.qtype = qtype;
//	}
//
//
//	public UserPNBS getUserService() {
//		return userPNBS;
//	}
//
//
//	public void setUserService(UserPNBS userPNBS) {
//		this.userPNBS = userPNBS;
//	}
//	
//	/**
//	 * 警务push queryUserListAction
//	 * 
//	 * @author hanliqiang@kingtoneinfo.com
//	 * 
//	 */
//	public String queryUserPNList()throws Exception{
////		User user = new User();
//		PresenceManager presenceManager = new PresenceManager();
//		rows.clear();
////		List userPushList = userPNBS.findUserList();
//		Map m = new HashMap();
//		m.put("1", "在线");
//		m.put("2", "离线");
//		for (Object object : userPushList) {
//			User userPushResult = (User) object;
//			Map map = new HashMap();
//			map.put("id", userPushResult.getId());
//			if (presenceManager.isAvailable(user)) {
//                // Presence presence = presenceManager.getPresence(user);
//				userPushResult.setOnline1("1");
//            } else {
//            	userPushResult.setOnline1("2");
//            }
//			map.put("cell", new Object[]{
//					m.get(userPushResult.getOnline1()),
//					userPushResult.getId(),
////					userPushResult.getName(),
//					userPushResult.getUserName(),
//					userPushResult.getEmail(),
//					userPushResult.getCreatedDate()
//			});
//		}
//		return JSON;
//	}
//	
//}
////	public ModelAndView list(HttpServletRequest request,
////            HttpServletResponse response) throws Exception {
////        PresenceManager presenceManager = new PresenceManager();
////        List<User> userList = userService.findUserList();
////        for (User user : userList) {
////            if (presenceManager.isAvailable(user)) {
////                // Presence presence = presenceManager.getPresence(user);
////                user.setOnline(true);
////            } else {
////                user.setOnline(false);
////            }
////            // logger.debug("user.online=" + user.isOnline());
////        }
////        ModelAndView mav = new ModelAndView();
////        mav.addObject("userList", userList);
////        mav.setViewName("user/list");
////        return mav;
////    }
//
//

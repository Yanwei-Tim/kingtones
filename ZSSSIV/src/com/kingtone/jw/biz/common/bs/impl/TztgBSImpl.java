package com.kingtone.jw.biz.common.bs.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.kingtone.jw.biz.common.bs.TztgBS;
import com.kingtone.jw.biz.common.dao.TztgDAO;
import com.kingtone.jw.biz.common.domain.Notice;
import com.kingtone.jw.biz.common.domain.NoticeUser;
import com.kingtone.jw.biz.common.domain.Sjsb;
import com.kingtone.jw.biz.xajw.dao.JwUserDAO;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.platform.dao.UnitDAO;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.jw.service.PushPn;
import com.kingtone.jw.service.domain.PnNotice;
import com.kingtone.ssi.bizservice.SSIBizService;


public class TztgBSImpl extends SSIBizService implements TztgBS{
	public TztgDAO tztgDAO;
	private JwUserDAO jwUserDAO;

	public void setTztgDAO(TztgDAO tztgDAO) {
		this.tztgDAO = tztgDAO;
	}
	public UnitDAO unitDAO;

	
	
	public void setUnitDAO(UnitDAO unitDAO) {
		this.unitDAO = unitDAO;
	}


	public List findSjsbListByXzqh(Sjsb sjsb)throws Exception{
		return tztgDAO.findSjsbListByXzqh(sjsb);
	}


	public List findAllNoticePage(User user,Notice notice, int skipindex, int maxindex) throws Exception {
		return this.tztgDAO.findAllNoticePage(user,notice,unitDAO.findAllSubUnitsByParentId(user.getUnitID()), skipindex, maxindex);
	}
	public List findAllNoticePage(NoticeUser notice, int skipindex, int maxindex) throws Exception {
		return this.tztgDAO.findAllNoticePage(notice, skipindex, maxindex);
	}

	public int findAllNoticePageCount(User user,Notice notice) throws Exception {
		return this.tztgDAO.findAllNoticePageCount(user,notice,unitDAO.findAllSubUnitsByParentId(user.getUnitID()));
	}
	public int findAllNoticeUserPageCount(NoticeUser notice) throws Exception {
		return this.tztgDAO.findAllNoticeUserPageCount(notice);
	}

	public void deleteNotice(int id) throws Exception {
		this.tztgDAO.deleteNotice(id);
		this.tztgDAO.deleteNoticeUser(id);
		

	}

	public Notice findNoticeById(int id) throws Exception {
		return this.tztgDAO.findNoticeById(id);
		
	}
	@SuppressWarnings("unused")
	public void saveNotice(Notice notice, String optype) throws Exception {
		
		Notice noticeCopy = notice;
		String currentUserID = ((User) OrgUtils.getInstance().getCurrentUser())
				.getUserID();
		String currentUnitID = ((Unit) OrgUtils.getInstance()
				.getUnitlistOfUser().get(0)).getUnit_id();
		String currentUserName = ((User) OrgUtils.getInstance()
				.getCurrentUser()).getFullName();
		String currentUnitName = ((Unit) OrgUtils.getInstance()
				.getUnitlistOfUser().get(0)).getUnit_name();
		noticeCopy.setSendUserid(currentUserID);
		noticeCopy.setSendDeptid(currentUnitID);
		noticeCopy.setSendUsername(currentUserName);
		noticeCopy.setSendDeptname(currentUnitName);
		if (optype.equals("save")) {
			noticeCopy.setSendStatus("0");
			this.tztgDAO.saveNotice(noticeCopy);
		}
		if (optype.equals("send")) {
			noticeCopy.setSendStatus("1");
			noticeCopy.setSendTime(new Date());
			Integer id = (Integer) this.tztgDAO.sendNotice(noticeCopy);
			// String id=this.tztgDAO.sendNotice(notice);
//			List jwUserListByXzqh = new ArrayList();//推送，根据行政区划获取的jw_userList
			Notice noticeUnit = new Notice();
			if (!(notice.getReqDeptId().equals(""))) {
				String[] unitIds = notice.getReqDeptId().split("split");
				for (int i = 0; i < unitIds.length; i++) {
					Unit unit = unitDAO.findUnitByXz(unitIds[i]);
					JwUser jwUser = new JwUser();
					jwUser.setXzqh(unit.getXzqh());
					List jwUserList = jwUserDAO.findJwList(jwUser);//根据行政区划查找jw_user
//					add by 韩立强
//					jwUserListByXzqh.containsAll(jwUserList);
					//add end
					for (Object o : jwUserList) {
						JwUser obj = (JwUser) o;
						noticeUnit.setReqdevice_id(obj.getSjcm());
						noticeUnit.setNoticeId(id);
						noticeUnit.setReadStatus(0);
						this.tztgDAO.sendNoticeUser(noticeUnit);
					}
				}
			}
//			根据deviceID查询JwUser ADD BY 韩立强
//			List listByDevice_id = new ArrayList();
			Notice noticeUser = new Notice();
			if (!(notice.getReqdevice_id().equals(""))) {
				String[] userIds = notice.getReqdevice_id().split("split");
				for (int i = 0; i < userIds.length; i++) {
//				    JwUser result = this.jwUserDAO.findJwUserByDeviceID(userIds[i]);
//					listByDevice_id.add(result);
					noticeUser.setReqdevice_id(userIds[i]);
					noticeUser.setNoticeId(id);
					noticeUser.setReadStatus(0);
					this.tztgDAO.sendNoticeUser(noticeUser);
				}
			}
			
		}
		
		
	}

	public void updateNotice(Notice notice,String optype) throws Exception {
		if (optype.equals("save")) {
			this.tztgDAO.updateNotice(notice);
		}
		if (optype.equals("send")) {
			notice.setSendStatus("1");
			notice.setSendTime(new Date());
			this.tztgDAO.updateSendNotice(notice);
			
			Notice noticeUnit = new Notice();
			if (!(notice.getReqDeptId().equals(""))) {
				String[] unitIds = notice.getReqDeptId().split("split");
				for (int i = 0; i < unitIds.length; i++) {
					Unit unit = unitDAO.findUnitByXz(unitIds[i]);
					JwUser jwUser = new JwUser();
					jwUser.setXzqh(unit.getXzqh());
					List jwUserList = jwUserDAO.findJwList(jwUser);
					for (Object o : jwUserList) {
						JwUser obj = (JwUser) o;
						noticeUnit.setReqdevice_id(obj.getSjcm());
						noticeUnit.setNoticeId(notice.getId());
						noticeUnit.setReadStatus(0);
						this.tztgDAO.sendNoticeUser(noticeUnit);
					}
				}
			}
			Notice noticeUser = new Notice();
			if (!(notice.getReqdevice_id().equals(""))) {
				String[] userIds = notice.getReqdevice_id().split("split");
				for (int i = 0; i < userIds.length; i++) {
					noticeUser.setReqdevice_id(userIds[i]);
					noticeUser.setNoticeId(notice.getId());
					noticeUser.setReadStatus(0);
					this.tztgDAO.sendNoticeUser(noticeUser);
				}
			}
		}
	}
	
	/**
	 * @author hanliqiang
	 * 通知通告推送
	 */
	public void sendPNMessage(Notice notice)throws Exception{
		PnNotice pt = new PnNotice();
		pt.setTitle(notice.getTitle());
		pt.setMessage(notice.getContent());
		String str = notice.getId()+"";
		if(!"".equals(str) || str != null){
			//适用于修改发送
			pt.setMessage_id(str);
		}else{
			//查询ID最大，适用于增加发送
			str = this.tztgDAO.getMaxNoticeID().getId()+"";
			pt.setMessage_id(str);
		}
//		pt.setApikey(apikey);
//		pt.setUri(uri);
		pt.setB_id("S000000013");
		List resultList = new ArrayList();
		List jwUserListBySelect = new ArrayList();//根据xzqh或者deviceid获取jwUserList
		List jwUserListByDeviceID = new ArrayList();//根据获取jwUserList
		if(!("".equals(notice.getReqDeptId()))){
			String depIDs[] = notice.getReqDeptId().split("split");
			for (int i = 0; i < depIDs.length; i++) {
				Unit unit = unitDAO.findUnitByXz(depIDs[i]);
				JwUser jwUser = new JwUser();
				jwUser.setXzqh(unit.getXzqh());
				List jwUserList = jwUserDAO.findJwList(jwUser);//根据行政区划查找jw_user
				jwUserListBySelect.addAll(jwUserList);
			}
		}
		if(!("".equals(notice.getReqdevice_id()))){
			String[] deviceIds = notice.getReqdevice_id().split("split");
			for (int i = 0; i < deviceIds.length; i++) {
			    JwUser result = this.jwUserDAO.findJwUserByDeviceID(deviceIds[i]);
			    jwUserListByDeviceID.add(result);
			    jwUserListBySelect.addAll(jwUserListByDeviceID);
			}
		}
		Set set = new HashSet();
		for (Iterator iter = jwUserListBySelect.iterator(); iter.hasNext();) {  
           JwUser element = (JwUser)iter.next(); 
           if (set.add(element)){
        	   resultList.add(element);   
           }
		} 
		PushPn pp = new PushPn();
		pp.addNotice(pt);
		pp.messagePush(pt, resultList);
		
	}


//	@Override
	public void updateNoticeAttach(Notice notice) throws Exception {
		// TODO Auto-generated method stub
		this.tztgDAO.updateNoticeAttach(notice);
	}


	public void setJwUserDAO(JwUserDAO jwUserDAO) {
		this.jwUserDAO = jwUserDAO;
	}}

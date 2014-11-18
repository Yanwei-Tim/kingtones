package com.kingtone.jw.biz.xajw.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.service.dao.ServiceDAO;
import com.kingtone.jw.biz.service.domain.BusinessRel;
import com.kingtone.jw.biz.xajw.bs.JwRoleBS;
import com.kingtone.jw.biz.xajw.dao.JwRoleDAO;
import com.kingtone.jw.biz.xajw.domain.JwMRoleBiz;
import com.kingtone.jw.biz.xajw.domain.JwMRoleRes;
import com.kingtone.jw.biz.xajw.domain.JwRole;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.ssi.bizservice.SSIBizService;
import com.kingtone.ssi.util.IDUtil;

public class JwRoleBSImpl extends SSIBizService implements JwRoleBS{
	public JwRoleDAO jwRoleDAO;
	public ServiceDAO serviceDAO;

	
	public void addJwRole(JwRole jwRole) throws Exception {
		// TODO Auto-generated method stub
		jwRole.setRole_id(IDUtil.newID());
		jwRole.setChange_date(serviceDAO.getSysDate());
		jwRoleDAO.addJwRole(jwRole);
	}

	
	public void delJwRole(String jwRoleId) throws Exception {
		// TODO Auto-generated method stub		
		JwMRoleBiz jwMRoleBiz=new JwMRoleBiz();
		JwMRoleRes jwMRoleRes=new JwMRoleRes();
		jwMRoleBiz.setRole_id(jwRoleId);
		jwMRoleRes.setRole_id(jwRoleId);
		jwRoleDAO.delJwMRoleBiz(jwMRoleBiz);
		jwRoleDAO.delJwMRoleRes(jwMRoleRes);
		jwRoleDAO.delJwRole(jwRoleId);
	}

	
	public void updateJwRole(JwRole jwRole) throws Exception {
		// TODO Auto-generated method stub
		jwRole.setChange_date(serviceDAO.getSysDate());
		jwRoleDAO.editJwRole(jwRole);
	}

	
	public List queryJwRoleList(JwRole jwRole) throws Exception {
		// TODO Auto-generated method stub
		return jwRoleDAO.findJwRoleList(jwRole);
	}

	public void setJwRoleDAO(JwRoleDAO jwRoleDAO) {
		this.jwRoleDAO = jwRoleDAO;
	}
	/*根据父节点和角色ID来查BIZ树*/
	public List<Menu> findBizListByParentAndRoleId(JwMRoleBiz jwMRoleBiz)throws Exception{
		return jwRoleDAO.findBizListByParentAndRoleId(jwMRoleBiz);
	}
	/*根据父节点和角色ID来查RES树*/
	public List<Menu> findResListByBizAndRoleId(JwMRoleRes jwMRoleRes)throws Exception{
		return jwRoleDAO.findResListByBizAndRoleId(jwMRoleRes);
	}
	/*权限分配*/
	public void updateJwRoleBizRes(String jwRoleId,String menuCheckedIDstr,String menuUncheckedIDstr,String menuCheckedRestr,String menuUncheckedRestr) throws Exception{
		String[] bizIDs = menuCheckedIDstr.split("split");
		String[] bizIDsUn = menuUncheckedIDstr.split("split");
		String[] resIDs = menuCheckedRestr.split("split");
		String[] resIDsUn = menuUncheckedRestr.split("split");
		JwMRoleBiz jwMRoleBiz;
		JwMRoleRes jwMRoleRes;
		if(!menuUncheckedIDstr.equals("")){
		for(int i=0;i<bizIDsUn.length;i++){
			jwMRoleBiz=new JwMRoleBiz();
			jwMRoleBiz.setBiz_id(bizIDsUn[i]);
			jwMRoleBiz.setRole_id(jwRoleId);
			jwRoleDAO.delJwMRoleBiz(jwMRoleBiz);
			List<BusinessRel> list=serviceDAO.queryBizRelByRidList(jwMRoleBiz.getBiz_id());
			for(BusinessRel b:list){				
				serviceDAO.updateBizEditResDate(b.getB_id());
			}
		}
		
		}
		if(!menuUncheckedRestr.equals("")){
			String temp_biz_id="";
		for(int i=0;i<resIDsUn.length;i++){
			String[] tempres=resIDsUn[i].split("resfenge");
			jwMRoleRes=new JwMRoleRes();
			jwMRoleRes.setBiz_id(tempres[0]);
			jwMRoleRes.setRole_id(jwRoleId);
			jwMRoleRes.setRes_id(tempres[1]);
			jwRoleDAO.delJwMRoleRes(jwMRoleRes);
			temp_biz_id=jwMRoleRes.getBiz_id();
		}
		serviceDAO.updateBizEditResDate(temp_biz_id);
		}
		if(!menuCheckedIDstr.equals(""))
		for(int i=0;i<bizIDs.length;i++){
			jwMRoleBiz=new JwMRoleBiz();
			jwMRoleBiz.setBiz_id(bizIDs[i]);
			jwMRoleBiz.setRole_id(jwRoleId);
			jwRoleDAO.addJwMRoleBiz(jwMRoleBiz);
		}
		if(!menuCheckedRestr.equals("")){
			String temp_biz_id="";
		for(int i=0;i<resIDs.length;i++){
			String[] tempres=resIDs[i].split("resfenge");
			jwMRoleRes=new JwMRoleRes();
			jwMRoleRes.setBiz_id(tempres[0]);
			jwMRoleRes.setRole_id(jwRoleId);
			jwMRoleRes.setRes_id(tempres[1]);
			jwRoleDAO.addJwMRoleRes(jwMRoleRes);
			temp_biz_id=jwMRoleRes.getBiz_id();
		}		
			serviceDAO.updateBizEditResDate(temp_biz_id);
		}
		
		JwRole jwRole=new JwRole();
		jwRole.setRole_id(jwRoleId);
		jwRole.setChange_date(serviceDAO.getSysDate());
		jwRoleDAO.editJwRoleCDate(jwRole);
	}

	public void setServiceDAO(ServiceDAO serviceDAO) {
		this.serviceDAO = serviceDAO;
	}
}

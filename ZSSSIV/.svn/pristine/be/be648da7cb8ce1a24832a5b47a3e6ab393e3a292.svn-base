package com.kingtone.jw.platform.login;

import java.util.List;

import com.kingtone.jw.platform.domain.Account;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
import com.kingtone.ssi.util.IDUtil;
/**
 * Title:登录导航ac
 * Description:
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: May 11, 2011
 */
public class LoginAC extends SSIAction {

    private String type = "1";

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String success() throws Exception {
    	//初始化 用户相关信息SESSION
    	try{
	    	User currentUser = OrgUtils.getInstance().getCurrentUser();
	    	Account currentAccount = OrgUtils.getInstance().getCurrentAccount();
	    	Unit currentUnit = OrgUtils.getInstance().getUnitlistOfUser().get(0);
	    	List<Role> currentRoles = OrgUtils.getInstance().getRolelistOfUser();
	    	getSession().setAttribute(CURRENT_SESSION_USER, currentUser);
	    	getSession().setAttribute(CURRENT_SESSION_ACCOUNT, currentAccount);
	    	getSession().setAttribute(CURRENT_SESSION_UNIT, currentUnit);
	    	getSession().setAttribute(CURRENT_SESSION_ROLES, currentRoles);
	    	String button = "";
	    	for(int i=0;i<currentRoles.size();i++){
	    		Role role = currentRoles.get(i);
	    		String role_id = role.getRole_id();
	    		if(button.equals("")){
	    			button = OrgUtils.getInstance().getRoleButton(role_id);
	    		}else{
	    			button += "," + OrgUtils.getInstance().getRoleButton(role_id);
	    		}
	    		
	    	}
	    	getSession().setAttribute("ROLE_BUTTON", button);
//	    	Cookie cookie = new Cookie("ROLE_BUTTON", button);
//	    	getResponse().addCookie(cookie);
	    	LogTools.debug(getCurrentAccount().getUsername(),
					getCurrentUnit().getUnit_name(), "登入系统", 
					"登入管理平台");
    	}catch(Exception e){
    		
    	}
//		if(!IDUtil.LICENSE_RESULT)
//		{
//		//System.out.println(IDUtil.getLicenseMsg());
//		type="-1";
//		getRequest().setAttribute("type", type);
//		getRequest().setAttribute("msg1", IDUtil.getLicenseMsg());
//        return "error";
//		}
        return "success";
    }
    
    public String logout() throws Exception {
    	//清除 用户相关信息SESSION
    	try{
	    	getSession().removeAttribute(CURRENT_SESSION_USER);
	    	getSession().removeAttribute(CURRENT_SESSION_ACCOUNT);
	    	getSession().removeAttribute(CURRENT_SESSION_UNIT);
	    	getSession().removeAttribute(CURRENT_SESSION_ROLES);
    	}catch(Exception e){
    		
    	}
        return "logout";
    }

    public String error() throws Exception {
    	getRequest().setAttribute("type", type);
        return "error";
    }
}

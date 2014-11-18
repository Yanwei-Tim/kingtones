/**
 * 文件名：OrgUtils.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.platform.util;

import java.util.List;

import org.apache.commons.lang.Validate;

import com.kingtone.jw.platform.dao.AccountDAO;
import com.kingtone.jw.platform.dao.ButtonDAO;
import com.kingtone.jw.platform.dao.PrivilegeDAO;
import com.kingtone.jw.platform.dao.ResourceDAO;
import com.kingtone.jw.platform.dao.RoleDAO;
import com.kingtone.jw.platform.dao.UnitDAO;
import com.kingtone.jw.platform.dao.UserDAO;
import com.kingtone.jw.platform.domain.Account;
import com.kingtone.jw.platform.domain.Resource;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.ssi.util.SSISecurityUtil;

/**
 * 
 * Title:组织机构工具类
 * Description:通过该类获取当权登录用户及相关信息，同时提供各种组织机构查询功能
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Apr 13, 2011
 */
public class OrgUtils {

    private static OrgUtils instance = null;

    private AccountDAO accountDAO = null;

    private UserDAO userDAO = null;

    private PrivilegeDAO privilegeDAO = null;

    private ResourceDAO resourceDAO = null;

    private RoleDAO roleDAO = null;

    private UnitDAO unitDAO = null;

    private ButtonDAO buttonDAO = null;
    private String adminRoleId = null;
    private static final String configFile="configes";
    //---------------------------------------------------------------------------------------------
    /*
     * Description:获取当前登录用户帐号字符串
     */
    public Account getCurrentAccount() throws Exception{
        String username = SSISecurityUtil.getUsername();
        if(username!=null){
            return accountDAO.queryAccountByUsername(username);
        }
        return null; 
    }

    public User getCurrentUser() throws Exception{
        Account account = getCurrentAccount();
        return userDAO.queryUserByuserId(account.getUser_id());
    }

    public List<Role> getRolelistOfUser() throws Exception{
        return roleDAO.queryRoleListOfUser(getCurrentUser());
    }
    
    public List<Unit> getUnitlistOfUser() throws Exception{
        return unitDAO.queryUnitListOfUser(getCurrentUser());
    }
    
    //-----------------------------------------------------------------------------
    public void setAdminRoleId(String adminRoleId) {
        this.adminRoleId = adminRoleId;
    }

   

    public static void setInstance(OrgUtils instance) {
		OrgUtils.instance = instance;
	}

	public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	public void setPrivilegeDAO(PrivilegeDAO privilegeDAO) {
		this.privilegeDAO = privilegeDAO;
	}

	public void setResourceDAO(ResourceDAO resourceDAO) {
		this.resourceDAO = resourceDAO;
	}

	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	public void setUnitDAO(UnitDAO unitDAO) {
		this.unitDAO = unitDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	/**
     * 
     * Description:TODO 方法用途描述
     * @see
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: Apr 13, 2011
     * History:
     * his1:
     * @return
     */
    public static OrgUtils getInstance() {
        if (instance == null)
            instance = new OrgUtils();
        return instance;
    }

    public boolean isUserOfAdminRole(String userId) throws Exception {
        Validate.notNull(userId, "userId required");
        User user_bak =new User();
               user_bak.setUnitID(userId);
        List<Role> roleList = roleDAO.queryRoleListOfUser(user_bak);
        for (Role r : roleList) {
            if (adminRoleId.equals(r.getRole_id()))
                return true;
        }
        return false;
    }

    public List queryRoleListOfUser(String userId) throws Exception {
        Validate.notNull(userId, "userId required");
        User user_bak=new User();
        user_bak.setUnitID(userId);
        return roleDAO.queryRoleListOfUser(user_bak);
    }

    @SuppressWarnings("unchecked")
	public List<Resource> queryResourceList() throws Exception {
    	List list = resourceDAO.queryResourceList();
        return list;
    }

    public List<Role> queryRoleListOfResource(String resourceId) throws Exception {
    	Resource resource_bak=new Resource();
    	   resource_bak.setResource_id(resourceId);
        return roleDAO.queryRoleListOfResource(resource_bak);
    }
    
    public String getRoleButton(String role_id) throws Exception{
    	String button_viewID ="";
    	List buttonList = buttonDAO.queryButtonID(role_id);
    	for(int i =0;i<buttonList.size();i++){
    		if(button_viewID.equals("")){
    			button_viewID = buttonList.get(i).toString();
    		}else{
    			button_viewID += "," + buttonList.get(i).toString();
    		}
    	}
    	return button_viewID;
    }
    public void setButtonDAO(ButtonDAO buttonDAO) {
		this.buttonDAO = buttonDAO;
	}

	/**
	 * 去除字符串中的空格
	 * @param source String类型 源数据
	 * @return 
	 * yaoliming
	 */
	public static String delBlankChar(String source){
		while (source.indexOf("　") != -1) {
			int position = source.indexOf("　");
			String prefix = source.substring(0, position);
			String tail = source.substring(position + 1, source.length());
			source = prefix + tail;
		}
		return source;
	}
	public   static   String   reverseString(String   str){ 
	      String   result= " "; 
	      for(int   i=0;i <str.length();i++){ 
	            result=result+str.substring(str.length()-i-1,str.length()-i); 
	      } 
	      
	      return   result; 
	} 
	

	
}

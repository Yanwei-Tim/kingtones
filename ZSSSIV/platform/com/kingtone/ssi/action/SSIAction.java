/**
 * 文件名：SSIAction.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.action;

import java.io.PrintStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.kingtone.jw.platform.domain.Account;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Title:SSI框架Action基类
 * Description:基于此框架开发的Action可以继承此Action以提供有效的扩展机制
 * Copyright:Copyright 2011 KingToneInfo
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Apr 2, 2011
 * History:
 * his1:
 */
public class SSIAction extends ActionSupport {
	protected static String CURRENT_SESSION_USER = "currentUser";
	protected static String CURRENT_SESSION_UNIT = "currentUnit";
	protected static String CURRENT_SESSION_ROLES = "currentRoles";
	protected static String CURRENT_SESSION_ACCOUNT = "currentAccount";
	protected HttpSession getSession(){
		return ServletActionContext.getRequest().getSession();
	}
	protected HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	protected User getCurrentUser(){
		return (User) getSession().getAttribute(CURRENT_SESSION_USER);
	}
	protected Account getCurrentAccount(){
		return (Account) getSession().getAttribute(CURRENT_SESSION_ACCOUNT);
	}
	protected Unit getCurrentUnit(){
		return (Unit) getSession().getAttribute(CURRENT_SESSION_UNIT);
	}
	protected List<Role> getCurrentRoles(){
		return (List<Role>)getSession().getAttribute(CURRENT_SESSION_ROLES);
	}
	
    protected HttpServletResponse getResponse(){
    	return ServletActionContext.getResponse();
    }
//    public HttpServletRequest request = ServletActionContext.getRequest();
//    public HttpServletResponse response = ServletActionContext.getResponse();
//    public HttpSession session = request.getSession();
//    response.setContentType("text/html;charset=GBK");//解决中文乱码
//    PrintStream out = new PrintStream(response.getOutputStream());//获取out输出对象
    private static final long serialVersionUID = 1L;

    /**
     * 返回JSON数据的result Key
     */
    public static final String JSON = "jsonResult";

    /**
     * Description: 以JSON类型返回指定的变量
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: Apr 2, 2011
     * History:
     * his1:
     * @param target
     * @return
     */
    protected String toJSON(String... target) {
        // TODO 处理指定的JSON数据
        return JSON;
    }
    
    
}

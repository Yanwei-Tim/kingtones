package com.kingtone.ssi.util;

import org.acegisecurity.Authentication;
import org.acegisecurity.context.SecurityContext;
import org.acegisecurity.context.SecurityContextHolder;
import org.acegisecurity.ui.WebAuthenticationDetails;
import org.acegisecurity.userdetails.UserDetails;
/**
 * 
 * Title:安全认证 工具类
 * Description:通过acegi中配置的httpSessionContextIntegrationFilter过滤器，获取当前登录用户信息
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Apr 13, 2011
 */
public class SSISecurityUtil {
	
	/* 控制资源角色列表 何时重新加载，默认为不重复加载 
	 * 考虑到 资源 角色 都会修改； 
	 * 如果想让修改后立即生效，可以指定该参数为true
	 * 否则 需要重启服务才可生效；
	 **/
	public static boolean reLoadResRoleList = false;
	public static String getUsername() {   
        SecurityContext ctx = SecurityContextHolder.getContext();   
        if (ctx != null) {   
            Authentication auth = ctx.getAuthentication();   
            if (auth != null) {   
                Object principal = auth.getPrincipal();   
                if (principal instanceof UserDetails) {   
                    return ((UserDetails) principal).getUsername();   
                } else {   
                    return principal.toString();   
                }   
            }   
        }   
        return null;   
    }   
  
    public static String getSessionID() {   
        SecurityContext ctx = SecurityContextHolder.getContext();   
        if (ctx != null) {   
            if (ctx instanceof SecurityContext) {   
                SecurityContext sc = (SecurityContext) ctx;   
                Authentication auth = sc.getAuthentication();   
                if (auth != null) {   
                    Object details = auth.getDetails();   
                    if (details instanceof WebAuthenticationDetails) {   
                        return ((WebAuthenticationDetails) details).getSessionId();   
                    } else {   
                        return null;   
                    }   
                }   
            }   
        }   
        return null;   
    }   
}

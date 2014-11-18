/**
 * 文件名：SSIExceptionMappingInterceptor.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.interceptor;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.kingtone.ssi.log.SSILogger;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.LocaleProvider;
import com.opensymphony.xwork2.interceptor.ExceptionHolder;
import com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor;
/**
 * Title:异常拦截器
 * Description:重写异常拦截器
 * Copyright:Copyright 2011 KingToneInfo
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Apr 8, 2011
 * History:
 * his1:
 */
public class SSIExceptionMappingInterceptor extends ExceptionMappingInterceptor
		implements LocaleProvider {
	private static final long serialVersionUID = 1L;
	public String intercept(ActionInvocation invocation) throws Exception {
	    //跳转页面标识，在Struts-default.xml文件中配置
	    //global_error:跳转到错误页面
	    //ajax_error：返回json数据
		String result = "global_error";
		try {
			result = invocation.invoke();
//			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//            Date date = new Date();
//            String currentTime = dateFormat.format(date);
		} catch (Exception e) {
		    
            StackTraceElement[] trace = e.getStackTrace();
            String errorStr = "\n   "+invocation.getAction().getClass().toString();
            for(int i = 0 ;i<trace.length;i++){
                errorStr+="\n   " + trace[i];
            }
            SSILogger.Exceptionlogger.error(errorStr); 
            
            HttpServletRequest request = ServletActionContext.getRequest();
			String submitType = request.getHeader("submit-type");
			if (submitType == null || "".equals(submitType)) {
				submitType = request.getParameter("submit-type");
			}
			// 如果为ajax提交，则将错误信息写到response中, 并设置状态值
			if ("ajax".equals(submitType)) {
				result = "ajax_error";
			} 
            //向JSP页面公布异常
            publishException(invocation, new ExceptionHolder(e == null ? e : e));
		}
		return result;
	}

	public Locale getLocale() {
		return ActionContext.getContext().getLocale();
	}

}

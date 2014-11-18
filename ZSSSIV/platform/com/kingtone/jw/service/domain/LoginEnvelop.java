/**
 * 文件名：LoginEnvelop.java
 * 创建人：陈萧如 - chenxiaoru@kingtoneinfo.com
 * 创建时间：Dec 6, 2011
 * 版权所有：西安联合信息技术股份有限公司
 */

package com.kingtone.jw.service.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * 警务用户登录验证信封类。
 *
 * @author 陈萧如 - chenxiaoru@kingtoneinfo.com
 * @version 1.0 Created on Dec 6, 2011
 */
public class LoginEnvelop extends InsertEnvelop {
	/* 登录用户密码 */
	private String psw;
	
	/* 是否需要用户验证： true：是；false：否 */
	private boolean shouldValidateUser = true;
	
	List tableList = new ArrayList();

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}
	
	public List getTableList() {
		return tableList;
	}

	public void setTableList(List tableList) {
		this.tableList = tableList;
	}

	public boolean isShouldValidateUser() {
		return shouldValidateUser;
	}

	public void setShouldValidateUser(boolean shouldValidateUser) {
		this.shouldValidateUser = shouldValidateUser;
	}

}

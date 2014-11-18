/**
 * 文件名：Menu.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.platform.domain;

import java.util.List;

import com.kingtone.ssi.domain.SSIDomain;

/**
 * <p>[描述信息：说明类的基本功能]</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Sep 22, 2008 9:53:32 PM
 */
public class RoleMenu  {
	
	private String  role_id;
	private String  role_id_bak;
	private String menu_id;
	
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getRole_id_bak() {
		return role_id_bak;
	}
	public void setRole_id_bak(String role_id_bak) {
		this.role_id_bak = role_id_bak;
	}
	

	
}

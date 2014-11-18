/**
 * 文件名：SSIApplicationContextUtils.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.contextloader;

import org.springframework.context.ApplicationContext;

/**
 * <p>[描述信息：说明类的基本功能]</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Sep 3, 2008 10:21:21 PM
 */
public class SSIApplicationContextUtils {

	private static SSIApplicationContextUtils instance = null;

	private ApplicationContext ctx = null;

	private SSIApplicationContextUtils() {

	}

	public static SSIApplicationContextUtils getInstance() {
		if (instance == null)
			instance = new SSIApplicationContextUtils();
		return instance;
	}

	protected void setApplicationContext(ApplicationContext ctx) {
		this.ctx = ctx;
	}

	public ApplicationContext getApplicationContext() {
		return this.ctx;
	}
}

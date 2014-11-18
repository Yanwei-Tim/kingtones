/**
 * 文件名：DAOUtils.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.dao;

/**
 * <p>[描述信息：说明类的基本功能]</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Oct 7, 2008 11:21:16 AM
 */
public class DAOUtils {

	public static String convertBoolean2String(Boolean b) {
		if (b == null)
			return null;
		return b.booleanValue() ? "1" : "0";
	}

	public static Boolean convertString2Boolean(String value, Boolean defaultValue) {
		if (value == null)
			return defaultValue;
		if ("0".equals(value))
			return Boolean.FALSE;
		else if ("1".equals(value))
			return Boolean.TRUE;
		return defaultValue;
	}

	public static boolean convertString2Boolean(String value) {
		return convertString2Boolean(value, Boolean.FALSE);
	}
}

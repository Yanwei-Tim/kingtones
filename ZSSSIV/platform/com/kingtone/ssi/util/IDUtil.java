/**
 * 文件名：IDGenerator.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.util;

import java.rmi.server.UID;


/**
 * <p>ID生成工具。</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Aug 21, 2008 3:20:23 PM
 */
public class IDUtil {
	public static boolean LICENSE_RESULT=false;
	public static String getLicenseMsg(){
		String LICENSE_RESULT_MSG="通用系统LICENSE过期，服务启动停止。结果:"+IDUtil.LICENSE_RESULT;
		return LICENSE_RESULT_MSG;
	} 
	public static String newID() {
		String id = new UID().toString();
		//id = id.replaceAll(":|-", "");
		return id;
	}
}

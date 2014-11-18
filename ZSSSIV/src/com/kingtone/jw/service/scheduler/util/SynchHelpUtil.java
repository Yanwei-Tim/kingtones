/**
 * 文件名：SycnHelpUtil.java
 * 创建人：陈萧如 - chenxiaoru@kingtoneinfo.com
 * 创建时间：Dec 16, 2011
 * 版权所有：西安联合信息技术股份有限公司
 */

package com.kingtone.jw.service.scheduler.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kingtone.jw.service.util.CommonTool;


/**
 * 数据库同步文件帮助工具类
 * 
 * @author 陈萧如 - chenxiaoru@kingtoneinfo.com
 * @version 1.0 Created on Dec 16, 2011
 */
public class SynchHelpUtil {
	/**
	 * 
	 * 格式化文件名，去掉无效字符（文件名不能包含下面任何字符之一：\ / : * ? " < > |）。
	 * 
	 * @param fileName：需要格式化的文件名
	 * @return：格式化后的文件名
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 16, 2011
	 */
	public static String formatFileName(String fileName) {
		String nameFormat = "";
		String regEx = "/|\\\\|:|\\*|\\?|\"|<|>"; // 正则表达式，表示\ / : * ? " < > |特殊字符
		nameFormat = fileName.replaceAll(regEx, "");
		return nameFormat;
	}

	/**
	 * 
	 * 格式化插入参数值表达式（sql语句中对字符串里带有'符号的需要转义为'',否则会报错）。
	 * -当插入值为空或者为“null”字符串，返回null字符串。
	 * -当插入值不为空时，将字符串内所有的'符号替换为''，返回'value'字符串。
	 * 
	 * @param value：插入值
	 * @return 格式化后的插入值
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 20, 2011
	 */
	public static String formatInsertValueExpress(String value){
		String returnValue = "";
		if(value==null||value.equals("null")){
			returnValue = "null";
		}else if(!value.isEmpty()){
			returnValue = "\'"+value.replaceAll("'", "''")+"\'";
		}
		return returnValue;
	}
	
	/**
	 * 
	 * 将传入列表中的CHANGE_DATE全为9的去除（不将SYSTEM_RES_CONFIG表中CHANGE_DATE字段值全为9的数据同步到sqlite文件中）。
	 * @param resList：需要过滤的SYSTEM_RES_CONFIG表数据。
	 * @return：过滤后的SYSTEM_RES_CONFIG表数据。
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 20, 2011
	 */
	public static List<HashMap<String, String>> formateResList(List<HashMap<String, String>> resList){
		List<HashMap<String, String>> returnResList = new ArrayList<HashMap<String, String>>();
		for(HashMap<String, String> map:resList){
			String changeDate = map.get("CHANGE_DATE");
			// 移除map中key为CHANGE_DATE对应值全为9的数据
			if(changeDate==null || changeDate.isEmpty() || !changeDate.replaceAll("9", "").isEmpty()){
				returnResList.add(map);
			}
		}
		return returnResList;
	}
	
	/**
	 * 
	 * 获取服务器数据库中的最新更新时间。
	 * @param roleId：角色ID
	 * @return 服务器数据库中的最新更新时间
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws Exception 
	 * @date: Created on: Dec 21, 2011
	 */
	public static String getSynchDateFromDB(String roleId) throws Exception {
		String synchDate = "";
		if(roleId == null)
			synchDate = CommonTool.synchDAO.queryRootBizUpdateDate();
		else
			synchDate = CommonTool.synchDAO.queryRoleBizUpdateDateByRoleId(roleId);
		return synchDate;
	}
	
	/**
	 * 
	 * 将传入数据流写入目标文件。
	 * @param sourceStream：传入数据流
	 * @param destinationFile：目标文件
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws IOException 
	 * @date: Created on: Dec 30, 2011
	 */
	public static void conyFile(InputStream sourceStream, File destinationFile) throws IOException{
		// 手机本地的sqlite文件 
		FileOutputStream fos = new FileOutputStream(destinationFile);
		try{
			byte[] buffer = new byte[8192];
			int count = 0;
			// 开始复制到本地police.db文件
			while ((count = sourceStream.read(buffer)) > 0) {
				fos.write(buffer, 0, count);
			}
		}  catch (IOException e) {
			throw e;
		} finally {
			// 关闭文件流
			sourceStream.close();
			fos.close();
		}
	}
}

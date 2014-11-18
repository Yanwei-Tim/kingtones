/**
 * 文件名：OrgUtils.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.biz.common.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.commons.lang.Validate;

import com.kingtone.jw.platform.dao.AccountDAO;
import com.kingtone.jw.platform.dao.PrivilegeDAO;
import com.kingtone.jw.platform.dao.ResourceDAO;
import com.kingtone.jw.platform.dao.RoleDAO;
import com.kingtone.jw.platform.dao.UnitDAO;
import com.kingtone.jw.platform.dao.UserDAO;
import com.kingtone.jw.platform.domain.*;
import com.kingtone.ssi.util.SSISecurityUtil;


public class Utils {

	private static final String configFile = "configes";
	
	private static Map tztgCodeList = null;
	public static Map getTztgCodeList(){
		if(tztgCodeList==null){
			tztgCodeList = new HashMap();
			Map map = new HashMap();
			map.put("0", "未发送");
			map.put("1", "已发送");
			tztgCodeList.put("sendstatus", map);
			map = new HashMap();
			map.put("1", "协查通报");
			map.put("2", "通知通告");
			map.put("3", "会议通知");
			tztgCodeList.put("noticetype", map);
		}
		return tztgCodeList;
	}

	/**
	 * 获取config.properties配置文件里的常量设置
	 * 
	 * @param k
	 * @return
	 */
	public static String GetConfigByKey(String k) {
		try {
			ResourceBundle rb = ResourceBundle.getBundle(configFile);
			if (rb == null) {
				return null;
			}
			return rb.getString(k);
		} catch (Exception er) {
			er.printStackTrace();
			return null;
		}
	}
}

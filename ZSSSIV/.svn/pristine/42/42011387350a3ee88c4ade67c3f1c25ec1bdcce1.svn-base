package com.kingtone.jw.service.util;

import java.util.ResourceBundle;

public class GetConfig {
	private static final String configFile="common";

	/**
	 * 获取config.properties配置文件里的常量设置
	 * @param k
	 * @return
	 */
	public static String GetConfigByKey(String k){
		try{
			ResourceBundle  rb = ResourceBundle.getBundle(configFile);
			if(rb==null){
				return null;
			}
			return rb.getString(k);
		}catch(Exception er){
			er.printStackTrace();
			return null;
		}
	}

	


}

package com.kingtone.jw.biz.service.util;

import java.rmi.server.UID;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Tools {

	public static String getUID(){
		String newId = new UID().toString();
		return newId;
	}
	
	/**
	 * 格式化时间串
	 * @param date
	 * @return
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: 2012-4-18
	 */
	public static String formatDate(Date date){
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateformat.format(date);
	}

}

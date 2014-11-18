/**
 * 文件名：ServiceData.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Jun 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.service.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Title:终端-服务端 数据通信 信封类--基类
 * Description:
 * 1、可以在其中自定义list业务对象，
 * 2、服务端将查出的数据封装其中，装换成xml字符串 传到终端
 * 3、终端接收xml字符串，使用xml解析工具，将字符串还原成serviceData对象 然后使用
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Jun 2, 2011
 */
public class ServiceData {
	

	List tableList = new ArrayList();

	

	public List getTableList() {
		return tableList;
	}

	public void setTableList(List tableList) {
		this.tableList = tableList;
	}

}

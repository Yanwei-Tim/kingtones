/**
 * 文件名：SSIContextLoaderListener.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.contextloader;


import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.ContextLoaderListener;


/**
 * Title:Web监听类
 * Description:启动Web容器时，自动装配Spring ApplicationContext的配置信息
 * Copyright:Copyright 2011 KingToneInfo
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Apr 2, 2011
 * History:
 * his1:
 */
public class SSIContextLoaderListener extends ContextLoaderListener {
	
	protected ContextLoader createContextLoader() {
		/*
		String path=System.getProperty("user.dir");
		path=this.getClass().getResource("/").getPath();
		//System.out.println("license_path1=qq:"+path);
		String license_path=this.getClass().getProtectionDomain().getCodeSource().getLocation().getFile();
		//System.out.println("license_path2="+license_path);
		
		try {
			SSISecurityService.LicensePath=path;
			Map licenseMap = SSISecurityService.getMapLicense();
			SSISecurityService.getResultLicense(licenseMap);
		} catch (Exception e) {
			// TODO: handle exception			
		}
		*/
		
		return new SSIContextLoader();
	}
}

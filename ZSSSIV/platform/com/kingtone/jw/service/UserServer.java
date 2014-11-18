package com.kingtone.jw.service;

import com.kingtone.jw.service.util.CommonTool;

public class UserServer {
	/**
	 * yanhao:2012-02-15 为终端1.2版提供版本更新接口
	 */
	public String checkUpdate(String currentVersion) {
		return CommonTool.apkCheckBS.checkApk(currentVersion);
	}
}

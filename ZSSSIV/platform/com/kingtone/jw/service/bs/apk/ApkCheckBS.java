package com.kingtone.jw.service.bs.apk;

public interface ApkCheckBS {
	
	/**
	 * <p>apk包版本检测</p>
	 * @param:currentVersion 终端当前版本号
	 * @return：版本下载URL 或者 返回not字符串
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public String checkApk(String currentVersion);

}

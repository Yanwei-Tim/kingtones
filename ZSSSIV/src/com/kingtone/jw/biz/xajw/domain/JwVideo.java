package com.kingtone.jw.biz.xajw.domain;

/**
 * 警务视频监控 关联表配置库jw_spjk
 * 
 * @author hanliqiang@kingtoneinfo.com
 * 
 */

public class JwVideo {
	private String id;// 主键ID
	private String ip;// ip地址
	private String port;// 端口
	private String point;// 采集点
	private String jk_state;// 是否可用
	private String order_id;// 排序
	private String description;// 具体描述

	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getJk_state() {
		return jk_state;
	}

	public void setJk_state(String jk_state) {
		this.jk_state = jk_state;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}

package com.kingtone.jw.biz.manage.domain;

import java.util.Date;

/**
 * 法律法规目录
 * 
 */
public class LawDirectory {

	private int id;
	private String code;// 目录编码
	private String name;// 目录名称
	private Date createdTime;// 创建时间
	private int sort;// 排序编码
	private int parentId;// 父类ID

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * 获取法律法规目录编码
	 * 
	 * @return code 目录编码
	 */
	public String getCode() {
		return code;
	}

	/**
	 * 设置法律法规目录编码
	 * 
	 * @param code
	 *            需要设置的目录编码
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * 获取法律法规目录名称
	 * 
	 * @return code 目录名称
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置法律法规目录名称
	 * 
	 * @param name
	 *            需要设置的目录名称
	 */
	public void setName(String name) {
		this.name = name;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

}

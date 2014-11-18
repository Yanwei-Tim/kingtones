/**
 * 文件名：MessageResourceAC.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.action;

import com.kingtone.ssi.dto.Pagination;

/**
 * Title:SSI框架Action基类
 * Description:翻页使用的Action基类
 * Copyright:Copyright 2011 KingToneInfo
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Apr 2, 2011
 * History:
 * his1:
 */
public class SSIPaginationSupportAction extends SSIAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 记录总数
	 */
	private int totalCount;

	/**
	 * 开始记录
	 */
	private int start;

	/**
	 * 查询条数
	 */
	private int limit;

	/**
	 *
	 * @return 
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 *
	 * @param totalCount
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 *
	 * @return 
	 */
	public int getStart() {
		return start;
	}

	/**
	 *
	 * @param start
	 */
	public void setStart(int start) {
		this.start = start;
	}

	/**
	 *
	 * @return 
	 */
	public int getLimit() {
		return limit;
	}

	/**
	 *
	 * @param limit
	 */
	public void setLimit(int limit) {
		this.limit = limit;
	}

	/**
	 *
	 * @param pagination
	 */
	protected void setPagination(Pagination pagination) {
		this.limit = pagination.getLimit();
		this.start = pagination.getStart();
		this.totalCount = pagination.getTotalCount();
	}
}

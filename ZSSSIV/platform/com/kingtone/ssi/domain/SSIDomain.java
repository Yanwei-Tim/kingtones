/**
 * 文件名：SSIDomain.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.domain;

/**
 * <p>域对像，映射操作实体</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Aug 16, 2008 2:38:48 PM
 */
public class SSIDomain {

	private String id = null;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		if (this.getClass() != obj.getClass())
			return false;
		return this.hashCode() == obj.hashCode();
	}

	public int hashCode() {
		return id == null ? 0 : id.hashCode();
	}
}

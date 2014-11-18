/**
 * @Title: ParameterInfo.java
 * @Package com.kingtone.jw.service.jwoa.bean
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright: Copyright (c) 2012  西安联合信息技术股份有限公司
 * @author 李刚
 * @date Aug 1, 2013 10:18:23 AM
 * @version V0.5
 */
package com.kingtone.jw.service.jwoa.bean;

import java.io.Serializable;

/**
 * @ClassName: ParameterInfo
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 李刚
 * @date Aug 1, 2013 10:18:23 AM
 * 
 */
public class ParameterInfo implements Serializable {
	private String datafield = null; // 字段名称
	private String operator = null; // sql操作符
	private String datavalue = null;// 字段的值
	private String datatype = "VARCHAR";// 字段的类型
	private String format = "";// 字段的值的格式化
	

	/**
	 * @return Returns the datafield.
	 */

	public String getDatafield() {
		return datafield;
	}

	/**
	 * @param datafield
	 *            The datafield to set.
	 */
	public void setDatafield(String datafield) {
		this.datafield = datafield;
	}

	/**
	 * @return Returns the operator.
	 */

	public String getOperator() {
		return operator;
	}

	/**
	 * @param operator
	 *            The operator to set.
	 */
	public void setOperator(String operator) {
		this.operator = operator;
	}

	/**
	 * @return Returns the datavalue.
	 */

	public String getDatavalue() {
		return datavalue;
	}

	/**
	 * @param datavalue
	 *            The datavalue to set.
	 */
	public void setDatavalue(String datavalue) {
		this.datavalue = datavalue;
	}

	/**
	 * @return Returns the datatype.
	 */

	public String getDatatype() {
		return datatype;
	}

	/**
	 * @param datatype
	 *            The datatype to set.
	 */
	public void setDatatype(String datatype) {
		this.datatype = datatype;
	}

	/**
	 * @return Returns the format.
	 */

	public String getFormat() {
		return format;
	}

	/**
	 * @param format
	 *            The format to set.
	 */
	public void setFormat(String format) {
		this.format = format;
	}

}

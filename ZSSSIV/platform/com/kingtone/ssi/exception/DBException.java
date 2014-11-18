/**
 * 文件名：DBException.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.exception;

/**
 * <p> Title: 数据库操作异常　</p>
 * <p> Description: 描述数据库操作的异常情况　</p>
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0
 */
public class DBException extends SystemException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 构造方法
	 */
	public DBException() {
	}

	/**
	 * 构造方法
	 */
	public DBException(String msg) {
		super(msg);
	}

	/**
	 * 构造方法
	 */
	public DBException(Throwable ex) {
		super(ex);
	}

	/**
	 * 构造方法
	 */
	public DBException(String msg, Throwable ex) {
		super(msg, ex);
	}
}

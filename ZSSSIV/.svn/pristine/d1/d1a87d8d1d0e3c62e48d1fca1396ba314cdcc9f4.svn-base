package com.kingtone.jw.service.face.entity;


import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 返回结果的基本信息，由返回结果的根实体调用
 * @author yangzm
 *
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class BaseInfo {
	private String code;
	private String message;
	private int rowcount;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getRowcount() {
		return rowcount;
	}
	
	@Override
	public String toString() {
		return "[code="+this.code+",message="+this.message+",rowCount="+this.rowcount+"]";
	}

	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}
}

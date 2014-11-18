package com.kingtone.jw.biz.manage.domain;

/**
 * 通讯录详细
 * @author laukie
 *
 */
public class Address {

	/** 通讯录编号 */
	private String ADDID;
	
	/** 人员姓名 */
	private String NAME;
	
	/** 所在单位编号 */
	private String DEPTID;
	
	/** 手机 */
	private String MOBILE;
	
	/** 单位电话 */
	private String UNITTEL;
	
	/** 家庭电话 */
	private String HOMETEL;
	
	/** 备注 */
	private String REMARK;
	
	/** 职务 */
	private String DUTY;
	
	/** 排序号 */
	private String SORT;
	
	/** 手机号2 */
	private String MOBILE2;
	
	/** 单位电话2 */
	private String UNITTEL2;
	
	/** 机构名称 */
	private String DEPTNAMES;
	
	/** 邮件 */
	private String EMAIL;

	/**
	 * 通讯录编号的获取
	 * @return the aDDID
	 */
	public String getADDID() {
		return ADDID;
	}

	/**
	 * 通讯录编号的设定
	 * @param addid the aDDID to set
	 */
	public void setADDID(String addid) {
		ADDID = addid;
	}

	/**
	 * 所在单位编号的取得
	 * @return the dEPTID
	 */
	public String getDEPTID() {
		return DEPTID;
	}

	/**
	 * 所在单位编号的设定
	 * @param deptid the dEPTID to set
	 */
	public void setDEPTID(String deptid) {
		DEPTID = deptid;
	}

	/**
	 * 机构名称的取得
	 * @return the dEPTNAMES
	 */
	public String getDEPTNAMES() {
		return DEPTNAMES;
	}

	/**
	 * 机构名称的设定
	 * @param deptnames the dEPTNAMES to set
	 */
	public void setDEPTNAMES(String deptnames) {
		DEPTNAMES = deptnames;
	}

	/**
	 * 职务的取得
	 * @return the dUTY
	 */
	public String getDUTY() {
		return DUTY;
	}

	/**
	 * 职务的设定
	 * @param duty the dUTY to set
	 */
	public void setDUTY(String duty) {
		DUTY = duty;
	}

	/**
	 * 邮件地址的取得
	 * @return the eMAIL
	 */
	public String getEMAIL() {
		return EMAIL;
	}

	/**
	 * 邮件地址的设定
	 * @param email the eMAIL to set
	 */
	public void setEMAIL(String email) {
		EMAIL = email;
	}

	/**
	 * 家庭电话的取得
	 * @return the hOMETEL
	 */
	public String getHOMETEL() {
		return HOMETEL;
	}

	/**
	 * 家庭电话的设定
	 * @param hometel the hOMETEL to set
	 */
	public void setHOMETEL(String hometel) {
		HOMETEL = hometel;
	}

	/**
	 * 手机号码的取得
	 * @return the mOBILE
	 */
	public String getMOBILE() {
		return MOBILE;
	}

	/**
	 * 手机号码的设定
	 * @param mobile the mOBILE to set
	 */
	public void setMOBILE(String mobile) {
		MOBILE = mobile;
	}

	/**
	 * 手机号2的取得
	 * @return the mOBILE2
	 */
	public String getMOBILE2() {
		return MOBILE2;
	}

	/**
	 * 手机号2的设定
	 * @param mobile2 the mOBILE2 to set
	 */
	public void setMOBILE2(String mobile2) {
		MOBILE2 = mobile2;
	}

	/**
	 * 人员姓名的取得
	 * @return the nAME
	 */
	public String getNAME() {
		return NAME;
	}

	/**
	 * 人员姓名的设定
	 * @param name the nAME to set
	 */
	public void setNAME(String name) {
		NAME = name;
	}

	/**
	 * 备注详细的取得
	 * @return the rEMARK
	 */
	public String getREMARK() {
		return REMARK;
	}

	/**
	 * 备注详细的设定
	 * @param remark the rEMARK to set
	 */
	public void setREMARK(String remark) {
		REMARK = remark;
	}

	/**
	 * 排序号的取得
	 * @return the sORT
	 */
	public String getSORT() {
		return SORT;
	}

	/**
	 * 排序号的设定
	 * @param sort the sORT to set
	 */
	public void setSORT(String sort) {
		SORT = sort;
	}

	/**
	 * 单位电话的取得
	 * @return the uNITTEL
	 */
	public String getUNITTEL() {
		return UNITTEL;
	}

	/**
	 * 单位电话的设定
	 * @param unittel the uNITTEL to set
	 */
	public void setUNITTEL(String unittel) {
		UNITTEL = unittel;
	}

	/**
	 * 单位电话2的取得
	 * @return the uNITTEL2
	 */
	public String getUNITTEL2() {
		return UNITTEL2;
	}

	/**
	 * 单位电话2设定
	 * @param unittel2 the uNITTEL2 to set
	 */
	public void setUNITTEL2(String unittel2) {
		UNITTEL2 = unittel2;
	}
}

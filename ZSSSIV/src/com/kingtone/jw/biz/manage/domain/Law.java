package com.kingtone.jw.biz.manage.domain;

/**
 * 法律法规详细
 * @author laukie
 *
 */
public class Law {

	/** 法规ID */
	private String LAW_ID;
	
	/** 法规代码 */
	private String LAW_CODE;
	
	/** 法规名称 */
	private String LAW_NAME;
	
	/** 颁布事件 */
	private String ADMINISTRATION;
	
	/** 法规内容 */
	private String IRREGULARITYACTION;
	
	/** 法规类型 */
	private String LAW_TYPE;

	/**
	 * 颁布事件的取得
	 * @return the aDMINISTRATION
	 */
	public String getADMINISTRATION() {
		return ADMINISTRATION;
	}

	/**
	 * 颁布事件的设定
	 * @param administration the aDMINISTRATION to set
	 */
	public void setADMINISTRATION(String administration) {
		ADMINISTRATION = administration;
	}

	/**
	 * 法规内容的取得
	 * @return the iRREGULARITYACTION
	 */
	public String getIRREGULARITYACTION() {
		return IRREGULARITYACTION;
	}

	/**
	 * 法规内容的设定
	 * @param irregularityaction the iRREGULARITYACTION to set
	 */
	public void setIRREGULARITYACTION(String irregularityaction) {
		IRREGULARITYACTION = irregularityaction;
	}

	/**
	 * 法规代码的取得
	 * @return the lAW_CODE
	 */
	public String getLAW_CODE() {
		return LAW_CODE;
	}

	/**
	 * 法规代码的设定
	 * @param law_code the lAW_CODE to set
	 */
	public void setLAW_CODE(String law_code) {
		LAW_CODE = law_code;
	}

	/**
	 * 法规ID的取得
	 * @return the lAW_ID
	 */
	public String getLAW_ID() {
		return LAW_ID;
	}

	/**
	 * 法规ID的设定
	 * @param law_id the lAW_ID to set
	 */
	public void setLAW_ID(String law_id) {
		LAW_ID = law_id;
	}

	/**
	 * 法规名称的取得
	 * @return the lAW_NAME
	 */
	public String getLAW_NAME() {
		return LAW_NAME;
	}

	/**
	 * 法规名称的设定
	 * @param law_name the lAW_NAME to set
	 */
	public void setLAW_NAME(String law_name) {
		LAW_NAME = law_name;
	}

	/**
	 * 法规类型的取得
	 * @return the lAW_TYPE
	 */
	public String getLAW_TYPE() {
		return LAW_TYPE;
	}

	/**
	 * 法规类型的设定
	 * @param law_type the lAW_TYPE to set
	 */
	public void setLAW_TYPE(String law_type) {
		LAW_TYPE = law_type;
	}
}

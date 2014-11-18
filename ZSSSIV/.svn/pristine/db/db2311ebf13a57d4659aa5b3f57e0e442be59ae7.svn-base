package com.kingtone.jw.service.face.entity;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 查询条件实体，由查询根实体调用
 * @author Administrator
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class QueryCondition {

	@XmlElement(name = "imgStr")
	private String img; // 现场采集人脸的照片

	@XmlElement(name = "XB")
	private String sex; // 性别 男：1

	@XmlElement(name = "CSRQ")
	private String birthdayYear; // 出生年份

	@XmlElement(name = "GJ")
	private String country; // 国家 中国:156

	@XmlElement(name = "MZ")
	private String nation; // 民族

	@XmlElement(name = "JG")
	private String nativePlace; // 籍贯  广州市:440100

	@XmlElement(name = "KLB")
	private String libSubject; // 库类别 常住人口库：10

	@XmlElement(name = "fScore")
	private String score; // 比对相似度的阀值

	@XmlElement(name = "iMaxCount")
	private int maxCount; // 返回比中的最大记录数

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthdayYear() {
		return birthdayYear;
	}

	public void setBirthdayYear(String birthdayYear) {
		this.birthdayYear = birthdayYear;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getNativePlace() {
		return nativePlace;
	}

	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}

	public String getLibSubject() {
		return libSubject;
	}

	public void setLibSubject(String libSubject) {
		this.libSubject = libSubject;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public int getMaxCount() {
		return maxCount;
	}

	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}

}

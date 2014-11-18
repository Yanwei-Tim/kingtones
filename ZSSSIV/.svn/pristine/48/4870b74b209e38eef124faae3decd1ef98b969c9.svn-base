package com.kingtone.jw.service.face.entity;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 返回结果的根实体
 * @author yangzm
 */
@XmlRootElement(name = "root")
@XmlAccessorType(XmlAccessType.FIELD)
public class Root {

	@XmlElement(name = "header")
	private BaseInfo info;

	@XmlElementWrapper(name = "body")
	@XmlElement(name = "DrvPreasign")
	private List<Preasign> preasignList;

	public BaseInfo getInfo() {
		return info;
	}

	public void setInfo(BaseInfo info) {
		this.info = info;
	}

	public List<Preasign> getPreasignList() {
		return preasignList;
	}

	public void setPreasignList(List<Preasign> preasignList) {
		this.preasignList = preasignList;
	}

	@Override
	public String toString() {
		System.out.println("[info:"+this.info+"]");
		for(Preasign p :preasignList){
			System.out.println("----- id =  " + p.getId());
			System.out.println("----- CaseID =  " + p.getCaseID());
			System.out.println("----- Name =  " + p.getName());
		}
		return super.toString();
	}
}

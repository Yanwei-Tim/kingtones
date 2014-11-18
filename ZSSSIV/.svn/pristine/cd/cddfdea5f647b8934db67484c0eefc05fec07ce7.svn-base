package com.kingtone.jw.platform.codelist;

import java.util.List;

import com.kingtone.jw.biz.service.bs.ServiceBS;
import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.platform.bs.CodeListBS;
import com.kingtone.jw.platform.domain.Code;
import com.kingtone.ssi.action.SSIAction;

public class CodeListAC extends SSIAction{
	
	public CodeListBS codeListBS;
	public ServiceBS serviceBS;
	//返回到前台的select标签字符串
	private String codeListHtml = "";
	//前台传来的代码类型
	private String codeType = null;
	//前台传来的select标签id
	private String selectId = null;
	
	private String selectName = null;
	
	private String selectWidth =  null;
	

	public void setCodeListBS(CodeListBS codeListBS) {
		this.codeListBS = codeListBS;
	}
	
	public String findCodeListByType()throws Exception{
		Code code = new Code();
		code.setCodetype(codeType);
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\""+selectId+"\" name=\""+selectName+"\" style=\"width:"+selectWidth+"%\">");
		List codeList = codeListBS.findCodeListByType(code);
		for(Object o:codeList){
			Code c = (Code)o;
			sb.append("<option value=\""+c.getCode()+"\">"+c.getCodename()+"</option>");
		}
		sb.append("</select>");
		codeListHtml = sb.toString();
		return JSON;
	}

	public void setCodeListHtml(String codeListHtml) {
		this.codeListHtml = codeListHtml;
	}

	public String getCodeListHtml() {
		return codeListHtml;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public void setSelectId(String selectId) {
		this.selectId = selectId;
	}

	public void setSelectName(String selectName) {
		this.selectName = selectName;
	}

	public void setSelectWidth(String selectWidth) {
		this.selectWidth = selectWidth;
	}

	public void setServiceBS(ServiceBS serviceBS) {
		this.serviceBS = serviceBS;
	}

	
}

package com.kingtone.jw.service.jwoa.envelop;

import java.util.ArrayList;
import java.util.List;

import com.kingtone.jw.service.jwoa.bean.ParameterInfo;

/**
 * @ClassName: ReceiptEnvelop
 * @Description: 警务用户 收文记录信封类。
 * @author 李刚
 * @date 2013-8-1 上午9:13:08
 */
public class OaEnvelop {
	/** 查询业务标识 **/
	private String bizTag = null;
	/** 查询条件 **/
	private List condition = new ArrayList();
	/** 返回数据列表 **/
	private List list = new ArrayList();
	/** 返回详细信息 **/
	private Object detail = null;
	private String guid;
	private String corpId = "zsga";
    private Integer wfId;//流程编号
    private Integer noteId;//流程节点编号
    private Integer proId;//处理编号
    private String procName;//当前处理步骤名称
    private String taskId;//收文流程编号，收文表的GUID
    private String sendList;//收阅人编号字符串（多个收阅人时，用“,”半角逗号字符分隔）
    private String circulatedOpinion;//传阅意见
    private boolean sendSMS;//是否短信通知
	/** 每页大小 **/
	private int pageSize;
	/** 当前页码 **/
	private int pageIndex;
	/** 总条数**/
	private int recordCount;
	/** 用户登录账号,也就是用户编号 **/
	private String userAccount = null;
	public String getBizTag() {
		return bizTag;
	}
	public void setBizTag(String bizTag) {
		this.bizTag = bizTag;
	}
    public List getCondition() {
        return condition;
    }
    public void setCondition(List condition) {
        this.condition = condition;
    }
    public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Object getDetail() {
		return detail;
	}
	public void setDetail(Object detail) {
		this.detail = detail;
	}
	public String getCorpId() {
		return corpId;
	}
	public void setCorpId(String corpId) {
		this.corpId = corpId;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	/**
	 * @return Returns the guid.
	 */
	
	public String getGuid() {
		return guid;
	}
	/**
	 * @param guid The guid to set.
	 */
	public void setGuid(String guid) {
		this.guid = guid;
	}
    public Integer getWfId() {
        return wfId;
    }
    public void setWfId(Integer wfId) {
        this.wfId = wfId;
    }
    public Integer getNoteId() {
        return noteId;
    }
    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }
    public Integer getProId() {
        return proId;
    }
    public void setProId(Integer proId) {
        this.proId = proId;
    }
    public String getProcName() {
        return procName;
    }
    public void setProcName(String procName) {
        this.procName = procName;
    }
    public String getTaskId() {
        return taskId;
    }
    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }
    public String getSendList() {
        return sendList;
    }
    public void setSendList(String sendList) {
        this.sendList = sendList;
    }
    public String getCirculatedOpinion() {
        return circulatedOpinion;
    }
    public void setCirculatedOpinion(String circulatedOpinion) {
        this.circulatedOpinion = circulatedOpinion;
    }
    public boolean isSendSMS() {
        return sendSMS;
    }
    public void setSendSMS(boolean sendSMS) {
        this.sendSMS = sendSMS;
    }
	
}

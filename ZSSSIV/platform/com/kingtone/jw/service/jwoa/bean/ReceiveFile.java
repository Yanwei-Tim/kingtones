/**
 * @Title: ReceiveFile.java
 * @Package com.kingtone.jw.service.jwoa.bean
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright: Copyright (c) 2012  西安联合信息技术股份有限公司
 * @author 王海博
 * @date Aug 2, 2013 9:22:42 AM
 * @version V0.5
 */
package com.kingtone.jw.service.jwoa.bean;

/**
 * @ClassName: ReceiveFile
 * @Description: 收文封装对象
 * @author 王海博
 * @date Aug 2, 2013 9:22:42 AM
 *
 */
public class ReceiveFile { 
    private String guid;//GUID  发文记录主键
    private String fileNumber;//文件号
    private String title;//标题
    private String dateOfDraft;//拟稿日期
    
    private String fileType;//文件类别
    private String status;//流程状态
    private String hasFile = "";// 是否有文件
    private String rowNumber="";
    /**
	 * @return Returns the hasFile.
	 */
	
	public String getHasFile() {
		return hasFile;
	}
	/**
	 * @param hasFile The hasFile to set.
	 */
	public void setHasFile(String hasFile) {
		this.hasFile = hasFile;
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
    /**
     * @return Returns the fileNumber.
     */
    
    public String getFileNumber() {
        return fileNumber;
    }
    /**
     * @param fileNumber The fileNumber to set.
     */
    public void setFileNumber(String fileNumber) {
        this.fileNumber = fileNumber;
    }
    /**
     * @return Returns the title.
     */
    
    public String getTitle() {
        return title;
    }
    /**
     * @param title The title to set.
     */
    public void setTitle(String title) {
        this.title = title;
    }
    /**
     * @return Returns the dateOfDraft.
     */
    
    public String getDateOfDraft() {
        return dateOfDraft;
    }
    /**
     * @param dateOfDraft The dateOfDraft to set.
     */
    public void setDateOfDraft(String dateOfDraft) {
        this.dateOfDraft = dateOfDraft;
    }
    /**
     * @return Returns the fileType.
     */
    
    public String getFileType() {
        return fileType;
    }
    /**
     * @param fileType The fileType to set.
     */
    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
    /**
     * @return Returns the status.
     */
    
    public String getStatus() {
        return status;
    }
    /**
     * @param status The status to set.
     */
    public void setStatus(String status) {
        this.status = status;
    }
    public String getRowNumber() {
        return rowNumber;
    }
    public void setRowNumber(String rowNumber) {
        this.rowNumber = rowNumber;
    }
    
}

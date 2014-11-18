/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

/**
 * 附件信息
 * 
 * @author litengmin
 * @since [产品/模块版本] （必须）
 * @date 2013-8-6
 */

public class SysAdtionInfo {
    private String guId;// GUID="e709779f-8782-41fe-8d4b-af93e91cc9c5"
    private String fileName;// 文件名称="230.doc"
    private String memo;//MEMO 
    private String fileSize;// 文件大小="51200"
    private String path;// 文件存放路径
    private String type1;//TYPE1 
    private String type2;//TYPE2 
    private String tName;// TNAME="发文表"
    private String isPigeonhole;//ISPIGEONHOLE 是否归档
    private String archivesGUID;// ARCHIVESGUID 归档GUID
    private String inTime;// INTIME="2013-6-18 9:03:20"
    private String corpId;//CORPID 
    private String content;//CONTENT 内容 
    private String userId;//USERID 
    private String eId;//EID 

    
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
    public String getType1() {
        return type1;
    }
    public void setType1(String type1) {
        this.type1 = type1;
    }
    public String getType2() {
        return type2;
    }
    public void setType2(String type2) {
        this.type2 = type2;
    }
    public String getIsPigeonhole() {
        return isPigeonhole;
    }
    public void setIsPigeonhole(String isPigeonhole) {
        this.isPigeonhole = isPigeonhole;
    }
    public String getArchivesGUID() {
        return archivesGUID;
    }
    public void setArchivesGUID(String archivesGUID) {
        this.archivesGUID = archivesGUID;
    }
    public String getCorpId() {
        return corpId;
    }
    public void setCorpId(String corpId) {
        this.corpId = corpId;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String geteId() {
        return eId;
    }
    public void seteId(String eId) {
        this.eId = eId;
    }
    public String getGuId() {
        return guId;
    }
    public void setGuId(String guId) {
        this.guId = guId;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    public String gettName() {
        return tName;
    }
    public void settName(String tName) {
        this.tName = tName;
    }
    public String getFileSize() {
        return fileSize;
    }
    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }
    public String getInTime() {
        return inTime;
    }
    public void setInTime(String inTime) {
        this.inTime = inTime;
    }
}

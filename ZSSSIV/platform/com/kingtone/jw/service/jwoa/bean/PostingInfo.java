/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

/**
 * 发文明细
 * @author     litengmin
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-10
 */

public class PostingInfo {
    
    private String postCode;    //  编号  编号="FW130529017897" 
    private String fileCode;    //  文件号     文件号="山公传发〔2013〕456号" 
    private String fileCategory;    //  文件类别    文件类别="传真电报"
    private String title;    //  标题  标题="关于组织开展全市公安机关科技项目有关情况统计工作的通知"
    private String subjectHeadings;    //  主题词     主题词="科技项目 统计 通知"
    private String securityLevel;    //  密级  密级="明文"
    private String degreeUrgency;   //  紧急程度    紧急程度="加急"
    private String mainContent;    //  正文  
    private String mcPeo;    //  主送对象    主送对象="局直各单位,各分局,消防支队,边防支队,森林分局"
    private String ccPeo;    //  抄送对象    
    private String intendedDraftDep;    //  拟稿部门    拟稿部门="情报科"
    private String intendedDraftPeo;    //  拟稿人     拟稿人="郑嘉丽"
    private String intendedDraftDate;    //  拟稿日期    拟稿日期="2013-05-29 16:25"
    private String checkDraftPeo;    //  核稿人     核稿人="刘辉"
    private String checkDraftPeoCode;    //  核稿人编号   核稿人编号="160153"
    private String verifyPeo;//审核人
    private String verifyPeoCode;//审核人编号
    private String postUnit;//    发文单位 
    private String postDate;//发文日期
    private String undertakeUnit;    //  承办单位    承办单位="情报科"
    private String prooPeo;//校对人
    private String prooPeoCode;//校对人编号
    private String fileType;//文件类型
    private String mark;//  标识  
    private String signSendPeo;    //  签发人     签发人="冯永富"
    private String signSendPeoCode;    //  签发人编号   签发人编号="160012"
    private String distSendPeo;    //  分发人     分发人="黄华健"
    private String distSendPeoCode;    //  分发人编号   分发人编号="160574"
    private String signSendDate;    //  签发时间    签发时间="2013-05-30 09:38" 
    private String signSendType;    //  签发类型    签发类型="一人签发"
    private String guId;     //  GUID    GUID="10809818-ab81-4985-abd9-647d78c2129a"
    private String passMark;     //  通过标识    通过标识="1"
    private String isProo;     //  是否校对    
    private String markVerifyPeoCode;    //  标识审核人编号     
    private String joinIssuUnits;    //  联合发文单位  
    private String joinIssuUnitSignPeo;    //  联合发文单位签发人   
    private String undertakePeo;    //  承办人     承办人="郑嘉丽"
    private String issuAuth;    //  印发机关    印发机关="指挥中心"
    private String sendPeo;    //  发送对象    
    private String sendPeoCode;    //  发送对象编号  
    private String isDistSend;    //  是否分发    是否分发="0"
    private String fileSmallCategory;    //  文件小类别   文件小类别="内部传真"
    private String fileCodeYear;    //  文件号年    
    private String fileCodeNum;    //  文件号数    
    private String year;    //  年份  年份="2013"
    private String contact;    //  联系电话    联系电话="61388"
    private String userId;    //  USERID  USERID="xtkfcy"
    private String corpId;    //  CORPID  CORPID="zsga"
    private String forOrgId;    //  FORORGID    FORORGID="903"
    private String corpId2;    //  CORPID2     
    private String refCodeGuId;    //  REFCODEGUID     REFCODEGUID="8eef6c6a-f1a6-40d3-b7d4-5b98a6c2e26e"
    public String getPostCode() {
        return postCode;
    }
    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }
    public String getFileCode() {
        return fileCode;
    }
    public void setFileCode(String fileCode) {
        this.fileCode = fileCode;
    }
    public String getFileCategory() {
        return fileCategory;
    }
    public void setFileCategory(String fileCategory) {
        this.fileCategory = fileCategory;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getSubjectHeadings() {
        return subjectHeadings;
    }
    public void setSubjectHeadings(String subjectHeadings) {
        this.subjectHeadings = subjectHeadings;
    }
    public String getSecurityLevel() {
        return securityLevel;
    }
    public void setSecurityLevel(String securityLevel) {
        this.securityLevel = securityLevel;
    }
    public String getDegreeUrgency() {
        return degreeUrgency;
    }
    public void setDegreeUrgency(String degreeUrgency) {
        this.degreeUrgency = degreeUrgency;
    }
    public String getMainContent() {
        return mainContent;
    }
    public void setMainContent(String mainContent) {
        this.mainContent = mainContent;
    }
    public String getMcPeo() {
        return mcPeo;
    }
    public void setMcPeo(String mcPeo) {
        this.mcPeo = mcPeo;
    }
    public String getCcPeo() {
        return ccPeo;
    }
    public void setCcPeo(String ccPeo) {
        this.ccPeo = ccPeo;
    }
    public String getIntendedDraftDep() {
        return intendedDraftDep;
    }
    public void setIntendedDraftDep(String intendedDraftDep) {
        this.intendedDraftDep = intendedDraftDep;
    }
    public String getIntendedDraftPeo() {
        return intendedDraftPeo;
    }
    public void setIntendedDraftPeo(String intendedDraftPeo) {
        this.intendedDraftPeo = intendedDraftPeo;
    }
    public String getIntendedDraftDate() {
        return intendedDraftDate;
    }
    public void setIntendedDraftDate(String intendedDraftDate) {
        this.intendedDraftDate = intendedDraftDate;
    }
    public String getCheckDraftPeo() {
        return checkDraftPeo;
    }
    public void setCheckDraftPeo(String checkDraftPeo) {
        this.checkDraftPeo = checkDraftPeo;
    }
    public String getCheckDraftPeoCode() {
        return checkDraftPeoCode;
    }
    public void setCheckDraftPeoCode(String checkDraftPeoCode) {
        this.checkDraftPeoCode = checkDraftPeoCode;
    }
    public String getVerifyPeo() {
        return verifyPeo;
    }
    public void setVerifyPeo(String verifyPeo) {
        this.verifyPeo = verifyPeo;
    }
    public String getVerifyPeoCode() {
        return verifyPeoCode;
    }
    public void setVerifyPeoCode(String verifyPeoCode) {
        this.verifyPeoCode = verifyPeoCode;
    }
    public String getPostUnit() {
        return postUnit;
    }
    public void setPostUnit(String postUnit) {
        this.postUnit = postUnit;
    }
    public String getPostDate() {
        return postDate;
    }
    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }
    public String getUndertakeUnit() {
        return undertakeUnit;
    }
    public void setUndertakeUnit(String undertakeUnit) {
        this.undertakeUnit = undertakeUnit;
    }
    public String getProoPeo() {
        return prooPeo;
    }
    public void setProoPeo(String prooPeo) {
        this.prooPeo = prooPeo;
    }
    public String getProoPeoCode() {
        return prooPeoCode;
    }
    public void setProoPeoCode(String prooPeoCode) {
        this.prooPeoCode = prooPeoCode;
    }
    public String getFileType() {
        return fileType;
    }
    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
    public String getMark() {
        return mark;
    }
    public void setMark(String mark) {
        this.mark = mark;
    }
    public String getSignSendPeo() {
        return signSendPeo;
    }
    public void setSignSendPeo(String signSendPeo) {
        this.signSendPeo = signSendPeo;
    }
    public String getSignSendPeoCode() {
        return signSendPeoCode;
    }
    public void setSignSendPeoCode(String signSendPeoCode) {
        this.signSendPeoCode = signSendPeoCode;
    }
    public String getDistSendPeo() {
        return distSendPeo;
    }
    public void setDistSendPeo(String distSendPeo) {
        this.distSendPeo = distSendPeo;
    }
    public String getDistSendPeoCode() {
        return distSendPeoCode;
    }
    public void setDistSendPeoCode(String distSendPeoCode) {
        this.distSendPeoCode = distSendPeoCode;
    }
    public String getSignSendDate() {
        return signSendDate;
    }
    public void setSignSendDate(String signSendDate) {
        this.signSendDate = signSendDate;
    }
    public String getSignSendType() {
        return signSendType;
    }
    public void setSignSendType(String signSendType) {
        this.signSendType = signSendType;
    }
    public String getGuId() {
        return guId;
    }
    public void setGuId(String guId) {
        this.guId = guId;
    }
    public String getPassMark() {
        return passMark;
    }
    public void setPassMark(String passMark) {
        this.passMark = passMark;
    }
    public String getIsProo() {
        return isProo;
    }
    public void setIsProo(String isProo) {
        this.isProo = isProo;
    }
    public String getMarkVerifyPeoCode() {
        return markVerifyPeoCode;
    }
    public void setMarkVerifyPeoCode(String markVerifyPeoCode) {
        this.markVerifyPeoCode = markVerifyPeoCode;
    }
    public String getJoinIssuUnits() {
        return joinIssuUnits;
    }
    public void setJoinIssuUnits(String joinIssuUnits) {
        this.joinIssuUnits = joinIssuUnits;
    }
    public String getJoinIssuUnitSignPeo() {
        return joinIssuUnitSignPeo;
    }
    public void setJoinIssuUnitSignPeo(String joinIssuUnitSignPeo) {
        this.joinIssuUnitSignPeo = joinIssuUnitSignPeo;
    }
    public String getUndertakePeo() {
        return undertakePeo;
    }
    public void setUndertakePeo(String undertakePeo) {
        this.undertakePeo = undertakePeo;
    }
    public String getIssuAuth() {
        return issuAuth;
    }
    public void setIssuAuth(String issuAuth) {
        this.issuAuth = issuAuth;
    }
    public String getSendPeo() {
        return sendPeo;
    }
    public void setSendPeo(String sendPeo) {
        this.sendPeo = sendPeo;
    }
    public String getSendPeoCode() {
        return sendPeoCode;
    }
    public void setSendPeoCode(String sendPeoCode) {
        this.sendPeoCode = sendPeoCode;
    }
    public String getIsDistSend() {
        return isDistSend;
    }
    public void setIsDistSend(String isDistSend) {
        this.isDistSend = isDistSend;
    }
    public String getFileSmallCategory() {
        return fileSmallCategory;
    }
    public void setFileSmallCategory(String fileSmallCategory) {
        this.fileSmallCategory = fileSmallCategory;
    }
    public String getFileCodeYear() {
        return fileCodeYear;
    }
    public void setFileCodeYear(String fileCodeYear) {
        this.fileCodeYear = fileCodeYear;
    }
    public String getFileCodeNum() {
        return fileCodeNum;
    }
    public void setFileCodeNum(String fileCodeNum) {
        this.fileCodeNum = fileCodeNum;
    }
    public String getYear() {
        return year;
    }
    public void setYear(String year) {
        this.year = year;
    }
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getCorpId() {
        return corpId;
    }
    public void setCorpId(String corpId) {
        this.corpId = corpId;
    }
    public String getForOrgId() {
        return forOrgId;
    }
    public void setForOrgId(String forOrgId) {
        this.forOrgId = forOrgId;
    }
    public String getCorpId2() {
        return corpId2;
    }
    public void setCorpId2(String corpId2) {
        this.corpId2 = corpId2;
    }
    public String getRefCodeGuId() {
        return refCodeGuId;
    }
    public void setRefCodeGuId(String refCodeGuId) {
        this.refCodeGuId = refCodeGuId;
    }
    
}

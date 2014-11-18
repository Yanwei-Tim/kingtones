/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

/**
 * 收文记录信息
 * @author     litengmin
 * @see         [相关类/方法]（可选）
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-6
 */

public class ReceiptInfo {
    
    private String receiptCode;//编号 
    private String fileCode;//文件号 
    private String fileType;//文件类型
    private String fileCategory;//文件类别 
    private String title;//标题 
    private String subjectHeadings;//主题词 
    private String securityLevel;//密级 
    private String degreeUrgency;//紧急程度 
    private String mainContent; //正文
    private String mcPeo; //主送对象
    private String ccPeo;//    抄送对象 
    private String intendedDraftDep;//    拟稿部门 
    private String intendedDraftPeo;//    拟稿人 
    private String intendedDraftDate;//    拟稿日期 
    private String checkDraftPeo;//    核稿人 
    private String checkDraftPeoCode;//    核稿人编号 
    private String verifyPeo;//审核人
    private String verifyPeoCode;//审核人编号
    private String forVerifyPeo;//复核人
    private String forVerifyPeoCode;//复核人编号
    private String inteDoPeo; //   拟办人 
    private String inteDoPeoCode;//    拟办人编号 
    private String examApprPeo;//批办人
    private String examApprPeoCode;//批办人编号
    private String undertakePeo;//承办人
    private String undertakePeoCode;//承办人编号
    private String receVerifyPeo;//收文审核人1
    private String receVerifyPeoCode;//收文审核人编号1
    private String postUnit;//    发文单位  
    private String postDate;//发文日期
    private String undertakeUnit;//承办单位
    private String prooPeo;//校对人
    private String prooPeoCode;//校对人编号
    private String arcRemark;//存档备注
    private String mark;//标识
    private String deadlines;//    完成时限 
    private String batchDoType;//    批办类型 
    private String intendedDraftPeoCode;//拟稿人编号
    private String isUndertake;//是否承办
    private String origUnit;//    来源单位
    private String undertakeResult;//承办结果
    private String sourUnitCode;//来源单位编号
    private String receiptNum;//收文号
    private String upguId;//    UPGUID 
    private String receReadPeoCode;//收阅人编号
    private String receReadPeo;//收阅人
    private String receiptCategory;//收文类别
    private String guId;//    GUID 
    private String aguId;//AGUID
    private String receiptSignUnit;//收文签收单位
    private String corpId;//    CORPID 
    private String handleCode;//处理编号
    private String year;//年份
    private String signReceiptMark;//收文签收标记
    public String signPeo;//签收人
    public String userId;//签收人ID
    /**
     * 
     * @return 编号 
     */
    public String getReceiptCode() {
        return receiptCode;
    }
    public void setReceiptCode(String receiptCode) {
        this.receiptCode = receiptCode;
    }
    /**
     * 
     * @return 文件号 
     */
    public String getFileCode() {
        return fileCode;
    }
    public void setFileCode(String fileCode) {
        this.fileCode = fileCode;
    }
    /**
     * 
     * @return 文件类型
     */
    public String getFileType() {
        return fileType;
    }
    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
    /**
     * 
     * @return
     */
    public String getFileCategory() {
        return fileCategory;
    }
    public void setFileCategory(String fileCategory) {
        this.fileCategory = fileCategory;
    }
    /**
     * 
     * @return
     */
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    /**
     * 
     * @return
     */
    public String getSubjectHeadings() {
        return subjectHeadings;
    }
    public void setSubjectHeadings(String subjectHeadings) {
        this.subjectHeadings = subjectHeadings;
    }
    /**
     * 
     * @return
     */
    public String getSecurityLevel() {
        return securityLevel;
    }
    public void setSecurityLevel(String securityLevel) {
        this.securityLevel = securityLevel;
    }
    /**
     * 
     * @return
     */
    public String getDegreeUrgency() {
        return degreeUrgency;
    }
    public void setDegreeUrgency(String degreeUrgency) {
        this.degreeUrgency = degreeUrgency;
    }
    /**
     * 
     * @return
     */
    public String getMainContent() {
        return mainContent;
    }
    public void setMainContent(String mainContent) {
        this.mainContent = mainContent;
    }
    /**
     * 
     * @return
     */
    public String getMcPeo() {
        return mcPeo;
    }
    public void setMcPeo(String mcPeo) {
        this.mcPeo = mcPeo;
    }
    /**
     * 
     * @return
     */
    public String getCcPeo() {
        return ccPeo;
    }
    public void setCcPeo(String ccPeo) {
        this.ccPeo = ccPeo;
    }
    /**
     * 
     * @return
     */
    public String getIntendedDraftDep() {
        return intendedDraftDep;
    }
    public void setIntendedDraftDep(String intendedDraftDep) {
        this.intendedDraftDep = intendedDraftDep;
    }
    /**
     * 
     * @return
     */
    public String getIntendedDraftPeo() {
        return intendedDraftPeo;
    }
    public void setIntendedDraftPeo(String intendedDraftPeo) {
        this.intendedDraftPeo = intendedDraftPeo;
    }
    /**
     * 
     * @return
     */
    public String getIntendedDraftDate() {
        return intendedDraftDate;
    }
    public void setIntendedDraftDate(String intendedDraftDate) {
        this.intendedDraftDate = intendedDraftDate;
    }
    /**
     * 
     * @return
     */
    public String getCheckDraftPeo() {
        return checkDraftPeo;
    }
    public void setCheckDraftPeo(String checkDraftPeo) {
        this.checkDraftPeo = checkDraftPeo;
    }
    /**
     * 
     * @return
     */
    public String getCheckDraftPeoCode() {
        return checkDraftPeoCode;
    }
    public void setCheckDraftPeoCode(String checkDraftPeoCode) {
        this.checkDraftPeoCode = checkDraftPeoCode;
    }
    /**
     * 
     * @return
     */
    public String getVerifyPeo() {
        return verifyPeo;
    }
    public void setVerifyPeo(String verifyPeo) {
        this.verifyPeo = verifyPeo;
    }
    /**
     * 
     * @return
     */
    public String getVerifyPeoCode() {
        return verifyPeoCode;
    }
    public void setVerifyPeoCode(String verifyPeoCode) {
        this.verifyPeoCode = verifyPeoCode;
    }
    /**
     * 
     * @return
     */
    public String getForVerifyPeo() {
        return forVerifyPeo;
    }
    public void setForVerifyPeo(String forVerifyPeo) {
        this.forVerifyPeo = forVerifyPeo;
    }
    /**
     * 
     * @return
     */
    public String getForVerifyPeoCode() {
        return forVerifyPeoCode;
    }
    public void setForVerifyPeoCode(String forVerifyPeoCode) {
        this.forVerifyPeoCode = forVerifyPeoCode;
    }
    /**
     * 
     * @return
     */
    public String getInteDoPeo() {
        return inteDoPeo;
    }
    public void setInteDoPeo(String inteDoPeo) {
        this.inteDoPeo = inteDoPeo;
    }
    /**
     * 
     * @return
     */
    public String getInteDoPeoCode() {
        return inteDoPeoCode;
    }
    public void setInteDoPeoCode(String inteDoPeoCode) {
        this.inteDoPeoCode = inteDoPeoCode;
    }
    /**
     * 
     * @return
     */
    public String getExamApprPeo() {
        return examApprPeo;
    }
    public void setExamApprPeo(String examApprPeo) {
        this.examApprPeo = examApprPeo;
    }
    /**
     * 
     * @return
     */
    public String getExamApprPeoCode() {
        return examApprPeoCode;
    }
    public void setExamApprPeoCode(String examApprPeoCode) {
        this.examApprPeoCode = examApprPeoCode;
    }
    /**
     * 
     * @return
     */
    public String getUndertakePeo() {
        return undertakePeo;
    }
    public void setUndertakePeo(String undertakePeo) {
        this.undertakePeo = undertakePeo;
    }
    /**
     * 
     * @return
     */
    public String getUndertakePeoCode() {
        return undertakePeoCode;
    }
    public void setUndertakePeoCode(String undertakePeoCode) {
        this.undertakePeoCode = undertakePeoCode;
    }
    /**
     * 
     * @return
     */
    public String getReceVerifyPeo() {
        return receVerifyPeo;
    }
    public void setReceVerifyPeo(String receVerifyPeo) {
        this.receVerifyPeo = receVerifyPeo;
    }
    /**
     * 
     * @return
     */
    public String getReceVerifyPeoCode() {
        return receVerifyPeoCode;
    }
    public void setReceVerifyPeoCode(String receVerifyPeoCode) {
        this.receVerifyPeoCode = receVerifyPeoCode;
    }
    /**
     * 
     * @return
     */
    public String getPostUnit() {
        return postUnit;
    }
    public void setPostUnit(String postUnit) {
        this.postUnit = postUnit;
    }
    /**
     * 
     * @return
     */
    public String getPostDate() {
        return postDate;
    }
    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }
    /**
     * 
     * @return
     */
    public String getUndertakeUnit() {
        return undertakeUnit;
    }
    public void setUndertakeUnit(String undertakeUnit) {
        this.undertakeUnit = undertakeUnit;
    }
    /**
     * 
     * @return
     */
    public String getProoPeo() {
        return prooPeo;
    }
    public void setProoPeo(String prooPeo) {
        this.prooPeo = prooPeo;
    }
    /**
     * 
     * @return
     */
    public String getProoPeoCode() {
        return prooPeoCode;
    }
    public void setProoPeoCode(String prooPeoCode) {
        this.prooPeoCode = prooPeoCode;
    }
    /**
     * 
     * @return
     */
    public String getArcRemark() {
        return arcRemark;
    }
    public void setArcRemark(String arcRemark) {
        this.arcRemark = arcRemark;
    }
    /**
     * 
     * @return
     */
    public String getMark() {
        return mark;
    }
    public void setMark(String mark) {
        this.mark = mark;
    }
    /**
     * 
     * @return
     */
    public String getDeadlines() {
        return deadlines;
    }
    public void setDeadlines(String deadlines) {
        this.deadlines = deadlines;
    }
    /**
     * 
     * @return
     */
    public String getBatchDoType() {
        return batchDoType;
    }
    public void setBatchDoType(String batchDoType) {
        this.batchDoType = batchDoType;
    }
    /**
     * 
     * @return
     */
    public String getIntendedDraftPeoCode() {
        return intendedDraftPeoCode;
    }
    public void setIntendedDraftPeoCode(String intendedDraftPeoCode) {
        this.intendedDraftPeoCode = intendedDraftPeoCode;
    }
    /**
     * 
     * @return
     */
    public String getIsUndertake() {
        return isUndertake;
    }
    public void setIsUndertake(String isUndertake) {
        this.isUndertake = isUndertake;
    }
    /**
     * 
     * @return
     */
    public String getOrigUnit() {
        return origUnit;
    }
    public void setOrigUnit(String origUnit) {
        this.origUnit = origUnit;
    }
    /**
     * 
     * @return
     */
    public String getUndertakeResult() {
        return undertakeResult;
    }
    public void setUndertakeResult(String undertakeResult) {
        this.undertakeResult = undertakeResult;
    }
    /**
     * 
     * @return
     */
    public String getSourUnitCode() {
        return sourUnitCode;
    }
    public void setSourUnitCode(String sourUnitCode) {
        this.sourUnitCode = sourUnitCode;
    }
    /**
     * 
     * @return
     */
    public String getReceiptNum() {
        return receiptNum;
    }
    public void setReceiptNum(String receiptNum) {
        this.receiptNum = receiptNum;
    }
    /**
     * 
     * @return
     */
    public String getUpguId() {
        return upguId;
    }
    public void setUpguId(String upguId) {
        this.upguId = upguId;
    }
    /**
     * 
     * @return
     */
    public String getReceReadPeoCode() {
        return receReadPeoCode;
    }
    public void setReceReadPeoCode(String receReadPeoCode) {
        this.receReadPeoCode = receReadPeoCode;
    }
    /**
     * 
     * @return
     */
    public String getReceReadPeo() {
        return receReadPeo;
    }
    public void setReceReadPeo(String receReadPeo) {
        this.receReadPeo = receReadPeo;
    }
    /**
     * 
     * @return
     */
    public String getReceiptCategory() {
        return receiptCategory;
    }
    public void setReceiptCategory(String receiptCategory) {
        this.receiptCategory = receiptCategory;
    }
    /**
     * 
     * @return
     */
    public String getGuId() {
        return guId;
    }
    public void setGuId(String guId) {
        this.guId = guId;
    }
    /**
     * 
     * @return
     */
    public String getAguId() {
        return aguId;
    }
    public void setAguId(String aguId) {
        this.aguId = aguId;
    }
    /**
     * 
     * @return
     */
    public String getReceiptSignUnit() {
        return receiptSignUnit;
    }
    public void setReceiptSignUnit(String receiptSignUnit) {
        this.receiptSignUnit = receiptSignUnit;
    }
    /**
     * 
     * @return
     */
    public String getCorpId() {
        return corpId;
    }
    public void setCorpId(String corpId) {
        this.corpId = corpId;
    }
    /**
     * 
     * @return
     */
    public String getHandleCode() {
        return handleCode;
    }
    public void setHandleCode(String handleCode) {
        this.handleCode = handleCode;
    }
    /**
     * 
     * @return
     */
    public String getYear() {
        return year;
    }
    public void setYear(String year) {
        this.year = year;
    }
    public String getSignPeo() {
        return signPeo;
    }
    public void setSignPeo(String signPeo) {
        this.signPeo = signPeo;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getSignReceiptMark() {
        return signReceiptMark;
    }
    public void setSignReceiptMark(String signReceiptMark) {
        this.signReceiptMark = signReceiptMark;
    }
    
}

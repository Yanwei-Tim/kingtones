/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

/**
 * 发文意见记录信息
 * @author     litengmin
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-10
 */

public class PostingCommentInfo {
    private String postcommCode;  //编号 
    private String fillPeo;  //填写人 
    private String fillDate;  //填写时间 
    private String fillOpin;  //填写意见 
    private String guId;  //GUID 
    private String serialNum;  //序号 
    private String fillDep;  //填写部门 
    private String handleStep;  //处理步骤 
    private String userName;  //用户名 
    private String userId;  //USERID 
    private String corpId;  //CORPID 
    public String getPostcommCode() {
        return postcommCode;
    }
    public void setPostcommCode(String postcommCode) {
        this.postcommCode = postcommCode;
    }
    public String getFillPeo() {
        return fillPeo;
    }
    public void setFillPeo(String fillPeo) {
        this.fillPeo = fillPeo;
    }
    public String getFillDate() {
        return fillDate;
    }
    public void setFillDate(String fillDate) {
        this.fillDate = fillDate;
    }
    public String getFillOpin() {
        return fillOpin;
    }
    public void setFillOpin(String fillOpin) {
        this.fillOpin = fillOpin;
    }
    public String getGuId() {
        return guId;
    }
    public void setGuId(String guId) {
        this.guId = guId;
    }
    public String getSerialNum() {
        return serialNum;
    }
    public void setSerialNum(String serialNum) {
        this.serialNum = serialNum;
    }
    public String getFillDep() {
        return fillDep;
    }
    public void setFillDep(String fillDep) {
        this.fillDep = fillDep;
    }
    public String getHandleStep() {
        return handleStep;
    }
    public void setHandleStep(String handleStep) {
        this.handleStep = handleStep;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
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

}

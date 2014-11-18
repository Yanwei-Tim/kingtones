/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

/**
 * 承办反馈记录
 * @author     litengmin
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-6
 */

public class UTFeedbackInfo {
    private String undertakePeo;//承办人
    private String undertakePeoCode;//承办人编号
    private String feedBackCont;//反馈内容 
    private String fillDate;//填写日期 
    private String receiptCode;//收文编号 
    private String siteAccount;//站点帐号 
    private String guId;//GUID 
    private String type;//TYPE 
    private String userId;//USERID 
    private String corpId;//CORPID 
    private String newTime;//NEWTIME 
    public String getUndertakePeo() {
        return undertakePeo;
    }
    public void setUndertakePeo(String undertakePeo) {
        this.undertakePeo = undertakePeo;
    }
    public String getUndertakePeoCode() {
        return undertakePeoCode;
    }
    public void setUndertakePeoCode(String undertakePeoCode) {
        this.undertakePeoCode = undertakePeoCode;
    }
    public String getFeedBackCont() {
        return feedBackCont;
    }
    public void setFeedBackCont(String feedBackCont) {
        this.feedBackCont = feedBackCont;
    }
    public String getFillDate() {
        return fillDate;
    }
    public void setFillDate(String fillDate) {
        this.fillDate = fillDate;
    }
    public String getReceiptCode() {
        return receiptCode;
    }
    public void setReceiptCode(String receiptCode) {
        this.receiptCode = receiptCode;
    }
    public String getSiteAccount() {
        return siteAccount;
    }
    public void setSiteAccount(String siteAccount) {
        this.siteAccount = siteAccount;
    }
    public String getGuId() {
        return guId;
    }
    public void setGuId(String guId) {
        this.guId = guId;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
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
    public String getNewTime() {
        return newTime;
    }
    public void setNewTime(String newTime) {
        this.newTime = newTime;
    }
}

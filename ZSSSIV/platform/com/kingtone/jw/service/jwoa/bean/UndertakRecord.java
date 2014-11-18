/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

import java.util.List;

/**
 * 3.5.1    收文承办记录明细
 * @author     litengmin
 * @see         [相关类/方法]（可选）
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-30
 */

public class UndertakRecord {
    private List<UndertakInfo> undertakInfoList;//承办记录信息,请直接取get(0)
    private List<SysAdtionInfo> sysAdtionInfoList;//附件列表
    private List<ReceiptCommentInfo> receiptCommentInfoList;//收文意见列表
    private List<UTHistoryProcInfo> UTHistoryProcInfoList;//收文处理过程列表
    private List<ProcInfo> procInfoList;//承办处理过程列表
    private List<UTIssuedInfo> UTIssuedInfoList;//承办下发记录列表
    private List<UTFeedbackInfo> UTFeedbackInfoList;//承办反馈记录列表
    private List<UTCommentInfo> UTCommentInfoList;//承办处理意见列表
    
    public List<UndertakInfo> getUndertakInfoList() {
        return undertakInfoList;
    }
    public void setUndertakInfoList(List<UndertakInfo> undertakInfoList) {
        this.undertakInfoList = undertakInfoList;
    }
    public List<SysAdtionInfo> getSysAdtionInfoList() {
        return sysAdtionInfoList;
    }
    public void setSysAdtionInfoList(List<SysAdtionInfo> sysAdtionInfoList) {
        this.sysAdtionInfoList = sysAdtionInfoList;
    }
    public List<ReceiptCommentInfo> getReceiptCommentInfoList() {
        return receiptCommentInfoList;
    }
    public void setReceiptCommentInfoList(
            List<ReceiptCommentInfo> receiptCommentInfoList) {
        this.receiptCommentInfoList = receiptCommentInfoList;
    }
    public List<UTHistoryProcInfo> getUTHistoryProcInfoList() {
        return UTHistoryProcInfoList;
    }
    public void setUTHistoryProcInfoList(
            List<UTHistoryProcInfo> uTHistoryProcInfoList) {
        UTHistoryProcInfoList = uTHistoryProcInfoList;
    }
    public List<ProcInfo> getProcInfoList() {
        return procInfoList;
    }
    public void setProcInfoList(List<ProcInfo> procInfoList) {
        this.procInfoList = procInfoList;
    }
    public List<UTIssuedInfo> getUTIssuedInfoList() {
        return UTIssuedInfoList;
    }
    public void setUTIssuedInfoList(List<UTIssuedInfo> uTIssuedInfoList) {
        UTIssuedInfoList = uTIssuedInfoList;
    }
    public List<UTFeedbackInfo> getUTFeedbackInfoList() {
        return UTFeedbackInfoList;
    }
    public void setUTFeedbackInfoList(List<UTFeedbackInfo> uTFeedbackInfoList) {
        UTFeedbackInfoList = uTFeedbackInfoList;
    }
    public List<UTCommentInfo> getUTCommentInfoList() {
        return UTCommentInfoList;
    }
    public void setUTCommentInfoList(List<UTCommentInfo> uTCommentInfoList) {
        UTCommentInfoList = uTCommentInfoList;
    }
}

/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

import java.util.List;

/**
 *  收文记录明细
 * @author     litengmin
 * @see         [相关类/方法]（可选）
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-6
 */

public class ReceiptDetail {
    private List<ReceiptInfo> receiptInfoList;//收文记录信息
    private List<SysAdtionInfo> sysAdtionInfoList;//附件列表
    private List<ReceiptCommentInfo> receiptCommentInfoList; //收文意见列表
    private List<UTHistoryProcInfo> uTHistoryProcInfoList; //历史处理过程
    private List<ProcInfo> procInfoList;//当前处理过程列表
    private List<UTFeedbackInfo> uTFeedbackInfoList; //承办反馈记录列表
   
    public List<ReceiptInfo> getReceiptInfoList() {
        return receiptInfoList;
    }
    public void setReceiptInfoList(List<ReceiptInfo> receiptInfoList) {
        this.receiptInfoList = receiptInfoList;
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
    public List<ProcInfo> getProcInfoList() {
        return procInfoList;
    }
    public void setProcInfoList(List<ProcInfo> procInfoList) {
        this.procInfoList = procInfoList;
    }
    public List<UTHistoryProcInfo> getuTHistoryProcInfoList() {
        return uTHistoryProcInfoList;
    }
    public void setuTHistoryProcInfoList(
            List<UTHistoryProcInfo> uTHistoryProcInfoList) {
        this.uTHistoryProcInfoList = uTHistoryProcInfoList;
    }
    public List<UTFeedbackInfo> getuTFeedbackInfoList() {
        return uTFeedbackInfoList;
    }
    public void setuTFeedbackInfoList(List<UTFeedbackInfo> uTFeedbackInfoList) {
        this.uTFeedbackInfoList = uTFeedbackInfoList;
    }
    
}

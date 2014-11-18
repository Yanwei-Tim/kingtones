/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

import java.util.List;

/**
 *3.5.2 承办处理过程追索信息
 * @author     litengmin
 * @see         [相关类/方法]（可选）
 * @since      [产品/模块版本] （必须）
 * @date 2013-9-2
 */

public class UTIssuedProcessRecord {
    private List<UTHistoryProcInfo> UTHistoryProcInfoList;//历史处理记录列表
    private List<ProcInfo> procInfoList;//当前处理记录列表
    private List<UTIssuedInfo> UTIssuedInfoList;//承办下发记录列表
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
}

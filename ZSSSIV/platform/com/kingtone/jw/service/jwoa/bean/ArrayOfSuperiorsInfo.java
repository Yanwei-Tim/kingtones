/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

import java.util.List;

/**
 * 审核人或拟办人列表
 * @author     litengmin
 * @see         [相关类/方法]（可选）
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-30
 */

public class ArrayOfSuperiorsInfo {
    private List<SuperiorsInfo> superiorsInfoList;

    public List<SuperiorsInfo> getSuperiorsInfoList() {
        return superiorsInfoList;
    }

    public void setSuperiorsInfoList(List<SuperiorsInfo> superiorsInfoList) {
        this.superiorsInfoList = superiorsInfoList;
    }
    
}

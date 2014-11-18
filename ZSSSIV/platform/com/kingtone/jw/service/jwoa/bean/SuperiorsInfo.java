/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

/**
 * 审核人或拟办人信息
 * @author     litengmin
 * @see         [相关类/方法]（可选）
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-30
 */

public class SuperiorsInfo {
    private String username;//用户登录名
    private String fullname;//姓名
    private String org;//单位名称
    private String isenable;//工作状态
    private String isonline;//在线状态
    private String memo;//备注
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getFullname() {
        return fullname;
    }
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    public String getOrg() {
        return org;
    }
    public void setOrg(String org) {
        this.org = org;
    }
    public String getIsenable() {
        return isenable;
    }
    public void setIsenable(String isenable) {
        this.isenable = isenable;
    }
    public String getIsonline() {
        return isonline;
    }
    public void setIsonline(String isonline) {
        this.isonline = isonline;
    }
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
}

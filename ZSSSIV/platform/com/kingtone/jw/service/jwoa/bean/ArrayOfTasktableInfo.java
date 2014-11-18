package com.kingtone.jw.service.jwoa.bean;

import java.util.List;
/**
  * @ClassName: ArrayOfTasktableInfo
  * @Description: 待办事宜父级
  * @author 李刚
  * @date Aug 9, 2013 3:21:03 PM
 */
public class ArrayOfTasktableInfo {
private List<TasktableInfo> tasktableInfoList;

/**
 * @return Returns the tasktableInfoList.
 */

public List<TasktableInfo> getTasktableInfoList() {
	return tasktableInfoList;
}

/**
 * @param tasktableInfoList The tasktableInfoList to set.
 */
public void setTasktableInfoList(List<TasktableInfo> tasktableInfoList) {
	this.tasktableInfoList = tasktableInfoList;
}
}

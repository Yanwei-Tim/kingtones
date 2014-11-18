/**
 * 文件名：CommonServerDAO.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Jun 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.service.dao;

import java.util.HashMap;
import java.util.List;

import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.domain.SynchEnvelop;

/**
 * 
 * Title:通用服务--DAO接口 Description:提供附表更新、业务交互等功能 Author: 邹甲乐 -
 * zoujiale@kingtoneinfo.com Date: Jun 2, 2011
 */
public interface ConfDAO {

	/**
	 * Description:加载列映射信息 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: Jul 18,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public void loadColMap() throws Exception;

	/**
	 * Description:初始化系统代码表 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: Jul
	 * 19, 2011
	 * 
	 * @throws Exception
	 */
	public void loadCodeMap() throws Exception;

	/**
	 * Description:加载业务代码表信息 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: Jul
	 * 18, 2011
	 * 
	 * @throws Exception
	 */
	public void loadResMap() throws Exception;

	/**
	 * Description:查询【business_config】中指定列的值 Author: 邹甲乐 -
	 * zoujiale@kingtoneinfo.com Date: Jul 18, 2011
	 * 
	 * @param bizId
	 *            业务id
	 * @param colName
	 *            列名
	 * @return
	 * @throws Exception
	 */
	public String queryColValue_Biz(String bizId, String colName)
			throws Exception;

	/**
	 * <p>
	 * 查询表【system_res_config】中指定列的指
	 * </p>
	 * 
	 * @param resId
	 * @param colName
	 * @return
	 * @throws Exception
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 6, 2012
	 */
	public String queryColValue_Res(String resId, String colName)
			throws Exception;

	/**
	 * Description:加载列映射信息c_column->columns Author: 阎浩 - yanhao@kingtoneinfo.com
	 * Date: Nov 22, 2011
	 * 
	 * @throws Exception
	 */
	public void loadC_ColumnMap() throws Exception;
	public void loadD_ColumnMap() throws Exception;

	/**
	 * 上传文件查询
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public List queryFileList(String sql) throws Exception;

	public void insertFileInfo(String sql) throws Exception;
	public void delUnUpFile(String sql) throws Exception;

}

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

import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import com.kingtone.jw.service.domain.InsertEnvelop;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.domain.SynchEnvelop;
/**
 * 
 * Title:通用服务--DAO接口
 * Description:提供附表更新、业务交互等功能
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Jun 2, 2011
 */
public interface BizDAO {

	/**
	 * Description:查询列表
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public QueryEnvelop queryList(QueryEnvelop request)throws Exception;

	/**
	 * Description:查询详细
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public QueryEnvelop queryDetail(QueryEnvelop request)throws Exception;
	
	/**
	 * Description:新增详细
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param request
	 * @throws Exception
	 */
	public void addDetailSql(InsertEnvelop request)throws Exception;
	
	/**
	 * Description:通过存储过程新增详细
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param request
	 * @throws Exception
	 */
	public void addDetailProc(InsertEnvelop request)throws Exception;
	
	/**
	 * Description:查询【业务库】代码表
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param sql
	 * @param rowMaper
	 * @return
	 * @throws Exception
	 */
	
	public List queryCodeList(String ds,String sql,RowMapper rowMaper)throws Exception;

	/**
	 * Description:查询同步数据列表
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param sqlStr
	 * @return
	 * @throws Exception
	 */
	/*同步数据*/
	public SynchEnvelop querySynchDataList(String sqlStr)throws Exception;
	/**
	 * Description:查询同步数据列表
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param sqlStr
	 * @return
	 * @throws Exception
	 */
	/*同步数据*/
	public String querySynchDataStr(String sqlStr)throws Exception;
	
}

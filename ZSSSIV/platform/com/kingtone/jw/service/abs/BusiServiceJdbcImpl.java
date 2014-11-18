package com.kingtone.jw.service.abs;

import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.util.CommonTool;

/**
 * <p>业务服务JDBC实现</p>
 *
 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
 * @date: Jan 5, 2012
*/
public class BusiServiceJdbcImpl extends BusiServiceAbstract{
	public BusiServiceJdbcImpl(){
		super();
	}

	public void addDetail() throws Exception{
		if(CommonTool.confDAO.queryColValue_Biz(this.getInsertRequest().getBizTag(),"l_sql")!=null){
			CommonTool.bizDAO.addDetailSql(this.getInsertRequest());
		}else{
			CommonTool.bizDAO.addDetailProc(this.getInsertRequest());
		}
	}

	public QueryEnvelop getDetail()throws Exception {
		return CommonTool.bizDAO.queryDetail(this.getQueryRequest());
	}

	public QueryEnvelop getList()throws Exception {
		return CommonTool.bizDAO.queryList(this.getQueryRequest());
	}

	@Override
	public void addLoadtime(String username) throws Exception {
		CommonTool.logDAO.addLoadtime(username);
	}
}

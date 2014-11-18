package com.kingtone.jw.service.external.dragon;

import java.util.HashMap;
import java.util.List;

import com.dragonsoft.adapter.service.QueryAdapterSend;
import com.dragonsoft.pci.exception.InvokeServiceException;
import com.kingtone.jw.service.abs.BusiServiceAbstract;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.jw.service.util.GetConfig;
import com.kingtone.jw.service.util.XmlParseTool;

public class DragonServiceImpl extends BusiServiceAbstract{

	/**
	 * 查询详细
	 */
	public QueryEnvelop getDetail(String xml) throws Exception {
		// TODO Auto-generated method stub
		QueryEnvelop response = new QueryEnvelop();
		// 列表后缀
//		String methodSuffix = "JX";
		List<HashMap<String, String>> dataList = getData("",xml,"detail");
		// 业务数据
		response.setDetail(dataList.get(0));
		response.setJkType("Y");
		return response;
	}

	/**
	 * 查询列表
	 */
	public QueryEnvelop getList(String xml) throws Exception {
		// TODO Auto-generated method stub
		QueryEnvelop response = new QueryEnvelop();
		// 详细后缀
		String methodSuffix = "JX";
		List<HashMap<String, String>> dataList = getData(methodSuffix,xml,"list");
		// 业务数据
		response.setList(dataList);
		// 记录数
		response.setTotalNum(dataList.size());
		// 总页数、巨龙未提供分页接口，故默认值为1
		response.setTotalPage(1);
		response.setJkType("Y");
		return response;
	}

	/**
	 * 调用巨龙接口，解析并获得终端需要的数据
	 * 
	 * @param methodSuffix
	 * @return
	 */
	private List<HashMap<String, String>> getData(String methodSuffix,String xml,String flag) {
		QueryEnvelop request = new QueryEnvelop();
		XmlParseTool.toObj(xml, request);
		String name=request.getName();
		String danwei=request.getDanWei();
		String idCard=request.getIdCard();
		String bizId = request.getBizTag();
		DragonXmlParseAdapter xmlParseAdapter = new DragonXmlParseAdapter();
		String queryCondtion = "";
		String condtion ="";
		// 巨龙接口调用类
		// 巨龙调用方法，具体方法在巨龙RBSPAdapter.jar的rbsp_setup.ini中配置
		String method = GetConfig.GetConfigByKey(bizId) + methodSuffix;
		String returnXmlStr = "";
		try {
		QueryAdapterSend adapter = new QueryAdapterSend();
			// 读取sql条件
			
			if(flag.equals("list")){
				condtion = CommonTool.confDAO.queryColValue_Biz(bizId,
				"l_sql");
			}else{
				condtion = CommonTool.confDAO.queryColValue_Biz(bizId,
				"d_sql");
			}
			String temp1 = condtion.substring(0,condtion.indexOf("where")+"where".length());
			String temp2 = temp1 + condtion.substring(condtion.indexOf("#"),condtion.length());
			condtion = CommonTool.getDragonQueryCondSql(temp2, request);
			if(condtion.indexOf("where")>=0){
				queryCondtion = condtion.substring(condtion.indexOf("where")+"where".length(), condtion.length());
			}
			queryCondtion = queryCondtion.substring(queryCondtion.indexOf("and")+ 3,queryCondtion.length());
//			queryCondtion= "SFZH='340621198410209317'";
			// webservice接口调用
		
			returnXmlStr = adapter.sendQuery(method, queryCondtion, idCard, name, danwei);
		System.out.println("-----接口返回数据------>"+returnXmlStr);
		} catch (InvokeServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			String code = e.getErrorCode();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		// 报文解析
		List<HashMap<String, String>> dataList = xmlParseAdapter.xmlAnalytic(
				bizId, returnXmlStr);
		return dataList;
	}

	@Override
	public void addDetail() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addLoadtime(String username) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public QueryEnvelop getDetail() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QueryEnvelop getList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	public static void main(String[] args) {
		try{
			QueryAdapterSend adapter = new QueryAdapterSend();
			String strCondition = "SFZH='340621198410209317'";
			String returnXmlStr = adapter.sendQuery("QueryQGCKJX", strCondition, "360730198711192630", "阿超", "10001");
			System.out.println(returnXmlStr);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}

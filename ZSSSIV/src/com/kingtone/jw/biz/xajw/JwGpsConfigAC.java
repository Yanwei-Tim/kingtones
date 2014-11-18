package com.kingtone.jw.biz.xajw;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.kingtone.jw.biz.service.util.Tools;
import com.kingtone.jw.biz.xajw.bs.JwGpsConfigBS;
import com.kingtone.jw.biz.xajw.domain.JwGpsConfig;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;

/**
 * GPS状态设置Action
 * 
 * @author hanliqiang@kingtoneinfo.com
 * 
 */

@SuppressWarnings("unchecked")
public class JwGpsConfigAC extends SSIAction {
	public JwGpsConfigBS gpsConfigBS;
	
	private JwGpsConfig jwGpsConfig;

	public void setGpsConfigBS(JwGpsConfigBS gpsConfigBS) {
		this.gpsConfigBS = gpsConfigBS;
	}
	
	public JwGpsConfig getJwGpsConfig() {
		return jwGpsConfig;
	}

	public void setJwGpsConfig(JwGpsConfig jwGpsConfig) {
		this.jwGpsConfig = jwGpsConfig;
	}
	
	// 删除项
	private String deleteItems;
	
	/**
	 * @return Returns the deleteItems.
	 */
	public String getDeleteItems() {
		return deleteItems;
	}

	/**
	 * @param deleteItems The deleteItems to set.
	 */
	public void setDeleteItems(String deleteItems) {
		this.deleteItems = deleteItems;
	}

	// Add by 陈萧如 start
	private List rows = new ArrayList();
	
	protected String total = "0";
	
	protected String page;
	
	protected String rp;
	
	protected String userName;
	
	protected String deviceid;
	
	protected String startdate;
	
	protected String enddate;
	
	protected JwGpsData jwGpsData;
	
	private String ids;
	private String id;
	private String xzqh;
	
	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	/**
	 * @return Returns the rows.
	 */
	public List getRows() {
		return rows;
	}
	
	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	/**
	 * @return Returns the page.
	 */
	public String getPage() {
		return page;
	}

	/**
	 * @param page The page to set.
	 */
	public void setPage(String page) {
		this.page = page;
	}

	/**
	 * @return Returns the rp.
	 */
	public String getRp() {
		return rp;
	}

	/**
	 * @param rp The rp to set.
	 */
	public void setRp(String rp) {
		this.rp = rp;
	}

	/**
	 * @return Returns the userName.
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName The userName to set.
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return Returns the deviceid.
	 */
	public String getDeviceid() {
		return deviceid;
	}

	/**
	 * @param deviceid The deviceid to set.
	 */
	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}

	/**
	 * @return Returns the startdate.
	 */
	public String getStartdate() {
		return startdate;
	}

	/**
	 * @param startdate The startdate to set.
	 */
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	/**
	 * @return Returns the enddate.
	 */
	public String getEnddate() {
		return enddate;
	}

	/**
	 * @param enddate The enddate to set.
	 */
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	/**
	 * @return Returns the ids.
	 */
	public String getIds() {
		return ids;
	}

	/**
	 * @param ids The ids to set.
	 */
	public void setIds(String ids) {
		this.ids = ids;
	}

	/**
	 * @return Returns the jwGpsData.
	 */
	public JwGpsData getJwGpsData() {
		return jwGpsData;
	}

	/**
	 * @param jwGpsData The jwGpsData to set.
	 */
	public void setJwGpsData(JwGpsData jwGpsData) {
		this.jwGpsData = jwGpsData;
	}
	
	/**
	 * gpsConfig 设置添加 根据userId判断gps设置，如果有则修改，没有直接增加
	 * @author hanliqiang
	 * @return
	 * @throws Exception
	 */
	public String addJwGpsCOnf()throws Exception{
		JwGpsConfig jc = new JwGpsConfig();
		JwGpsConfig jcg = new JwGpsConfig();
		String ids = jwGpsConfig.getIds();
		if(ids == null || "".equals(ids)){
			String xzqh = jwGpsConfig.getXzqh();
			List<String> userIDs = gpsConfigBS.findJwUserIDbyXzqh(xzqh);
			System.out.println("userIDs------------------->"+userIDs);
			for (int i = 0; i < userIDs.size(); i++) {
				jc = gpsConfigBS.findGpsConfByUserID(userIDs.get(i));
				if(jc != null){
					jcg.setUserID(userIDs.get(i));
					jcg.setState(jwGpsConfig.getState());
					jcg.setInterval(jwGpsConfig.getInterval());
					gpsConfigBS.updateGpsConf(jcg);
				}else{
					jcg.setUserID(userIDs.get(i).toString());
					jcg.setState(jwGpsConfig.getState());
					jcg.setInterval(jwGpsConfig.getInterval());
					gpsConfigBS.addGpsConf(jcg);
				}
			}
			
		}else {
			String strs[] = ids.split("split");
			System.out.println("strs------------------->"+strs.length);
			if(strs.length > 1){
				
				for (int i = 0; i < strs.length; i++) {
					jc = gpsConfigBS.findGpsConfByUserID(strs[i]);
					if(jc != null){
						jcg.setUserID(strs[i]);
						jcg.setState(jwGpsConfig.getState());
						jcg.setInterval(jwGpsConfig.getInterval());
						gpsConfigBS.updateGpsConf(jcg);
					}else{
						jcg.setUserID(strs[i]);
						jcg.setState(jwGpsConfig.getState());
						jcg.setInterval(jwGpsConfig.getInterval());
						gpsConfigBS.addGpsConf(jcg);
					}
				}
			}else{
				jc = gpsConfigBS.findGpsConfByUserID(strs[0]);
				if(jc!=null){
					jcg.setUserID(strs[0]);
					jcg.setState(jwGpsConfig.getState());
					jcg.setInterval(jwGpsConfig.getInterval());
					gpsConfigBS.updateGpsConf(jcg);
				}else{
					jcg.setUserID(strs[0]);
					jcg.setState(jwGpsConfig.getState());
					jcg.setInterval(jwGpsConfig.getInterval());
					gpsConfigBS.addGpsConf(jcg);
				}
			}
		}
		return JSON;
	}
	
	/**
	 * gpsConfig 设置查询 根据userId查询
	 * @author hanliqiang
	 * @return
	 * @throws Exception
	 */
	public String queryJwGpsCOnf()throws Exception{
		System.out.println("ids--------------->"+ids);
		if(ids == null || "".equals(ids)){
			jwGpsConfig = new JwGpsConfig();
		}else{
			String str[] = ids.split("split");
			if(str.length>1){
				jwGpsConfig = new JwGpsConfig();
			}else{
				jwGpsConfig = gpsConfigBS.findGpsConfByUserID(str[0]);
				if(jwGpsConfig == null){
					jwGpsConfig = new JwGpsConfig();
				}
			}
		}
		HttpServletResponse response = this.getResponse();
		response.setHeader("Pragma","No-Cache");
	    response.setHeader("Cache-Control","No-Cache");
	    response.setDateHeader("Expires", 0);
		return JSON;
	}

	/**
	 * 
	 * 通过用户名，设备ID，时间范围获取对应的GPS数据
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 16, 2012
	 */
	public String findGPSData()throws Exception{
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "警务GPS查询", 
				"进入【警务GPS查询】维护页面");
		// 如果日期范围传入为空，不查询数据
		if(startdate == null || startdate.isEmpty())
			return JSON;
		// 查询条件
		JwGpsData jwGpsData = new JwGpsData();
		jwGpsData.setDeviceid(deviceid);
		jwGpsData.setStartdate(startdate);
		jwGpsData.setEnddate(enddate);
		jwGpsData.setUserName(userName);
		
		rows.clear();
		// 获取查询结构数据
		List dataList = gpsConfigBS.findGPSData(jwGpsData, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : dataList) {
			JwGpsData data = (JwGpsData) o;
			Map map = new HashMap();
			map.put("userid",data.getUserid() );
			map.put("cell", new Object[] {data.getUserid()+";"+data.getDeviceid()+";"+(data.getDatetime()!=null?data.getDatetime().toGMTString():""),
					data.getUserid(),
					data.getDeviceid(), 
					data.getX(),
					data.getY(),
					null != data.getDatetime()&&!"".equals(data.getDatetime())?Tools.formatDate(data.getDatetime()):"",
					data.getSpeed(),
					data.getDirection(),
					data.getImsi()
					 });
			
			rows.add(map);
		}
		// 获取返回数据条数
		total = gpsConfigBS.findGPSDataCount(jwGpsData)+"";
		return JSON;
	}
	
	/**
	 * 
	 * 删除GPS数据
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 17, 2012
	 */
	public String delGPSData()throws Exception{
		if(jwGpsData!=null)
			gpsConfigBS.delGPSData(jwGpsData);
		return JSON;
	}
	
	/**
	 * 
	 * 删除选中GPS数据
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 17, 2012
	 */
	public String delSelectGPSData()throws Exception{
		
		String[] items = deleteItems.split("split");
		for(String item:items){
			String[] split = item.split(";");
			JwGpsData del = new JwGpsData();
			del.setUserid(split[0]);
			del.setDeviceid(split[1]);
			Date date = new Date(split[2]);
			del.setDatetime(date);
			gpsConfigBS.delSelectGPSData(del);
		}
		return JSON;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	// Add by 陈萧如 end
	
	/**
	 * <p>地理信息 在地图上显示用户当前位置</p>
	 * 
	 * @return
	 * @throws Exception
	 * @return: String
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Mar 22, 2012
	 */
	public String showMapByDeviceid()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String deviceid_temp=request.getParameter("deviceid");
		if(this.getDeviceid()!=null);deviceid_temp=this.getDeviceid();
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "地理信息", 
				"进入【地理信息】维护页面");
		// 查询条件
		JwGpsData jwGpsData = new JwGpsData();
		jwGpsData.setDeviceid(deviceid_temp);
		
		if(deviceid_temp!=null&&!deviceid_temp.trim().equals("")){
			StringBuffer sb=new StringBuffer();
			sb.append("g.deviceid in (");
			String[] str=deviceid_temp.split("split");
			for(int i=0;i<str.length;i++){
				sb.append("'").append(str[i]).append("'");
				if(i!=str.length-1)sb.append(",");
			}
			sb.append(") ");
			deviceid_temp=sb.toString();
		}
			

		// 获取查询结构数据
		List dataList = gpsConfigBS.showMapByDeviceid(deviceid_temp);		
		request.setAttribute("listStr", getSbMapFromList(dataList).toString());
		return "map_now_show";
	}
	
	/**
	 * <p>地理信息 在地图上显示用户历史位置</p>
	 * 
	 * @return
	 * @throws Exception
	 * @return: String
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Mar 22, 2012
	 */
	public String showMapByDeviceidDD()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "历史信息", 
				"进入【历史信息】维护页面");
		// 查询条件
		JwGpsData jwGpsData = new JwGpsData();
		jwGpsData.setDeviceid(this.getDeviceid());
		jwGpsData.setStartdate(this.getStartdate());
		jwGpsData.setEnddate(this.getEnddate());		

		// 获取查询结构数据
		List dataList = gpsConfigBS.showMapByDeviceidDD(jwGpsData);		
		request.setAttribute("listStr", getSbMapFromList(dataList).toString());
		return "map_ls_show";
	}
	
	/**
	 * <p>转换数据成MAP需要的格式</p>
	 * 
	 * @param list
	 * @return
	 * @return: StringBuffer
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Mar 22, 2012
	 */
	private StringBuffer getSbMapFromList(List list)
	{		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			StringBuffer listStr = new StringBuffer();
			for (int i = 0; i < list.size(); i++) {
				JwGpsData gps = (JwGpsData) list.get(i);
				String subStr = gps.getUserName()+ "&" + sdf.format(gps.getDatetime()) + "&"
						+ gps.getX() + "&" + gps.getY();
				listStr.append(subStr);
				listStr.append("&&");
			}
			return listStr;
	}
}

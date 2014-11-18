package com.kingtone.jw.biz.xajw;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.kingtone.jw.biz.xajw.bs.JwVideoBS;
import com.kingtone.jw.biz.xajw.domain.JwVideo;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;

/**
 * 警务视频监控 Action
 * 
 * @author hanliqiang@kingtoneinfo.com
 * 
 */
@SuppressWarnings("unchecked")
public class JwVideoAC extends SSIAction {
	private JwVideoBS jwVideoBS;
	private JwVideo jwVideo;

	public JwVideoBS getJwVideoBS() {
		return jwVideoBS;
	}

	public void setJwVideoBS(JwVideoBS jwVideoBS) {
		this.jwVideoBS = jwVideoBS;
	}

	public JwVideo getJwVideo() {
		return jwVideo;
	}

	public void setJwVideo(JwVideo jwVideo) {
		this.jwVideo = jwVideo;
	}

	private List rows = new ArrayList();
	protected String total = "0";
	protected String page;
	protected String rp;
	protected String ip;// ip地址
	protected String port;// 端口
	protected String point;// 采集地点
	private String jwVideoID;
	private String id;
	// 查询关键字
	private String query;
	// 查询关键字类型
	private String qtype;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJwVideoID() {
		return jwVideoID;
	}

	public void setJwVideoID(String jwVideoID) {
		this.jwVideoID = jwVideoID;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRp() {
		return rp;
	}

	public void setRp(String rp) {
		this.rp = rp;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}
	/**
	 * 警务视频监控 queryListAction
	 * 
	 * @author hanliqiang@kingtoneinfo.com
	 * 
	 */
	public String queryJwVideoList() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "警务视频监控", 
				"进入【警务视频监控】维护页面");
		JwVideo jwVideo = new JwVideo();
		System.out.println("qtype------->"+qtype);
		System.out.println("query--------->"+query);
		if("ip".equals(qtype)){
			jwVideo.setIp(query);
		}else if("port".equals(qtype)){
			jwVideo.setPort(query);
		}else if("point".equals(qtype)){
			jwVideo.setPoint(query);
		}
		rows.clear();
		List jwVideoList = jwVideoBS.findJwVideoList(jwVideo, (Integer.parseInt(page) - 1)
				* (Integer.parseInt(rp)), (Integer.parseInt(rp)));
		Map m = new HashMap();
		m.put("Y", "是");
		m.put("N", "否");
		for (Object object : jwVideoList) {
			JwVideo result = (JwVideo) object;
			
			Map map = new HashMap();
			map.put("id", result.getId());
			map.put("cell", new Object[] { result.getId(), result.getIp(),
					result.getPort(), result.getPoint(), m.get(result.getJk_state()),
					result.getOrder_id(), result.getDescription() });
			rows.add(map);
		}
		total = jwVideoBS.findAllJwVideoCount(jwVideo) + "";
		return JSON;
	}
	
	/**
	 * 警务视频监控 addAction
	 * 
	 * @author hanliqiang@kingtoneinfo.com
	 * 
	 */
	public String addJwVideo()throws Exception {
		jwVideoBS.addJwVideo(jwVideo);
		return JSON;
	}
	
	/**
	 * 警务视频监控 editAction
	 * 
	 * @author hanliqiang@kingtoneinfo.com
	 * 
	 */
	public String editJwVideo()throws Exception {
		jwVideoBS.editJwVideo(jwVideo);
		return JSON;
	}
	
	/**
	 * 警务视频监控 delAction
	 * 
	 * @author hanliqiang@kingtoneinfo.com
	 * 
	 */
	public String delJwVideo() throws Exception{
		String []videoIDs = jwVideoID.split("split");
		for (int i = 0; i < videoIDs.length; i++) {
			jwVideoBS.delJwVideo(videoIDs[i]);
		}
		return JSON;
	}
	/**
	 * 警务视频监控 queryAction
	 * 
	 * @author hanliqiang@kingtoneinfo.com
	 * 
	 */
	public String queryJwVideoByID()throws Exception{
		jwVideo = jwVideoBS.findJwVideoByID(id);
		return JSON;
	}

	public String getQtype() {
		return qtype;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

}

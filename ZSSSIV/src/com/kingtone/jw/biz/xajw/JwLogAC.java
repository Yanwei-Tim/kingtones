package com.kingtone.jw.biz.xajw;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.struts2.ServletActionContext;

import com.kingtone.jw.biz.service.util.Tools;
import com.kingtone.jw.biz.xajw.bs.JwLogBS;
import com.kingtone.jw.biz.xajw.domain.JwLog;
import com.kingtone.jw.biz.xajw.domain.JwLogUser;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;

@SuppressWarnings("unchecked")
public class JwLogAC extends SSIAction {
	public JwLogBS jwLogBS;

	private List rows = new ArrayList();

	protected String rp;

	protected String page;

	protected String total = "0";

	private String id;

	private String ids;

	private JwLog jwLog;

	private String info;

	 private String query;
	private String logIds;

	// 查询关键字类型
	 private String qtype;
	private static final String UP_LOAD_FILE = "uploadfile";

	private List<TreeNode> treeNodes = new ArrayList<TreeNode>();

	public String queryLogList() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "警务日志", 
				"进入【警务日志】维护页面");
		JwLog log = new JwLog();
		rows.clear();
		if ("user_name".equals(qtype)) {
			log.setUser_name(query);
			

		} else if ("biz_name".equals(qtype)) {
			log.setBiz_name(query);
			
		} else if ("user_id".equals(qtype)) {
			log.setUser_id(query);
			
		} 
		List list = jwLogBS.findJwLogList(log, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : list) {
			JwLog b = (JwLog) o;
			Map map = new HashMap();
			map.put("id", b.getId());
			map.put("cell", new Object[] { b.getId(), b.getUser_id(),
					b.getBiz_id(), b.getUser_name(), b.getBiz_name(),
					null != b.getOp_time() && !"".equals(b.getOp_time()) ? Tools.formatDate(b.getOp_time()):"" });
			rows.add(map);
		}
		total = jwLogBS.findJwLogListCount(log) + "";
		return JSON;
	}
	/**
	 * 删除日志
	 * 
	 * @return
	 */
	public String delJwLog() throws Exception {
		String[] logId = logIds.split("split");
		for (int i = 0; i < logId.length; i++) {

			jwLogBS.delJwLog(logId[i]);
		}
		return JSON;
	}
	
	/**
	 *统计日志查看
	 * 
	 * @return
	 */
	public String tongJiJwLog() throws Exception {
		List list = jwLogBS.findJwLogListQuery(jwLog, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : list) {
			JwLogUser b = (JwLogUser) o;
			Map map = new HashMap();
			map.put("id", b.getId());
			map.put("cell", new Object[] { b.getName(), b.getAccount(),
					b.getSjhm(), b.getSjcm(), b.getXzqh(), b.getBizname(),
					b.getCount() });
			rows.add(map);
		}
		total = jwLogBS.findJwLogListCountQuery(jwLog) + "";
		return JSON;
	}
	
	/**
	 *统计日志查看
	 * 
	 * @return
	 */
	public String tongJiJwLogUser() throws Exception {
		List list = jwLogBS.findJwLogListUserQuery(jwLog, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : list) {
			JwLogUser b = (JwLogUser) o;
			Map map = new HashMap();
			map.put("id", b.getId());
			map.put("cell", new Object[] { b.getName(), b.getAccount(),
					b.getSjhm(), b.getSjcm(), b.getXzqh(), b.getBizname(),
					b.getOp_time1() });
			rows.add(map);
		}
		total = jwLogBS.findJwLogListCountUserQuery(jwLog) + "";
		return JSON;
	}
	
	/**
	 *统计日志查看
	 * 
	 * @return
	 */
	public String tongJiJwLogNuser() throws Exception {
		List list = jwLogBS.findJwLogListNuserQuery(jwLog, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : list) {
			JwLogUser b = (JwLogUser) o;
			Map map = new HashMap();
			map.put("id", b.getId());
			map.put("cell", new Object[] { b.getName(), b.getAccount(),
					b.getSjhm(), b.getSjcm(), b.getXzqh(), b.getBizname(),
					b.getDays() });
			rows.add(map);
		}
		total = jwLogBS.findJwLogListCountNuserQuery(jwLog) + "";
		return JSON;
	}

	/**
	 * 使用用户统计信息
	 * 
	 * @return
	 */
	public String excelDoOut1() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String fileName = "使用用户统计信息.xls";
		String dirpath = request.getRealPath(UP_LOAD_FILE) + "\\";
		File path = new File(dirpath);
		if (path.exists()) {
			path.mkdirs();
		}
		String filepath = dirpath + fileName;
		File file = new File(filepath);
		if (file.exists()) {
			file.delete();
		}
		try {
			file.createNewFile();
			if (jwLog.getUser_id().equals("")) {
				WritableWorkbook workbook = Workbook.createWorkbook(file);
				WritableSheet sheet = workbook.createSheet("使用用户统计信息", 0);
				// 设置表格的样式
				WritableFont wfTitle = new jxl.write.WritableFont(
						WritableFont.COURIER, 10, WritableFont.BOLD, false);
				WritableCellFormat wcfTitle = new WritableCellFormat(wfTitle);
				wcfTitle.setAlignment(Alignment.CENTRE);
				wcfTitle.setBorder(Border.ALL, BorderLineStyle.THIN);
				sheet.addCell(new Label(0, 0, "用户姓名", wcfTitle));
				sheet.addCell(new Label(1, 0, "用户账号", wcfTitle));
				sheet.addCell(new Label(2, 0, "手机号码", wcfTitle));
				sheet.addCell(new Label(3, 0, "手机串号", wcfTitle));
				sheet.addCell(new Label(4, 0, "行政区划", wcfTitle));
				sheet.addCell(new Label(5, 0, "登录模块", wcfTitle));
				sheet.addCell(new Label(6, 0, "登录次数", wcfTitle));
				// 设置边框
				WritableFont wfTitle2 = new jxl.write.WritableFont(
						WritableFont.COURIER, 10, WritableFont.NO_BOLD, false);
				WritableCellFormat wcfTitle2 = new WritableCellFormat(wfTitle2);
				wcfTitle2.setBorder(Border.ALL, BorderLineStyle.THIN);
				List jwLogList = jwLogBS.getJwLogUser(jwLog);
				for (int i = 0; i < jwLogList.size(); i++) {

					JwLogUser jwLogUser = (JwLogUser) jwLogList.get(i);
					sheet.addCell(new Label(0, i + 1, jwLogUser.getName(),
							wcfTitle2));

					sheet.addCell(new Label(1, i + 1, jwLogUser.getAccount(),
							wcfTitle2));
					sheet.addCell(new Label(2, i + 1, jwLogUser.getSjhm(),
							wcfTitle2));
					sheet.addCell(new Label(3, i + 1, jwLogUser.getSjcm(),
							wcfTitle2));

					sheet.addCell(new Label(4, i + 1, jwLogUser.getXzqh(),
							wcfTitle2));

					sheet.addCell(new Label(5, i + 1, jwLogUser.getBizname(),
							wcfTitle2));

					sheet.addCell(new Label(6, i + 1, jwLogUser.getCount(),
							wcfTitle2));

				}
				workbook.write();
				workbook.close();

				TempleteByPath(filepath);
				file.delete();
			} else {
				WritableWorkbook workbook = Workbook.createWorkbook(file);
				WritableSheet sheet = workbook.createSheet("使用用户统计信息", 0);
				// 设置表格的样式
				WritableFont wfTitle = new jxl.write.WritableFont(
						WritableFont.COURIER, 10, WritableFont.BOLD, false);
				WritableCellFormat wcfTitle = new WritableCellFormat(wfTitle);
				wcfTitle.setAlignment(Alignment.CENTRE);
				wcfTitle.setBorder(Border.ALL, BorderLineStyle.THIN);

				sheet.addCell(new Label(0, 0, "用户姓名", wcfTitle));
				sheet.addCell(new Label(1, 0, "用户性别", wcfTitle));
				sheet.addCell(new Label(2, 0, "用户账号", wcfTitle));
				sheet.addCell(new Label(3, 0, "手机号码", wcfTitle));
				sheet.addCell(new Label(4, 0, "手机串号", wcfTitle));

				sheet.addCell(new Label(5, 0, "行政区划", wcfTitle));
				
				sheet.addCell(new Label(6, 0, "登录模块", wcfTitle));
				sheet.addCell(new Label(7, 0, "登录时间", wcfTitle));

				// 设置边框
				WritableFont wfTitle2 = new jxl.write.WritableFont(
						WritableFont.COURIER, 10, WritableFont.NO_BOLD, false);
				WritableCellFormat wcfTitle2 = new WritableCellFormat(wfTitle2);
				wcfTitle2.setBorder(Border.ALL, BorderLineStyle.THIN);

				List jwLogList = jwLogBS.getJwLogUser(jwLog);

				for (int i = 0; i < jwLogList.size(); i++) {

					JwLogUser jwLogUser = (JwLogUser) jwLogList.get(i);
					sheet.addCell(new Label(0, i + 1, jwLogUser.getName(),
							wcfTitle2));
					Map m = new HashMap();
					m.put("M", "女");
					m.put("F", "男");
					sheet.addCell(new Label(1, i + 1, m.get(jwLogUser.getXb())
							+ "", wcfTitle2));
					sheet.addCell(new Label(2, i + 1, jwLogUser.getAccount(),
							wcfTitle2));
					sheet.addCell(new Label(3, i + 1, jwLogUser.getSjhm(),
							wcfTitle2));
					sheet.addCell(new Label(4, i + 1, jwLogUser.getSjcm(),
							wcfTitle2));

					sheet.addCell(new Label(5, i + 1, jwLogUser.getXzqh(),
							wcfTitle2));
					

					sheet.addCell(new Label(6, i + 1, jwLogUser.getBizname(),
							wcfTitle2));

					sheet.addCell(new Label(7, i + 1, String.valueOf(jwLogUser
							.getOp_time1()), wcfTitle2));
				}
				workbook.write();
				workbook.close();

				TempleteByPath(filepath);
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return JSON;

		}

		return JSON;
	}

	/**
	 * 未使用用户统计信息
	 * 
	 * @return
	 */
	public String excelDoOut() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String fileName = "未使用用户统计信息.xls";
		String dirpath = request.getRealPath(UP_LOAD_FILE) + "\\";
		File path = new File(dirpath);
		if (path.exists()) {
			path.mkdirs();
		}
		String filepath = dirpath + fileName;
		File file = new File(filepath);
		if (file.exists()) {
			file.delete();
		}
		try {
			file.createNewFile();
			WritableWorkbook workbook = Workbook.createWorkbook(file);
			WritableSheet sheet = workbook.createSheet("未使用用户统计信息", 0);
			// 设置表格的样式
			WritableFont wfTitle = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.BOLD, false);
			WritableCellFormat wcfTitle = new WritableCellFormat(wfTitle);
			wcfTitle.setAlignment(Alignment.CENTRE);
			wcfTitle.setBorder(Border.ALL, BorderLineStyle.THIN);

			sheet.addCell(new Label(0, 0, "未登录模块", wcfTitle));
			sheet.addCell(new Label(1, 0, "未使用天数", wcfTitle));
			sheet.addCell(new Label(2, 0, "用户姓名", wcfTitle));
			sheet.addCell(new Label(3, 0, "用户账号", wcfTitle));
			sheet.addCell(new Label(4, 0, "手机号码", wcfTitle));
			sheet.addCell(new Label(5, 0, "手机串号", wcfTitle));
			sheet.addCell(new Label(6, 0, "行政区划", wcfTitle));

			// 设置边框
			WritableFont wfTitle2 = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.NO_BOLD, false);
			WritableCellFormat wcfTitle2 = new WritableCellFormat(wfTitle2);
			wcfTitle2.setBorder(Border.ALL, BorderLineStyle.THIN);

			List jwLogList = jwLogBS.getJwLog(jwLog);
			for (int i = 0; i < jwLogList.size(); i++) {
				JwLogUser unit = (JwLogUser) jwLogList.get(i);
				sheet
						.addCell(new Label(0, i + 1, unit.getBizname(),
								wcfTitle2));

				sheet.addCell(new Label(1, i + 1, String
						.valueOf(unit.getDays())
						+ "天", wcfTitle2));

				sheet.addCell(new Label(2, i + 1, unit.getName(), wcfTitle2));

				sheet
						.addCell(new Label(3, i + 1, unit.getAccount(),
								wcfTitle2));
				sheet.addCell(new Label(4, i + 1, unit.getSjhm(), wcfTitle2));
				sheet.addCell(new Label(5, i + 1, unit.getSjcm(), wcfTitle2));

				sheet.addCell(new Label(6, i + 1, unit.getXzqh(), wcfTitle2));

			}
			workbook.write();
			workbook.close();

			TempleteByPath(filepath);
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return JSON;

		}

		return JSON;
	}

	/**
	 * 将模板 下载到指定路径
	 */
	private void TempleteByPath(String filePath) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			File file = new File(filePath);
			String fileName = file.getName();
			response.setContentType("application/vnd.ms-excel"); // 设置头，浏览器不认识就提示下载
			response.setHeader("Content-Disposition", "attachment;filename="
					+ new String(fileName.getBytes("GB2312"), "ISO8859-1"));
			// 以流的形式写出文件
			FileInputStream bis = new FileInputStream(file);// 以流的形式写出文件
			OutputStream bos = response.getOutputStream();
			byte[] buff = new byte[1024];
			int readCount = 0;
			readCount = bis.read(buff);
			while (readCount != -1) {
				bos.write(buff, 0, readCount);
				readCount = bis.read(buff);
			}
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
			// 下载完毕，给浏览器发给完毕的头
			response.setStatus(HttpServletResponse.SC_OK);
			response.flushBuffer();
		} catch (Exception e) {
			e.toString();
		}
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public JwLog getJwLog() {
		return jwLog;
	}

	public void setJwLog(JwLog jwLog) {
		this.jwLog = jwLog;
	}

	public JwLogBS getJwLogBS() {
		return jwLogBS;
	}

	public void setJwLogBS(JwLogBS jwLogBS) {
		this.jwLogBS = jwLogBS;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	public String getRp() {
		return rp;
	}

	public void setRp(String rp) {
		this.rp = rp;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}

	public void setTreeNodes(List<TreeNode> treeNodes) {
		this.treeNodes = treeNodes;
	}

	public String getLogIds() {
		return logIds;
	}

	public void setLogIds(String logIds) {
		this.logIds = logIds;
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

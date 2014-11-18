package com.kingtone.jw.biz.xajw;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.kingtone.jw.biz.common.bs.SjcjBS;
import com.kingtone.jw.biz.xajw.bs.JwUserBS;
import com.kingtone.jw.biz.xajw.domain.JwJz;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.platform.bs.UnitBS;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.jw.platform.util.RegExpValidator;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
import com.kingtone.ssi.util.IDUtil;
import com.kingtone.ssi.util.encoder.EncodeTool;

@SuppressWarnings("unchecked")
public class JwUserAC extends SSIAction {
	public JwUserBS jwUserBS;
	private UnitBS unitBS;
	public SjcjBS sjcjBS;
	private List rows = new ArrayList();

	protected String rp;

	protected String page;

	protected String total = "0";

	private String id;

	private String ids;

	private JwUser jwUser;

	private JwJz jwJz;

	private String info = null;

	// 修改用户id
	private String userId;

	// 查询关键字
	private String query;

	// 查询关键字类型
	private String qtype;

	// 单击tree节点id
	private String unitID;

	private String userIds;

	private String xzqh;

	private String xzinfo;

	// 返回到前台的select标签字符串
	private String codeListHtml = "";

	// 前台传来的select标签id
	private String selectId = null;

	private String selectName = null;

	private String selectWidth = null;
	private String accountInfo = null;

	private static final String UP_LOAD_FILE = "uploadfile";

	private String uploadFileName = "用户信息导入.xls"; // 上传文件名

	private String delInfo;

	private String delInfo1;

	private String delInfo2;
	private String delInfo3;
	private File test;
	private String testFileName;
	private String testContentType;

	public String getAccountInfo() {
		return accountInfo;
	}

	public void setAccountInfo(String accountInfo) {
		this.accountInfo = accountInfo;
	}

	public String findJwjzCodeList() throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\"" + selectId + "\" name=\"" + selectName
				+ "\" style=\"width:" + selectWidth + "%\">");
		List codeList = jwUserBS.findJwJzList(new JwJz());
		for (Object o : codeList) {
			JwJz c = (JwJz) o;
			sb.append("<option value=\"" + c.getId() + "\">" + c.getName()
					+ "</option>");
		}
		sb.append("</select>");
		codeListHtml = sb.toString();
		return JSON;
	}

	public String getXzinfo() {
		return xzinfo;
	}

	public void setXzinfo(String xzinfo) {
		this.xzinfo = xzinfo;
	}

	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	public String getUserIds() {
		return userIds;
	}

	public void setUserIds(String userIds) {
		this.userIds = userIds;
	}

	/**
	 * Description:查询用户列表-根据行政区划 Author: 张战博 - :
	 * 
	 * 
	 * @throws Exception
	 */
	
	public String queryJwUserList() throws Exception {
		rows.clear();
		JwUser jwUser = new JwUser();

		if ("name".equals(qtype)) {
			jwUser.setName(query);
		} else if ("account".equals(qtype)) {
			jwUser.setAccount(query);
		} else if ("sjhm".equals(qtype)) {
			jwUser.setSjhm(query);
		} else if ("sjcm".equals(qtype)) {
			jwUser.setSjcm(query);
		} else if ("jz".equals(qtype)) {
			jwUser.setJz(query);
		} else if ("description".equals(qtype)) {
			jwUser.setDescription(query);
		}
		JwJz jwJz = new JwJz();

		List jzList = jwUserBS.findJwJzList(jwJz);
		Map jzmap = new HashMap();
		for (Object o : jzList) {
			JwJz user1 = (JwJz)o;	
		jzmap.put(user1.getId(), user1.getName());
		}
		List userList = jwUserBS.findJwOnlineUserList(jwUser,(Integer.parseInt(page) - 1) * Integer.parseInt(rp), Integer.parseInt(rp));
		Map m = new HashMap();
		m.put("M", "女");
		m.put("F", "男");
		JwUser user1=null;
		for (Object o : userList) {
			 user1 = (JwUser) o;
			
				  Map map = new HashMap();
					map.put("id", user1.getId());
					map.put("cell", new Object[] { user1.getId(), user1.getAccount(),
							user1.getName(), m.get(user1.getXb()), user1.getSjhm(),
							user1.getSjcm(), user1.getJmkh(), jzmap.get(user1.getJzname()),
							user1.getDescription()});
					rows.add(map); 
				  
			  }
			
	
		
		total = jwUserBS.findJwOnlineUserListCount(jwUser) + "";
		unitID = null;
		return JSON;
			
			
		}
	
	public String queryJwUserListByXzqh() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "警务用户", 
				"进入【警务用户】维护页面");
		rows.clear();
		JwUser jwUser = new JwUser();
		JwUser jwUserTmp = new JwUser();
		if ("name".equals(qtype)) {
			jwUser.setName(query);
			jwUserTmp.setName(query);
		} else if ("account".equals(qtype)) {
			jwUser.setAccount(query);
			jwUserTmp.setAccount(query);
		} else if ("sjhm".equals(qtype)) {
			jwUser.setSjhm(query);
			jwUserTmp.setSjhm(query);
		} else if ("sjcm".equals(qtype)) {
			jwUser.setSjcm(query);
			jwUserTmp.setSjcm(query);
		} else if ("jz".equals(qtype)) {
			jwUser.setJz(query);
			jwUserTmp.setJz(query);
		} else if ("description".equals(qtype)) {
			jwUser.setDescription(query);
			jwUserTmp.setDescription(query);
		}
		int skipindex = (Integer.parseInt(page) - 1) * Integer.parseInt(rp);
		jwUser.setXzqh(xzqh);
		List deptList = unitBS.getUnit();
		List userList = new ArrayList();

		JwUser jwTmp = jwUser;
		if (jwTmp.getXzqh() != null && !"null".equals(jwTmp.getXzqh())) {
//			userList = jwUserBS.findJwUserList(jwUser,
//					(Integer.parseInt(page) - 1) * Integer.parseInt(rp),
//					Integer.parseInt(rp));
			userList = jwUserBS.findJwUserList(jwUser,0,0);
			total = jwUserBS.findJwUserListCount(jwUser) + "";
			StringBuffer condtion = new StringBuffer();
//			condtion.append("'" + getCurrentUnit().getXzqh() + "',");

			// 获取所有的子节点
			List listNode = sjcjBS.findAllNode(unitID);

//			for (Iterator it = listNode.iterator(); it.hasNext();) {
//				Unit subUnit = (Unit) it.next();
//				condtion.append("'" + subUnit.getXzqh() + "',");
//			}
			int num = 1;
			if(listNode.size()>0){
				for(Object o:listNode){
					Unit subUnit =(Unit) o;
					if(num==999){
						condtion.append("'"+subUnit.getXzqh()+"')");
						condtion.append(" or t.xzqh in(");
						num=1;
					}else{
						condtion.append("'"+subUnit.getXzqh()+"',");
						num++;
					}
				}
				String tmpCondtion = condtion.toString();
				
				tmpCondtion = tmpCondtion.substring(0, tmpCondtion.length() - 1);
				jwTmp.setXzqh(tmpCondtion);
				
				// 獲取所有節點的數據
				List subList = jwUserBS.findJwListStrut(jwTmp);
				for (Iterator subIt = subList.iterator(); subIt.hasNext();) {
					userList.add((JwUser) subIt.next());
				}
			}

			int index = (userList.size() - skipindex) > Integer.parseInt(rp) ? Integer
					.parseInt(rp)
					: userList.size() - skipindex;
			total = userList.size() + "";
			userList = new ArrayList(userList.subList(skipindex, skipindex
					+ index));
		} else {

			StringBuffer condtion = new StringBuffer();
			condtion.append("'" + getCurrentUnit().getXzqh() + "',");

			// 获取所有的子节点
			List listNode = sjcjBS.findAllNode(getCurrentUnit().getUnit_id());

//			for (Iterator it = listNode.iterator(); it.hasNext();) {
//				Unit subUnit = (Unit) it.next();
//				condtion.append("'" + subUnit.getXzqh() + "',");
//			}
			int num = 1;
			for(Object o:listNode){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getXzqh()+"')");
					condtion.append(" or t.xzqh in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getXzqh()+"',");
					num++;
				}
			}
			String tmpCondtion = condtion.toString();

			tmpCondtion = tmpCondtion.substring(0, tmpCondtion.length() - 1);
			jwTmp.setXzqh(tmpCondtion);

			// 獲取所有節點的數據
			List subList = jwUserBS.findJwListStrut(jwTmp);
			for (Iterator subIt = subList.iterator(); subIt.hasNext();) {
				userList.add((JwUser) subIt.next());
			}

			int index = (userList.size() - skipindex) > Integer.parseInt(rp) ? Integer
					.parseInt(rp)
					: userList.size() - skipindex;
			total = userList.size() + "";
			userList = new ArrayList(userList.subList(skipindex, skipindex
					+ index));
		}
		Map m = new HashMap();
		m.put("M", "女");
		m.put("F", "男");
		m.put("0", "正常");
		/**Modify by 陈萧如 start**/
		m.put("1", "销毁");
		m.put("2", "锁定");
		Map m1 = new HashMap();//用于承载gps是否开启状态 add by hanliqiang
		m1.put("0", "关闭");
		m1.put("1", "开启");
		m1.put("2", "无设置");
		/**Modify by 陈萧如 end**/
		for(int i=0;i<deptList.size();i++){
			Unit unit = (Unit)deptList.get(i);
			for (Object o : userList) {
				JwUser user1 = (JwUser) o;
				System.out.println("user1---------------->"+user1.getState());
				Map map = new HashMap();
				if(unit.getXzqh().equals(user1.getXzqh())){
					map.put("id", user1.getId());
					map.put("cell", new Object[] { user1.getId(), user1.getAccount(),
							user1.getName(),unit.getUnit_name(), m.get(user1.getXb()), user1.getSjhm(),
							user1.getSjcm(), user1.getJmkh(), user1.getJzname(), m.get(user1.getIslocked()),
							user1.getDescription(), m1.get(user1.getState())});
					rows.add(map);
				}
			}
		}

		unitID = null;
		return JSON;
	}

	/**
	 * Description:查询警种列表 Author: 张战博 - :
	 * 
	 * 
	 * @throws Exception
	 */
	public String queryJwJzListByXzqh() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "警种管理", 
				"进入【警务警种】维护页面");
		rows.clear();
		JwJz jwJz = new JwJz();

		List userList = jwUserBS.findJwJzList(jwJz,
				(Integer.parseInt(page) - 1) * Integer.parseInt(rp), Integer
						.parseInt(rp));

		for (Object o : userList) {
			JwJz user1 = (JwJz) o;
			Map map = new HashMap();
			map.put("id", user1.getId());
			map.put("cell", new Object[] { user1.getId(), user1.getName(),
					user1.getDescription() });
			rows.add(map);
		}
		total = jwUserBS.findJwJzListCount(jwJz) + "";
		return JSON;
	}

	/**
	 * Description:添加用户 Author: zhangzhanbo
	 * 
	 * 
	 * @throws Exception
	 */
	public String addJwUser() throws Exception {
		int count1 = jwUserBS.findUserByAccount(jwUser.getAccount());
		if (count1 > 0) {
			accountInfo = "1";
			return JSON;
		} else {
			jwUser.setIslocked("0");//新增时默认不锁定
			jwUser.setPsw(EncodeTool.getMd5EncoderInstance().encodePassword(jwUser.getPsw()));
			jwUserBS.addJwUser(jwUser);
			return JSON;
		}
	}
public static void main(String[] arg){
	String ss = EncodeTool.getMd5EncoderInstance().encodePassword("3");
	System.out.println(ss);
}
	/**
	 * Description:添加警种 Author: zhangzhanbo
	 * 
	 * 
	 * @throws Exception
	 */
	public String addJwJz() throws Exception {
		int count = jwUserBS.findJwJzByJwid(jwJz.getId());
		if (count > 0) {
			xzinfo = "1";
		} else {
			jwUserBS.addJwJz(jwJz);
		}

		return JSON;
	}

	/**
	 * Description:查询用户-根据用户id Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May
	 * 9, 2011
	 * 
	 * @throws Exception
	 */
	public String queryJwUserById() {
		try{
			jwUser = jwUserBS.findJwUserById(id);
			String xzqh = jwUser.getXzqh();
			Unit unit = unitBS.findUnitByXzqh1(xzqh);
			jwUser.setUnitName(unit.getUnit_name());
			HttpServletResponse response = this.getResponse();
			response.setHeader("Pragma","No-Cache");
		    response.setHeader("Cache-Control","No-Cache");
		    response.setDateHeader("Expires", 0);
			return JSON;
		}catch (Exception e){
			e.printStackTrace();
			return null;
		}
		
	}

	/**
	 * Description:查询警种-根据用户id Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May
	 * 9, 2011
	 * 
	 * @throws Exception
	 */
	public String queryJwJzById() throws Exception {
		jwJz = jwUserBS.findJwJzById(id);
		return JSON;
	}

	/**
	 * Description:编辑用户 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String editJwUser() throws Exception {
		int count = jwUserBS.findJwUserByJwUser(jwUser);
		//如果密码项已经修改
		if(jwUserBS.isJwPwdChange(jwUser)){
			jwUser.setPsw(EncodeTool.getMd5EncoderInstance().encodePassword(jwUser.getPsw()));
		}
		if (count > 0) {
			xzinfo = "3";
			return JSON;
		} else {
			jwUserBS.editJwUser(jwUser);
			return JSON;
		}
	}

	/**
	 * Description:编辑警种 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String editJwJz() throws Exception {

		// jwUser.setId(id);

		jwUserBS.editJwJz(jwJz);

		return JSON;
	}

	/**
	 * Description:删除用户 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String delJwUser() throws Exception {
		String[] userId = userIds.split("split");
		for (int i = 0; i < userId.length; i++) {

			jwUserBS.delJwUser(userId[i]);
		}
		return JSON;
	}

	public String destroyJwUser() throws Exception {
		String[] userId = userIds.split("split");
		JwUser ju = new JwUser();
		ju.setIslocked("1");
		for (int i = 0; i < userId.length; i++) {
			ju.setId(userId[i]);
			jwUserBS.lockJwUser(ju);
		}
		return JSON;
	}
	
	public String lockJwUser() throws Exception {
		String[] userId = userIds.split("split");
		JwUser ju = new JwUser();
		ju.setIslocked("2");
		for (int i = 0; i < userId.length; i++) {
			ju.setId(userId[i]);
			jwUserBS.lockJwUser(ju);
		}
		return JSON;
	}
	
	public String unlockJwUser() throws Exception {
		String[] userId = userIds.split("split");
		JwUser ju = new JwUser();
		ju.setIslocked("0");
		for (int i = 0; i < userId.length; i++) {
			ju.setId(userId[i]);
			jwUserBS.lockJwUser(ju);
		}
		return JSON;
	}

	/**
	 * Description:删除警种 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String delJwJz() throws Exception {
		String[] userId = ids.split("split");
		for (int i = 0; i < userId.length; i++) {

			jwUserBS.delJwJz(userId[i]);
		}
		return JSON;
	}

	/**
	 * excel导出
	 * 
	 * @return
	 */
	public String excelDoOut() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String fileName = "终端用户信息导出.xls";
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
			WritableSheet sheet = workbook.createSheet("终端用户信息", 0);
			// 设置表格的样式
			WritableFont wfTitle = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.BOLD, false);
			WritableCellFormat wcfTitle = new WritableCellFormat(wfTitle);
			wcfTitle.setAlignment(Alignment.CENTRE);
			wcfTitle.setBorder(Border.ALL, BorderLineStyle.THIN);

			sheet.addCell(new Label(0, 0, "登录账号", wcfTitle));
			sheet.addCell(new Label(1, 0, "密码", wcfTitle));
			sheet.addCell(new Label(2, 0, "用户姓名", wcfTitle));
			sheet.addCell(new Label(3, 0, "性别", wcfTitle));
			sheet.addCell(new Label(4, 0, "手机号码", wcfTitle));
			sheet.addCell(new Label(5, 0, "手机串码", wcfTitle));
			sheet.addCell(new Label(6, 0, "加密卡号", wcfTitle));
			sheet.addCell(new Label(7, 0, "警种", wcfTitle));
			sheet.addCell(new Label(8, 0, "行政区划", wcfTitle));
			sheet.addCell(new Label(9, 0, "描述信息", wcfTitle));

			// 设置边框
			WritableFont wfTitle2 = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.NO_BOLD, false);
			WritableCellFormat wcfTitle2 = new WritableCellFormat(wfTitle2);
			wcfTitle2.setBorder(Border.ALL, BorderLineStyle.THIN);
			
			User currentUser = OrgUtils.getInstance().getCurrentUser();
	    	Unit currentUnit = OrgUtils.getInstance().getUnitlistOfUser().get(0);
	    	String unit_id = currentUnit.getUnit_id();
	    	String xzqh = currentUnit.getXzqh();
	    	currentUser.setUnitID(unit_id);
	    	JwUser user = new JwUser();
			List jwuserList = new ArrayList();
			if(!"00000".equals(unit_id)){
				user.setXzqh("'"+xzqh+"'");
				jwuserList = jwUserBS.getUnitJwUser(currentUser,user);
			}else{
				jwuserList = jwUserBS.getAllJwUser();
			}
			for (int i = 0; i < jwuserList.size(); i++) {
				JwUser jwuser = (JwUser) jwuserList.get(i);
				sheet.addCell(new Label(0, i + 1, jwuser.getAccount(),
						wcfTitle2));
				sheet.addCell(new Label(1, i + 1, jwuser.getPsw(), wcfTitle2));
				sheet.addCell(new Label(2, i + 1, jwuser.getName(), wcfTitle2));

				if (jwuser.getXb().equals("F")) {
					sheet.addCell(new Label(3, i + 1, "男", wcfTitle2));
				} else {
					sheet.addCell(new Label(3, i + 1, "女", wcfTitle2));
				}
				sheet.addCell(new Label(4, i + 1, jwuser.getSjhm(), wcfTitle2));

				sheet.addCell(new Label(5, i + 1, jwuser.getSjcm(), wcfTitle2));
				sheet.addCell(new Label(6, i + 1, jwuser.getJmkh(), wcfTitle2));
				sheet.addCell(new Label(7, i + 1, jwuser.getJz(), wcfTitle2));
				sheet.addCell(new Label(8, i + 1, jwuser.getXzqh(), wcfTitle2));
				sheet.addCell(new Label(9, i + 1, jwuser.getDescription(),
						wcfTitle2));

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
	 * excel导入
	 * 
	 * @return
	 */
	public String importExcel() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String targetDirectory = request.getRealPath(UP_LOAD_FILE);
		String targetFileName = uploadFileName;
		File upload1;
		int count2 = 0;
		int count3 = 0;
		try {
			String suffixName = testFileName.substring(testFileName
					.lastIndexOf("."));
			upload1 = new File(ServletActionContext.getServletContext()
					.getRealPath("/uploadfile")
					+ "/" + System.currentTimeMillis() + ".xls");
			FileUtils.copyFile(test, upload1);
			if (upload1.exists() || upload1.length() > 0) {

				FileInputStream inputSteam = new FileInputStream(upload1);

				Workbook book = Workbook.getWorkbook(inputSteam);
				Sheet sheet = book.getSheet(0);
				int rows = sheet.getRows();

				JwUser jwuser = new JwUser();

				for (int i = 1; i < rows; i++) {
					// 登录账号
					Cell accountColumn = sheet.getCell(0, i);
					String accounte = accountColumn.getContents();
					accounte = OrgUtils.delBlankChar(accounte);

					// 密码
					Cell pswColumn = sheet.getCell(1, i);
					String psw = pswColumn.getContents();
					psw = OrgUtils.delBlankChar(psw);
					// 用户姓名
					Cell userNameColumn = sheet.getCell(2, i);
					String userName = userNameColumn.getContents();
					userName = OrgUtils.delBlankChar(userName);
					// 性别
					Cell xbColumn = sheet.getCell(3, i);
					String xb = xbColumn.getContents();
					xb = OrgUtils.delBlankChar(xb);
					// 手机号码
					Cell sjhmColumn = sheet.getCell(4, i);
					String sjhm = sjhmColumn.getContents();
					sjhm = OrgUtils.delBlankChar(sjhm);
					// 手机串码
					Cell sjcmColumn = sheet.getCell(5, i);
					String sjcm = sjcmColumn.getContents();
					sjcm = OrgUtils.delBlankChar(sjcm);
					// 加密卡号
					Cell jmkhColumn = sheet.getCell(6, i);
					String jmkh = jmkhColumn.getContents();
					jmkh = OrgUtils.delBlankChar(jmkh);
					// 警种
					Cell jzColumn = sheet.getCell(7, i);
					String jz = jzColumn.getContents();
					jz = OrgUtils.delBlankChar(jz);
					// 行政区划
					Cell xzqhColumn = sheet.getCell(8, i);
					String xzqh = xzqhColumn.getContents();
					xzqh = OrgUtils.delBlankChar(xzqh);
					// 描述信息
					Cell msxxColumn = sheet.getCell(9, i);
					String msxx = msxxColumn.getContents();
					msxx = OrgUtils.delBlankChar(msxx);

					if (accounte.equals("") || accounte == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(accounte))) {
						count2 = count2 + 1;
					} else if (psw.equals("") || psw == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(psw))) {
						count2 = count2 + 1;
					} else if (userName.equals("") || userName == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(userName))) {
						count2 = count2 + 1;
					} else if (xb.equals("") || xb == null) {
						count2 = count2 + 1;
					} 
					else if (!(RegExpValidator.isSpecialCharacters(xb))) {
						count2 = count2 + 1;
					} else if (sjhm.equals("") || sjhm == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(sjhm))) {
						count2 = count2 + 1;
					} else if (sjcm.equals("") || sjcm == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(sjcm))) {
						count2 = count2 + 1;
					} else if (jmkh.equals("") || jmkh == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(jmkh))) {
						count2 = count2 + 1;
					} else if (jz.equals("") || jz == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(jz))) {
						count2 = count2 + 1;
					} else if (xzqh.equals("") || xzqh == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(xzqh))) {
						count2 = count2 + 1;
					} else if (msxx.equals("") || msxx == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(msxx))) {
						count2 = count2 + 1;
					} else {

						int count = jwUserBS.findByJwUserAccunt(accounte);
						int count4 = unitBS.findUnitListCountByXzqh(xzqh);
						int count5 = jwUserBS.findJwJzByJwid(jz);
					
						if (count > 0) {
							count2 = count2 + 1;

						} else if(count4==0){
							count2 = count2 + 1;
							
						}
						 else if(count5==0){
								count2 = count2 + 1;
								
							}
						 else if(!(xb.equals("F"))&& !(xb.equals("M"))){
								count2 = count2 + 1;
								
							}
						 
						 else if(count5==0){
								count2 = count2 + 1;
								
							}else {
							jwuser.setId(IDUtil.newID());
							jwuser.setAccount(accounte);
							jwuser.setPsw(psw);
							jwuser.setPsw(EncodeTool.getMd5EncoderInstance().encodePassword(psw));
							jwuser.setName(userName);
							jwuser.setXb(xb);
							jwuser.setSjhm(sjhm);
							jwuser.setSjcm(sjcm);
							jwuser.setJmkh(jmkh);
							jwuser.setJz(jz);
							jwuser.setXzqh(xzqh);
							jwuser.setDescription(msxx);
							count3 = count3 + 1;
							jwuser.setIslocked("0");//导入时默认不锁定账户
							jwUserBS.importJwUser(jwuser);

						}
					}

				}

			}

		} catch (Exception e) {

			e.printStackTrace();
			delInfo = "导入失败！";
			return "error";
		}
		upload1.delete();
		String count4 = count3 + "";
		String count5 = count2 + "";
		request.getSession().setAttribute("count4", count4);

		request.getSession().setAttribute("count5", count5);

		return "success";
	}
	/**
	 * excel模板下载
	 * 
	 * @return
	 */
	public String ExcelTemp() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String fileName = "终端用户信息导入模板.xls";
		String temppath = request.getRealPath(UP_LOAD_FILE) + "\\" + fileName;
		TempleteByPath(temppath);

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

	public JwUser getJwUser() {
		return jwUser;
	}

	public void setJwUser(JwUser jwUser) {
		this.jwUser = jwUser;
	}

	// public JwUserBS getJwUserBS() {
	// return jwUserBS;
	// }

	public void setJwUserBS(JwUserBS jwUserBS) {
		this.jwUserBS = jwUserBS;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUnitID() {
		return unitID;
	}

	public void setUnitID(String unitID) {
		this.unitID = unitID;
	}

	public JwJz getJwJz() {
		return jwJz;
	}

	public void setJwJz(JwJz jwJz) {
		this.jwJz = jwJz;
	}

	public String getCodeListHtml() {
		return codeListHtml;
	}

	public void setSelectId(String selectId) {
		this.selectId = selectId;
	}

	public void setSelectName(String selectName) {
		this.selectName = selectName;
	}

	public void setSelectWidth(String selectWidth) {
		this.selectWidth = selectWidth;
	}

	// public SjcjBS getSjcjBs() {
	// return sjcjBs;
	// }

	public void setSjcjBS(SjcjBS sjcjBS) {
		this.sjcjBS = sjcjBS;
	}

	public String getDelInfo() {
		return delInfo;
	}

	public void setDelInfo(String delInfo) {
		this.delInfo = delInfo;
	}

	public String getDelInfo1() {
		return delInfo1;
	}

	public void setDelInfo1(String delInfo1) {
		this.delInfo1 = delInfo1;
	}

	public String getDelInfo2() {
		return delInfo2;
	}

	public void setDelInfo2(String delInfo2) {
		this.delInfo2 = delInfo2;
	}

	public String getDelInfo3() {
		return delInfo3;
	}

	public void setDelInfo3(String delInfo3) {
		this.delInfo3 = delInfo3;
	}

	public File getTest() {
		return test;
	}

	public void setTest(File test) {
		this.test = test;
	}

	public String getTestContentType() {
		return testContentType;
	}

	public void setTestContentType(String testContentType) {
		this.testContentType = testContentType;
	}

	public String getTestFileName() {
		return testFileName;
	}

	public void setTestFileName(String testFileName) {
		this.testFileName = testFileName;
	}

	public JwUserBS getJwUserBS() {
		return jwUserBS;
	}

	public String getSelectId() {
		return selectId;
	}

	public String getSelectName() {
		return selectName;
	}

	public String getSelectWidth() {
		return selectWidth;
	}

	public SjcjBS getSjcjBS() {
		return sjcjBS;
	}

	public void setCodeListHtml(String codeListHtml) {
		this.codeListHtml = codeListHtml;
	}

	public void setUnitBS(UnitBS unitBS) {
		this.unitBS = unitBS;
	}

}

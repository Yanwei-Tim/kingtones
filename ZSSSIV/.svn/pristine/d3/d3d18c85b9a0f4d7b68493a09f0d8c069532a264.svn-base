package com.kingtone.jw.platform.org;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.Validate;
import org.apache.struts2.ServletActionContext;

import com.kingtone.jw.biz.xajw.domain.JwJz;
import com.kingtone.jw.platform.bs.UnitBS;
import com.kingtone.jw.platform.bs.UserBS;

import com.kingtone.jw.platform.dao.AccountDAO;
import com.kingtone.jw.platform.dao.RoleDAO;
import com.kingtone.jw.platform.dao.UnitDAO;
import com.kingtone.jw.platform.dao.UserDAO;
import com.kingtone.jw.platform.domain.Account;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;

import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.jw.platform.util.RegExpValidator;

import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
import com.kingtone.ssi.util.IDUtil;
import com.kingtone.ssi.util.encoder.EncodeTool;

public class UserAC extends SSIAction {

	private static final String UP_LOAD_FILE = "uploadfile";

	private String uploadFileName = "用户信息导入.xls"; // 上传文件名

	private String upload;// 实际上传文件

	private UserBS userBS;

	private UnitBS unitBS;

	private String delInfo;

	private String delInfo1;

	private String delInfo2;
	private String delInfo3;

	// 每页/最大记录数
	protected String rp;

	// 当前页码
	protected String page;

	// 总记录数
	protected String total = "0";

	// 人员列表展现对象
	private List rows = new ArrayList();

	// 单击tree节点id
	private String unitID;

	// 删除用户ids
	private String userIds;

	// 新增or修改用户对象
	private User user_bak;

	// 修改用户id
	private String userId;

	// 查询关键字

	private String query;

	// 查询关键字类型
	private String qtype;

	private String dateInfo;

	// 前台传来的select标签id
	private String selectId = null;

	private String selectName = null;

	private String selectWidth = null;

	private String codeListHtml = null;

	private File test;
	private String testFileName;
	private String testContentType;

	public void setTest(File test) {
		this.test = test;
	}

	public void setTestContentType(String testContentType) {
		this.testContentType = testContentType;
	}

	public void setTestFileName(String testFileName) {
		this.testFileName = testFileName;
	}

	public String getCodeListHtml() {
		return codeListHtml;
	}

	public void setCodeListHtml(String codeListHtml) {
		this.codeListHtml = codeListHtml;
	}

	public String getSelectId() {
		return selectId;
	}

	public void setSelectId(String selectId) {
		this.selectId = selectId;
	}

	public String getSelectName() {
		return selectName;
	}

	public void setSelectName(String selectName) {
		this.selectName = selectName;
	}

	public String getSelectWidth() {
		return selectWidth;
	}

	public void setSelectWidth(String selectWidth) {
		this.selectWidth = selectWidth;
	}

	public String getDateInfo() {
		return dateInfo;
	}

	public void setDateInfo(String dateInfo) {
		this.dateInfo = dateInfo;
	}

	/**
	 * Description:查询用户列表-根据单元id Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date:
	 * May 9, 2011
	 * 
	 * @throws Exception
	 */
	public String queryUserListByUnitID() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(), getCurrentUnit()
				.getUnit_name(), "后台用户管理", "进入【后台用户管理】维护页面");
		rows.clear();
		User user = new User();
		User userCnt = new User();
		if ("user_name".equals(qtype)) {
			user.setFullName(query);
			userCnt.setFullName(query);

		} else if ("user_desc".equals(qtype)) {
			user.setDescription(query);
			userCnt.setDescription(query);
		}
		user.setUnitID(unitID);
		userCnt.setUnitID(unitID);
		String loginUnitID = "";
		if(null==unitID||"null".equals(unitID)){
			loginUnitID = getCurrentUnit().getUnit_id();
		}else{
			loginUnitID =  unitID;
		}
		// 登录用户的初始化信息设定
		User loginUser = new User();

		// 设定用户的单元id
		loginUser.setUnitID(loginUnitID);

		List userList = userBS.findUserList(loginUser, user, (Integer
				.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));

		Map m = new HashMap();
		m.put("M", "女");
		m.put("F", "男");
		for (Object o : userList) {
			User user1 = (User) o;
			Map map = new HashMap();
			map.put("id", user1.getUserID());
			map.put("cell", new Object[] { user1.getUserID(),
					user1.getFullName(), m.get(user1.getSex()),
					user1.getDescription(),user1.getUnitName() });
			rows.add(map);
		}
		total = userBS.findUserListCount(loginUser, userCnt) + "";
		unitID = null;
		query = null;
		user = new User();
		return JSON;
	}

	/**
	 * Description:查询用户-根据用户id Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May
	 * 9, 2011
	 * 
	 * @throws Exception
	 */
	public String queryUserById() throws Exception {
		user_bak = userBS.findUserById(userId);
		HttpServletResponse response = this.getResponse();
		response.setHeader("Pragma", "No-Cache");
		response.setHeader("Cache-Control", "No-Cache");
		response.setDateHeader("Expires", 0);
		return JSON;
	}

	/**
	 * Description:添加用户 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String addUser() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = sdf.parse(user_bak.getExpired_date());

		// int count=userBS.findUserByFullName(user_bak.getFullName());
		int count1 = userBS.findUserByUserName(user_bak.getUsername());
		if (date.before(new Date())) {
			dateInfo = "1";
			return JSON;
		} else if (count1 > 0) {
			dateInfo = "2";
			return JSON;
		} else {
			user_bak.setPassword(EncodeTool.getMd5EncoderInstance()
					.encodePassword(user_bak.getPassword()));
			userBS.addUser(user_bak);
			dateInfo = "3";
			return JSON;
		}

	}

	/**
	 * Description:编辑用户 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String editUser() throws Exception {
		int count = userBS.findUserByUser(user_bak);
		// 如果密码项已经修改
		if (userBS.isPwdChange(user_bak)) {
			user_bak.setPassword(EncodeTool.getMd5EncoderInstance()
					.encodePassword(user_bak.getPassword()));
		}
		if (count > 0) {
			dateInfo = "3";
			return JSON;
		} else {
			dateInfo = "8";
			userBS.editUser(user_bak);
			return JSON;
		}
	}

	/**
	 * Description:删除用户 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String delUser() throws Exception {
		userBS.delUser(userIds);
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
		String fileName = "用户信息导出.xls";
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
			WritableSheet sheet = workbook.createSheet("用户信息", 0);
			// 设置表格的样式
			WritableFont wfTitle = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.BOLD, false);
			WritableCellFormat wcfTitle = new WritableCellFormat(wfTitle);
			wcfTitle.setAlignment(Alignment.CENTRE);
			wcfTitle.setBorder(Border.ALL, BorderLineStyle.THIN);

			sheet.addCell(new Label(0, 0, "姓名", wcfTitle));
			sheet.addCell(new Label(1, 0, "性别", wcfTitle));
			sheet.addCell(new Label(2, 0, "电话", wcfTitle));
			sheet.addCell(new Label(3, 0, "邮电", wcfTitle));
			sheet.addCell(new Label(4, 0, "描述信息", wcfTitle));
			sheet.addCell(new Label(5, 0, "账号", wcfTitle));
			sheet.addCell(new Label(6, 0, "密码", wcfTitle));
			sheet.addCell(new Label(7, 0, "到期时间", wcfTitle));
			sheet.addCell(new Label(8, 0, "是否锁定", wcfTitle));

			// 设置边框
			WritableFont wfTitle2 = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.NO_BOLD, false);
			WritableCellFormat wcfTitle2 = new WritableCellFormat(wfTitle2);
			wcfTitle2.setBorder(Border.ALL, BorderLineStyle.THIN);
			User currentUser = OrgUtils.getInstance().getCurrentUser();
	    	Unit currentUnit = OrgUtils.getInstance().getUnitlistOfUser().get(0);
	    	String unit_id = currentUnit.getUnit_id();
	    	currentUser.setUnitID(unit_id);
			List userList = new ArrayList();
			if(!"00000".equals(unit_id)){
				userList = userBS.getUnitUser(currentUser);
			}else{
				userList = userBS.getAllTuser();
			}
			
			for (int i = 0; i < userList.size(); i++) {
				User user = (User) userList.get(i);
				sheet
						.addCell(new Label(0, i + 1, user.getFullName(),
								wcfTitle2));
				if (user.getSex().equals("F")) {
					sheet.addCell(new Label(1, i + 1, "男", wcfTitle2));
				} else {
					sheet.addCell(new Label(1, i + 1, "女", wcfTitle2));
				}

				sheet.addCell(new Label(2, i + 1, user.getTell(), wcfTitle2));
				sheet.addCell(new Label(3, i + 1, user.getEmail(), wcfTitle2));
				sheet.addCell(new Label(4, i + 1, user.getDescription(),
						wcfTitle2));
				sheet
						.addCell(new Label(5, i + 1, user.getUsername(),
								wcfTitle2));
				sheet
						.addCell(new Label(6, i + 1, user.getPassword(),
								wcfTitle2));
				sheet.addCell(new Label(7, i + 1, user.getExpired_date(),
						wcfTitle2));
				sheet.addCell(new Label(8, i + 1, user.getLocked(), wcfTitle2));

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

				User user = new User();
				Account account = new Account();

				for (int i = 1; i < rows; i++) {
					// 姓名
					Cell useridColumn = sheet.getCell(0, i);
					String fullName = useridColumn.getContents();
					fullName = OrgUtils.delBlankChar(fullName);
					fullName = fullName;
					// 性别
					Cell usernameColumn = sheet.getCell(1, i);
					String sex = usernameColumn.getContents();
					sex = OrgUtils.delBlankChar(sex);
					// 电话
					Cell policeidColumn = sheet.getCell(2, i);
					String tell = policeidColumn.getContents();
					tell = OrgUtils.delBlankChar(tell);
					// 邮电
					Cell dutyColumn = sheet.getCell(3, i);
					String email = dutyColumn.getContents();
					email = OrgUtils.delBlankChar(email);
					// 描述
					Cell usertypeColumn = sheet.getCell(4, i);
					String Description = usertypeColumn.getContents();
					Description = OrgUtils.delBlankChar(Description);
					// 账号
					Cell imeiColumn = sheet.getCell(5, i);
					String userName = imeiColumn.getContents();
					userName = OrgUtils.delBlankChar(userName);
					// 密码
					Cell mobileColumn = sheet.getCell(6, i);
					String password = mobileColumn.getContents();
					password = OrgUtils.delBlankChar(password);
					// 到期时间
					Cell policetypeColumn = sheet.getCell(7, i);
					String Expired_date = policetypeColumn.getContents();
					Expired_date = OrgUtils.delBlankChar(Expired_date);
					// 是否锁定
					Cell remarkColumn = sheet.getCell(8, i);
					String locked = remarkColumn.getContents();
					locked = OrgUtils.delBlankChar(locked);
					// 行政区划
					Cell xzqhColumn = sheet.getCell(9, i);
					String xzqh = xzqhColumn.getContents();
					xzqh = OrgUtils.delBlankChar(xzqh);

					SimpleDateFormat dateFormat = new SimpleDateFormat(
							"yyyy-MM-dd");

					String Expired_date1 = Expired_date.replace('/', '-');
					String Expired_date2[] = Expired_date1.split("-");
					String Expired_date3 = Expired_date2[2] + "-"
							+ Expired_date2[1] + "-" + Expired_date2[0];

					if (xzqh.equals("") || xzqh == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(xzqh))) {
						count2 = count2 + 1;
					} else if (userName.equals("") || userName == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(userName))) {
						count2 = count2 + 1;
					} 
//					else if (tell.equals("") || tell == null) {
//						count2 = count2 + 1;
//					} 
					else if (!(RegExpValidator.isSpecialCharacters(tell))) {
						count2 = count2 + 1;
					} 
//					else if (email.equals("") || email == null) {
//						count2 = count2 + 1;
//					}
					else if (!(RegExpValidator.isSpecialCharacters(email))) {
						count2 = count2 + 1;
					} else if (fullName.equals("") || fullName == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(fullName))) {
						count2 = count2 + 1;
					} else if (sex.equals("") || sex == null) {
						count2 = count2 + 1;
					} else if (!(sex.equals("女")) && !(sex.equals("男"))) {
						count2 = count2 + 1;
					}else if (!(RegExpValidator.isSpecialCharacters(sex))) {
						count2 = count2 + 1;
					} else if (Description.equals("") || Description == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator
							.isSpecialCharacters(Description))) {
						count2 = count2 + 1;
					} else if (password.equals("") || password == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(password))) {
						count2 = count2 + 1;
					} else if (Expired_date3.equals("")
							|| Expired_date3 == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator
							.isSpecialCharacters(Expired_date3))) {
						count2 = count2 + 1;
					} else if (locked.equals("") || locked == null) {
						count2 = count2 + 1;
					} else if (!(locked.equals("1")) && !(locked.equals("0"))) {
						count2 = count2 + 1;
					}else if (!(RegExpValidator.isSpecialCharacters(locked))) {
						count2 = count2 + 1;
					} else {
						int count = userBS.findUserListCount1(userName);
						int count4 = unitBS.findUnitListCountByXzqh(xzqh);

						if (count > 0) {
							count2 = count2 + 1;

						} else if (count4 == 0) {

							count2 = count2 + 1;

						} else {
							user.setUserID(IDUtil.newID());
							user.setFullName(fullName);
							if (sex.equals("男")) {
								user.setSex("F");

							} else {
								user.setSex("M");
							}

							user.setTell(tell);

							user.setEmail(email);

							user.setDescription(Description);
							account.setAccount_id(IDUtil.newID());
							account.setUser_id(user.getUserID());
							account.setUsername(userName);
							// account.setPassword(password);//
							account.setPassword(EncodeTool
									.getMd5EncoderInstance().encodePassword(
											password));
							account.setRegister_date(new Date());
							account.setExpired_date(dateFormat
									.parse(Expired_date3));

							if (locked.equals("1")) {
								account.setLocked(true);
							} else {
								account.setLocked(false);
							}
							user.setXzqh(xzqh);
							userBS.importUser(user, account);
							count3 = count3 + 1;
						}

					}
				}

			}

		} catch (Exception e) {

			e.printStackTrace();
			delInfo = "导入失败！";
			return "fail";
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
		String fileName = "用户信息导入模版.xls";
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

	public String getRp() {
		return rp;
	}

	public void setRp(String rp) {
		this.rp = rp;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getUnitID() {
		return unitID;
	}

	public void setUnitID(String unitID) {
		this.unitID = unitID;
	}

	public String getTotal() {
		return total;
	}

	public List getRows() {
		return rows;
	}

	public void setUserIds(String userIds) {
		this.userIds = userIds;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserBS(UserBS userBS) {
		this.userBS = userBS;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public User getUser_bak() {
		return user_bak;
	}

	public void setUser_bak(User user_bak) {
		this.user_bak = user_bak;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
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

	public void setUnitBS(UnitBS unitBS) {
		this.unitBS = unitBS;
	}

}

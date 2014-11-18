package com.kingtone.jw.biz.manage;

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
import com.kingtone.jw.biz.manage.bs.AddressBS;
import com.kingtone.jw.biz.manage.domain.Address;
import com.kingtone.jw.biz.xajw.bs.JwUserBS;
import com.kingtone.jw.biz.xajw.domain.JwJz;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.jw.platform.util.RegExpValidator;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
import com.kingtone.ssi.util.IDUtil;

@SuppressWarnings("unchecked")
public class AddressAC extends SSIAction {
	public AddressBS addressBS;
	
	private List rows = new ArrayList();

	protected String rp;

	protected String page;

	protected String total = "0";

	// 查询关键字
	private String query;

	// 查询关键字类型
	private String qtype;


	private String  accountInfo=null;
	
	private static final String UP_LOAD_FILE = "uploadfile";

	
	private String delInfo;
//
	private File test;
	private String testFileName;

	
	private Address address;
	/** 通讯录编号 */
	private String addID;
	
	/**
	 * @return the addID
	 */
	public String getAddID() {
		return addID;
	}

	/**
	 * @param addID the addID to set
	 */
	public void setAddID(String addID) {
		this.addID = addID;
	}
	
	/**
	 * @return the address
	 */
	public Address getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(Address address) {
		this.address = address;
	}
	
	public String getAccountInfo() {
		return accountInfo;
	}

	public void setAccountInfo(String accountInfo) {
		this.accountInfo = accountInfo;
	}

	/**
	 * 通讯录一览查询处理
	 * @return
	 * @throws Exception
	 */
	public String queryAddressList() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "通讯录", 
				"进入【通讯录】维护页面");
		rows.clear();
		
		Address addressTmp =new Address();

		if("NAME".equals(qtype)){
			addressTmp.setNAME(query);			
		}else if("DEPTID".equals(qtype)){
			addressTmp.setDEPTID(query);
		}else if("MOBILE".equals(qtype)){
			addressTmp.setMOBILE(query);
		}else if("UNITTEL".equals(qtype)){
			addressTmp.setUNITTEL(query);
		}else if("HOMETEL".equals(qtype)){
			addressTmp.setHOMETEL(query);
		}else if("REMARK".equals(qtype)){
			addressTmp.setREMARK(query);
		}else if("DUTY".equals(qtype)){
			addressTmp.setDUTY(query);
		}else if("SORT".equals(qtype)){
			addressTmp.setSORT(query);
		}else if("MOBILE2".equals(qtype)){
			addressTmp.setMOBILE2(query);
		}else if("UNITTEL2".equals(qtype)){
			addressTmp.setUNITTEL2(query);
		}else if("DEPTNAMES".equals(qtype)){
			addressTmp.setDEPTNAMES(query);
		}else if("EMAIL".equals(qtype)){
			addressTmp.setEMAIL(query);
		}
		
		// 每页显示记录数
		int skipIndex=(Integer.parseInt(page) - 1) * Integer.parseInt(rp);
		
		
		List addressList =new ArrayList();		
		
		addressList =addressBS.findAddressList(addressTmp, skipIndex, Integer.parseInt(rp));

		for (Iterator it =addressList.iterator();it.hasNext();) {
			Address addressBean = (Address) it.next();
			Map map = new HashMap();
			map.put("id", addressBean.getADDID());
			map.put("cell", new Object[] { addressBean.getADDID(),addressBean.getNAME(),addressBean.getDEPTID(),
					addressBean.getMOBILE(),addressBean.getUNITTEL(),addressBean.getHOMETEL(),
					addressBean.getDUTY(),addressBean.getEMAIL(),addressBean.getREMARK()

			});
			rows.add(map);
		}
		total=addressBS.findAddressListCount(addressTmp)+"";
		return JSON;

	}
	
	/**
	 * 删除通讯录记录操作
	 * @return
	 * @throws Exception
	 */
	public String delAddressByAddID() throws Exception {
		String[] addIds = addID.split("split");
		for (int i = 0; i < addIds.length; i++) {

			addressBS.delAddress(addIds[i]);
		}
		return JSON;
	}

	/**
	 * 通訊錄添加
	 * @return
	 * @throws Exception
	 */
	public String addAddress()throws Exception{
		
		int count1=addressBS.findAddressCountByName(address);
		// 不允许添加用户名和手机号同时
		if(count1>0){
			accountInfo="1";
			 return JSON;	
		}else{
			addressBS.insertAddress(address);
			return JSON;
		}
	}
	
	/**
	 * 通訊錄查詢 通過通訊錄id
	 * @return
	 * @throws Exception
	 */
	public String findAddressByAddID()throws Exception{
		address= addressBS.findAddressByAddID(addID);
		return JSON;
	}
	
	/**
	 * 通訊錄更新
	 * @return
	 * @throws Exception
	 */
	public String updateAddress()throws Exception{
		
		addressBS.updateAddres(address);
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
		String fileName = "通讯录导出.xls";
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
			WritableSheet sheet = workbook.createSheet("通讯录详细", 0);
			// 设置表格的样式
			WritableFont wfTitle = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.BOLD, false);
			WritableCellFormat wcfTitle = new WritableCellFormat(wfTitle);
			wcfTitle.setAlignment(Alignment.CENTRE);
			wcfTitle.setBorder(Border.ALL, BorderLineStyle.THIN);

			sheet.addCell(new Label(0, 0, "人员姓名", wcfTitle));
			sheet.addCell(new Label(1, 0, "单位编号", wcfTitle));
			sheet.addCell(new Label(2, 0, "手机", wcfTitle));
			sheet.addCell(new Label(3, 0, "单位电话", wcfTitle));
			sheet.addCell(new Label(4, 0, "家庭电话", wcfTitle));
			sheet.addCell(new Label(5, 0, "职务", wcfTitle));
			sheet.addCell(new Label(6, 0, "排序号", wcfTitle));
			sheet.addCell(new Label(7, 0, "手机号2", wcfTitle));
			sheet.addCell(new Label(8, 0, "单位电话2", wcfTitle));
			sheet.addCell(new Label(9, 0, "机构名称", wcfTitle));
			sheet.addCell(new Label(10, 0, "邮箱地址", wcfTitle));
			sheet.addCell(new Label(11, 0, "备注", wcfTitle));
			
			// 设置边框
			WritableFont wfTitle2 = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.NO_BOLD, false);
			WritableCellFormat wcfTitle2 = new WritableCellFormat(wfTitle2);
			wcfTitle2.setBorder(Border.ALL, BorderLineStyle.THIN);
			List addressList = addressBS.findAddressList(address, 0, 100000000);
			for (int i = 0; i < addressList.size(); i++) {
				Address address = (Address) addressList.get(i);
				sheet.addCell(new Label(0, i + 1,address.getNAME(),wcfTitle2));
				sheet.addCell(new Label(1, i + 1, address.getDEPTID(), wcfTitle2));
				sheet.addCell(new Label(2, i + 1, address.getMOBILE(), wcfTitle2));
								
				sheet.addCell(new Label(3, i + 1, address.getUNITTEL(), wcfTitle2));
				
				sheet.addCell(new Label(4, i + 1, address.getHOMETEL(),wcfTitle2));
				
				sheet.addCell(new Label(5, i + 1, address.getDUTY(),wcfTitle2));
				sheet.addCell(new Label(6, i + 1, address.getSORT(),wcfTitle2));
				sheet.addCell(new Label(7, i + 1, address.getMOBILE2(),wcfTitle2));
				sheet.addCell(new Label(8, i + 1, address.getUNITTEL2(), wcfTitle2));
				sheet.addCell(new Label(9, i + 1, address.getDEPTNAMES(), wcfTitle2));
				sheet.addCell(new Label(10, i + 1, address.getEMAIL(), wcfTitle2));
				sheet.addCell(new Label(11, i + 1, address.getREMARK(), wcfTitle2));

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
		// String targetFileName = uploadFileName;
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
					// 人员姓名
					Cell column = sheet.getCell(0, i);
					String NAME = column.getContents();
					NAME = OrgUtils.delBlankChar(NAME);

					// 单位编号
					Cell pswColumn = sheet.getCell(1, i);
					String DEPTID = pswColumn.getContents();
					DEPTID = OrgUtils.delBlankChar(DEPTID);

					// 手机
					Cell userNameColumn = sheet.getCell(2, i);
					String MOBILE = userNameColumn.getContents();
					MOBILE = OrgUtils.delBlankChar(MOBILE);

					// 单位电话
					Cell xbColumn = sheet.getCell(3, i);
					String UNITTEL = xbColumn.getContents();
					UNITTEL = OrgUtils.delBlankChar(UNITTEL);

					// 手机号码
					Cell sjhmColumn = sheet.getCell(4, i);
					String HOMETEL = sjhmColumn.getContents();
					HOMETEL = OrgUtils.delBlankChar(HOMETEL);

					// 职务
					Cell sjcmColumn = sheet.getCell(5, i);
					String DUTY = sjcmColumn.getContents();
					DUTY = OrgUtils.delBlankChar(DUTY);

					// 排序号
					Cell jzColumn = sheet.getCell(6, i);
					String SORT = jzColumn.getContents();
					SORT = OrgUtils.delBlankChar(SORT);

					// 手机号2
					Cell xzqhColumn = sheet.getCell(7, i);
					String MOBILE2 = xzqhColumn.getContents();
					MOBILE2 = OrgUtils.delBlankChar(MOBILE2);

					// 单位电话2
					Cell msxxColumn = sheet.getCell(8, i);
					String UNITTEL2 = msxxColumn.getContents();
					UNITTEL2 = OrgUtils.delBlankChar(UNITTEL2);

					// 机构名称
					Cell msxxColumn1 = sheet.getCell(9, i);
					String DEPTNAMES = msxxColumn1.getContents();
					DEPTNAMES = OrgUtils.delBlankChar(DEPTNAMES);

					// 邮件
					Cell msxxColumn2 = sheet.getCell(10, i);
					String EMAIL = msxxColumn2.getContents();
					EMAIL = OrgUtils.delBlankChar(EMAIL);

					// 备注
					Cell msxxColumn3 = sheet.getCell(11, i);
					String REMARK = msxxColumn3.getContents();
					REMARK = OrgUtils.delBlankChar(REMARK);

					if (NAME.equals("") || NAME == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(NAME))) {
						count2 = count2 + 1;
					} else if (DEPTID.equals("") || DEPTID == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(DEPTID))) {
						count2 = count2 + 1;
					} else if (MOBILE.equals("") || MOBILE == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(MOBILE))) {
						count2 = count2 + 1;
					} else if (UNITTEL.equals("") || UNITTEL == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(UNITTEL))) {
						count2 = count2 + 1;
					} else if (HOMETEL.equals("") || HOMETEL == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(HOMETEL))) {
						count2 = count2 + 1;
					}
//					else if (DUTY.equals("") || DUTY == null) {
//						count2 = count2 + 1;
//					} 
					
					else if (!(RegExpValidator.isSpecialCharacters(DUTY))) {
						count2 = count2 + 1;
					} else if (SORT.equals("") || SORT == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(SORT))) {
						count2 = count2 + 1;
					} 
//					else if (MOBILE2.equals("") || MOBILE2 == null) {
//						count2 = count2 + 1;
//					} 
					else if (!(RegExpValidator.isSpecialCharacters(MOBILE2))) {
						count2 = count2 + 1;
					} 
					
//					else if (UNITTEL2.equals("") || UNITTEL2 == null) {
//						count2 = count2 + 1;
//					} 
					
					else if (!(RegExpValidator.isSpecialCharacters(UNITTEL2))) {
						count2 = count2 + 1;
					} else if (DEPTNAMES.equals("") || DEPTNAMES == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(DEPTNAMES))) {
						count2 = count2 + 1;
					} else if (EMAIL.equals("") || EMAIL == null) {
						count2 = count2 + 1;
					} else if (!(RegExpValidator.isSpecialCharacters(EMAIL))) {
						count2 = count2 + 1;
					} 
//					else if (REMARK.equals("") || REMARK == null) {
//						count2 = count2 + 1;
//					} 
					else if (!(RegExpValidator.isSpecialCharacters(REMARK))) {
						count2 = count2 + 1;
					} else {

						Address addressBean = new Address();
						
						addressBean.setNAME(NAME);
						addressBean.setDEPTID(DEPTID);
						addressBean.setMOBILE(MOBILE);
						addressBean.setUNITTEL(UNITTEL);
						addressBean.setHOMETEL(HOMETEL);
						addressBean.setDUTY(DUTY);
						addressBean.setSORT(SORT);
						addressBean.setMOBILE2(MOBILE2);
						addressBean.setUNITTEL2(UNITTEL2);
						addressBean.setDEPTNAMES(DEPTNAMES);
						addressBean.setEMAIL(EMAIL);
						addressBean.setREMARK(REMARK);
						
						// 不允许插入手机号于用户名同时相同的重复值
						int count = addressBS.findAddressCountByName(addressBean);

						if (count > 0) {
							count2 = count2 + 1;

						} else {

							addressBS.insertAddress(addressBean);
							count3 = count3 + 1;
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
		String fileName = "通讯录导入模版.xls";
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




	public String getDelInfo() {
		return delInfo;
	}

	public void setDelInfo(String delInfo) {
		this.delInfo = delInfo;
	}

	public File getTest() {
		return test;
	}

	public void setTest(File test) {
		this.test = test;
	}


	public String getTestFileName() {
		return testFileName;
	}

	public void setTestFileName(String testFileName) {
		this.testFileName = testFileName;
	}


	/**
	 * @param addressBS the addressBS to set
	 */
	public void setAddressBS(AddressBS addressBS) {
		this.addressBS = addressBS;
	}

}

package com.kingtone.jw.platform.org;

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

import com.kingtone.jw.biz.xajw.bs.JwUserBS;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.platform.bs.UnitBS;
import com.kingtone.jw.platform.bs.UserBS;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.jw.platform.util.RegExpValidator;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
import com.kingtone.ssi.util.IDUtil;
/**
 * Title:组织单元维护action
 * Description:增删改查
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: May 9, 2011
 */
@SuppressWarnings("unchecked")
public class UnitAC extends SSIAction{
	public JwUserBS jwUserBS;
    private UnitBS unitBS;
    private UserBS userBS;
    
    //每页/最大记录数
    protected String rp;
    //当前页码
    protected String page;
    //总记录数
    protected String total = "1500";
    //单元列表显示对象-变量名固定
    private List rows = new ArrayList();
    //单元树显示对象-变量名固定
    private List<TreeNode> treeNodes = new ArrayList<TreeNode>();
    //单击tree节点ID
    private String treeNodeID;
    //展开tree节点ID
    private String id ;
    //删除提示信息
    private String delInfo;
    //删除单元id字符串-IN
    private String delUnits;
    //修改or新增单元 对象
    private Unit unit_bak;
    //修改单元Id
    private String unitID;
    private String query;
    
    private String qtype;
    private String xzinfo;
    private static final String UP_LOAD_FILE = "uploadfile";

	private String uploadFileName = "单位信息导入.xls"; // 上传文件名
	private String upload;// 实际上传文件
	
	private String delInfo1;
	private String delInfo2;
	private String delInfo3;
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
	/**
     * Description:获取tree节点集-懒加载
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 9, 2011
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public String queryUnitTreeNodes() throws Exception {
		treeNodes.clear();
		Unit unit = new Unit();
		String currentUnitID = getCurrentUnit().getUnit_id();
		
		if (id == null)
			id = currentUnitID;
		unit.setParent_id(id);

		List unitList = unitBS.findUnitListTree(unit);
		Iterator it = unitList.iterator();
		while (it.hasNext()) {
			unit = (Unit) it.next();
			TreeNode treeNode = new TreeNode(unit.getUnit_id(), unit
					.getUnit_name(), unit.getParent_id(),unit.getXzqh(), true, false, false);
			treeNodes.add(treeNode);
		}
		id = null;// 复位
		return JSON;
    }
    /**
	 * Description:获取grid数据集 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May
	 * 9, 2011
	 * 
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public String queryUnitGridData() throws Exception {
		rows.clear();
		Unit unit = new Unit();
		Unit unitCnt =new Unit();
		 if ("unit_name".equals(qtype)) {
			unit.setUnit_name(query);
			unitCnt.setUnit_name(query);

		} else if ("unit_desc".equals(qtype)) {
			unit.setDescription(query);
			unitCnt.setDescription(query);

		}else if ("xzqh".equals(qtype)) {
			unit.setXzqh(query);
			unitCnt.setXzqh(query);

		}

		 LogTools.debug(getCurrentAccount().getUsername(),
					getCurrentUnit().getUnit_name(), "单位管理", 
					"进入【单位管理】维护页面"); 
		unit.setParent_id(treeNodeID);
		unitCnt.setParent_id(treeNodeID);
		User user =new User();
		if(null==treeNodeID||"null".equals(treeNodeID)){
			user.setUnitID(getCurrentUnit().getUnit_id());
		}else{
			user.setUnitID(treeNodeID);
		}

		user.setXzqh(getCurrentUnit().getXzqh());
		List unitList = unitBS.findUnitList(user,unit, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o :  unitList) {
			Unit unit1 = (Unit) o;
			Map map = new HashMap();
			map.put("id", unit1.getUnit_id());
			map.put("cell", new Object[] { unit1.getUnit_id(),
					unit1.getUnit_name(),unit1.getParent_name(),unit1.getXzqh(), unit1.getDescription(),unit1.getOrderid() });
			rows.add(map);
		}
		total = unitBS.findUnitListCount(user,unitCnt) + "";
		// total=Integer.toString(i);
		treeNodeID = null;
		return JSON;
	}
  
    /**
	 * Description:删除组织单元 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
    public String delUnit() throws Exception{
        delInfo = "1";
        String [] delUnitIDs = delUnits.split("split");
        for(int i=0;i<delUnitIDs.length;i++){
        	 Unit unit= new Unit();
        	 unit.setParent_id(delUnitIDs[i]);
        	 User user_bak= new User();
         	user_bak.setUnitID(delUnitIDs[i]);
         	int count1=userBS.findUserListCountUnit(user_bak);
        	int count=unitBS.findUnitListCount(user_bak,unit);
        	JwUser jwUser = new JwUser();
        	Unit u2 = unitBS.findUnitById(delUnitIDs[i]);
        	jwUser.setXzqh(u2.getXzqh());
        	int count2 = jwUserBS.findJwUserListCount(jwUser);
           // int count = unitBS.queryChildUnitCount(delUnitIDs[i]);
            if(count>0){
                delInfo="2";
                return JSON;
            }else if(count1>0){
            	delInfo="3";
                return JSON;
            }else if(count2>0){
            	delInfo="4";
                return JSON;
            }
        }
        unitBS.delUnit(delUnits);
       // unitBS.batchDeleteUnit(delUnitIDs);
        return JSON;
    }
    /**
     * Description:新增组织单元
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 9, 2011
     * @throws Exception
     */
    public String addUnit() throws Exception{
    	  String currentUnitID = getCurrentUnit().getUnit_id();
      
        unit_bak.setUnit_id(IDUtil.newID());
       
        if("".equals(unit_bak.getParent_id()))unit_bak.setParent_id(currentUnitID);
        int count=unitBS.findUnitByXzqh(unit_bak.getXzqh());
        if(count>0){
        	xzinfo="1";
        }else{
        	 unitBS.addUnit(unit_bak);
        }
     
       
        return JSON;
    }
    /**
     * Description:查询指定id组织单元
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 9, 2011
     * @throws Exception
     */
    public String queryUnitByID()throws Exception{
     
    	String unitID1=unitID;
        unit_bak=unitBS.findUnitById(unitID1);
        return JSON;
    }
    /**
     * Description:修改组织单元
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 9, 2011
     * @throws Exception
     */
    public String editUnit()throws Exception{
    
        int count=unitBS.findUnitByXzqhUnit(unit_bak);
        
         if(count>0){
         	xzinfo="1";
         }else{
        	 unitBS.editUnit(unit_bak);
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
		String fileName = "单位信息导出.xls";
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
			WritableSheet sheet = workbook.createSheet("单位信息", 0);
			// 设置表格的样式
			WritableFont wfTitle = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.BOLD, false);
			WritableCellFormat wcfTitle = new WritableCellFormat(wfTitle);
			wcfTitle.setAlignment(Alignment.CENTRE);
			wcfTitle.setBorder(Border.ALL, BorderLineStyle.THIN);

			sheet.addCell(new Label(0, 0, "单位编号", wcfTitle));
			sheet.addCell(new Label(1, 0, "单位名称", wcfTitle));
			sheet.addCell(new Label(2, 0, "父级编号", wcfTitle));
			sheet.addCell(new Label(3, 0, "父级单位名称", wcfTitle));
			sheet.addCell(new Label(4, 0, "叶子节点(1是，0否)", wcfTitle));
			sheet.addCell(new Label(5, 0, "描述信息", wcfTitle));
			sheet.addCell(new Label(6, 0, "行政区划", wcfTitle));
			sheet.addCell(new Label(7, 0, "排列顺序", wcfTitle));
			

			// 设置边框
			WritableFont wfTitle2 = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.NO_BOLD, false);
			WritableCellFormat wcfTitle2 = new WritableCellFormat(wfTitle2);
			wcfTitle2.setBorder(Border.ALL, BorderLineStyle.THIN);
			
			Unit currentUnit = OrgUtils.getInstance().getUnitlistOfUser().get(0);
			String unit_id = currentUnit.getUnit_id();
			List unitList = new ArrayList();
			if(!"00000".equals(unit_id)){
				unitList = unitBS.findUnitListById(unit_id);
			}else{
				unitList = unitBS.getUnit();
			}
			for (int i = 0; i < unitList.size(); i++) {
				Unit unit = (Unit) unitList.get(i);
				sheet
						.addCell(new Label(0, i + 1, unit.getUnit_id(),
								wcfTitle2));
				
				sheet.addCell(new Label(1, i + 1, unit.getUnit_name(), wcfTitle2));
				sheet.addCell(new Label(2, i + 1, unit.getParent_id(), wcfTitle2));
				sheet.addCell(new Label(3, i + 1, unit.getParent_name(), wcfTitle2));
				sheet.addCell(new Label(4, i + 1, unit.getIs_leaf(), wcfTitle2));
				sheet.addCell(new Label(5, i + 1,unit.getDescription(),
						wcfTitle2));
				sheet
						.addCell(new Label(6, i + 1, unit.getXzqh(),
								wcfTitle2));
				sheet
						.addCell(new Label(7, i + 1,String.valueOf( unit.getOrderid()),
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
//		HttpServletResponse response = ServletActionContext.getResponse();
//		String targetDirectory = request.getRealPath(UP_LOAD_FILE);
//		String targetFileName = uploadFileName;
		File upload1;
		int count2=0;
		int count3=0;
		try {
//			String suffixName = testFileName.substring(testFileName
//					.lastIndexOf("."));
			upload1 = new File(ServletActionContext.getServletContext().getRealPath("/uploadfile")
					+ "/" + System.currentTimeMillis() + ".xls");
			if(test != null)
				FileUtils.copyFile(test, upload1);

			if (upload1.exists() || upload1.length() > 0) {

				FileInputStream inputSteam = new FileInputStream(upload1);

				Workbook book = Workbook.getWorkbook(inputSteam);
				Sheet sheet = book.getSheet(0);
				int rows = sheet.getRows();

				Unit unit = new Unit();
				
				for (int i = 1; i < rows; i++) {
					// 单位ID
					Cell useridColumn = sheet.getCell(0, i);
					String unit_id = useridColumn.getContents();
					unit_id = OrgUtils.delBlankChar(unit_id);
					
					// 单位名称
					Cell usernameColumn = sheet.getCell(1, i);
					String unit_name = usernameColumn.getContents();
					unit_name = OrgUtils.delBlankChar(unit_name);
					// 父节点
					Cell policeidColumn = sheet.getCell(2, i);
					String parent_id = policeidColumn.getContents();
					parent_id = OrgUtils.delBlankChar(parent_id);
					
					// 描述
					Cell usertypeColumn = sheet.getCell(3, i);
					String description = usertypeColumn.getContents();
					description = OrgUtils.delBlankChar(description);
					// 账号
					Cell imeiColumn = sheet.getCell(4, i);
					String xzqh = imeiColumn.getContents();
					xzqh = OrgUtils.delBlankChar(xzqh);
					// 密码
					Cell mobileColumn = sheet.getCell(5, i);
					String orderid = mobileColumn.getContents();
					orderid = OrgUtils.delBlankChar(orderid);
						
 						if(unit_id.equals("")||unit_id==null) {
							count2=count2+1;
						}else if(!(RegExpValidator.isSpecialCharacters(unit_id))) {
							count2=count2+1;
						}
						else if(unit_name.equals("")||unit_name==null) {
							count2=count2+1;
						}else if(!(RegExpValidator.isSpecialCharacters(unit_name))) {
							count2=count2+1;
						}else if(parent_id.equals("")||parent_id==null) {
							count2=count2+1;
						}else if(!(RegExpValidator.isSpecialCharacters(parent_id))) {
							count2=count2+1;
						}else if(description.equals("")||description==null) {
							count2=count2+1;
						}else if(!(RegExpValidator.isSpecialCharacters(description))) {
							count2=count2+1;
						}
						else if(xzqh.equals("")||xzqh==null) {
							count2=count2+1;
						}else if(!(RegExpValidator.isSpecialCharacters(xzqh))) {
							count2=count2+1;
						}
						else if(orderid.equals("")||orderid==null) {
							count2=count2+1;
						}else if(!(RegExpValidator.isSpecialCharacters(orderid))) {
							count2=count2+1;
						}else if(!(RegExpValidator.isNumber(orderid))) {
							count2=count2+1;
						}
						else {
							int count = unitBS.findUnitListCount1(unit_id);
							int count1 = unitBS.findUnitListCountByXzqh(xzqh);
							int count6 = unitBS.findUnitListCount1(parent_id);//unitBS.findUnitListCountByParent_id(parent_id);
							
							if (count > 0) {
							count2=count2+1;
							
						}else if(count1 > 0) {
							count2=count2+1;
						}
						else if(count6 == 0) {
							count2=count2+1;
						}
						
						else {
							unit.setUnit_id(unit_id);
							unit.setUnit_name(unit_name);
							unit.setParent_id(parent_id);
							
							unit.setDescription(description);
							unit.setXzqh(xzqh);
							unit.setOrderid(Integer.parseInt(orderid));
							unitBS.importUnit(unit);
							count3=count3+1;
						}}
					 
				}

			}

		} catch (Exception e) {

			e.printStackTrace();
			delInfo = "导入失败！";
			
			return "fail";
		}
		upload1.delete();
	    String count4=count3+"";
	    String count5=count2+"";
	    request.getSession().setAttribute("count4",count4);
		
	    request.getSession().setAttribute("count5",count5);
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
		String fileName = "单位信息导入模版.xls";
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

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public void setTreeNodeID(String treeNodeID) {
        this.treeNodeID = treeNodeID;
    }

    public String getDelInfo() {
        return delInfo;
    }

    public void setDelUnits(String delUnits) {
        this.delUnits = delUnits;
    }
    public void setUnitID(String unitID) {
        this.unitID = unitID;
    }

    public void setId(String id) {
        this.id = id;
    }
   
	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}
	public void setUnitBS(UnitBS unitBS) {
		this.unitBS = unitBS;
	}
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public Unit getUnit_bak() {
		return unit_bak;
	}
	public void setUnit_bak(Unit unit_bak) {
		this.unit_bak = unit_bak;
	}
	public void setUserBS(UserBS userBS) {
		this.userBS = userBS;
	}
	  public String getXzinfo() {
			return xzinfo;
		}
		public void setXzinfo(String xzinfo) {
			this.xzinfo = xzinfo;
		}
		public String getUpload() {
			return upload;
		}
		public void setUpload(String upload) {
			this.upload = upload;
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
		public void setJwUserBS(JwUserBS jwUserBS) {
			this.jwUserBS = jwUserBS;
		}
    
}

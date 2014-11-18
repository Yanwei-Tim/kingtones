package com.kingtone.jw.platform.org;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.rmi.server.UID;
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

import com.kingtone.jw.platform.bs.PSBS;
import com.kingtone.jw.platform.domain.Organization;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.ssi.action.SSIAction;
/**
 * Title:组织单元维护警情action
 * Description:增删改查
 * Author: yulipeng
 * Date: 2014-9-4
 */
@SuppressWarnings("unchecked")
public class PSAC extends SSIAction{
    private PSBS psBS;
    
    public void setPsBS(PSBS psBS) {
		this.psBS = psBS;
	}
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
    //修改or新增单元 对象
    private Organization organ_bak;
    //删除提示信息
    private String delInfo;
    //删除单元id字符串-IN
    private String delOrgans;
    //修改organ机构Id
    private String jqID;
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
  
	
	public Organization getOrgan_bak() {
		return organ_bak;
	}
	public void setOrgan_bak(Organization organBak) {
		organ_bak = organBak;
	}	
	public File getTest() {
		return test;
	}
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
     * Author: yulipeng
     * Date: 2014-9-4
     * @throws Exception
     */
    public String findPulicSituation() throws Exception {
		treeNodes.clear();
		Organization organ = new Organization();
		//String currentUnitID = getCurrentUnit().getUnit_id();
		String headid = psBS.findHead();
		if (id == null)
			id = headid;					
		organ.setParent_id(id);
		List unitList = psBS.findPulicSituation(organ);
		Iterator it = unitList.iterator();
		while (it.hasNext()) {
			organ = (Organization) it.next();
			TreeNode treeNode = new TreeNode(organ.getId(), organ
					.getName(), organ.getDescription(),organ.getParent_id(), true, false, false);
			treeNodes.add(treeNode);
		}
		id = null;// 复位
		return JSON;
    }
    
    /**
	 * Description:获取organ数据集 Author: yulipeng
	 * 
	 * @throws Exception
	 */
    public String queryJqGridData() throws Exception{
    	
    	rows.clear();
    	Organization organ = new Organization();
    	Organization organCnt = new Organization();
    	
    	if ("name".equals(qtype)) {
    		 organ.setName(query);
    		 organCnt.setName(query);
 		} else if ("code".equals(qtype)) {
 			organ.setCode(query);
 			organCnt.setCode(query);
 		}
    	 	
    	organ.setParent_id(treeNodeID);
    	organCnt.setParent_id(treeNodeID);
    	List jqlist = psBS.findJqList(organ,(Integer.parseInt(page)-1)*Integer.parseInt(rp),Integer.parseInt(rp));

    	for (Object o :  jqlist) {
			Organization organ1 = (Organization) o;
			Map map = new HashMap();
			map.put("id", organ1.getId());
			map.put("cell", new Object[] { organ1.getId(),
					organ1.getName(),organ1.getCode(),organ1.getParent_name(),organ1.getDescription(),organ1.getSort() });
			rows.add(map);
		}
    	total = psBS.findJqListCount(organCnt)+"";
		treeNodeID = null;
		return JSON;

    }
    
    /**
     * Description:新增organ组织单元
     * Author: yulpeng - yulpeng@kingtoneinfo.com
     * Date: 2014-9-10
     * @throws Exception
     */
    public String addJq() throws Exception{
    	String headid = psBS.findHead();
        organ_bak.setId(new UID().toString());
        if("".equals(organ_bak.getParent_id())){
        	organ_bak.setParent_id(headid);        	
        }
              
        int count= psBS.findJqByCode(organ_bak.getCode());
        if(count>0){
        	xzinfo="1";
        }else{
        	psBS.addJq(organ_bak);
        }         
        return JSON;
    }
	
    /**
     * Description:查询指定id组织单元
     * Author: yulipeng - yulipeng@kingtoneinfo.com
     * Date: 2014-9-10
     * @throws Exception
     */
    public String queryJqByID()throws Exception{
    	String jqID1=jqID;
    	organ_bak=psBS.findJqById(jqID1);
    	
        return JSON;
    }
    
    /**
     * Description:修改organ机构组织单元
     * Author: yulipeng - yulipeng@kingtoneinfo.com
     * Date: 2014-9-10
     * @throws Exception
     */
    public String editJq()throws Exception{
    	int count=psBS.findJqByCodeJq(organ_bak);
    	if(count>0){
    		xzinfo="1";
    	}else{
    		psBS.editOrgan(organ_bak);
    	}
    	 return JSON;
    }
    
    /**
	 * Description:删除组织单元 Author: yulipeng - yulipeng@kingtoneinfo.com 
	 * Date: 2014-9-10
	 * 
	 * @throws Exception
	 */
    public String delJq() throws Exception{
        delInfo = "1";
        String [] delOrganIDs = delOrgans.split("split");//delUnits
        
        for(int i=0;i<delOrganIDs.length;i++){
       	
        	Organization organ_bak= new Organization();
        	organ_bak.setId(delOrganIDs[i]);
        	int count=psBS.findJqSonCount(organ_bak);
        	int count2=psBS.findJqUserCount(organ_bak);

            if(count>0){
                delInfo="2"; //子节点
                return JSON;
            }else if(count2>0){//存在警务用户
            	delInfo="4";
                return JSON;
            }
        }
        psBS.delOrgan(delOrgans);
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
		String fileName = "警情机构信息导出.xls";
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

			sheet.addCell(new Label(0, 0, "机构编号", wcfTitle));
			sheet.addCell(new Label(1, 0, "机构名称", wcfTitle));
			sheet.addCell(new Label(2, 0, "父级编号", wcfTitle));
			sheet.addCell(new Label(3, 0, "父级机构名称", wcfTitle));
			sheet.addCell(new Label(4, 0, "机构编码", wcfTitle));
			sheet.addCell(new Label(5, 0, "描述信息", wcfTitle));
			sheet.addCell(new Label(6, 0, "排列顺序", wcfTitle));			

			// 设置边框
			WritableFont wfTitle2 = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.NO_BOLD, false);
			WritableCellFormat wcfTitle2 = new WritableCellFormat(wfTitle2);
			wcfTitle2.setBorder(Border.ALL, BorderLineStyle.THIN);
			
			List organList = new ArrayList();
			if(!treeNodeID.equals("null")){
				organList = psBS.getOrganAllbyId(treeNodeID);
			}else{
				organList = psBS.getOrganAll();
			}
			for (int i = 0; i < organList.size(); i++) {
				Organization org = (Organization) organList.get(i);
				sheet.addCell(new Label(0, i + 1,org.getId(),wcfTitle2));				
				sheet.addCell(new Label(1, i + 1,org.getName(), wcfTitle2));
				sheet.addCell(new Label(2, i + 1,org.getParent_id(), wcfTitle2));
				sheet.addCell(new Label(3, i + 1,org.getParent_name(), wcfTitle2));
				sheet.addCell(new Label(4, i + 1,org.getCode(), wcfTitle2));
				sheet.addCell(new Label(5, i + 1,org.getDescription(),wcfTitle2));
				sheet.addCell(new Label(6, i + 1,String.valueOf( org.getSort()),wcfTitle2));
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
	
	/**author：yulipeng
	 * excel导入
	 * 
	 * @return
	 */
	public String importExcel(){
		HttpServletRequest request = ServletActionContext.getRequest();
		File upload1 = null;
		int count3=0;
		try {
			upload1 = new File(ServletActionContext.getServletContext().getRealPath("/uploadfile")
					+ "/" + System.currentTimeMillis() + ".xls");
			if(test != null)
				FileUtils.copyFile(test, upload1);

			if (upload1.exists() || upload1.length() > 0) {

				FileInputStream inputSteam = new FileInputStream(upload1);

				Workbook book = Workbook.getWorkbook(inputSteam);
				Sheet sheet = book.getSheet(0);
				int rows = sheet.getRows();

				Organization organ= new Organization();
				
				for (int i = 1; i < rows; i++) {
					// 单位ID
					Cell useridColumn = sheet.getCell(0, i);
					String unit_id = useridColumn.getContents();
					unit_id = OrgUtils.delBlankChar(unit_id);
					
					// 单位名称
					Cell usernameColumn = sheet.getCell(1, i);
					String unit_name = usernameColumn.getContents();
					unit_name = OrgUtils.delBlankChar(unit_name);
					// 父节ID
					Cell policeidColumn = sheet.getCell(2, i);
					String parent_id = policeidColumn.getContents();
					parent_id = OrgUtils.delBlankChar(parent_id);
					
					// 描述
					Cell usertypeColumn = sheet.getCell(3, i);
					String description = usertypeColumn.getContents();
					description = OrgUtils.delBlankChar(description);
					// 机构编码 code=xzqh代替
					Cell imeiColumn = sheet.getCell(4, i);
					String xzqh = imeiColumn.getContents();
					xzqh = OrgUtils.delBlankChar(xzqh);
					// 排序
					Cell mobileColumn = sheet.getCell(5, i);
					String orderid = mobileColumn.getContents();
					orderid = OrgUtils.delBlankChar(orderid);
							
					organ.setId(unit_id);
					organ.setName(unit_name);
					organ.setParent_id(parent_id);
					organ.setDescription(description);
					organ.setCode(xzqh);

					organ.setSort(Integer.parseInt(orderid));

					psBS.importOrgan(organ);
					count3=count3+1;				 
				}
			}
		
		} catch (NumberFormatException e) {//异常无法处理
			e.printStackTrace();
			upload1.delete();
		    String count4=count3+"";
		    request.getSession().setAttribute("count4",count4);
		    return "success";
		}catch (Exception e) {

			e.printStackTrace();
			delInfo = "导入失败！";			
			return "error";
		}
		upload1.delete();
	    String count4=count3+"";
	    request.getSession().setAttribute("count4",count4);
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
		String fileName = "警情机构信息导入模版.xls";
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

    public String getTreeNodeID() {
		return treeNodeID;
	}
	public String getDelInfo() {
        return delInfo;
    }

    public String getDelOrgans() {
		return delOrgans;
	}
	public void setDelOrgans(String delOrgans) {
		this.delOrgans = delOrgans;
	}
	public String getJqID() {
		return jqID;
	}
	public void setJqID(String jqID) {
		this.jqID = jqID;
	}
	public void setId(String id) {
        this.id = id;
    }
   
	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	public void setQuery(String query) {
		this.query = query;
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
    
}

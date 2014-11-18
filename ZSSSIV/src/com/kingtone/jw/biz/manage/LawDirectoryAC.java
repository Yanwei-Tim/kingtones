package com.kingtone.jw.biz.manage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.biz.manage.bs.LawDirectoryBS;
import com.kingtone.jw.biz.manage.domain.LawContent;
import com.kingtone.jw.biz.manage.domain.LawDirectory;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.ssi.action.SSIAction;
/***
 * 
 * 新法律法规
 * @author YLP
 *
 */
@SuppressWarnings("serial")
public class LawDirectoryAC extends SSIAction {

	private LawDirectory lawDirectory;
	private LawDirectoryBS lawDirectoryBS;
	private int curId = 0;
	private int id;
	
	private String someid;//字符串id（备用）
	private LawContent lawContent;
	private String lawTime;//时间返回
	private List<TreeNode> treeNodes = new ArrayList<TreeNode>();

	public String queryLawDirectoryTree() {//获得法律法规的树目录

		lawDirectory = new LawDirectory();
		lawDirectory.setParentId(id);
		try {
			List<LawDirectory> lawDirList = lawDirectoryBS.findLawDirectoryAllTree(lawDirectory);
			Iterator<LawDirectory> it = lawDirList.iterator();
			while (it.hasNext()) {
				LawDirectory lawDir = it.next();
				TreeNode treeNode = new TreeNode(
						String.valueOf(lawDir.getId()), lawDir.getName(),
						String.valueOf(lawDir.getParentId()), null, true,
						false, false);
				treeNodes.add(treeNode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}

	public String queryLawDirectoryContent(){//获得法律法规的内容

		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");			
			lawContent = lawDirectoryBS.queryLawDirectoryContent(id);
			if(null!=lawContent){
				lawTime = "时间："+formatter.format(lawContent.getCreatedTime())+"  ";
			}else{
				lawContent=new LawContent();
				lawContent.setContent("-----------该层没有内容,或请点击下一层！-------------");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}

	public String addLawDirectory(){//添加法律法规目录
		try {
			lawDirectory.setCreatedTime(new Date());
			lawDirectoryBS.addLawDirectory(lawDirectory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}
	
	public String findDirectorybyId(){		//根据id获取目录的信息
		try {
			int did = Integer.parseInt(someid);
			lawDirectory = lawDirectoryBS.getLawDirectorybyId(did);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}

	public String updateDirectory(){//修改目录的信息
		try {
			lawDirectoryBS.updateLawDirectory(lawDirectory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}
	
	public String getLawContentCount(){//检查目录下是否有内容（用于添加内容）
		try {
			if(someid!=null){
				int did = Integer.parseInt(someid);
				id = lawDirectoryBS.getLawContentCount(did);
			}						
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}
	
	public String addLawContent(){//添加目录内容
		try {
			lawContent.setCreatedTime(new Date());
			lawDirectoryBS.addLawContent(lawContent);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return JSON;
	}
	
	public String findContentbyId(){		//根据id获取目录的信息
		try {
			int did = Integer.parseInt(someid);
			lawContent = lawDirectoryBS.getLawContentbyId(did);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}
	
	public String updateContent(){//修改目录内容
		try {
			lawDirectoryBS.updateLawContent(lawContent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}
	
	public String deleteDirectory(){	//删除目录	
		try {
			int did = Integer.parseInt(someid);
			int a = lawDirectoryBS.getLawDirectoryCount(did);
			int b = lawDirectoryBS.getLawContentCount(did);
			if(a>0){
				id=1;
			}else if(b>0){
				id=2;
			}else{
				id=3;
				lawDirectoryBS.delLawDirectory(did);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}
	
	public String deleteLawContent(){	//删除目录内容	
		try {
			int did = Integer.parseInt(someid);
			int b = lawDirectoryBS.getLawContentCount(did);
			if(b==0){
				id=1;
			}else{
				id=2;
				lawDirectoryBS.delLawContent(did);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}
	
	public String getSomeid() {
		return someid;
	}

	public void setSomeid(String someid) {
		this.someid = someid;
	}

	public String updateLawDirectory(){
		return null;
	}
	public String getLawTime() {
		return lawTime;
	}

	public void setLawTime(String lawTime) {
		this.lawTime = lawTime;
	}

	public LawContent getLawContent() {
		return lawContent;
	}

	public void setLawContent(LawContent lawContent) {
		this.lawContent = lawContent;
	}

	public LawDirectoryBS getLawDirectoryBS() {
		return lawDirectoryBS;
	}

	public void setLawDirectoryBS(LawDirectoryBS lawDirectoryBS) {
		this.lawDirectoryBS = lawDirectoryBS;
	}

	public LawDirectory getLawDirectory() {
		return lawDirectory;
	}

	public void setLawDirectory(LawDirectory lawDirectory) {
		this.lawDirectory = lawDirectory;
	}

	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}

	public void setTreeNodes(List<TreeNode> treeNodes) {
		this.treeNodes = treeNodes;
	}

	public int getCurId() {
		return curId;
	}

	public void setCurId(int curId) {
		this.curId = curId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	

}

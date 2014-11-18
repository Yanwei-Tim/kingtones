// JavaScript Document
//firstNote		第一个节点的名称
//imgFoldOpen	打开的图标的URL
//imgFoldClose	关闭的图标的url
//imgFile		文件图标的URL
var firstNote="dir0";
var imgFoldOpen="folderopen.gif";
var imgFoldClose="folder.gif";
var imgFile="file.gif";

//功能：为一个目录添加菜单项目，并在各项前添加一个复选按钮
//参数：

//m_parent:	插入点，父节点ID
//m_id:		节点ID
//m_name:		节点名称
//m_link:		节点链接
//m_level:	节点的层次 
//m_isFile:	是否文件，用来决定节点的图标
//m_fileICO:	如果是文件，可以添加一个图标链接；如果值为空，使用默认值
//m_rdo:		添加一个单选框
//m_chk:		添加一个复选框

function add_item(m_parent,M_ID,m_name,m_link,m_level,m_isFile,m_fileICO,m_urlname,m_rdo,m_chk)
{
	var tmpStr;
	var m_id="dir_"+M_ID;
	m_parent="dir_"+m_parent;

	tmpStr="";
	tmpStr=tmpStr+"<div id=\""+m_id+"\" class=\"parent\" isFile=\""+m_isFile+"\">";	
	tmpStr=tmpStr+"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" > <tr>";
	//-----------添加单（复）选按钮---------
	if(m_rdo==true)
	{
		tmpStr+="<td><input type=\"radio\" name=\"m_id\" id=\""+m_id+"_RDO\" value=\""+M_ID+"\" ></td>";
	}
	if(m_chk==true)
	{
		tmpStr+="<td><input type=\"checkbox\" name=\"m_id\" id=\""+m_id+"_CHK\" value=\""+M_ID+"\" checked onclick=check_all(\""+m_id+"\");></td>";
	}else if(m_chk==false)
	{
		tmpStr+="<td><input type=\"checkbox\" name=\"m_id\" id=\""+m_id+"_CHK\"  value=\""+M_ID+"\" onclick=check_all(\""+m_id+"\");></td>";
	}
	
	//------添加间隔图片------
	tmpStr=tmpStr+"<td nowrap>";	
	for(i=1;i<=m_level;i++)
	{
		tmpStr=tmpStr+"<img src=\"spacer.gif\" width=\"15\" height=\"11\">";
	}
	
	//-------选择节点图片-------
	if(m_isFile)
	{
		var imgStr=m_fileICO?m_fileICO:imgFile;
		tmpStr=tmpStr+"<img id=\""+m_id+"_IMG\" src=\""+imgStr+"\" width=\"16\" height=\"16\">  ";
	}else{
		tmpStr=tmpStr+"<img id=\""+m_id+"_IMG\" src=\""+imgFoldOpen+"\" width=\"16\" height=\"16\">  ";
	}
	
	//-----为节点链接添加点击事件-------
	
	if((m_rdo=="")||(m_chk==""))
	{
		if(m_isFile)
		{
			tmpStr=tmpStr+"<a href=\"#\"  target=\"mainFrame\">"+m_name+"</a>";
		}else{
			tmpStr=tmpStr+"<a href=\"#\" onClick=\"return menu_hide("+m_id+".id);\">"+m_name+"</a>";
		}		
	}
	else 
	{
		if(m_isFile)
		{
		//	tmpStr=tmpStr+"<a href=\""+m_link+"?URLNAME="+m_urlname+"\"  target=\"mainFrame\">"+m_name+"</a>";
			tmpStr=tmpStr+"<a href=\""+m_link+"\"  target=\"mainFrame\">"+m_name+"</a>";
		}else{
		//	tmpStr=tmpStr+"<a href=\""+m_link+"?URLNAME="+m_urlname+"\" onClick=\"return menu_hide("+m_id+".id);\">"+m_name+"</a>";
			tmpStr=tmpStr+"<a href=\""+m_link+"\" onClick=\"return menu_hide("+m_id+".id);\">"+m_name+"</a>";
		}		
	}
	
	tmpStr=tmpStr+"</td>";
	tmpStr=tmpStr+"</tr></table>";	
	if(!m_isFile)
	{	
		tmpStr=tmpStr+"<div id=\""+m_id+"_CHILD\" class=\"child\"></div>";
	}
	tmpStr=tmpStr+"</div>";
	
	obj=document.all[m_parent+"_CHILD"];
	
	if (obj)
	{
		obj.innerHTML=obj.innerHTML+tmpStr;
	}else{
		document.writeln(tmpStr);
	}
	
}


//功能：显示与隐藏菜单项
//参数：

//idname:		菜单项的ID编号
//isHide:		是否隐藏

function menu_hide(idname,isHide)
{
	 

	obj=document.all[idname+"_CHILD"];
	objIMG=document.all[idname+"_IMG"];

	if(obj.style.display)
	{
		obj.style.display="";
		objIMG.src=imgFoldOpen;
	}else{
		obj.style.display="none";
		objIMG.src=imgFoldClose;
	}
	return false;
}


function add_item_qx(m_parent,M_ID,m_name,m_link,m_level,m_isFile,m_fileICO,m_urlname,m_rdo,m_chk)
{
	var tmpStr;
	var m_id="dir_"+M_ID;
	m_parent="dir_"+m_parent;

	tmpStr="";
	tmpStr=tmpStr+"<div id=\""+m_id+"\" class=\"parent\" isFile=\""+m_isFile+"\">";	
	tmpStr=tmpStr+"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" > <tr>";
	//-----------添加单（复）选按钮---------
	if(m_rdo==true)
	{
		tmpStr+="<td><input type=\"radio\" name=\"m_id\" id=\""+m_id+"_RDO\" value=\""+M_ID+"\" ></td>";
	}
	if(m_chk==true)
	{
		tmpStr+="<td><input type=\"checkbox\" name=\"MID_"+M_ID+"\" id=\""+m_id+"_CHK\"  value=\"L,A,E,D\" checked  onclick=check_all(\""+m_id+"\");></td>";
	}else if(m_chk==false)
	{
		tmpStr+="<td><input type=\"checkbox\" name=\"MID_"+M_ID+"\" id=\""+m_id+"_CHK\"  value=\"L,A,E,D\" onclick=check_all(\""+m_id+"\");></td>";
	}
	
	//------添加间隔图片------
	tmpStr=tmpStr+"<td nowrap>";	
	for(i=1;i<=m_level;i++)
	{
		tmpStr=tmpStr+"<img src=\"spacer.gif\" width=\"15\" height=\"11\">";
	}
	
	//-------选择节点图片-------
	if(m_isFile)
	{
		var imgStr=m_fileICO?m_fileICO:imgFile;
		tmpStr=tmpStr+"<img id=\""+m_id+"_IMG\" src=\""+imgStr+"\" width=\"16\" height=\"16\">  ";
	}else{
		tmpStr=tmpStr+"<img id=\""+m_id+"_IMG\" src=\""+imgFoldOpen+"\" width=\"16\" height=\"16\">  ";
	}
	
	//-----为节点链接添加点击事件-------
	
	if((m_rdo=="")||(m_chk==""))
	{
		if(m_isFile)
		{
			tmpStr=tmpStr+"<a href=\"#\"  target=\"mainFrame\">"+m_name+"</a>";
		}else{
			tmpStr=tmpStr+"<a href=\"#\" onClick=\"return menu_hide("+m_id+".id);\">"+m_name+"</a>";
		}		
	}
	else 
	{
		if(m_isFile)
		{
		//	tmpStr=tmpStr+"<a href=\""+m_link+"?URLNAME="+m_urlname+"\"  target=\"mainFrame\">"+m_name+"</a>";
			tmpStr=tmpStr+"<a href=\""+m_link+"\"  target=\"mainFrame\">"+m_name+"</a>";
		}else{
			tmpStr=tmpStr+"<a href=\""+m_link+"\"  target=\"mainFrame\">"+m_name+"</a>";
		//	tmpStr=tmpStr+"<a href=\""+m_link+"?URLNAME="+m_urlname+"\"  target=\"mainFrame\">"+m_name+"</a>";
		}		
	}
	
	tmpStr=tmpStr+"</td>";
	tmpStr=tmpStr+"</tr></table>";	
	if(!m_isFile)
	{	
		tmpStr=tmpStr+"<div id=\""+m_id+"_CHILD\" class=\"child\"></div>";
	}
	tmpStr=tmpStr+"</div>";
	
	obj=document.all[m_parent+"_CHILD"];
	
	if (obj)
	{
		obj.innerHTML=obj.innerHTML+tmpStr;
	}else{
		document.writeln(tmpStr);
	}
	
}






//功能：显示或隐藏所有项目
function hide_all(idName)
{
	var obj,isDisplay;
	var aList=document.all[idName].parentElement.getElementsByTagName("DIV");
	var tmpStr="";
	isDisplay=(document.all[firstNote+"_CHILD"].style.display=="none")?true:false;

	for (var i=0;i<aList.length;i++)
	{
		obj=document.all[aList[i].id+"_CHILD"];
		objIMG=document.all[aList[i].id+"_IMG"];
		if((aList[i].isFile)&&(aList[i].isFile!="true"))		
		{
			if(isDisplay)
			{
				obj.style.display="";
				objIMG.src=imgFoldOpen;			
			}else{
				obj.style.display="none";
				objIMG.src=imgFoldClose;
			}
		}
		
	}

}

//功能： 选中或取消选中所有项目
function check_all(idName)
{
	var obj,isDisplay;
	var aList=document.all[idName].getElementsByTagName("INPUT");
	var tmpStr="";
	obj=document.all[idName+"_CHK"];
	isCHK=(obj.checked)?true:false;
	obj.checked=isCHK;	

	for (var i=0;i<aList.length;i++)
	{
		obj=aList[i];
		obj.checked=isCHK;
	}

}
// JavaScript Document
//-----document变量说明
//url		指明表单ACTION属性值

//功能：表单在提交时专门用于删除按钮
function onDelete(msg,objForm)
{
	if(!confirm(msg))
	{
		return false;
	}
	do_form(objForm);
}
//功能 ：提交表单并确认表单
function do_form(objForm)
{	
	objForm.action=document.url;
	//alert(form1.action);
	objForm.submit();

}
/*光棒效果*/
function over(obj)
{
obj.style.backgroundColor="#3366FF";
}
function out(obj)
{
obj.style.backgroundColor="";
}


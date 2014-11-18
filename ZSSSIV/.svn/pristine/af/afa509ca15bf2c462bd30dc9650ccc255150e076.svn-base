<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>角色列表</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
	<link rel="stylesheet" href="<%=path%>/ztree/demo/demoStyle/demo.css" type="text/css"/>
  	<link rel="stylesheet" href="<%=path%>/ztree/demo/zTreeStyle/zTreeStyle.css" type="text/css"/>
  	<script type="text/javascript" src="<%=path%>/ztree/demo/jquery-ztree-2.5.js"></script>
  	<script type="text/javascript" src="<%=path%>/config.js"></script>
  	<script type="text/javascript">
  	function _btnSubmit(){
		var checkedNodes = menuTree.getCheckedNodes(true);
		var uncheckedNodes = menuTree.getCheckedNodes(false);
		var menuCheckedIDstr = "";
		var menuCheckedRestr = "";
		var menuUncheckedIDstr = "";
		var menuUncheckedRestr = "";
		var buttonCheckedIDstr = "";
		var buttonUnCheckedIDstr = "";
		for (var i=0; i<checkedNodes.length; i++) {
		
			if(checkedNodes[i].level==0){
				if(checkedNodes[i].checkedOld != checkedNodes[i].checked){
					menuCheckedIDstr+= checkedNodes[i].id + "split";
					menuCheckedRestr+= checkedNodes[i].pid+ "split";
				}
			}else if(checkedNodes[i].level==1){
				if(checkedNodes[i].checkedOld != checkedNodes[i].checked){
					menuCheckedIDstr+= checkedNodes[i].id + "split";
					menuCheckedRestr+= checkedNodes[i].pid+ "split";
				}
			}else if(checkedNodes[i].level==2){
				if(checkedNodes[i].checkedOld != checkedNodes[i].checked){
					buttonCheckedIDstr+= checkedNodes[i].id + "split";
				}
			}
				//alert("|"+tmp[i].name+"|"+tmp[i].checkedOld+"|"+tmp[i].checked)
		}
		for (var i=0; i<uncheckedNodes.length; i++) {
			if(uncheckedNodes[i].level==0){
				if(uncheckedNodes[i].checkedOld != uncheckedNodes[i].checked){
					menuUncheckedIDstr+= uncheckedNodes[i].id + "split";
					menuUncheckedRestr+= uncheckedNodes[i].pid+ "split";
				}
			}else if(uncheckedNodes[i].level==1){
				if(uncheckedNodes[i].checkedOld != uncheckedNodes[i].checked){
					menuUncheckedIDstr+= uncheckedNodes[i].id + "split";
					menuUncheckedRestr+= uncheckedNodes[i].pid+ "split";
				}
			}else if(uncheckedNodes[i].level==2){
				if(uncheckedNodes[i].checkedOld != uncheckedNodes[i].checked){
					buttonUnCheckedIDstr+= uncheckedNodes[i].id + "split";
				}
			}
			
		}
		$.ajax({
	    	url: webroot+'/platform/roleAC!updataRoleMenuMaping.action?roleID='+getSelectNodeId(),
	    	type: 'POST',
		    dataType: '',
		    data: 'menuCheckedIDstr='+menuCheckedIDstr+'&menuUncheckedIDstr='+menuUncheckedIDstr
		    	+'&menuCheckedRestr='+menuCheckedRestr+'&menuUncheckedRestr='+menuUncheckedRestr
		    	+'&buttonCheckedIDstr='+buttonCheckedIDstr+'&buttonUnCheckedIDstr='+buttonUnCheckedIDstr,
		    //timeout: 1000,
		    error: function(){
		       alert('保存失败');
		    },
		    success: function(data){
		    	alert("保存成功！按钮权限重新登录后生效！"); // Modify by 陈萧如 bug36对应
		    	menuTree = $("#menutree2").zTree(menuTreeSet, menuTreeNodes);
//		    	window.parent.document.getElementsByTagName("frameset")[0].location.reload();
//		    	window.parent.frames.top.location.reload();
		    }
		});
	}
	/*
	function _btnSubmit2(){
		var tmp = menuTree3.getCheckedNodes(true);
		var tmp2 = menuTree3.getCheckedNodes(false);
		var menuIDstr = "";
		var menuRestr = "";
		var menuIDstr2 = "";
		var menuRestr2 = "";
		for (var i=0; i<tmp.length; i++) {
			if(tmp[i].checkedOld != tmp[i].checked){
				menuIDstr+= tmp[i].id + "split";
				menuRestr+= tmp[i].pid+ "split";
			}
				//alert("|"+tmp[i].name+"|"+tmp[i].checkedOld+"|"+tmp[i].checked)
		}
		for (var i=0; i<tmp2.length; i++) {
			if(tmp2[i].checkedOld != tmp2[i].checked){
				menuIDstr2+= tmp2[i].id + "split";
				menuRestr2+= tmp2[i].pid+ "split";
			}
				//alert("|"+tmp2[i].name+"|"+tmp2[i].checkedOld+"|"+tmp2[i].checked)
		}
		alert(menuIDstr+""+menuRestr+""+menuIDstr2+""+menuRestr2);
		$.ajax({
	    	url: webroot+'/platform/roleAC!updataRoleMenuMaping2.action?roleID='+getSelectNodeId(),
	    	type: 'POST',
		    dataType: 'json',
		    data: 'menuIDstr='+menuIDstr+'&menuIDstr2='+menuIDstr2+'&menuRestr='+menuRestr+'&menuRestr2='+menuRestr2,
		    timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		    	menuTree3 = $("#menutree3").zTree(menuTreeSet3, menuTreeNodes3);
		    	//alert("保存成功！");
		    	//menuTreeSet.asyncUrl = 'platform/roleAC!queryMenusByRoleID.action?roleID='+treeNode.id;
				//menuTree = $("#menutree").zTree(menuTreeSet, menuTreeNodes);
		    }
		});
	}
	*/
	function _btnCreate(){
		url=webroot+"/platform/auth/role_add.jsp";
        var newWin=window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:450px;dialogLeft:300px;dialogTop:230px;center:yes');
			newWin.open();
	}
  	function _btnDelelte(){
  	
  		if(getSelectNode()==null){
  			alert("请选择要删除的角色！");
  			return;
  		} else{
			 if(confirm('是否要删除该项！')){
  		$.ajax({
	    	url:webroot+'/platform/roleAC!delRole.action',
	    	type: 'POST',
	    	data: 'roleID='+getSelectNodeId(),
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		     alert("删除失败");
		       
		    },
		    success: function(data){
		        alert("删除成功");
		    	refreshTree();
		    	refreshTree1()
		    }
		});}}
  	}
  	</script>
		
	<style>
		body
			{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			}
		.flexigrid div.fbutton .add
			{
				background: url(<%=path%>/flexgrid/css/images/add.png) no-repeat center left;
			}	
		.flexigrid div.fbutton .delete
			{
				background: url(<%=path%>/flexgrid/css/images/close.png) no-repeat center left;
			}	
	</style>
	
  </head>
  
  <body>
  	<table width="100px" align="left">
  		<tr height="5%">
  			<td><span style="color:#000000; font-weight:bolder;">权限管理&gt;&gt;角色管理</span></td>
  			<td></td>
  		</tr>
  		<tr width="10%">
  			<td>
  				<table cellpadding="0" cellspacing="0" border="1px" width="100%">
					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="color: #000000; font-weight: bolder;">角色列表</span>
						</td>
					</tr>
				</table>
				<table cellpadding="1" cellspacing="1"  border="1px"><tr><td><ul id="roletree" class="tree"></ul></td></tr></table>
				<table height="100%"></table>
			</td>
										
  			<td>
  				<table cellpadding="0" cellspacing="0" border="1px" width="100%">
					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="color: #000000; font-weight: bolder;">菜单列表-可访问</span>
						</td>
					</tr>
				</table>
  				<table border="1px"><tr><td><ul id="menutree2" class="tree"></ul></td></tr></table>
				<table height="100%"></table>
  			</td>
  			
  			<!--td>
  				<table cellpadding="0" cellspacing="0" border="1px" width="100%">
					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="color: #B96F26; font-weight: bolder;">菜单列表-可分配</span>
						</td>
					</tr>
				</table>
  				<table border="1px"><tr><td><ul id="menutree3" class="tree"></ul></td></tr></table>
				<table height="100%"></table>
  			</td-->
  		</tr>
  		<tr>
  			<td>
	  			<input type="button" id="btn1"    value="保存" onclick="_btnSubmit();"/>
	  			<input type="button" id="btn2"    value="增加" onclick="_btnCreate()"/>
	  			<input type="button" id="btn3"    value="删除" onclick="_btnDelelte();"/>
	  			<!--input type="button" id="btn4"    value="保存2" onclick="_btnSubmit2();"/-->
  			</td>
  		</tr>
  	</table>
<script type="text/javascript" src="<%=path%>/platform/auth/role_mgr_list.js"></script>
  </body>
</html>

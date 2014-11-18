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
  	<script type="text/javascript" src="<%=path%>/ztree/demo_2.6/jquery.ztree-2.6.js"></script>
  	<script type="text/javascript" src="<%=path%>/config.js"></script>
  	<script type="text/javascript">
  	function _btnSubmit(){
		var checkedNodes = menuTree.getCheckedNodes(true);
		var uncheckedNodes = menuTree.getCheckedNodes(false);
		var menuCheckedIDstr = "";
		var menuCheckedRestr = "";
		var menuUncheckedIDstr = "";
		var menuUncheckedRestr = "";
		for (var i=0; i<checkedNodes.length; i++) {
			if(checkedNodes[i].checkedOld != checkedNodes[i].checked){
				menuCheckedIDstr+= checkedNodes[i].id + "split";
			}
		}
		for (var i=0; i<uncheckedNodes.length; i++) {
			if(uncheckedNodes[i].checkedOld != uncheckedNodes[i].checked){
				menuUncheckedIDstr+= uncheckedNodes[i].id + "split";
			}
		}
		
		if(menuTree3!=null){
		var checkedNodes3 = menuTree3.getCheckedNodes(true);
		var uncheckedNodes3 = menuTree3.getCheckedNodes(false);
		for (var i=0; i<checkedNodes3.length; i++) {
			if(checkedNodes3[i].checkedOld != checkedNodes3[i].checked&&(checkedNodes3[i].pid!=null)){
				menuCheckedRestr+= checkedNodes3[i].pid+ "resfenge"+checkedNodes3[i].id+"split";
			}
		}
		for (var i=0; i<uncheckedNodes3.length; i++) {
			if(uncheckedNodes3[i].checkedOld != uncheckedNodes3[i].checked&&(uncheckedNodes3[i].pid!=null)){
				menuUncheckedRestr+= uncheckedNodes3[i].pid+ "resfenge"+uncheckedNodes3[i].id+"split";
			}
		}
		}
		
		$.ajax({
	    	url: webroot+'/xajw/jwRoleAC!updateJwRoleBizRes.action?jwRoleId='+getSelectNodeId(),
	    	type: 'POST',
		    dataType: 'json',
		    data: 'menuCheckedIDstr='+menuCheckedIDstr+'&menuUncheckedIDstr='+menuUncheckedIDstr
		    	+'&menuCheckedRestr='+menuCheckedRestr+'&menuUncheckedRestr='+menuUncheckedRestr,
		    //timeout: 1000,
		    error: function(){
		       alert('保存失败');
		    },
		    success: function(data){
		    	alert("保存成功！");
		    	//menuTree = $("#menutree2").zTree(menuTreeSet, menuTreeNodes);
		    	refreshTree1();
		    	refreshTree2();
		    }
		});
	}
	
	function _btnCreate(){
		url=webroot+"/biz/xajw/jwrole_add.jsp";
        var newWin=window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:450px;dialogLeft:300px;dialogTop:230px;center:yes');
			newWin.open();
	}
  	function _btnDelelte(){
  		if(getSelectNode()==null){
  			alert("请选择要删除的角色！");
  			return;
  		} else{
			 if(confirm('是否要删除该项及权限分配！')){
  		$.ajax({
	    	url:webroot+'/xajw/jwRoleAC!delJwRole.action',
	    	type: 'POST',
	    	data: 'jwRoleId='+getSelectNodeId(),
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		     alert("删除失败");
		       
		    },
		    success: function(data){
		        alert("删除成功");
		    	refreshTree();
		    	refreshTree1()
		    	refreshTree2();
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
  			<td><span style="color:#000000; font-weight:bolder;">警务权限管理&gt;&gt;警务角色管理</span></td>
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
							<span style="color: #000000; font-weight: bolder;">业务列表-可访问</span>
						</td>
					</tr>
				</table>
  				<table border="1px"><tr><td><ul id="menutree2" class="tree"></ul></td></tr></table>
				<table height="100%"></table>
  			</td>
  			
  			<td>
  				<table cellpadding="0" cellspacing="0" border="1px" width="100%">
					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="color: #000000; font-weight: bolder;">业务组件列表-可访问</span>
						</td>
					</tr>
				</table>
  				<table border="1px"><tr><td><ul id="menutree3" class="tree"></ul></td></tr></table>
				<table height="100%"></table>
  			</td>
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
<script type="text/javascript" src="<%=path%>/biz/xajw/jwrole_mgr_list.js"></script>
  </body>
</html>

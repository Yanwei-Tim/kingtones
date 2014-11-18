<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户信息编辑</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
     	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
     		<script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
function len(){
	m=0;
	for(i=0;i<document.getElementById('sex').length;i++){
		 if(document.getElementById('sex')[i].selected==true){
		 	m++;
		 }
	}
}
var parent=window.opener;//this.dialogArguments;


 $(document).ready(function(){
  
  
       $.ajax({
	    	url: webroot+'/platform/userAC!queryUserById.action',
	    	data:'userId='+parent.selectItemId,
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		    	$("#userID").val(data.user_bak.userID);
		    	$("#sex").val( data.user_bak.sex);
		    	if(data.user_bak.sex=="F"){
		    	$("#sex_div").html("<select id=\"sex\" name=\"user_bak.sex\" style=\"width:30%\"><option value=\"F\" selected=\"selected\">男</option><option value=\"M\">女</option>");
		    	}else{
		    			    	$("#sex_div").html("<select id=\"sex\" name=\"user_bak.sex\" style=\"width:30%\"><option value=\"F\" >男</option><option value=\"M\" selected=\"selected\">女</option>");
		    	}
		    	
		    	$("#name").val(data.user_bak.fullName);
		    	$("#desc").val(data.user_bak.description);
		    	$("#unitID").val(data.user_bak.unitID);
		    	$("#roleID").val(data.user_bak.roleID);
		    	$("#unitName").val(data.user_bak.unitName);
		    	$("#roleName").val(data.user_bak.roleName);
		    	$("#username").val(data.user_bak.username);
		    	$("#password").val(data.user_bak.password);
		    	$("#account_id").val(data.user_bak.account_id);
		    	$("#expired_date").val(data.user_bak.expired_date);
		    	$("#locked").val(data.user_bak.locked);
		    	if(data.user_bak.locked=="true"){
		    	$("#locked_div").html("<select id=\"locked\" name=\"user_bak.locked\" style=\"width:30%\"><option value=\"1\" selected=\"selected\">是</option><option value=\"0\">否</option>");
		    	}else{
		    	$("#locked_div").html("<select id=\"locked\" name=\"user_bak.locked\" style=\"width:30%\"><option value=\"1\" >是</option><option value=\"0\" selected=\"selected\">否</option>");
		    	}
		    	
		    }
		});
 		
  $("#btn1").click(function(){
    	//给隐藏域赋值
    	postdata();                                              
    });     
    $("#btn2").click(function(){
		window.close();
    });   
 }); 
function postdata(){ 

    if(!isNull($("#name").val(),"姓名")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	 if(!lengthCheck($("#fullName").val(),"姓名",128)){
     return false;
   }
	if(!isNull($("#unitName").val(),"单位")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#username").val(),"账户")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!lengthCheck($("#username").val(),"账户",128)){
     return false;
   } 
	if(!isNull($("#password").val(),"密码")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	 if(!lengthCheck($("#password").val(),"密码",128)){
     return false;
   }  
   
	if(!isNull($("#roleName").val(),"角色")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!isNull($("#desc").val(),"描述信息")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
    if(!lengthCheck($("#desc").val(),"描述信息",1024)){
     return false;
   } 
   
	var postData = $("#form1").serialize();                                    
     
	$.ajax({
		url: webroot+'/platform/userAC!editUser.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("修改失败");
		},
		success: function(data){
		if (data.dateInfo=="3"){
		 alert("账号不能重复！")
		}else{
		    alert("修改成功！")
			document.getElementById("btn1").disabled = false;
				parent.refreshGrid();
	        	window.close();
			
	    }}
	});              
 }

function openDeptTree(url){
		window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:450px;dialogLeft:300px;dialogTop:230px;center:yes');
	}
	
function setRoleID(roleID){
	$("#roleID").val(roleID);
}
function setUnitID(unitID){
	$("#unitID").val(unitID);
}

function setRoleName(roleName){
	$("#roleName").val(roleName);
}
function setUnitName(unitName){
	$("#unitName").val(unitName);
}

    
</script>
 
    
  </head>
  <body>
  	<br>
  	<form id="form1">
  	<input type="hidden"  id="userID" name="user_bak.userID"/>
  	<input type="hidden" id="account_id" name="user_bak.account_id"/>
  	<input type="hidden" id="unitID" name="user_bak.unitID"/>
  	<input type="hidden"  id="roleID" name="user_bak.roleID"/>
  	<table border="0" cellspacing="0" cellpadding="0" align="right">
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td>&nbsp;</td><td><span class="xing">*</span>&nbsp;&nbsp;姓名：</td><td><input type="text"  id="name" name="user_bak.fullName" size="50%"/></td><td>&nbsp;</td></tr>
	  	<tr><td>&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;性别：</td>
		  	<td>
	  			
	    		<!--input  type="text" id= "sex" name="user_bak.sex" size="50%"/-->
	  			<div id="sex_div"></div>
		  	</td>
		  	<td>&nbsp;</td>
	  	</tr>
	  	<tr><td>&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;单位：</td><td><input type="text" id="unitName" name="user_bak.unitName" size="50%" onclick="openDeptTree('<%=path%>/platform/org/unit_tree.jsp')" readonly  /></td><td>&nbsp;</td></tr>
	  	<tr><td>&nbsp;</td><td><span class="xing">*</span>&nbsp;&nbsp;账户：</td><td><input type="text" id="username" name="user_bak.username" size="50%"/></td><td>&nbsp;</td></tr>
	  	<tr><td>&nbsp;</td><td><span class="xing">*</span>&nbsp;&nbsp;密码：</td><td><input type="password" id="password" name="user_bak.password" size="50%"/></td><td>&nbsp;</td></tr>
	  	<tr><td>&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;角色：</td><td><input type="text" id="roleName" name="user_bak.roleName" size="50%" onclick="openDeptTree('<%=path%>/platform/auth/role_tree.jsp')" readonly/></td><td>&nbsp;</td></tr>
	  	<tr><td>&nbsp;</td><td><span class="xing">*</span>&nbsp;&nbsp;描述信息：</td><td><input type="text" id="desc" name="user_bak.description"  size="50%"/></td><td>&nbsp;</td></tr>
	  	<tr><td>&nbsp;</td><td><span class="xing">*</span>&nbsp;&nbsp;到期时间：</td><td><input type="text"   id="expired_date" name="user_bak.expired_date" size="20%" onFocus="HS_setDate(this)" readonly></td><td>&nbsp;</td></tr>
	  	<tr><td>&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;是否锁定：</td>
	  		<td>
	  			
	    		<!--input  type="text" id= "locked" name="user_bak.locked" size="50%"/-->
	  			<div id="locked_div"></div>
		  	</td>
		  	<td>&nbsp;</td>
	  	</tr>
	  	<tr><td>&nbsp;</td><td>&nbsp;</td>
	  		<td align="center">
	  			<input type="button" id="btn1"  value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  			<input type="button" id="btn2"  value="取 消"/>
	  		</td>
	  		<td>&nbsp;</td>
	  	</tr>
	  	
  	</table>
	</form>  
  </body>
</html>

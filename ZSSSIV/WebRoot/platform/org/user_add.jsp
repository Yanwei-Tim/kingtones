<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户信息添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
   	
<script type="text/javascript">
var parent= window.opener;//this.dialogArguments;
 $(document).ready(function(){
    $("#btn1").click(function(){
    	//window.opener.disable = true;
		
		//给隐藏域赋值
    	$("#hid1").val(parent.getSelectNodeId());
    	postdata(); 
    	                                             
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 
function postdata(){ 
 if(!isNull($("#fullName").val(),"姓名")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
  if(!lengthCheck($("#fullName").val(),"姓名",128)){
     return false;
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
	if(!isNull($("#description").val(),"描述信息")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
     if(!lengthCheck($("#description").val(),"描述信息",1024)){
     return false;
   } 
   if(!isNull($("#expired_date").val(),"到期时间")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	var postData = $("#form1").serialize();  
	
		                         
   $.ajax({
		url: webroot+'/platform/userAC!addUser.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("添加失败");
		},
		success: function(data){
	
		if(data.dateInfo=="1"){
		    alert("到期时间不能早于当前时间！")
		}
		else if (data.dateInfo=="2"){
		 alert("账号不能重复！")
		}
		else{
			 alert("添加成功！")
				parent.refreshGrid();
	        	window.close();
	        	}
			
	    }
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
  	<form id="form1">
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	    <input type="hidden"  id="roleID" name="user_bak.roleID"/>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;姓名：</td><td><input  type="text" id= "fullName" name="user_bak.fullName" size="50%"/></td></tr>
	  	<tr><td></td>
		  	<td>&nbsp;&nbsp;&nbsp;&nbsp;性别：</td>
		  	<td>
	  			<select id ="sex"  name="user_bak.sex" style="width:100%">
		    		<option value="F">男</option>
         	<option value="M">女</option>
	    		</select>
		  	</td>
	  	</tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;账户：</td><td><input  type="text" id ="username" name="user_bak.username" size="50%"/></td></tr>
	  	
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;密码：</td><td><input  type="password" id ="password"  name="user_bak.password" size="50%"/></td></tr>
	 <tr><td>&nbsp;</td><td><span class="xing">*</span>&nbsp;&nbsp;角色：</td><td><input type="text" id="roleName" name="user_bak.roleName" size="50%" onclick="openDeptTree('<%=path%>/platform/auth/role_tree.jsp')" readonly/></td><td>&nbsp;</td></tr> 
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;描述信息：</td><td><input  type="text"  id ="description" name="user_bak.description" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;到期时间：</td><td><input type="text"   id="expired_date" name="user_bak.expired_date" size="20%" onFocus="HS_setDate(this)" readonly></td></tr>
	  		  <tr><td></td>
		  	<td>&nbsp;&nbsp;&nbsp;&nbsp;是否锁定：</td>
		  	<td>
	  			<select id="locked" name="user_bak.locked" style="width:50%">
	         	<option value="0">否</option>
	         	<option value="1">是</option>
	    		</select>
		  	</td>
	  	</tr>
	  	<tr><td></td><td></td><td><input id="hid1" type="hidden" name="user_bak.unitID" size="50%"/></td></tr>
	

  		
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

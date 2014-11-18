<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>菜单信息添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
    $("#btn1").click(function(){
    	//window.opener.disable = true;
		document.getElementById("btn1").disabled =true;
		$("#hid1").val(parent.getSelectNodeId());
		
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 

	function postdata(){ 
	
	 if(!isNull($("#name").val(),"菜单")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#name").val(),"菜单",64)){
		document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug41对应
     	return false;
   } 
	if(!isNull($("#position").val(),"序号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	if(!isNumber($("#position").val(),"序号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#position").val(),"序号",8)){
		document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug41对应
     	return false;
   } 
	if(!isNull($("#description").val(),"描述信息")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	if(!lengthCheck($("#description").val(),"描述信息",128)){
      	document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug41对应
     	return false;
   }  
	if(!isNull($("#url").val(),"页面")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	  if(!lengthCheck($("#url").val(),"页面",128)){
      	document.getElementById("btn1").disabled = false;
     	return false;
   } 
	if(!isNull($("#resource").val(),"资源")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!lengthCheck($("#res").val(),"资源",512)){
      	document.getElementById("btn1").disabled = false;
     	return false;
   } 
	
	var postData = $("#form1").serialize(); 
	if($("#resource").val()==""){
		$("#resource").cssClass = "background:red";
		alert("资源 不能为空");
		return;
	}     
	 $.ajax({
		url: webroot+'/platform/menuAC!addMenu.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("添加失败");
		},
		success: function(data){
			document.getElementById("btn1").disabled = false;
				parent.refreshGrid();
				parent.refreshNode();
		     
	        	window.close();
			
	    }
	});      
	  
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
	  
	  	
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;菜单:</td><td><input id="name" type="text"name="menu_bak.name" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;序号:</td><td><input id="position" type="text" name="menu_bak.position" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;描述信息:</td><td><input id="description" type="text" name="menu_bak.description" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;页面:</td><td><input id="url" type="text"name="menu_bak.url" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;资源:</td><td><input id="resource" name="menu_bak.resource" type="text" size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><input id="hid1" name="menu_bak.parent_id" type="hidden"  size="50%"/></td></tr>
	  	
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

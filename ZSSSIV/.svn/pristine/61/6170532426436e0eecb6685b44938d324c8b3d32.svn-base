<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>菜单信息编辑</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
        $.ajax({
	    	url: webroot+'/platform/menuAC!queryMenuByID.action',
	    	data:'menuID='+parent.selectItemId,
	    	type: 'POST',
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
				
		    	$("#menu_id").val(data.menu_bak.menu_id);
		    	$("#name").val(data.menu_bak.name);
		    	$("#url").val(data.menu_bak.url);
		    	$("#position").val(data.menu_bak.position);
		    	$("#desc").val(data.menu_bak.description);
		    	$("#res").val(data.menu_bak.resource);
		    	$("#rid").val(data.menu_bak.resource_id);
		    	$("#pid").val(data.menu_bak.parent_id);
		    }
		});
 		
 
    $("#btn1").click(function(){
    	//window.opener.disable = true;
		document.getElementById("btn1").disabled =true;
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
	// Add by 陈萧如 bug对应 start
	if(!lengthCheck($("#name").val(),"菜单",64)){
		document.getElementById("btn1").disabled = false; 
     	return false;
   } 
   // Add by 陈萧如 bug对应 end
   
	if(!isNull($("#position").val(),"序号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNumber($("#position").val(),"序号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	// Add by 陈萧如 bug对应 start
	if(!lengthCheck($("#position").val(),"序号",8)){
		document.getElementById("btn1").disabled = false; 
     	return false;
   } 
   // Add by 陈萧如 bug对应 end
   
	if(!isNull($("#desc").val(),"描述信息")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	// Add by 陈萧如 bug对应 start
	if(!lengthCheck($("#desc").val(),"描述信息",128)){
      	document.getElementById("btn1").disabled = false;
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
   // Add by 陈萧如 bug对应 end
   
	
	if(!isNull($("#res").val(),"资源")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!lengthCheck($("#res").val(),"资源",512)){
      	document.getElementById("btn1").disabled = false;
     	return false;
   } 
   
	var postData = $("#form1").serialize();      
	if($("#res").val()==""){
		alert("资源 不能为空");
		return;
	}                                  
   	 
	$.ajax({
		url: webroot+'/platform/menuAC!editMenu.action',
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
  	
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;菜单:</td><td><input type="text" id="name" name="menu_bak.name" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;序号:</td><td><input type="text" id="position" name="menu_bak.position" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;描述信息:</td><td><input type="text" id="desc" name="menu_bak.description" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;页面:</td><td><input type="text" id="url" name="menu_bak.url" label="页面" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;资源:</td><td><input type="text" id="res" name="menu_bak.resource" label="资源" size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><input type="hidden" id="pid" name="menu_bak.parent_id" size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><input type="hidden" id="rid" name="menu_bak.resource_id" size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><input type="hidden" id="menu_id" name="menu_bak.menu_id" size="50%"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

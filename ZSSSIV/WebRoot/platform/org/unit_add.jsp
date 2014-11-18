<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>单位信息添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
    <script type="text/javascript" src="<%=path%>/check.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
    $("#btn1").click(function(){
		document.getElementById("btn1").disabled =true;
		
		$("#hid1").val(parent.getSelectNodeId());
		 postdata();                                        
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 
function postdata(){ 

       if(!isNull($("#name").val(),"单位名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#name").val(),"单位名称",128)){
	  document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug39对应
     return false;
   } 
	if(!isNull($("#xzqh").val(),"行政区划")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	if(!lengthCheck($("#xzqh").val(),"行政区划",128)){
	  document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug39对应
     return false;
   } 
	if(!isNull($("#description").val(),"描述信息")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!lengthCheck($("#description").val(),"描述信息",128)){
	  document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug39对应
     return false;
   } 
	if(!isNull($("#orderid").val(),"排列顺序")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!isNumber($("#orderid").val(),"排列顺序")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	 if(!lengthCheck($("#orderid").val(),"排列顺序",30)){
	  document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug39对应
     return false;
   } 
		
	var postData = $("#form1").serialize();  
	                               
  $.ajax({
		url: webroot+'/platform/unitAC!addUnit.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("添加失败");
		},
		success: function(data){
			document.getElementById("btn1").disabled = false;
			if(data.xzinfo=='1'){
				alert("行政区划不能重复！");
				// Delete by 陈萧如 start bug37对应
				//parent.refreshGrid();
				//parent.refreshNode();
				// Delete by 陈萧如 end
			}else{
			  	alert("添加成功");
				parent.refreshGrid();
				parent.refreshNode();
	        	window.close();
			}
		
			
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
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;单位名称:</td><td><input id="name"  type="text"  name="unit_bak.unit_name" size="50%"/></td></tr>
	  	 <tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;行政区划:</td><td><input id="xzqh"  type="text" name="unit_bak.xzqh" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;描述信息:</td><td><input id="description"  type="text" name="unit_bak.description" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;排列顺序:</td><td><input id="orderid"  type="text" name="unit_bak.orderid" size="50%"/></td></tr>
	   
	  	<tr><td></td><td></td><td><input id="hid1" name="unit_bak.parent_id"  type="hidden"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

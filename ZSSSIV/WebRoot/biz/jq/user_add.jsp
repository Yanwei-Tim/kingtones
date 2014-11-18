<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>人员信息添加</title>
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

    if(!isNull($("#name").val(),"姓名")) {
		document.getElementById("btn1").disabled = false;
	return;
	}
	if(!lengthCheck($("#name").val(),"姓名",128)){
	  document.getElementById("btn1").disabled = false; 
     return false;
   } 
	if(!isNull($("#code").val(),"警员编号")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	if(!lengthCheck($("#code").val(),"警员编号",128)){
	  document.getElementById("btn1").disabled = false; 
     return false;
   } 
	if(!isNull($("#account").val(),"警员账号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!lengthCheck($("#account").val(),"警员账号",128)){
	  document.getElementById("btn1").disabled = false; 
     return false;
   } 
	if(!isNull($("#sort").val(),"排列顺序")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!isNumber($("#status").val(),"通传状态")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNumber($("#sort").val(),"排列顺序")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	 if(!lengthCheck($("#sort").val(),"排列顺序",30)){
	  document.getElementById("btn1").disabled = false; 
     return false;
   } 
		
	var postData = $("#form1").serialize();  
	                               
  $.ajax({
		url: webroot+'/jq/psUserAC!addJqUser.action',
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
				alert("警员编号或警员账号不能重复！");

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
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;警员编号:</td><td><input id="code"  type="text" name="jquser_bak.code" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;姓名:</td><td><input id="name"  type="text"  name="jquser_bak.name" size="50%"/></td></tr>	  	 
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;警员账号:</td><td><input id="account"  type="text" name="jquser_bak.account" size="50%"/></td></tr>
	  	<tr><td></td><td><br><span class="xing">*</span>&nbsp;&nbsp;通传状态<br>(0:关闭,1:接受):</td><td><input id="status"  type="text" name="jquser_bak.status" size="50%"/></td></tr>
	   <tr><td></td><td><br><span class="xing">*</span>&nbsp;&nbsp;排列顺序:</td><td><input id="sort"  type="text" name="jquser_bak.sort" size="50%"/></td></tr>
	   
	  	<tr><td></td><td></td><td><input id="hid1" name="jquser_bak.org_id"  type="hidden"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

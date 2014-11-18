<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>警员调度设置</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
   	<script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
$(document).ready(function(){

	 $("#ids").val(parent.selectItemId); 		
  	$("#btn1").click(function(){
    	postdata();                                              
    });     
    $("#btn2").click(function(){
		window.close();
    });  
 }); 

function postdata(){ 

	var postData = $("#form1").serialize();
    $.ajax({
		url: webroot+'/dw/jwUserDisplayAC!updateDispatchStatus.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("修改失败");
		},
		success: function(data){
		    alert("修改成功");
			document.getElementById("btn1").disabled = false;
			parent.refreshGrid();
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
	  	<tr><td></td>
		  	<td>警员调度状态:</td>
		  	<td>
	  			<select id ="state"  name="jwUserStatus.dispatch" style="width:100%">		    		
         			<option value="1">开启</option>
         			<option value="0">关闭</option>
	    		</select>
		  	</td>
	  	</tr>
	  	<tr><td></td><td></td><td><input  type="hidden" id= "ids" name="jwUserStatus.userid" size="50%"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>
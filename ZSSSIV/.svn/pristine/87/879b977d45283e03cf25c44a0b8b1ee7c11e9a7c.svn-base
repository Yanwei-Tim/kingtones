<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>警务GPS设置</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
   	<script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
$(document).ready(function(){
	
	 $("#xzqh").val(parent.getSelectNodeXzqh());
	 $("#ids").val(parent.selectItemId);
	  $.ajax({
	    	url: webroot+'/xajw/jwGpsConfigAC!queryJwGpsCOnf.action',
	    	data:'ids='+parent.selectItemId,
		    dataType: 'json',
		    error: function(){
		       alert('加载失败');
		    },
		    success: function(data){
		        $("#state").val(data.jwGpsConfig.state);
		        $("#interval").val(data.jwGpsConfig.interval);
		    }
		});
 		
  	$("#btn1").click(function(){
    	postdata();                                              
    });     
    $("#btn2").click(function(){
		window.close();
    });  
 }); 

function postdata(){ 
	if(!isNull($("#state").val(),"状态")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	if(!isNull($("#interval").val(),"发送时间")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	// 时间必须为数字check - Add by 陈萧如 bug19对应
	if(!isNumber($("#interval").val(),"时间")){
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#interval").val(),"时间",30)){
     return false;
    }  
	var postData = $("#form1").serialize();
    $.ajax({
		url: webroot+'/xajw/jwGpsConfigAC!addJwGpsCOnf.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("添加失败");
		},
		success: function(data){
		    alert("保存成功");
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
		  	<td>GPS启动方式:</td>
		  	<td>
	  			<select id ="state"  name="jwGpsConfig.state" style="width:100%">
		    		<option value="0">关闭</option>
         			<option value="1">开启</option>
	    		</select>
		  	</td>
	  	</tr>
	  	<tr><td></td><td>时间:</td><td><input  type="text" id= "interval" name="jwGpsConfig.interval" size="50%"/>秒</td></tr>
	  	<tr><td></td><td></td><td><input  type="hidden" id= "xzqh" name="jwGpsConfig.xzqh" size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><input  type="hidden" id= "ids" name="jwGpsConfig.ids" size="50%"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>
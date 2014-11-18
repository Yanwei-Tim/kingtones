<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>消息发送</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
   	<script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;

 $(document).ready(function(){
	/**
	 
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
 	*/	
  	$("#btn1").click(function(){
    	postdata();                                              
    });     
    $("#btn2").click(function(){
		window.close();
    });  
 }); 

function postdata(){ 
	/**
	
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
    */
	var postData = $("#form1").serialize();
	
    $.ajax({
		url: webroot+'/platform/jwUserPNAC!send.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("发送失败");
		},
		success: function(data){
		    alert("发送成功");
			document.getElementById("btn1").disabled = false;
			parent.refreshGrid();
	        window.close();
	    }
	});       
 }	
     
</script>
 
    
  </head>
  <body>
  	<form id="form1" >
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td>
		  	<td width="20%">发送对象:</td>
		  	<td width="80%">
		  		<input type="radio" name="broadcast" value="Y" checked="checked" />  所有 (Broadcast) 
            	<input type="radio" name="broadcast" value="N" /> 单个 
		  	</td>
	  	</tr>
	  	<tr id="trUsername" style="display:none;"><td></td><td>用户名:</td><td><input  type="text" id= "username" name="username" size="50%"/></td></tr>
	  	<tr><td></td><td>标&nbsp;&nbsp;&nbsp;&nbsp;题:</td><td><input  type="text" id= "title" name="title" value="Dokdo Island" size="50%"/></td></tr>
	  	<tr><td></td><td>消息内容:</td><td><textarea id="message" name="message" style="width:100%;" rows="9"></textarea></td></tr>
	  	<tr><td></td><td>url:</td><td><input type="text" id="uri" name="uri"  size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><span style="font-size:0.8em">ex) http://www.dokdocorea.com, geo:37.24,131.86, tel:111-222-3333</span></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="发送"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
	<script type="text/javascript"> 
//<![CDATA[
 
$(function() {
	$('input[name=broadcast]').click(function() {
		if ($('input[name=broadcast]')[0].checked) {
			$('#trUsername').hide();
		} else {
			$('#trUsername').show();
		}
	});
	
	if ($('input[name=broadcast]')[0].checked) {
		$('#trUsername').hide();
	} else {
		$('#trUsername').show();
	}	
});
 
//]]>
</script>
  </body>
</html>
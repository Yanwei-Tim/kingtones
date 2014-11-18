<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>视频添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
    $("#btn1").click(function(){
    	postdata(); 
    	                                             
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 
function postdata(){ 
   var reg = /^([a-zA-Z]|\d|_)*$/;
   if(!isNull($("#ip").val(),"IP地址")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	// add by 陈萧如 bug对应
	if(!lengthCheck($("#ip").val(),"IP地址",20)){
    	return false;
    } 
    
	if(!isNull($("#port").val(),"端口号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	// add by 陈萧如 bug对应
    if(!isNumber($("#port").val(),"端口")){
		document.getElementById("btn1").disabled = false;
	   	return;
    } 
	if(!lengthCheck($("#port").val(),"端口",10)){
    	return false;
    } 
    
	if(!isNull($("#point").val(),"采集地点")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	// add by 陈萧如 bug对应
	if(!isNumber($("#point").val(),"采集地点")){
		document.getElementById("btn1").disabled = false;
    	return;
    } 
	if(!lengthCheck($("#point").val(),"采集点",10)){
    	return false;
    } 
    
	if(!isNull($("#order_id").val(),"序号")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	// add by 陈萧如 bug对应
	if(!isNumber($("#order_id").val(),"序号")){
		document.getElementById("btn1").disabled = false;
    	return;
    } 
      
	if(!isNull($("#description").val(),"描述信息")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
   // add by 陈萧如 bug对应
    if(!lengthCheck($("#description").val(),"描述信息",50)){
     return false;
   } 
	var postData = $("#form1").serialize();  
	
		                         
   $.ajax({
		url: webroot+'/xajw/jwVideoAC!addJwVideo.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("添加失败");
		},
		success: function(data){
	        document.getElementById("btn1").disabled = false;
			alert("添加成功");
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
	  
	    <tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;IP地址：</td><td><input  type="text" id= "ip" name="jwVideo.ip" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;端口号：</td><td><input  type="text" id= "port" name="jwVideo.port" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;采集地点：</td><td><input  type="text" id= "point" name="jwVideo.point" size="50%"/></td></tr>
	  	<tr><td></td>
		  	<td>&nbsp;&nbsp;&nbsp;&nbsp;是否可用：</td>
		  	<td>
	  			<select id ="jk_state"  name="jwVideo.jk_state" style="width:100%">
		    		<option value="Y">是</option>
         			<option value="N">否</option>
	    		</select>
		  	</td>
	  	</tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;序号：</td><td><input  type="text" id= "order_id" name="jwVideo.order_id" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;描述：</td><td><textarea id= "description" name="jwVideo.description" style="width:100%;" rows="6"></textarea></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

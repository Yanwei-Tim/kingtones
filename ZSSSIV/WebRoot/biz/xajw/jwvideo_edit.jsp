<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>警务视频编辑</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
     	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
<script type="text/javascript">
function len(){
	m=0;
	for(i=0;i<document.getElementById('jk_state').length;i++){
		 if(document.getElementById('jk_state')[i].selected==true){
		 	alert(m);
		 	m++;
		 }
	}
}
var parent=this.dialogArguments;

 $(document).ready(function(){
       $.ajax({
	    	url: webroot+'/xajw/jwVideoAC!queryJwVideoByID.action',
	    	data:'id='+parent.selectItemId,
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('加载失败');
		    },
		    success: function(data){
		    	$("#id").val(data.jwVideo.id);
		        $("#ip").val(data.jwVideo.ip);
		    	$("#port").val(data.jwVideo.port);
		    	$("#point").val(data.jwVideo.point);
		    	if(data.jwVideo.jk_state=="Y"){
		    		$("#jk_state_div").html("<select id=\"jk_state\" name=\"jwVideo.jk_state\" style=\"width:100%\"><option value=\"Y\" selected=\"selected\">是</option><option value=\"N\">否</option>");
		    	}else{
		    		$("#jk_state_div").html("<select id=\"jk_state\" name=\"jwVideo.jk_state\" style=\"width:100%\"><option value=\"Y\" >是</option><option value=\"N\" selected=\"selected\">否</option>");
		    	}
		    	$("#jk_state").val(data.jwVideo.jk_state);
		    	$("#order_id").val(data.jwVideo.order_id);
		    	$("#description").val(data.jwVideo.description);
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
    // add by 陈萧如 bug对应
    if(!lengthCheck($("#description").val(),"描述信息",50)){
     return false;
   } 
	var postData = $("#form1").serialize();      
	                              
     
	$.ajax({
		url: webroot+'/xajw/jwVideoAC!editJwVideo.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("修改失败");
		},
		success: function(data){
			document.getElementById("btn1").disabled = false;
			parent.refreshGrid();
	        window.close();
	    }
	});              
 }


    
</script>
 
    
  </head>
  <body>
  	<br>
  	<form id="form1">
  	<input type="hidden"  id="id" name="jwVideo.id"/>
  	
  	<table border="0" cellspacing="0" cellpadding="0" align="right">
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;IP地址：</td><td><input  type="text" id= "ip" name="jwVideo.ip" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;端口号：</td><td><input  type="text" id= "port" name="jwVideo.port" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;采集地点：</td><td><input  type="text" id= "point" name="jwVideo.point" size="50%"/></td></tr>
	  	<tr><td></td>
		  	<td>&nbsp;&nbsp;&nbsp;&nbsp;是否可用：</td>
		  	<td>
	  			<div id="jk_state_div"></div>
	  			
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

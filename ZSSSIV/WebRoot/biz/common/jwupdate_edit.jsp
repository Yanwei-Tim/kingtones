<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>应用更新修改</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
     	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
<script type="text/javascript">
function len(){
	m=0;
	for(i=0;i<document.getElementById('sex').length;i++){
		 if(document.getElementById('sex')[i].selected==true){
		 	m++;
		 }
	}
}
var parent=this.dialogArguments;

 $(document).ready(function(){
       $.ajax({
	    	url: webroot+'/commonbiz/updateAC!queryJwUpdateById.action',
	    	data:'id='+parent.selectItemId,
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('修改失败');
		    },
		    success: function(data){
		        $("#id").val(data.jwUpdate.id);
		    	$("#name").val(data.jwUpdate.name);
		    	$("#time").val(data.jwUpdate.time);
		    	$("#description").val(data.jwUpdate.description);
		    	$("#version").val(data.jwUpdate.version);
		    	
		    }
		});
 		
  $("#btn1").click(function(){
    	//给隐藏域赋值
    	postdata();                                              
    });     
    $("#btn2").click(function(){
		window.close();
    });   
 }); 
function postdata(){ 
  
 if(!isNull($("#name").val(),"应用名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#name").val(),"应用名称",30)){
     return false;
   } 
    if(!isNull($("#version").val(),"版本号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#version").val(),"应用名称",30)){
     return false;
   } 
	
	if(!isNull($("#description").val(),"描述信息")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!lengthCheck($("#description").val(),"描述信息",100)){
     return false;
   } 
	var postData = $("#form1").serialize();    
	                              
     
	$.ajax({
		url: webroot+'/commonbiz/updateAC!editJwUpdate.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("修改失败");
		},
		success: function(data){
			

			document.getElementById("btn1").disabled = false;
			if(data.xzinfo=='1'){
			
				parent.refreshGrid();
			}else{
				alert("修改成功");
				parent.refreshGrid();
				
	        	window.close();
				}
	    }
	});              
 }


    
</script>
 
    
  </head>
  <body>
  	<br>
  	<form id="form1">
  
  	
  	<table border="0" cellspacing="0" cellpadding="0" align="right">
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	
	  	<tr><td></td><td></td><td><input  type="hidden" id= "id" name="jwUpdate.id" size="50%"/></td></tr>
	  		<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;应用名称：</td><td><input  type="text" id= "name" name="jwUpdate.name" size="50%"/></td></tr>
	  		<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;版本号：</td><td><input  type="text" id= "version" name="jwUpdate.version" size="50%"/></td></tr>
	  		
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;描述信息：</td><td><input  type="text" id= "description" name="jwUpdate.description" size="50%"/></td></tr>
	  	<tr><td>&nbsp;</td><td>&nbsp;</td>
	  		<td align="center">
	  			<input type="button" id="btn1"  value="修 改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  			<input type="button" id="btn2"  value="取 消"/>
	  		</td>
	  		<td>&nbsp;</td>
	  	</tr>
	  	
  	</table>
	</form>  
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>警种添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
    $("#btn1").click(function(){
    	//window.opener.disable = true;
		
		
    	
    	postdata(); 
    	                                             
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 
function postdata(){ 
 var id=$("#id").val();
  var reg = /^([a-zA-Z]|\d|_)*$/;
 if(!isNull($("#id").val(),"警种编号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
    if(!reg.test(id)){
        alert("警种编号只允许为字母，数字或下划线组成");
        return false;
    }
   if(!lengthCheck($("#id").val(),"警种编号",30)){
     return false;
   } 
	
 if(!isNull($("#name").val(),"警种名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#name").val(),"警种名称",30)){
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
		url: webroot+'/xajw/jwUserAC!addJwJz.action',
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
			 alert("警种编号不能重复！");
			}else{
			 alert("添加成功");
			 parent.refreshGrid();
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
	  
	    <tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;警种编号：</td><td><input  type="text" id= "id" name="jwJz.id" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;警种名称：</td><td><input  type="text" id= "name" name="jwJz.name" size="50%"/></td></tr>
	  	
	  	
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;描述信息：</td><td><textarea id= "description" name="jwJz.description" style="width:100%;" rows="9"></textarea></td></tr>
	  	
	  	
	  	

  		
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

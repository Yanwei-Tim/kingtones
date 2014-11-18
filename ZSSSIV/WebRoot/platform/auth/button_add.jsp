<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>按钮添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
 	$("#hid1").val(parent.selectItemId);
     $("#btn1").click(function(){
    	//window.opener.disable = true;
	postdata();    		                                          
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 

	function postdata(){ 
	
	 if(!isNull($("#name").val(),"按钮名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#name").val(),"按钮名称",64)){
     return false;
   } 
	if(!isNull($("#viewID").val(),"按钮显示ID")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#viewID").val(),"按钮显示ID",30)){
     return false;
   } 
	if(!isNull($("#description").val(),"描述信息")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	if(!lengthCheck($("#description").val(),"描述信息",1024)){
     return false;
   }  
	
	var postData = $("#form1").serialize(); 
	 $.ajax({
		url: webroot+'/platform/buttonAC!addButton.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("ID已被注册，请重新填写！");
		},
		success: function(data){
			document.getElementById("btn1").disabled = false;
				parent.refreshGrid();
				parent.refreshNode();
		     	alert("添加成功！");
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
	  
	  	
	  	<tr><td></td><td>按钮名称:</td><td><input id="name" type="text"name="button.button_name" size="40%"/></td></tr>
	  	<tr><td></td><td>按钮页面ID:</td><td><input id="viewID" type="text" name="button.button_view_id" size="50%"/></td></tr>
	  	<tr><td></td><td>描述信息:</td><td><input id="description" type="text" name="button.description" size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><input id="hid1" name="button.menu_id" type="hidden"  size="50%"/></td></tr>
	  	
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

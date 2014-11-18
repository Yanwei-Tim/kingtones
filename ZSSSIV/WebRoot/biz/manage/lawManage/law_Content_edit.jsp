<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>法律法规修改</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
   	
<script type="text/javascript">
//var parent=this.dialogArguments;
var parent= window.opener;//this.dialogArguments;

 $(document).ready(function(){
	 $.ajax({
			url: webroot+'/manage/lawDirectoryAC!findContentbyId.action',
			data:'someid='+document.getElementById("id").value,	
			type: 'POST',
			dataType: 'json',
		    error: function(){
				alert("加载数据失败");
			},
			success: function(data){
			    $("#pname").val(data.lawContent.pName);
		    	$("#content").val(data.lawContent.content);
		    }
		});
	 
    $("#btn1").click(function(){	
    	postdata(); 
    	                                             
    });      
    $("#btn2").click(function(){
    	parent.refreshTree();
		window.close();
    });  
 }); 
 
function postdata(){ 
	 if(!isNull($("#content").val(),"法规内容")) {
			document.getElementById("btn1").disabled = false;
			return;
		} 	 	
	
	var postData = $("#form1").serialize();  
                         
   $.ajax({
		url: webroot+'/manage/lawDirectoryAC!updateContent.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("修改失败");
		},
		success: function(data){		    
			 alert("修改成功！")
			// parent.refreshGrid();
			 parent.zTreeOnClick();
			 
			
		     window.close();
		    			
	    }
	});       
 }	
  
</script>
 
    
  </head>
  <body style="background-color:silver"><center>
  <%
  	String pid = request.getParameter("pid"); 
    request.setAttribute("pid1",pid);  
  %>
  	<form id="form1">
  	<br>
  	<table border="1" cellpadding="5" cellspacing="0" bordercolor="gray">
	  	
	    <input type="hidden" id="id" name="lawContent.directoryId" value="${pid1}"/>
	    <tr><td align="center">目录为：<input type="text" id="pname" size="50%" disabled /></td></tr>
	    <tr><td align="center">法律法规目录内容</td></tr>
	  	<tr><td><textarea name="lawContent.content" id="content" cols="95" rows="38"></textarea></td></tr>

	  	<tr>
	  		<td align="center"><input type="button" id="btn1"  value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
  	
	</form>  
  </center></body>
</html>

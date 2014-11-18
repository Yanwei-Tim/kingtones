<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>法律法规目录添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
   	
<script type="text/javascript">
//var parent=this.dialogArguments;
var parent= window.opener;//this.dialogArguments;


var tel=/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
var mobile=/^((\(\d{2,3}\))|(\d{3}\-))?(13|15|18)\d{9}$/;

var mail=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
 $(document).ready(function(){
	 if(document.getElementById("id").value==0){
		 $("#pname").val("--最顶目录--");
	}else{
		$.ajax({
			url: webroot+'/manage/lawDirectoryAC!findDirectorybyId.action',
			data:'someid='+document.getElementById("id").value,	
			type: 'POST',
			dataType: 'json',
		    error: function(){
				alert("加载数据失败");
			},
			success: function(data){
				    $("#pname").val(data.lawDirectory.name);
		    }
		});
	}
	 
    $("#btn1").click(function(){	
    	postdata(); 
    	                                             
    });      
    $("#btn2").click(function(){
    	parent.refreshTree();
		window.close();
    });  
 }); 
function postdata(){ 

	
 if(!isNull($("#LAW_CODE").val(),"法规代码")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
  if(!lengthCheck($("#LAW_CODE").val(),"法规代码",50)){
     return false;
   }
	if(!isNull($("#LAW_NAME").val(),"法规名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
  if(!lengthCheck($("#LAW_NAME").val(),"法规名称",50)){
     return false;
   }   	
	
	var postData = $("#form1").serialize();  
                         
   $.ajax({
		url: webroot+'/manage/lawDirectoryAC!addLawDirectory.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("添加失败");
		},
		success: function(data){		    
			 alert("添加成功！")
			// parent.refreshGrid();
			 parent.refreshTree()
		     window.close();
		    			
	    }
	});       
 }	
  
</script>
 
    
  </head>
  <body><center>
  <%
  	String pid = request.getParameter("pid"); 
    request.setAttribute("pid1",pid);  
  %>
  	<form id="form1">
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	
	    <input type="hidden" id="id" name="lawDirectory.parentId" value="${pid1=='null'?0:pid1}"/>
	    <tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;上级目录为：</td><td><input type="text" id="pname" size="50%" disabled /></td></tr>
	    <tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;法律法规目录名称：</td><td><input  type="text" id="LAW_NAME" name="lawDirectory.name" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;法律法规目录代码：</td><td><input  type="text" id="LAW_CODE" name="lawDirectory.code" size="50%" maxlength="10"/></td></tr>
	  	
	  	

	  	
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
  	
	</form>  
  </center></body>
</html>

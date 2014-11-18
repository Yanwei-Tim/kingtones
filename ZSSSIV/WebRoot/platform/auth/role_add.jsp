<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
    <title>角色添加</title>
     <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
    $("#btn1").click(function(){
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 

function postdata(){ 
    if(!isNull($("#role_name").val(),"角色名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#description").val(),"角色描述")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	var postData = $("#form1").serialize();                                    
   $.ajax({
		url: webroot+'/platform/roleAC!addRole.action',
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
				parent.refreshTree();
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
	  
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;角色名称：</td><td><input id="role_name" type="text" name="role_bak.role_name" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;角色描述：</td><td><input id="description" type="text" name="role_bak.description" size="50%"/></td></tr>
	  	
	  
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="确定"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
  
 
  
  
</html>

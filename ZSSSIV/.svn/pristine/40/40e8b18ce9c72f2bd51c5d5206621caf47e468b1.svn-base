<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户信息导入页面</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>

 
    
  </head>
  <body>
  	<form id="form1" action="<%=path%>/jq/psUserAC!importExcel.action"  method="post" enctype="multipart/form-data">
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  
	  
	  	
	  	<tr><td></td><td>选择文件：</td><td><input type="file"   id="test" name="test" size="40%" ></td></tr>
	  		  
	  	
	

  		
	  	<tr><td></td><td></td>
	  		<td align="center"><input  type="submit" id="btn1"  value="导入"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2" onClick="clo()"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

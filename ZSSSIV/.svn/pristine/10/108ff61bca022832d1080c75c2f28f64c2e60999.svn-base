<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String bizId = request.getParameter("bizId");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>业务组件列表页面</title>
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
	<script type="text/javascript" src="<%=path%>/config.js"></script>
	<script type="text/javascript">
	var bizId = '<%=bizId%>';
	</script>
	<style>
		body
			{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			}
		.flexigrid div.fbutton .select
			{
				background: url(<%=path%>/flexgrid/css/images/down.gif) no-repeat center left;
			}
		.flexigrid div.fbutton .add
			{
				background: url(<%=path%>/flexgrid/css/images/new.gif) no-repeat center left;
			}
		.flexigrid div.fbutton .edit
			{
				background: url(<%=path%>/flexgrid/css/images/edit.gif) no-repeat center left;
			}
		.flexigrid div.fbutton .relate
			{
				background: url(<%=path%>/flexgrid/css/images/relate.gif) no-repeat center left;
			}	
		.flexigrid div.fbutton .delete
			{
				background: url(<%=path%>/flexgrid/css/images/delete.gif) no-repeat center left;
			}
	</style>
	
  </head>
  
  <body>
  		<table>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td><table id="flex1" style="display:none"></table></td>
  			</tr>
  		<table>
  		
		<script type="text/javascript" src="<%=path%>/biz/service/busiconfres_mgr.js"></script>
  </body>
</html>

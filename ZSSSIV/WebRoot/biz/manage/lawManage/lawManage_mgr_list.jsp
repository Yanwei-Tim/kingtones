<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>法律法规列表</title>
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
	
	<link rel="stylesheet" href="<%=path%>/ztree/demo/demoStyle/demo.css" type="text/css">
  	<link rel="stylesheet" href="<%=path%>/ztree/demo/zTreeStyle/zTreeStyle.css" type="text/css">
  	<script type="text/javascript" src="<%=path%>/ztree/demo/jquery-ztree-2.5.js"></script>
  	<script type="text/javascript" src="<%=path%>/config.js"></script>
  	
	
	<style>
		body
			{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			}
		.flexigrid div.fbutton .add
			{
				background: url(<%=path%>/flexgrid/css/images/add.png) no-repeat center left;
			}	
		.flexigrid div.fbutton .delete
			{
				background: url(<%=path%>/flexgrid/css/images/close.png) no-repeat center left;
			}	
	</style>
	
  </head>
  
  <body>
  	<table width="100%">
  		<tr height="5%">
  			<td><span style="color:#000000; font-weight:bolder;">管理功能&gt;&gt;法律法规管理</span></td>
  		</tr>
  		<tr height="95%" >
  			<%--<td width="15%">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="color: #000000; font-weight: bolder;">单位选择</span>
						</td>
					</tr>
				</table>

  				<table cellpadding="1" cellspacing="1" border="1px">
  					<tr>
  						<td>
  							<ul id="treeDemo" class="tree"></ul>
  						</td>
  					</tr>
  				</table>
  				<table height="100%"></table>
			</td>
										
  			--%><td >
  				<table cellpadding="0" cellspacing="0" width="800px">
					<tr height="23px">
						<td class="rtitletdM"  align="left">
							<span style="color: #000000; font-weight: bolder;">法律法规列表</span>
						</td>
					</tr>
				</table>
  				<table id="flex1" style="display:none"></table>
  				<table height="100%"></table>
  			</td>
  		</tr>
  	</table>
<script type="text/javascript" src="<%=path%>/biz/manage/lawManage/lawManage_mgr_list.js"></script>
  </body>
</html>

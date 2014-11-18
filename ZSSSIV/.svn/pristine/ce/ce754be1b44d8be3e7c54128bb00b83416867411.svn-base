<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户选择树</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<link rel="stylesheet" href="<%=path%>/ztree/demo/demoStyle/demo.css" type="text/css">
  	<link rel="stylesheet" href="<%=path%>/ztree/demo/zTreeStyle/zTreeStyle.css" type="text/css">
  	
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
  	<script type="text/javascript" src="<%=path%>/ztree/demo_2.6/jquery.ztree-2.6.js"></script>
  	<script type="text/javascript" src="<%=path%>/config.js"></script>
  </head>
  
  <body>
    <table width="200" height="131">
  		<tr width="10%">
  			<td>
  				<table cellpadding="0" cellspacing="0" border="1px" width="100%">
					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="color: #B96F26; font-weight: bolder;">用户选择树</span>
						</td>
					</tr>
				</table>
  				<table border="1px"><tr><td><ul id="unittree" class="tree"></ul></td></tr></table>
  			</td>
  		</tr>
  		
  		<tr>
  			<td align="right">
  				<input type="button" id="btn1"    value="确定" onclick="_btnSubmit();"/>
  				<input type="button" id="btn2"   value="取消" onclick="javascript:window.close()"/>
  			</td>
  		</tr>
  	</table>
  </body>
  <script type="text/javascript" src="<%=path%>/biz/common/select_oneuser_tree.js"></script>
</html>

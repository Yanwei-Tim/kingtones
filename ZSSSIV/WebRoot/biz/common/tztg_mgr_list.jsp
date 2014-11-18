<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>通知通告列表</title>
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
	<script type="text/javascript" src="<%=path%>/config.js"></script>
	<link rel="stylesheet" href="<%=path%>/ztree/demo/demoStyle/demo.css" type="text/css"/>
  	<link rel="stylesheet" href="<%=path%>/ztree/demo/zTreeStyle/zTreeStyle.css" type="text/css"/>
  	<script type="text/javascript" src="<%=path%>/ztree/demo/jquery-ztree-2.5.js"></script>
  	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
  	<script type="text/javascript" src="<%=path%>/common.js"></script>
  	<script type="text/javascript" src="<%=path%>/check.js"></script>
  	<script type="text/javascript" src="<%=path%>/datetime.js"></script> 
  	
  	
<!--script type="text/javascript"  for= "document" event= "onkeydown"-->
<script type="text/javascript">
 	$(document).ready(function(){
 		getCodeList("noticetype","type");
 		getCodeList("sendstatus","sendStatus");
 		
 		$("#btn1").click(function(){
	    	
			if(getSelectNode())
	    		$("#sendDeptid").val(getSelectNode().id);
    		refreshGrid2();
    	});
 }); 
</script>
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
  			<td><span style="font-weight:bolder;">通知通告&gt;&gt;通知通告</span></td>
  		</tr>
  		<tr height="95%" >
  			<td width="15%">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="font-weight: bolder;">单位选择</span>
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
  			<td>
  				<table width="850px">
  					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style=" font-weight: bolder;">通知列表</span>
						</td>
					</tr>
				</table>
  				<table id="flex1" style="display:none"></table>
  				<table width="850px">
					<tr height="23px">
						<td>
						<form id="form2">
							<input id="sendDeptid"  type="hidden"  name="tztg.sendDeptid" size="10px"/>
							<table border="0pk">
							  	<tr>
							  		<td>类型:</td>
							  		<td>
							  			<div id="noticetype_div"></div>
								  		<!--select id="type" name="tztg.type">
								  			<option value="-1">全部</option>
								    		<option value="1">协查通报</option>
						         			<option value="2">通知通告</option>
						         			<option value="3">会议通知</option>
							    		</select-->
							 	 	</td>
							  		<td>发送状态:</td>
							  		<td>
							  			<div id="sendstatus_div"></div>
							  			<!--select id="sendStatus" name="tztg.sendStatus">
							  				<option value="-1">全部</option>
								    		<option value="0">未发送</option>
						         			<option value="1">已发送</option>
							    		</select-->	
							  		</td>
							  		<td>日期段:</td>
							  		<td><div><input id="startdate"  type="text"  name="tztg.startdate" size="10px" onClick="SelectDate(this,'yyyy-MM-dd',0,0)" readonly/></div></td>
							  		<td>-</td>
							  		<td><div><input id="enddate"  type="text"  name="tztg.enddate" size="10px" onClick="SelectDate(this,'yyyy-MM-dd',0,0)" readonly/></div></td>
							  		<td><input type="button" id="btn1"  value="查 询" onkeydown="KeyDown()"/></td>
							  	</tr>
						  	</table>
						  	</form>
						</td>
					</tr>
				</table>
  			</td>
  		</tr>
  	</table>
<script type="text/javascript" src="<%=path%>/biz/common/tztg_mgr_list.js"></script>
  </body>
</html>

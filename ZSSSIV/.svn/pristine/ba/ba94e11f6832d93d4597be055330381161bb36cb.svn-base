<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>人员列表</title>
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/mydatepicker/WdatePicker.js"></script>
	
	<link rel="stylesheet" href="<%=path%>/ztree/demo/demoStyle/demo.css" type="text/css"/>
  	<link rel="stylesheet" href="<%=path%>/ztree/demo/zTreeStyle/zTreeStyle.css" type="text/css"/>
  	<script type="text/javascript" src="<%=path%>/ztree/demo/jquery-ztree-2.5.js"></script>
  	<script type="text/javascript" src="<%=path%>/config.js"></script>
  	<script type="text/javascript" src="<%=path%>/datetime.js"></script> 
	
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
		.but1{font-size:13px;color: #FFFFFF;font-weight:bold;background-color: #778899}
	</style>
	
  </head>
  
  <body>
  	<table width="100%">
  		
  		<tr height="100%" >
  			<td width="15%">
				<table cellpadding="0" cellspacing="0" width="100%">
				<tr >
  					<td ><span style="color:#000000; font-weight:bolder;">警情管理&gt;&gt;机构处警统计</span></td>
  				</tr>
				<tr height="23px">
					<td class="rtitletdM" valign="bottom" align="left">
						<span style="color: #000000; font-weight: bolder;">机构选择</span>
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
  			
			</td>
										
  			<td >
				<table cellpadding="0" cellspacing="0" width="800px">
					<tr height="25px" >
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="color: #000000; font-weight: bolder;">统计机构列表</span>
						</td>
					</tr>
					<tr height="23px">
						<td class="rtitletdM"  align="left">
				<span style="float:right;color: #000000; font-weight: bolder;">
			统计起始日期:<input id="d12" type="text" size="8" onClick="SelectDate(this,'yyyy-MM-dd',0,0)" readonly/>
	 				
	  		结束日期:<input id="d13" type="text" size="8" onClick="SelectDate(this,'yyyy-MM-dd',0,0)" readonly/>
	 				
	  				<input class="but1" type="button" onclick="f1()" id="time1" value="统计"/>
	  			</span>
						</td>
					</tr>
				</table>
  			
  				<table id="flex1" style="display:none"></table>  				
  				<table height="100%"></table>
  			</td>
  		</tr>
  	</table>
<script type="text/javascript" src="<%=path%>/biz/jq/unit_count_list.js"></script>
<script type="text/javascript">
	function f2(){//添加处警信息测试
		
		window.location=webroot+'/jq/psUCAC!addJqDispatch.action'
	}
 function f1(){	 
	 var d12=document.getElementById("d12").value;
	 var d13=document.getElementById("d13").value;
	 if(d12>d13){
		 alert("起始日期不能大于结束日期！");
	 }else{
		 if(d12!=""){		
			 if(d13==""){
				 alert("请输入结束日期！");
			 }else{			 	
				 $("#flex1").flexOptions({params: [{ name:'treeNodeID', value:getSelectNodeId()},{ name:'stime',value:d12},{ name:'etime',value:d13}]}).flexReload();	 
			 }		 
		 }else{
			 alert("请输入起始日期！");
		 }
	 }
	
 }
</script>
  </body>
</html>

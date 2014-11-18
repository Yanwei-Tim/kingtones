<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setAttribute("guide_start",true);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>配置管理向导</title>
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
	<script type="text/javascript" src="<%=path%>/config.js"></script>
	<script type="text/javascript" src="<%=path%>/common.js"></script>
	<script type="text/javascript">
</script>
<script type="text/javascript">
var parent=this.dialogArguments;
var guide_start=true;
var guide_end=false;
 $(document).ready(function(){
    $("#btn1").click(function(){
		url=webroot+"/biz/service/imageinfo_add.jsp?guide_start=true";
        window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes'); 
        //window.open (url, 'newwindow', 'height=400, width=400, top=230,left=300, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');                                             
    }); 
 });  
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
  				<td>进入配置向导页面:</td>
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第一步：先进行模块<A HREF="<%=path%>/biz/service/imageinfo_mgr.jsp"><font size="3" face="华文彩云" color="red">图片维护</font></A>。</td>  				
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第二步：进行该模块业务基础数据维护(比如需要获取用户数据库中单位表数据，然后在终端下拉框中展示。注意：该维护数据会在“字段映射”编辑页面中的“资源id”调用。)，即<A HREF="<%=path%>/biz/service/codetype_mgr.jsp"><font size="3" face="华文彩云" color="red">业务代码表</font></A>。</td>
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第三步：如果配置管理平台基础数据需要维护，则进入<A HREF="<%=path%>/biz/service/code_mgr.jsp"><font size="3" face="华文彩云" color="red">系统代码表</font></A>进行操作。比如业务维护编辑页面中的业务类型不够用，可在此进行添加。</td>
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第四步：开始终端模块的配置工作，进入<A HREF="<%=path%>/biz/service/business_mgr.jsp"><font size="3" face="华文彩云" color="red">业务维护</font></A>页面。</td>
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp
  		<table>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>终端模块配置:</td>
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第4.1步：建立模块基础信息，即在<A HREF="<%=path%>/biz/service/business_mgr.jsp"><font size="3" face="华文彩云" color="red">增加</font></A>功能中进行。</td>  				 			
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第4.2步：如果该模块需建选项卡，则进入<A HREF="<%=path%>/biz/service/business_mgr.jsp"><font size="3" face="华文彩云" color="red">选项卡</font></A>功能中进行。</td>  				 			
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第4.3步：为显示模块中具体数据，比如查询、列表，详细等页面中每条项目。此时需做其准备工作。即建立<A HREF="<%=path%>/biz/service/business_mgr.jsp"><font size="3" face="华文彩云" color="red">字段映射</font></A>。</td>  				 			
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第4.4步：为显示模块中的查询条件，需在<A HREF="<%=path%>/biz/service/business_mgr.jsp"><font size="3" face="华文彩云" color="red">关联组件</font></A>中建立每个查询条件。</td>  				 			
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第4.5步：为显示模块中列表页面和详细页面的显示内容，需在<A HREF="<%=path%>/biz/service/business_mgr.jsp"><font size="3" face="华文彩云" color="red">显示过滤,SQL,验证说明</font></A>或<A HREF="<%=path%>/biz/service/business_mgr.jsp"><font size="3" face="华文彩云" color="red">修改</font></A>中进行操作。</td>  				 			
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第4.6步：该模块有关联业务时，此时进入<A HREF="<%=path%>/biz/service/business_mgr.jsp"><font size="3" face="华文彩云" color="red">关联业务</font></A>中进行操作。</td>  				 			
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第4.7步：为显示该模块查询出的详细页面，还需在<A HREF="<%=path%>/biz/service/codetype_mgr.jsp"><font size="3" face="华文彩云" color="red">业务代码表</font></A>中进行配置其ID为“业务维护”模块中增加后生成的ID（具体见操作手册）。</td>  				 			
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第4.8步：终端模块配置后，进入<A HREF="<%=path%>/biz/xajw/jwrole_mgr_list.jsp"><font size="3" face="华文彩云" color="red">警务角色管理</font></A>进行权限分配。</td>  				 			
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp第4.9步：配置完以上所有配置项后，重启服务器TOMCAT服务。</td>  				 			
  			</tr>
  		</table>
  			
  				</td>
  			</tr>
  		</table>
  		<table>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>注意:</td>
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td>&nbsp &nbsp &nbsp &nbsp在不熟悉配置管理操作时，请在熟悉需求的情况下严格按照上述步骤进行操作。具体操作有不清楚的地方，请根据操作手册进行。此向导只用于引领操作。</td>  				
  			</tr>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td><input type="button" id="btn1"  value="开始根据向导进行操作"/></td>
  			</tr>
  	<table>
  </body>
</html>

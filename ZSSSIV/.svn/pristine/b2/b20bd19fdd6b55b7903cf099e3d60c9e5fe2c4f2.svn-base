<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>组织单元管理</title>
		<link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/platform/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/platform/images/js/Menu.js"></script>
		<script type="text/javascript" src="<%=path%>/platform/js/JScript.js"></script>
		<script type="text/javascript" src="<%=path%>/platform/js/commonPage.js"></script>

		<script type="text/javascript">
		$(document).ready(function(){
	   		//更底层的ajax()函数
	   		$.ajax({
		    	url: 'platform/unitAC!showUnitList.action',
		    	type: 'POST',
			    dataType: 'json',
			    timeout: 1000,
			    error: function(){
			        alert('Error loading XML document');
			    },
			    success: function(data){
			    	printHtml(data);
			    }
			});
		});
		
		function printHtml(data){
			unitList=data.unitList;
			    	var html = "";
				    $("#data").empty();
			    	html+="<tr class='rtr_bg2'>";
					html+="<td align='center' width='7%'><strong>编号</strong></td>";
					html+="<td align='left' width='20%'><strong>单位全称</strong></td>";
					html+="<td align='left' width='20%'><strong>单位简称</strong></td>";
					html+="<td align='left' width='20%'><strong>所属单位</strong></td>";
					html+="<td align='center' width='6%'><strong>状态</strong></td>";
					html+="<td align='center' width='15%'><strong>操 作</strong></td>";
					html+="</tr>";
			       	$.each(data.unitList,function(n,unit){
			       		html+="<tr onmouseover='highlightTr(this);' onmouseout='highlightTr(this);'>";
				       		html+="<td id='id' align='center' width='7%'>"+unit.id+"</td>";
							html+="<td id='unitName' align='left' width='20%'>"+unit.unitName+"</td>";
							html+="<td id='parentId' align='left' width='20%'>"+unit.parentId+"</td>";
							html+="<td id='description' align='left' width='20%'>"+unit.description+"</td>";
							html+="<td align='center' width='6%'>1</td>";
							html+="<td align='center' width='15%'>";
							html+="	<a href='javascript:unit_edit("+unit.id+")'> <img alt='浏览' border='0' src='<%=path%>/platform/images/address/look.gif' /> </a>&nbsp;";
							html+="	<a href=''> <img alt='禁用' border='0' src='<%=path%>/platform/images/role/stop.gif' /> </a>&nbsp;";
							html+="	<a href=''> <img alt='启用' border='0' src='<%=path%>/platform/images/role/normal.gif' /> </a>&nbsp;";
							html+="	<a href=''> <img alt='编辑' border='0' src='<%=path%>/platform/images/role/edit.gif' /> </a>&nbsp;";
							html+="	<a href=''> <img alt='删除' border='0' src='<%=path%>/platform/images/role/del.gif' /> </a>&nbsp;";
							html+="</td>";
						html+="</tr>";	
			       	});
			       	$("#data").html(html);
		}
		function unit_edit(unitID){
			alert (unitID);
		};
		
		function page_update(){
			
		}
		</script>
	</head>




	<body style="margin-top: 0;">
		<!-- 页面标题 及 按钮区域 -->
		<div id="div_top" style="height: auto;">
			<table style="width: 100%;">
				<tr>
					<td class="pagedh">
						<span style="color: #B96F26; font-weight: bolder;">机构管理&gt;&gt;单位维护</span>
					</td>
					<td colspan="3" align="right" style="height: 22px">
						<input id="btn_add" type="button" class="btn2k3" onclick=""
							title="新建单位" value="新建" />
					</td>
				</tr>
			</table>
		</div>
		<!-- 数据展现区 -->
		<TABLE width="100%" align="left" cellpadding="0" cellspacing="0">
			<TR>
				<!-- 组织机构树 -->
				<TD valign="top" width="185">
					<iframe src="" width="180" height="480" scrolling="auto" frameborder="0">
					</iframe>
				</TD>
				<!-- 数据展现区 -->
				<TD valign="top">
				<div id="div_data">
						<form name="resultList" id="resultList" action="platform/unitAC!showUnitList.action">
							<!-- 数据列表 -->
							<table width="100%" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<!-- 表头 -->
										<table id="top" width="100%" align="center" cellpadding="0"
											cellspacing="0">
											<tr style="height: 23px">
												<td class="rtitletdL"></td>
												<td class="rtitletdM" valign="bottom" align="left">
													<span style="color: #B96F26; font-weight: bolder;">单位列表</span>
												</td>
											</tr>
										</table>
										<!-- 数据列表 -->
										<table id="data" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class='datatable'>
											<tr class="rtr_bg2">
												<td align="center" width="7%">
													<strong>编号</strong>
												</td>
												<td align="left" width="20%">
													<strong>单位全称</strong>
												</td>
												<td align="left" width="20%">
													<strong>单位简称</strong>
												</td>
												<td align="left" width="20%">
													<strong>所属单位</strong>
												</td>
												<td align="center" width="6%">
													<strong>状态</strong>
												</td>
												<td align="center" width="15%">
													<strong>操 作</strong>
												</td>
											</tr>
											<tr id="datalist" onmouseover="highlightTr(this);"
												onmouseout="highlightTr(this);">
												<td id="id" align="center" width="7%">
												</td>
												<td id="unitName" align="left" width="20%">
												</td>
												<td id="parentId" align="left" width="20%">
												</td>
												<td align="left" width="20%">
												</td>
												<td align="center" width="6%">
												</td>
												<td align='center' width="15%">
													<a href=""> <img alt="浏览" border="0" src="<%=path%>/platform/images/address/look.gif" /> </a>&nbsp;
													<a href=""> <img alt="禁用" border="0" src="<%=path%>/platform/images/role/stop.gif" /> </a>&nbsp;
													<a href=""> <img alt="启用" border="0" src="<%=path%>/platform/images/role/normal.gif" /> </a>&nbsp;
													<a href=""> <img alt="编辑" border="0" src="<%=path%>/platform/images/role/edit.gif" /> </a>&nbsp;
													<a href=""> <img alt="删除" border="0" src="<%=path%>/platform/images/role/del.gif" /> </a>&nbsp;
												</td>
											</tr>
										</table>
										<!-- 列表底帘 -->
										<table id="bottom" align="center" width="100%" class="rbottom">
											<tr>
												<td align="left">
													&nbsp;
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<!-- 翻页工具条 -->
							<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td align="left" width="35%">
										<span id="lblPages"
											style="color: background; font-size: 10pt;">共 <font
											color='#C04000'><s:property value="deptid" />
										</font>条记录 第<font color='#C04000'><s:property value="deptid" />
										</font>页/共<font color='#C04000'><s:property value="deptid" />
										</font>页 </span>
									</td>
									<td valign="bottom" align="right" nowrap="nowrap" class="small1" style="width: 65%;">
										<a href="javascript:gotoPage('resultList','1');">首页</a>
										<a href="javascript:gotoPage('resultList','0');">上一页</a>
										<a href="javascript:gotoPage('resultList','0');">下一页</a>
										<a href="javascript:gotoPage('resultList','0');">末页</a>
										<span style="width: 20px;"></span>&nbsp;&nbsp;
											<input name="gotopage_num" id="gotopage_num" maxlength="4" size="4" Style="width: 25px;" value="#" />
										<a href="javascript:gotoPage('resultList','0');">页</a>
										<input id="btn_goto" type="button" class="btn2k3" onclick="" title="翻页" value="转到" />
									</td>
								</tr>
							</table>
						<form>
				</div>
				</TD>
			</TR>
		</TABLE>
	</body>
</html>

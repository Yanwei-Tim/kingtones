<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>TAB页信息编辑</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
 
 		$.ajax({
		url: webroot+'/biz/serviceAC!queryTabInfoById.action',
		data:'tabInfoId='+parent.selectItemId,
		type: 'POST',
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			$("#tab_name").val(data.tabInfo.tab_name);
			$("#b_id").val(data.tabInfo.b_id);
			$("#tab_id").val(data.tabInfo.tab_id);
	    }
	});
 
    $("#btn1").click(function(){
    	//window.opener.disable = true;
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 
function postdata(){ 

	if(!isNull($("#tab_id").val(),"选项卡编号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	/*
	if(!isNumber($("#tab_id").val(),"选项卡编号")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#b_id").val(),"业务ID")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/
	if(!isNull($("#tab_name").val(),"选项卡标题")) {
		document.getElementById("btn1").disabled = false;
		return;
	}

	var postData = $("#form1").serialize();                                    
   	$.post(webroot+'/biz/serviceAC!updateTabInfo.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     //window.opner.refreshGrid();
		     parent.refreshGrid();
		     window.close();
	}, 'json');    
 }

</script>
  </head>
  <body>
  	<form id="form1">
  	<input type="hidden" id="b_id" name="tabInfo.b_id"/>
  	<!-- input type="hidden" id="tab_id" name="tabInfo.tab_id"/-->
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td>选项卡编号</td><td><input readonly type="text" id="tab_id" name="tabInfo.tab_id" size="50%" maxlength="30"/></td></tr>
	  	<!-- <tr><td></td><td>业务id</td><td><input disabled type="text" id="b_id" name=tabInfo.b_id size="50%" maxlength="10"/></td></tr> -->
	  	<tr><td></td><td>选项卡标题</td><td><input type="text" id="tab_name" name="tabInfo.tab_name" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

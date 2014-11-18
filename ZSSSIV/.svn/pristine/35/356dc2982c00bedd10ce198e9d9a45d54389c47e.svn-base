<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>通知添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
     <script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
     <script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
	
	getCodeList("noticetype","type","tztg.type","100");
 
  $("#btn1").click(function(){
  document.getElementById("btn1").disabled =true;
    	//给隐藏域赋值
    	sendsave("send");                                              
    });     
    $("#btn2").click(function(){
    document.getElementById("btn1").disabled =true;
		sendsave("save");
    }); 
    $("#btn3").click(function(){
		window.close();
    });   
 }); 
function sendsave(optype){ 
    
  if(!isNull($("#title").val(),"标题")) {
		document.getElementById("btn1").disabled = false;
		return;
	}

	// Add by 陈萧如 bug对应
   if(!lengthCheck($("#title").val(),"标题",100)){
	  document.getElementById("btn1").disabled = false; 
     return;
   } 
	
	if(!selectCheck($("#type").val(),"类型")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#content").val(),"内容")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	
	// Add by 陈萧如 bug对应 
	if(!lengthCheck($("#content").val(),"内容",2000)){
	  document.getElementById("btn1").disabled = false;
     return;
   } 

	var postData = $("#form1").serialize();  
	   
	                                
	$.ajax({
		url: webroot+'/commonbiz/tztgAC!addNotice.action?optype='+optype,
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("增加失败");
		},
		success: function(data){
			document.getElementById("btn1").disabled = false;
				parent.refreshGrid();
	        	window.close();
			
	    }
	});              
 }

function openDeptTree(url){
		window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
	}
	
	
function setUnitID(reqDeptId){
	$("#reqDeptId").val(reqDeptId);
}
function setUserID(reqdevice_id){
	$("#reqdevice_id").val(reqdevice_id);
}

function setUnitName(reqDeptName){
	$("#reqDeptName").val(reqDeptName);
}
function setUserName(requsername){
	$("#requsername").val(requsername);
}
	
</script>
    
  </head>
  <body>
  
  	<form id="form1">
  	
  	<table border="0">
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;标题：</td><td><input type="text"  id="title" name="tztg.title" size="50%"/></tr>
	  	<tr><td></td>
		  	<td>&nbsp;&nbsp;&nbsp;&nbsp;类型：</td>
		  	<td>
		  		<div id="noticetype_div"></div>
		  		<!--select id="type" name="tztg.type" style="width:100%">
		    		<option value="1">协查通报</option>
         			<option value="2">通知通告</option>
         			<option value="3">会议通知</option>
	    		</select-->
		  	</td>
	  	</tr>
	  	<tr><td></td><td></td><td><input type="hidden"  id="reqDeptId" name="tztg.reqDeptId" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;单位：</td><td><input type="text" id="reqDeptName" name="tztg.reqDeptName" size="50%"  onclick="openDeptTree('<%=path%>/biz/common/tztg_unit_tree.jsp')" readonly/></td></tr>
	  	<tr><td></td><td></td><td><input type="hidden"  id="reqdevice_id" name="tztg.reqdevice_id" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;人员：</td><td><input type="text" id="requsername" name="tztg.requsername" size="50%" onclick="openDeptTree('<%=path%>/biz/common/tztg_user_tree.jsp')" readonly/></td></tr>
	  
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;内容：</td><td><textarea id="content" name="tztg.content" style="width:100%;" rows="9"></textarea></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center">
	  		<input type="button" id="btn1"  value="发 送"/>&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="保 存"/>&nbsp;&nbsp;
	  		<input type="button" id="btn3"  value="取 消"/></td>
	  	</tr>
	  	
  	</table>
	</form>  
		
  </body>
</html>

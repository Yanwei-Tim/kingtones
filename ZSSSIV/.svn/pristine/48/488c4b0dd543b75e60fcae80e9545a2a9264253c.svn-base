<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>通知编辑</title>
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
       $.ajax({
	    	url: webroot+'/commonbiz/tztgAC!queryNoticeByID.action',
	    	data:'id='+parent.selectItemId,
	    	type: 'POST',
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		       if(data.tztg.sendStatus=='1'){
			  alert("通知已发送不能修改！")
			  parent.refreshGrid();
	        	window.close();
			}else{
				
		    	$("#id").val(data.tztg.id);
		    	$("#title").val(data.tztg.title);
		    	$("#type").val(data.tztg.type);
		    	$("#content").val(data.tztg.content);
		    	$("#sendStatus").val(data.tztg.sendStatus);
		    	$("#reqDeptId").val(data.tztg.reqDeptId);
		    	$("#reqDeptName").val(data.tztg.reqDeptName);
		    	$("#reqdevice_id").val(data.tztg.reqdevice_id);
		    	$("#requsername").val(data.tztg.requsername);
		    	$("#uploadFileName").val(data.tztg.uploadFileName);
		    	
		    	}
		    }
		});
 
 
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
    	parent.refreshGrid();
		window.close();
    });   
    $("#btn4").click(function(){
    	url=webroot+"/biz/common/tztg_upload.jsp"
           window.open(url,'opendialog','width=460,height=410,top=230,left=300');
    });
 }); 
 
 function downloadFile(){
 	var fileName = $("#uploadFileName").val();
 	if(fileName == null||fileName ==""){
 		document.getElementById("btn1").disabled = false;
 		alert("下载文件为空！");
		return;
 	}
 	var checkurl=encodeURI(webroot+'/commonbiz/tztgAC!checkFile.action?uploadFileName='+fileName);
	checkurl=encodeURI(checkurl);
	
	var downurl=encodeURI(webroot+'/commonbiz/tztgAC!downloadFile.action?uploadFileName='+fileName);
	downurl=encodeURI(downurl);
 	
	$.ajax({
		url: checkurl,
		type: 'POST',
		dataType: 'json',
		
		error: function(){
			alert("文件下载失败!");
		},
		success: function(data){
		if(data.info=='1'){
       		alert("文件不存在，请检查!");
       	}else{
       		window.location=downurl;
       	}
	}
	});
 }
 
function sendsave(optype){ 
  
  if(!isNull($("#title").val(),"标题")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	
   // Add by 陈萧如 bug对应
   if(!lengthCheck($("#title").val(),"标题",100)){
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
   
	var postData = $("#form1").serialize()+'&upload='+$("#uploadFileName").val();  
	   
	                                
	$.ajax({
		url: webroot+'/commonbiz/tztgAC!editNotice.action?optype='+optype,
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("修改失败");
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
  <table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
<!--  <tr><td></td><td>选择文件：</td><td><input type="file"   id="test" name="test" size="38%" ></td></tr>-->
  	</table>
  	<form id="form1">
  	
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;标题：</td><td><input type="text"  id="title" name="tztg.title" size="50%"/></td></tr>
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
	  	<tr><td></td><td></td><td><input type="hidden"  id="uploadFileName" name="tztg.uploadFileName" size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><input type="hidden"  id="sendStatus" name="tztg.sendStatus" size="50%"/></td></tr>
	    <tr><td></td><td></td><td><input type="hidden"  id="id" name="tztg.id" size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><input type="hidden"  id="reqDeptId" name="tztg.reqDeptId" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;单位：</td><td><input type="text" id="reqDeptName" name="tztg.reqDeptName" size="50%"  onclick="openDeptTree('<%=path%>/biz/common/tztg_unit_tree.jsp')" readonly/></td></tr>
	  	<tr><td></td><td></td><td><input type="hidden"  id="reqdevice_id" name="tztg.reqdevice_id" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;人员：</td><td><input type="text" id="requsername" name="tztg.requsername" size="50%" onclick="openDeptTree('<%=path%>/biz/common/tztg_user_tree.jsp')" readonly/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;内容：</td><td><textarea id="content" name="tztg.content" style="width:100%;" rows="9"></textarea></td></tr>
		<!-- <tr><td></td><td>文件:</td><td><input type="text"  id="uploadFileName" name="tztg.uploadFileName" size="40%" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="downloadBtn"  value="下载"/></td></tr> -->
	  	<tr><td></td><td></td>
	  		<td align="center">
	  		<input type="button" id="btn4"  value="上传"/>&nbsp;&nbsp;
	  		<!-- <input type="button" id="downloadBtn"  value="下载"/>&nbsp;&nbsp;  -->
	  		<input type="button" id="btn1"  value="发 送"/>&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="保 存"/>&nbsp;&nbsp;
	  		<input type="button" id="btn3"  value="取 消"/></td>
	  		
	  	</tr>
	  	
  	</table>
	</form>  
  </body>
</html>

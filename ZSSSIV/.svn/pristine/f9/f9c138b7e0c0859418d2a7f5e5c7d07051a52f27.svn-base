<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String id = (String) request.getAttribute("id");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>通知通告文件上传</title>

	 <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
     <script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
      <script type="text/javascript" src="<%=path%>/common.js"></script>


		<script type="text/javascript">

var id = window.opener.document.getElementById("id").value;
var uploadFileName = window.opener.document.getElementById("uploadFileName").value;
$(document).ready(function() {
	$("#id").val(id);
	$("#uploadFileName").val(uploadFileName);
});

function validate_required(field, alerttxt) {
	with (field) {
		if (value == null || value == "") {
			alert(alerttxt);
			return false
		} else {
			return true
		}
	}
}


function validate_form(thisform)
{


	with (thisform)
	  {
	  if (validate_required(test,"文件不为空!")==false)
	    {test.focus();return false}
	    else{
	     return true;
	    }
	    parent.refreshGrid();
	  }
}  

function closeWindow(thisform)
{
	window.close(thisform);
}
 

     
</script>

	</head>
	<body>
		<form id="form1"
			action="<%=path%>/commonbiz/tztgAC!addTztgUpdate.action"
			onsubmit="return validate_form(this)" method="post"
			enctype="multipart/form-data">
			<br>
			<input type="hidden" id="id" name="id" size="50%" />
			<input type="hidden" id="uploadFileName" name="uploadFileName"
				size="50%" />
				<input type="hidden"  id="title" name="tztg.title" size="50%"/>
			<table align="center">
				<colgroup>
					<col width="10%" align="right" />
					<col width="30%" align="right" />
					<col width="50%" align="left" />
					<col width="10%" align="right" />
				</colgroup>



				<tr align="center">
					<td></td>
					<td>
						选择文件：
					</td>
					<td>
						<input type="file" id="test" name="test" size="40%"	onchange="getFileSize(this);">
					</td>
				</tr>


				<tr>
					<td></td>
					<td></td>
					<td align="center">
						<input type="submit" id="btn1" value="确 定" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" id="btn2" value="取 消" onclick="closeWindow(this)"/>
					</td>
				</tr>
			</table>
		</form>

	</body>
	<script type="text/javascript">
	function getFileSize(obj) {
	obj.select();  
	var path   = document.selection.createRange().text; 
	document.getElementById("btn1").disabled = false;
	$.ajax({
			url: webroot+'/commonbiz/tztgAC!checkFileSiez.action',
			type: 'POST',
			data:'path='+path,
			dataType: 'json',
		    error: function(){
				alert("文件出错！");
			},
			success: function(data){
				  if(data.tztg.title=='1'){
					  alert("文件大小不能超过10M！")
					  document.getElementById("btn1").disabled = true;
					  return false;
					}
			    }
		    }
		);              
	 }
</script>

</html>

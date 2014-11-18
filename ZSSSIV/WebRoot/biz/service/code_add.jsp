<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
	if( request.getParameter("guide_start")!=null){
		out.print("<script>  guide_start='"+request.getParameter("guide_start")+"';</script>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>系统代码添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
<script type="text/javascript">
function guide_next(){
	url=webroot+'/biz/service/business_add.jsp?guide_start=true';
	//window.location=webroot+'/biz/service/code_add.jsp'
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
function guide_next_add(){	
	url=webroot+'/biz/service/code_add.jsp?guide_start=true';
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
var parent=this.dialogArguments;
 $(document).ready(function(){
 	 if(parent==null)parent=window.opener;
	 if(parent.guide_start){
	 $("#guide_span").text("系统代码添加向导页面");
	 $("#btn_guide_next").show();}
    $("#btn1").click(function(){
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    }); 
    $("#btn_guide_next").click(function(){
		guide_next();
    }); 
 }); 
function postdata(){ 

	if(!isNull($("#key").val(),"代码键")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#value").val(),"代码值")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#type").val(),"代码分类")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	var postData = $("#form1").serialize();
	/*                                    
   	$.post(webroot+'/biz/serviceAC!addCode.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     parent.refreshGrid();
		     window.close();
	}, 'json');
	*/    
	$.ajax({
		url: webroot+'/biz/serviceAC!addCode.action',
		data:postData,
		type: 'POST',
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("添加失败");
		},
		success: function(data){
			document.getElementById("btn1").disabled = false;
			if(data.info!='1'){
				alert("【代码分类&代码键】主键冲突!");
			}else{
				if(parent.guide_start){
				alert("添加成功！进入下一步向导");
				//guide_next();
				guide_next_add();
				}else{
				//alert("添加成功！");
				parent.refreshGrid();
	        	window.close();}
			}
	    }
	});
 }

</script>
  </head>
  <body>
  	<form id="form1">
  	<br><span id="guide_span"></span>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;代码键：</td><td><input type="text" id="key" name="code.key" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;代码值：</td><td><input type="text" id="value" name="code.value" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;代码分类：</td><td><input type="text" id="type" name="code.type" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
	  		<tr><td></td><td></td><td><input style="display:none;" type="button" id="btn_guide_next"  value="直接进入下一步向导"/></td></tr>
  	</table>
	</form>  
  </body>
</html>

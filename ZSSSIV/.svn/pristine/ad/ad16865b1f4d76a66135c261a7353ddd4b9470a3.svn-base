<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
if( request.getParameter("guide_start")!=null){
		out.print("<script>  guide_start='"+request.getParameter("guide_start")+"'; bizId='"+request.getParameter("bizId")+"';</script>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>TAB页信息添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
<script type="text/javascript">
function guide_next(){
	url=webroot+'/biz/service/colmapping_add.jsp?guide_start=true&bizId='+parent.bizId;
	//window.location=webroot+'/biz/service/code_add.jsp'
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
function guide_next_add(){
	
	url=webroot+'/biz/service/tabinfo_add.jsp?guide_start=true&bizId='+parent.bizId;
	//window.location=webroot+'/biz/service/code_add.jsp'
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
var parent=this.dialogArguments;
 $(document).ready(function(){
 	if(parent==null)parent=window.opener;
  	if(parent.guide_start){
  	$("#guide_span").text("TAB页信息添加向导页面");
	 $("#btn_guide_next").show();
	 //$("#btn_guide_next_add").show();
	 }
	 $("#btn_guide_next").click(function(){
		guide_next();
    }); 
    $("#btn_guide_next_add").click(function(){
		guide_next_add();
    }); 	 
 	//alert(parent.bizId);
 	$("#b_id").val(parent.bizId);
    $("#btn1").click(function(){
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
	/*                                  
   	$.post(webroot+'/biz/serviceAC!addTabInfo.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     parent.refreshGrid();
		     window.close();
	}, 'json');
	*/
	
	$.ajax({
		url: webroot+'/biz/serviceAC!addTabInfo.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("添加失败");
		},
		success: function(data){
			document.getElementById("btn1").disabled = false;
			if(data.info!='1'){
				alert("【选项卡编号&业务ID】主键冲突!");
			}else{
			if(parent.guide_start){
				alert("添加成功！请选择继续增加或进入下一步向导");
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
  	<input type="hidden" id="b_id" name="tabInfo.b_id"/>
  	<br><span id="guide_span"></span>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td>选项卡编号</td><td><input id="tab_id" type="text" name="tabInfo.tab_id" size="50%" maxlength="30"/></td></tr>
	  	<!-- <tr><td></td><td>业务id</td><td><input readonly type="text" id="b_id" name=tabInfo.b_id size="50%" maxlength="10"/></td></tr> -->
	  	<tr><td></td><td>选项卡标题</td><td><input type="text" id="tab_name" name="tabInfo.tab_name" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
	  	<tr><td></td><td></td><td><input style="display:none;" type="button" id="btn_guide_next_add"  value="继续增加"/><input style="display:none;" type="button" id="btn_guide_next"  value="直接进入下一步向导"/></td></tr>
  	</table>
	</form>  
  </body>
</html>

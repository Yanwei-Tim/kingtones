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
    <title>字段映射录入页面</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
    <script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
function guide_next(){
	url=webroot+'/biz/service/businessres_add.jsp?guide_start=true&bizId='+parent.bizId;
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
function guide_next_add(){
	url=webroot+'/biz/service/colmapping_add.jsp?guide_start=true&bizId='+parent.bizId;
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
var parent=this.dialogArguments;
 $(document).ready(function(){
 if(parent==null)parent=window.opener;
 if(parent.guide_start){
 	$("#guide_span").text("字段映射添加向导页面");
	 $("#btn_guide_next").show();
	 //$("#btn_guide_next_add").show();
	 }
	 $("#btn_guide_next").click(function(){
		guide_next();
    }); 
    $("#btn_guide_next_add").click(function(){
		guide_next_add();
    }); 
 	$("#b_id").val(parent.bizId);
 	getSysCodeList("haveres","is_res","colMapping.is_res","100");
 	getSysCodeList("cname_type","cname_type","colMapping.cname_type","100");
 	getSysCodeList("condition","op","colMapping.op","100");
 	getResCodeList("res_id","res_id","colMapping.res_id","100");

    $("#btn1").click(function(){
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });
    /*  
    $("#b_id").click(function(){
    	url=webroot+"/biz/service/selectbiz_boxtree.jsp?type=f";
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });*/ 
 }); 
function postdata(){ 

	if(!isNull($("#columns").val(),"系统字段")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	/*if(!isNull($("#b_id").val(),"业务id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/
	if(!isNull($("#cname").val(),"系统字段名")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	/*if(!isNull($("#table_name").val(),"客户表名")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/
	/*if(!isNull($("#c_column").val(),"客户字段")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/
	if(!isNull($("#cname_type").val(),"客户字段类型")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	/*if(!isNull($("#res_id").val(),"资源id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#op").val(),"操作符")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/

	var postData = $("#form1").serialize(); 
	/*                                   
   	$.post(webroot+'/biz/serviceAC!addColMapping.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     parent.refreshGrid();
		     window.close();
	}, 'json');
	*/
	$.ajax({
		url: webroot+'/biz/serviceAC!addColMapping.action',
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
				alert("【系统字段&业务id】主键冲突!");
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
function setColumns(Columns,type){
	if(type=="f")$("#b_id").val(Columns);
}
</script>
  </head>
  <body>
  	<form id="form1">
  	<input type="hidden" id="b_id" name="colMapping.b_id"/>
  	<br><span id="guide_span"></span>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td>系统字段</td><td><input id="columns" type="text" name="colMapping.columns" size="50%" maxlength="20"/></td></tr>
	  	<tr><td></td><td>系统字段名</td><td><input id="cname" type="text" name="colMapping.cname" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td>客户表名</td><td><input id="table_name" type="text" name="colMapping.table_name" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td>客户字段</td><td><input id="c_column" type="text" name="colMapping.c_column" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td>客户字段类型</td><td>
	  	<div id="cname_type_div"/>
	  	<!-- <input id="cname_type" type="text" name="colMapping.cname_type" size="50%" maxlength="30"/>-->
	  	</td></tr>
	  	<tr><td></td>
	  		<td>是否有资源</td>
	  		<td>
	  			<div id="haveres_div"/>
	  			<!-- 
	  			<select name="colMapping.is_res" style="width:100%">
		    		<option value="0">否</option>
		         	<option value="1">是</option>
	    		</select> -->
	  		</td>
	  	</tr>
	  	<tr><td></td><td>资源id</td><td>
	  	<div id="res_id_div"/>
	  	<!--<input id="res_id" type="text" name="colMapping.res_id" size="50%" maxlength="20"/>-->
	  	</td></tr>
	  	<tr><td></td><td>操作符</td><td>
	  	<div id="condition_div"/>
	  	<!-- <input id="op" type="text" name="colMapping.op" size="50%" maxlength="20"/>-->
	  	</td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
	  		  	<tr><td></td><td></td><td><input style="display:none;" type="button" id="btn_guide_next_add"  value="继续增加"/><input style="display:none;" type="button" id="btn_guide_next"  value="直接进入下一步向导"/></td></tr>
  	</table>
	</form>  
  </body>
</html>

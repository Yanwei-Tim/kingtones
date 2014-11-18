<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
if( request.getParameter("guide_start")!=null){
		out.print("<script>  guide_start='"+request.getParameter("guide_start")+"';bizId='"+request.getParameter("bizId")+"';parent.selectItemId=bizId;</script>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<META HTTP-EQUIV="pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
	<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
    <title>业务组件录入页面</title>
     <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
      <script type="text/javascript" src="check.js"></script>
      <script type="text/javascript" src="<%=path%>/config.js"></script>
	<script type="text/javascript" src="<%=path%>/common.js"></script>

<script type="text/javascript">
function guide_next(){
	url=webroot+'/biz/service/business_edit.jsp?guide_start=true&bizId='+parent.bizId;
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
function guide_next_add(){
	url=webroot+'/biz/service/businessres_add.jsp?guide_start=true&bizId='+parent.bizId;
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
var parent=this.dialogArguments;
 $(document).ready(function(){
 	if(parent==null)parent=window.opener;
 if(parent.guide_start){
 	$("#guide_span").text("业务组件添加向导页面");
	 $("#btn_guide_next").show();
	//$("#btn_guide_next_add").show();
	 }
	 $("#btn_guide_next").click(function(){
		guide_next();
    }); 
    $("#btn_guide_next_add").click(function(){
		guide_next_add();
    }); 
 	getSysCodeList("w_type","type","bizRes.type","100");
 	getSysCodeList("isshow","visible","bizRes.visible","100");
 	getSysCodeList("validate","validate_type","bizRes.validate_type","100");
 	getSysCodeList("isnull","isbenull","bizRes.isbenull","100");
 	getColMappingCodeList("code","code","bizRes.code","100");
 	//getSystemMapTypeCodeList("res_id","res_id","bizRes.res_id","100");
 	getTabInfoList("tabgroup","tabgroup","bizRes.tabgroup","100");
 	
    $("#btn1").click(function(){
    	document.getElementById("btn1").disabled =true;
    	//给隐藏域赋值
    	$("#b_id").val(parent.bizId);
    	postdata();         
    });      
    $("#btn2").click(function(){
		window.close();
    }); 
    $("#res_id_bt").click(function(){
    	url=webroot+"/biz/service/selectsysres_boxtree.jsp?type=f";
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });  
 }); 
function postdata(){ 

	if(!isNumber($("#w_id").val(),"组件ID")) {
	document.getElementById("btn1").disabled = false;
	return;
	}
	if(!isNull($("#w_id").val(),"组件ID")){
	document.getElementById("btn1").disabled = false;
	return;
	}
	if(!isNull($("#name").val(),"组件标题")){
	document.getElementById("btn1").disabled = false;
	return;
	}
//	if(!isNull($("#res_id").val(),"组件资源")){
//	document.getElementById("btn1").disabled = false;
//	return;
//	}
/*
	if(!isNull($("#validate_des").val(),"校验提示")){
	document.getElementById("btn1").disabled = false;
	return;
	}*/
	if(!isNull($("#code").val(),"系统字段")){
	document.getElementById("btn1").disabled = false;
	return;
	}
	/*
	if(!isNull($("#datatype").val(),"校验数据类型")){
	document.getElementById("btn1").disabled = false;
	return;
	}
	*/
	if(!isNull($("#orders").val(),"顺序编号")){
	document.getElementById("btn1").disabled = false;
	return;
	}
	/*
	if(!isNull($("#tabgroup").val(),"选项卡好")){
	document.getElementById("btn1").disabled = false;
	return;
	}
	*/
	var postData = $("#form1").serialize();  
   	//$.post('webroot+/biz/serviceAC!addBizRes.action', postData, function(data){  
	//	     window.opener.refreshGrid();
	//	     window.close();
	//}, 'json');    
	
	
	$.ajax({
		url: webroot+'/biz/serviceAC!addBizRes.action',
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
				alert("组件ID已存在!");
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
	if(type=="f")$("#res_id").val(Columns);
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
	  	<tr><td></td><td><!-- 业务id --></td><td><input type="hidden" id="b_id" name="bizRes.b_id"/></td></tr>
	  	<tr><td></td><td>组件ID</td><td><input id="w_id" type="text" name="bizRes.w_id" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td>组件标题</td><td><input id="name" type="text" name="bizRes.name" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td>
		  	<td>组件类型</td>
		  	<td>
		  		<div id="w_type_div"/>
	  			<!--<select name="bizRes.type" style="width:100%">
		    		<option value="EditDate">编辑框[日期]</option>
		         	<option value="TextEdit">编辑框[文本]</option>
		         	<option value="SpinnersEdit">下拉+编辑框</option>
		         	<option value="TextSpinner">下拉列表</option>
	    		</select>-->
		  	</td>
	  	</tr>
	  	<tr><td></td><td>组件资源</td><td>
	  	<!--<div id="res_id_div"/>-->
	  	 <input id="res_id" type="text" name="bizRes.res_id" size="40%" maxlength="30"/>
	  	 &nbsp;<input type="button" id="res_id_bt"  value="选择" width="40"/>
	  	 </td>
	  	 </tr>
	  	<tr><td></td>
		  	<td>是否显示</td>
		  	<td>
		  		<div id="isshow_div"/>
		  		<!-- 
	  			<select name="bizRes.visible" style="width:100%">
		    		<option value="1">是</option>
		         	<option value="0">否</option>
	    		</select> -->
		  	</td>
	  	</tr>
	  	<tr><td></td>
		  	<td>校验类型</td>
		  	<td>
		  		<div id="validate_div"/>
		  	<!-- 
	  			<select name="bizRes.validate_type" style="width:100%">
		    		<option value="0">不验证</option>
		         	<option value="1">非空验证</option>
		         	<option value="2">身份证验证</option>
		         	<option value="3">手机验证</option>
		         	<option value="4">固定电话</option>
		         	<option value="5">数字验证</option>
		         	<option value="6">日期验证</option>
		         	<option value="7">特殊字符验证</option>
	    		</select> -->
		  	</td>
	  	</tr>
	  	<tr><td></td><td>校验提示</td><td><input id="validate_des" type="text" name="bizRes.validate_des" size="50%" maxlength="255"/></td></tr>
	  	<tr><td></td><td>系统字段</td><td>
	  	<div id="code_div"/>
	  	<!--<input id="code" type="text" name="bizRes.code" size="50%" maxlength="30"/>-->
	  	</td></tr>
	  	<tr><td></td><td>校验数据类型</td><td><input id="datatype" type="text" name="bizRes.datatype" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td>
		  	<td>是否允许为空</td>
		  	<td>
		  		<div id="isnull_div"/>
	  			<!-- <select name="bizRes.isbenull" style="width:100%">
		    		<option value="1">是</option>
		         	<option value="0">否</option>
	    		</select>-->
		  	</td>
	  	</tr>
	  	<tr><td></td><td>顺序编号</td><td><input id="orders" type="text" name="bizRes.orders" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td>选项卡号</td><td>
	  	<div id="tabgroup_div"/>
	  	<!-- <input id="tabgroup" type="text" name="bizRes.tabgroup" size="50%" maxlength="50"/> -->
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

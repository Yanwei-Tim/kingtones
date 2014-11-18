<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>手机信息录入页面</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
    <script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
 	//getSysCodeList("business","b_type","biz.b_type","100");	
 	//getSysCodeList("isleaf","final_node","biz.final_node","100");
 	//getImgCodeList("img_name","img_name","biz.img_name","100");
 	//getSysCodeValueList("datasource","ds","biz.ds","100");
 	
 		$.ajax({
		url: webroot+'/biz/serviceAC!queryBizById.action',
		data:'bizId='+parent.selectItemId,
		type: 'POST',
		async:false,
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			$("#b_id").val(data.biz.b_id);
			$("#b_name").val(data.biz.b_name);
			//alert(data.biz.b_type);
			//$("#b_type").val(data.biz.b_type);
			//$("#img_name").val(data.biz.img_name);
			$("#l_simple_items").val(data.biz.l_simple_items);
			$("#d_simple_items").val(data.biz.d_simple_items);
			//$("#l_sql").val(data.biz.l_sql);
			//$("#d_sql").val(data.biz.d_sql);
			//$("#father_id").val(data.biz.father_id);
			//$("#final_node").val(data.biz.final_node);
			//$("#ds").val(data.biz.ds);
			//$("#b_orders").val(data.biz.b_orders);
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
    $("#l_simple_items").click(function(){
    	bizId=document.getElementById("b_id").value;
    	url=webroot+"/biz/service/select_box.jsp?type=l&bizId="+bizId;
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });
    $("#d_simple_items").click(function(){
    	bizId=document.getElementById("b_id").value;
    	url=webroot+"/biz/service/select_box.jsp?type=d&bizId="+bizId;
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });    
    $("#father_id").click(function(){
    	url=webroot+"/biz/service/selectbiz_boxtree.jsp?type=f";
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });  
 }); 
function postdata(){ 
	/*
	if(!isNull($("#b_name").val(),"业务名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#img_name").val(),"图片名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	*/
	if(!isNull($("#l_simple_items").val(),"列表过滤")) {
		document.getElementById("btn1").disabled = false;
		return;
	}else{
		var str=$("#l_simple_items").val();
		var strs=str.split(",");	
		if(strs.length!=4){
		alert("列表过滤目前只支持显示4项:您选择"+strs.length+"项");
		document.getElementById("btn1").disabled = false;
		return;
		}
	}
	if(!isNull($("#d_simple_items").val(),"详细过滤")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	/*
	if(!isNull($("#l_sql").val(),"L_SQL语句")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#d_sql").val(),"D_SQL语句")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	if(!isNull($("#father_id").val(),"父节点id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#b_orders").val(),"排序")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/

	var postData = $("#form1").serialize();                                   
   	$.post(webroot+'/biz/serviceAC!updateBizItems.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     //window.opner.refreshGrid();
		     parent.refreshGrid();
		     window.close();
	}, 'json');    
 }
function setColumns(Columns,type){
	if(type=="l")$("#l_simple_items").val(Columns);
	else if(type=="d")$("#d_simple_items").val(Columns);
	else if(type=="f")$("#father_id").val(Columns);
}
</script>
  </head>
  <body>
  	<form id="form1">
  
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td>业务ID</td><td><input type="text" readonly id="b_id" name="biz.b_id" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td>业务名称</td><td><input type="text" readonly id="b_name" name="biz.b_name" size="50%" maxlength="50"/></td></tr>
	  	
	  	<tr><td></td><td>列表过滤</td><td><input readonly type="text" id="l_simple_items" name="biz.l_simple_items" size="50%" maxlength="100"/></td></tr>
	  	<tr><td></td><td></td><td>注:列表过滤目前只支持4列显示</td></tr>
	  	<tr><td></td><td>详细过滤</td><td><input readonly type="text" id="d_simple_items" name="biz.d_simple_items" size="50%" maxlength="1000"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>

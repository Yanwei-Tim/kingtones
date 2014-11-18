<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
	if( request.getParameter("guide_start")!=null){
		out.print("<script>  guide_start='"+request.getParameter("guide_start")+"';var b_name='"+request.getParameter("b_name")+"' ;bizId='"+request.getParameter("bizId")+"';parent.selectItemId=bizId;</script>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>业务关联添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
<script type="text/javascript">
function guide_next(){
	parent.guide_start=false;
	parent.guide_end=true;
	url=webroot+'/biz/service/codetype_add.jsp?guide_end=true&bizId='+parent.bizId+'&b_name='+b_name;
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
function guide_next_add(){
	url=webroot+'/biz/service/colmapping_add.jsp';
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
var parent=this.dialogArguments;
 $(document).ready(function(){
 	if(parent==null)parent=window.opener;
	 if(parent.guide_start){
	 $("#guide_span").text("业务关联添加向导页面");
	 $("#btn_guide_next").show();
	 //$("#btn_guide_next_add").show();
	 }
	 $("#btn_guide_next").click(function(){
		guide_next();
    }); 
    $("#btn_guide_next_add").click(function(){
		guide_next();
    }); 
    $("#btn1").click(function(){
    	document.getElementById("btn1").disabled =true;
	 	//$("#b_id").val(window.opener.bizId);
	 	$("#b_id").val(parent.bizId);
    	postdata();                                 	             
    });      
    $("#btn2").click(function(){
		window.close();
    }); 
    $("#r_id").click(function(){
    	url=webroot+"/biz/service/selectbiz_boxtree.jsp?type=l";
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });  
    $("#r_column").click(function(){
    	if(!isNull($("#r_id").val(),"关联业务id")) {
		document.getElementById("btn1").disabled = false;
		return;
		}else {
    	url=webroot+"/biz/service/selectone_coltree.jsp?type=d&bizId="+$("#r_id").val();;
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
        }
    });  
 }); 
function postdata(){ 

	if(!isNull($("#r_id").val(),"关联业务id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	if(!isNull($("#r_column").val(),"关联系统字段")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	var postData = $("#form1").serialize();                                    
   	/*
   	$.post(webroot+'/biz/serviceAC!addBizRel.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     //window.opener.refreshGrid();
		     parent.refreshGrid();
		     window.close();
	}, 'json');
	*/
	$.ajax({
		url: webroot+'/biz/serviceAC!addBizRel.action',
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
				alert("关联业务ID已存在!");
			}else{
			if(parent.guide_start){
				alert("添加成功！进入下一步向导");
				guide_next();
				}else{
				//alert("添加成功！");
				parent.refreshGrid();
	        	window.close();}
			}
	    }
	});    
	   
 }
function setColumns(Columns,type){
	if(type=="l")$("#r_id").val(Columns);
	else if(type=="d")$("#r_column").val(Columns);
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
	  	<tr><td></td><td><!-- 业务id --></td><td><input type="hidden" id="b_id" name="bizRel.b_id" maxlength="50"/></td></tr>
	  	<tr><td></td><td>关联业务id</td><td><input readonly type="text" id="r_id" name="bizRel.r_id" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td>关联系统字段</td><td><input readonly type="text" id="r_column" name="bizRel.r_column" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td>
		  	<td>关联类型</td>
		  	<td>
	  			<select name="bizRel.r_type" style="width:100%">
		    		<option value="0">详细</option>
		         	<option value="1">列表</option>
	    		</select>
		  	</td>
	  	</tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
	  	<tr><td></td><td></td><td><input style="display:none;" type="button" id="btn_guide_next_add"  value="继续增加"/><input style="display:none;" type="button" id="btn_guide_next"  value="直接进入下一步向导"/></td></tr>
  	</table>
	</form>    
  </body>
</html>

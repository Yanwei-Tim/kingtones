<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
	if( request.getParameter("guide_start")!=null){
		out.print("<script>  guide_start='"+request.getParameter("guide_start")+"';</script>");
	}
	if( request.getParameter("guide_end")!=null){
		out.print("<script>  guide_end='"+request.getParameter("guide_end")+"';var b_name='"+request.getParameter("b_name")+"' ;bizId='"+request.getParameter("bizId")+"';parent.selectItemId=bizId;</script>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>业务代码添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
    <script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
//var guide_start;
	//alert(guide_start);
function guide_next(){
	url=webroot+'/biz/service/code_add.jsp?guide_start=true';
	//window.location=webroot+'/biz/service/code_add.jsp'
	window.name = "dialogPage"; window.open(url,"dialogPage");
}

var parent=this.dialogArguments;

 $(document).ready(function(){
 	 if(parent==null)parent=window.opener;
 	 //alert(parent+"="+window.opener);
	 if(parent.guide_start){
	 $("#guide_span").text("业务代码添加向导页面");
	 $("#btn_guide_next").show();
	 }
	 if(parent.guide_end){
	 $("#guide_span").text("业务代码添加向导页面");
	 //$("#btn_guide_next_end").show();
	 $("#res_id").val(parent.bizId);
	 $("#source").val("select COLUMNS key,CNAME value from column_map where b_id = '"+parent.bizId+"'");
	 $("#res_name").val(b_name);
	 }
 	getSysCodeValueList("datasource","ds","codeType.ds","100");
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
    $("#btn_guide_next_end").click(function(){
		window.close();
    });   
 }); 
function postdata(){ 
	if(!isNull($("#res_id").val(),"分类id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#res_name").val(),"分类名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#source").val(),"代码SQL")) {
		document.getElementById("btn1").disabled = false;
		return;
	}

	var postData = $("#form1").serialize(); 
	
	/*                                   
   	$.post(webroot+'/biz/serviceAC!addCodeType.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     parent.refreshGrid();
		     window.close();
	}, 'json');
	*/    
	
	$.ajax({
		url: webroot+'/biz/serviceAC!addCodeType.action',
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
				alert("分类id已存在!");
			}else{
			if(parent.guide_start){
				alert("添加成功！进入下一步向导");
				guide_next();
				} else if(parent.guide_end){
				alert("配置向导结束!");
				window.close();
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
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;分类id：</td><td><input id="res_id" type="text" name="codeType.res_id" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;分类名称：</td><td><input id="res_name" type="text" name="codeType.res_name" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;代码SQL：</td><td><input id="source" type="text" name="codeType.source" size="50%" maxlength="400"/></td></tr>
	  	<!--tr><td></td><td>更新日期</td><td><input type="text" name="codeType.change_date" size="50%"/></td></tr-->
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;数据源：</td><td><div id="datasource_div"></div></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
	  	<tr><td></td><td></td><td><input style="display:none;" type="button" id="btn_guide_next_end"  value="配置结束"/><input style="display:none;" type="button" id="btn_guide_next"  value="直接进入下一步向导"/></td></tr>
  	</table>
	</form>  
  </body>
</html>

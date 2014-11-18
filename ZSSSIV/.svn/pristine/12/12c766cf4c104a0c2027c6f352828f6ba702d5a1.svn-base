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
    <title>业务添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>

    <script type="text/javascript" src="<%=path%>/config.js"></script>
	<script type="text/javascript" src="<%=path%>/common.js"></script>

<script type="text/javascript">
function guide_next(){
	url=webroot+'/biz/service/tabinfo_add.jsp?guide_start=true&bizId='+parent.bizId;
	//window.location=webroot+'/biz/service/code_add.jsp'
	window.name = "dialogPage"; window.open(url,"dialogPage");
}

var parent=this.dialogArguments;
 $(document).ready(function(){
 	 if(parent==null)parent=window.opener;
 	 if(parent.guide_start){
	 $("#guide_span").text("业务添加向导页面");
	 $("#btn_guide_next").show();
	 }
	 $("#btn_guide_next").click(function(){
		guide_next();
    });
 	getSysCodeList("business","b_type","biz.b_type","100");	
 	getSysCodeList("isleaf","final_node","biz.final_node","100");
 	getImgCodeList("img_name","img_name","biz.img_name","100");
 	getSysCodeValueList("datasource","ds","biz.ds","100");
 	
    $("#btn1").click(function(){
    	//window.opener.disable = true;
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });  
    $("#father_id").click(function(){
    	url=webroot+"/biz/service/selectbiz_boxtree.jsp?type=f";
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });
    $("#img_name").click(function(){
    	url=webroot+"/biz/service/selectone_imageinfo.jsp?type=i";
        window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });     
 }); 
function postdata(){ 

	if(!isNull($("#b_name").val(),"业务名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#img_name").val(),"图片名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	/*
	if(!isNull($("#l_simple_items").val(),"列表过滤")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#d_simple_items").val(),"详细过滤")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	*/
/*	if(!isNull($("#l_sql").val(),"L_SQL语句")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#d_sql").val(),"D_SQL语句")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/
	if(!isNull($("#father_id").val(),"父节点id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}else{
	var ifexist=false;
	$.ajax({
		url: webroot+'/biz/serviceAC!queryRootBiz.action',
		data:'bizId='+parent.selectItemId,
		type: 'POST',
		async:false,
		dataType: 'json',
	    error: function(){
	   		 document.getElementById("btn1").disabled = false;
			alert("父节点id:加载数据失败");	
			ifexist=true;		

		},
		success: function(data){
			//alert(data.biz.b_id+"-"+$("#father_id").val()+"-"+$("#b_id").val());
			//alert(data.biz.father_id);
			var rootb_id=data.biz.b_id;
			if(rootb_id!=null&&rootb_id!=$("#b_id").val()&&data.biz.father_id==$("#father_id").val())
			{
			document.getElementById("btn1").disabled = false;
			alert("父节点id:根业务已存在");	
			ifexist=true;

			}		
	    }
	});
	if(ifexist)return;
	}
	if(!isNull($("#b_orders").val(),"排序")) {
		document.getElementById("btn1").disabled = false;
		return;
	}	
	
	var postData = $("#form1").serialize(); 
   	$.post(webroot+'/biz/serviceAC!addBiz.action', postData, function(data){
   			if(parent.guide_start){
   				parent.bizId=data.biz.b_id;
				alert("添加成功！进入下一步向导");
				guide_next();
				}else{
   			 document.getElementById("btn1").disabled =false;  
		     //window.opner.refreshGrid();
		     parent.refreshGrid();
		     window.close();}
	}, 'json');    
 }
function setColumns(Columns,type){
	//alert(Columns+"="+type);
	if(type=="f")$("#father_id").val(Columns);
	if(type=="i")$("#img_name").val(Columns);
}
</script>

  </head>
  <body>
  	<form id="form1">
  	<br><span id="guide_span"></span>
  	<table>
	  	<colgroup>
	  		<col width="5%" align="right"/>
	  		<col width="45%" align="left"/>
			<col width="40%" align="right" />
			<col width="10%" align="right"/>
	  	</colgroup>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;业务名称：</td><td><input id="b_name" type="text" name="biz.b_name" size="40%" maxlength="40"/></td></tr>
	  	<tr><td></td>
	  		<td>&nbsp;&nbsp;&nbsp;&nbsp;业务类型：</td>
	  		<td>
	  		<div id="business_div"></div>
	  		<!-- 
	  			<select name="biz.b_type" style="width:100%">
		    		<option value="0">平铺菜单</option>
		         	<option value="1">列表菜单</option>
		         	<option value="2">查询</option>
		         	<option value="3">增加</option>
	    		</select>
	    		 -->
	  		</td>
	  	</tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;图片名称：</td><td>
	  	 <input readonly id="img_name" type="text" name="biz.img_name" size="40%" maxlength="40"/> 
	  	<!--<div id="img_name_div"></div>-->
	  	</td></tr>
	  	<!-- <tr><td></td><td>列表过滤</td><td><input id="l_simple_items" type="text" name="biz.l_simple_items" size="50%" maxlength="100"/></td></tr>
	  	<tr><td></td><td>详细过滤</td><td><input id="d_simple_items" type="text" name="biz.d_simple_items" size="50%" maxlength="1000"/></td></tr>
	  	 <tr><td></td><td>L_SQL语句</td><td><input id="l_sql" type="text" name="biz.l_sql" size="50%" maxlength="1000"/></td></tr>
	  	<tr><td></td><td>D_SQL语句</td><td><input id="d_sql" type="text" name="biz.d_sql" size="50%" maxlength="1000"/></td></tr>
	  	--><tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;父节点id：</td><td><input readonly id="father_id" type="text" name="biz.father_id" size="40%" maxlength="10" value="0"/></td></tr>
	  	<tr><td></td>
		  	<td>是否为叶子节点：</td>
		  	<td>
		  	<div id="isleaf_div"></div>
	  			<!-- <select name="biz.final_node" style="width:100%">
		    		<option value="0">否</option>
		         	<option value="1">是</option>
	    		</select>-->
		  	</td>
	  	</tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;数据源：</td><td><div id="datasource_div"></div></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;排序：</td><td><input id="b_orders" type="text" name="biz.b_orders" size="40%" maxlength="40"/></td></tr>
	  	<!--<tr><td></td><td>业务验证</td><td><input id="validate_res" type="text" name="biz.validate_res" size="50%" maxlength="1000"/></td></tr>
	  	<tr><td></td><td>验证说明</td><td><input id="validate_des" type="text" name="biz.validate_des" size="50%" maxlength="1000"/></td></tr>
	  	-->
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
	  		
  	</table>
	</form>  
  </body>
</html>

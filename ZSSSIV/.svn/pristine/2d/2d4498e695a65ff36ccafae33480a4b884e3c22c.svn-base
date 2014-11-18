<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
//System.out.println("1=="+request.getParameter("guide_start"));
request.setAttribute("guide_start",request.getParameter("guide_start"));
//System.out.println("2=="+request.getAttribute("guide_start"));

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图片信息添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
<script type="text/javascript">
function guide_next(){
	url=webroot+'/biz/service/codetype_add.jsp?guide_start=true';
	//window.location=webroot+'/biz/service/codetype_add.jsp'
	window.name = "dialogPage"; window.open(url,"dialogPage");
}

var parent=this.dialogArguments;
 $(document).ready(function(){
	 $("#img_show").hide();
	 //alert(parent.guide_start);
	 if(parent==null)parent=window.opener;
	 if(parent.guide_start){	 
	 $("#guide_span").text("图片信息添加向导页面");
	 $("#btn_guide_next").show();
	 }
	 
    $("#btn1").click(function(){
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });  
    $("#img_path").click(function(){
    	url=webroot+"/biz/service/image_import.jsp?type=f";
        //window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
        //window.open(url,"newwindow",'toolbar=no,menubar=no,titlebar=no,directories=no,resizable=no,status=no,fullscreen=no,scrollbars=yes;');
         window.open (url, 'newwindow', 'height=400, width=400, top=230,left=300, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
    }); 
    $("#btn_guide_next").click(function(){
		guide_next();
    }); 
 }); 
function postdata(){ 
	
	if(!isNull($("#img_name").val(),"图片名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#img_name").val(),"图片名称",30)){
	 document.getElementById("btn1").disabled = false;
     return false;
   }
	if(!isNull($("#img_path").val(),"图片路径")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	 if(!lengthCheck($("#img_path").val(),"图片路径",255)){
	 document.getElementById("btn1").disabled = false;
     return false;
   }
	if(!isNull($("#img_des").val(),"图片描述")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#img_des").val(),"图片描述",255)){
	 document.getElementById("btn1").disabled = false;
     return false;
   }
	
	//var imageInfo = {};
	//imageInfo.img_name = $("#img_name").val();
	//imageInfo.img_path =$("#img_path").val();
	//imageInfo.img_des =$("#img_des").val()
	//alert($.toJSON(imageInfo));
	
	var postData = $("#form1").serialize();
	/*
   	$.post(webroot+'/biz/serviceAC!addImageInfo.action', postData, function(data){
   			document.getElementById("btn1").disabled = false;
			if(data.info=='0'){
				alert("图片名称已存在!");
			}else if(data.info=='1'){
				alert("添加成功！");
				parent.refreshGrid();
	        	window.close();
			}else {
				alert("添加失败！");
			}
	}, 'json');
	*/

	$.ajax({
		url: webroot+'/biz/serviceAC!addImageInfo.action',
		type: 'POST',
		//contentType:"application/json,charset=UTF-8",
		data:postData,//$.toJSON(imageInfo),//postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("添加失败");
		},
		success: function(data){
			
			document.getElementById("btn1").disabled = false;
			if(data.info!='1'){
				alert("图片名称已存在!");
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
function setColumns(Columns,type,imgwidth){	
	//alert("a"+imgwidth);
	//alert("1");alert(Columns);
	$("#img_name").val(Columns);
	$("#img_path").val(type);
	//$("#img_show").val(webroot+type);
	//alert(webroot+type)
	$("#img_show").attr("src",webroot+type);
	var maxwidth=300; 
	$("img").load(function(){		
   // $("img").each(function(){        
        if (this.width>maxwidth)   
         this.width = maxwidth; 
         $("img").show();  
    }); 
	if(type=="f")$("#father_id").val(Columns);
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
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;图片路径：</td><td><input id="img_path" type="text" name="imageInfo.img_path" size="50%" maxlength="255"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;图片名称：</td><td><input id="img_name" type="text" name="imageInfo.img_name" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;图片描述：</td><td><input id="img_des" type="text" name="imageInfo.img_des" size="50%" maxlength="255"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;图片显示：</td><td><img alt="" src="" id="img_show" width="100"></td></tr>
	  	<tr><td></td><td></td><td><input style="display:none;" type="button" id="btn_guide_next"  value="直接进入下一步向导"/></td></tr>
  	</table>
	</form>  
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();



%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图片上传页面</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   <script type="text/javascript">
    var callBack = null;     
    callBack=window.opener;
</script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
  	$.ajax({
		url: webroot+'/biz/serviceAC!queryUploadImgFileInfo.action',
		type: 'POST',
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			//alert("1");
			var imgfile;
			imgfile =data.imgfilelist;
			//alert(imgfile);
			if(null!=imgfile&&"null"!=imgfile){
				$.each(data.imgfilelist, function (i, n) {
				//alert(i);alert(n);
				$("#img_show_table").append('<tr><td></td><td><input type="radio" name="rad" value="'+n+'" />'+n+'</td><td><img alt="" src="/ZSSSIV/uploadfile/image/'+n+'" id="img_show" width="100"></td></tr>');
				});	
			}
			    //var maxwidth=100;  
   				// $("img").each(function(){        
      			//  if (this.width>maxwidth)   
        		//	 this.width = maxwidth;   
   				// }); 				
	    }
	});
    $("#btn1").click(function(){
		document.getElementById("btn1").disabled =true;
    	//postdata();       
    	document.getElementById("form1").submit();  
    	//$("form1").submit();                                 
    });      
    $("#btn2").click(function(){
		window.close();
    });  
    var maxwidth=100;  
    $("img").each(function(){        
        if (this.width>maxwidth)   
         this.width = maxwidth;   
    }); 
    $("#btgender").click(function () {
           //alert($("input[name=rad]:checked"));
           var img=$("input[name=rad]:checked").val();
           var imgname=img.substring(0,img.lastIndexOf("."));
           var imgpath="/uploadfile/image/"+img;
           var imgwidth=$("input[name=rad]:checked").width();
          // alert("2="+callBack);
           //alert("3="+callBack==undefined);
            //if (callBack==null)callBack=window.opener;
            //callBack=window.opener;
           //alert(callBack);
           //window.opener.setColumns(imgname,imgpath,imgwidth);window.close();
           callBack.setColumns(imgname,imgpath,imgwidth);window.close();
    });
	$("input[type='radio']").click(function(){     
		alert("2");                                     
  		// $(this).next().text()
       }); 
	//alert($("input[name=rad]:checked").val());
 }); 
 </script>
   <style>  
.tScroll {overflow: scroll; overflow-x:hidden; height:290px; cursor: default;} 
</style>  
  </head>
  <body>
  	<form id="form1" action="<%=path%>/biz/serviceAC!importImage.action"  method="post" enctype="multipart/form-data">
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  
	  
	  	
	  	<tr><td></td><td>选择文件：</td><td><input type="file"   id="test" name="test" size="40%" ></td></tr>
	  		  
	  	
	

  		
	  	<tr><td></td><td></td>
	  		<td align="center"><input  type="submit" id="btn1"  value="上传"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>	  	
  	</table>
	</form>	
	<input type="button" id="btgender" value="选中所选图片"/>
  	<!-- <div class="tScroll" id="img_show_id"> -->
  	<table cellspacing="0" width="50%" align="center" id="img_show_table"> 
	</table>
  	<!--</div>-->
  </body>
</html>

<%
if(request.getAttribute("result")!=null){
	if(request.getAttribute("result").equals("1"))
	out.print("<script> alert('"+request.getAttribute("import_result_info")+"');callBack.setColumns('"+request.getAttribute("tpmc")+"','"+request.getAttribute("tplj")+"');window.close();</script>");
	else out.print("<script> alert('"+request.getAttribute("import_result_info")+"');</script>");
} 
%>

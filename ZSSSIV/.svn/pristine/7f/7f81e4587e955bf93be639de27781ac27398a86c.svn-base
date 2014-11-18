<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.kingtone.jw.biz.common.util.Utils"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String listStr = (String)request.getAttribute("listStr");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'main.jsp' starting page</title>
	</head>
	<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"/>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key=<%=Utils.GetConfigByKey("map_key")%>" type="text/javascript"></script>

	
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
  	<script type="text/javascript" src="<%=path%>/ztree/demo_2.6/jquery.ztree-2.6.js"></script>
  	<script type="text/javascript" src="<%=path%>/config.js"></script> 	
	<script type="text/javascript" src="<%=path%>/datetime.js"></script> 
	
	<script type="text/javascript">
	listStr = "<%=listStr%>";
	var map;
	
	var lat;//纬度
	var lon;//经度
	var points = listStr.split("&&");
	if(points.length==1){
		lat = "39.917";
		lon = "116.397";
	}else{
		lat = points[0].split("&")[3];
		lon = points[0].split("&")[2];
	}
	
    function initialize() {
    	if (GBrowserIsCompatible()) {
	        map = new GMap2(document.getElementById("map_canvas"),{ size: new GSize(1000,700) } );
	        map.setCenter(new GLatLng(lat,lon), 11);
	        var customUI = map.getDefaultUI();
	        customUI.maptypes.hybrid = false;
	        map.setUI(customUI);
	        map.addControl(new GOverviewMapControl());
    	}
    	
        for(var j=0;j<points.length-1;j++){
        	var point = points[j].split("&");
        	//alert(point);
        	latlng = new GLatLng(point[3],point[2]);
        	map.addOverlay(createMarker(latlng,point));
        	
        	if(j+1<points.length-1){
        		var pointNext = points[j+1].split("&");
        		var polyline = new GPolyline([new GLatLng(point[3],point[2]),new GLatLng( pointNext[3], pointNext[2])],"#FF0000", 4);
  　   			map.addOverlay(polyline);　
        	}
        }
    }



// 在给定点创建标记
// 点击标记时会隐藏它

function createMarker(latlng, devicename) {
// 创建“微型”标记图标

var blueIcon = new GIcon(G_DEFAULT_ICON);  
blueIcon.image = "<%=path%>/platform/images/icon01.gif"; 
//调整图标在地图中的显示位置

blueIcon.iconAnchor = new GPoint(16, 16);
blueIcon.infoWindowAnchor = new GPoint(16, 0);
blueIcon.iconSize = new GSize(24, 21);//设置图标的大小

blueIcon.shadowSize = new GSize(24, 21);//去掉图标的阴影            
markerOptions = { icon:blueIcon };
var marker = new GMarker(latlng,markerOptions);
marker.value = devicename.toString();
GEvent.addListener(marker,"click", function() {
    var myHtml = "<b>#"+devicename[0].toString()+"</b><br/>" + devicename[1].toString()+"</b><br/>" + latlng.toString();
    map.openInfoWindowHtml(latlng, myHtml);
  });
return marker;
}  
    </script>

	<script type="text/javascript">
	function queryMap()
{
	   var starttime = document.getElementById('startdate').value;
	   var endtime = document.getElementById('enddate').value;
	   var device_id = document.getElementById('reqdevice_id').value;
	   if(starttime==""||endtime==""){
	 	  alert("请选择时间段");
       			return false;
       	}else if(document.getElementById('reqdevice_id').value==""){
       			alert("请选择终端用户");
       			//document.getElementById('reqdevice_id').focus();
       			return false;
       	}	   
       	
       window.location=webroot+"/xajw/jwGpsConfigAC!showMapByDeviceidDD.action?startdate="+starttime+"&enddate="+endtime+"&deviceid="+device_id;
}

	function openDeptTree(url){
		window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
	}
	function setUserID(reqdevice_id){
		$("#reqdevice_id").val(reqdevice_id);//reqdevice_id
	}

	function setUserName(requsername){
		$("#requsername").val(requsername);
	}
	</script>
	<body onload="initialize()" onunload="GUnload()">
	
	<form name="form1" method="post" action="main.aspx" id="form1">
			<div>
				开始时间:
				<input id="startdate" name="startdate" maxlength="10" width="172px" value="" readOnly onClick="SelectDate(this,'yyyy-MM-dd hh:mm:ss',0,0)"/>
				结束时间:
				<input id="enddate" name="enddate" maxlength="10" width="172px" value=""  readOnly onClick="SelectDate(this,'yyyy-MM-dd hh:mm:ss',0,0)"/>
				终端用户：
				<s:hidden name="reqdevice_id" id="reqdevice_id"  value=""/> 
				<input id="requsername" name="requsername" maxlength="10" width="172px" value="" readonly onclick="openDeptTree(webroot+'/biz/common/select_oneuser_tree.jsp')"/>				
				<input type="button" id="btn1" value="查询" OnClick="queryMap();" />
			</div>		
		<div id="map_canvas" style="width: 500px; height: 300px">
		</div>
		</form>
	</body>
</html>

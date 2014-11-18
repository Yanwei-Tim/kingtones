<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="http://10.71.197.167:8080/portal/api.js"></script> -->
<!-- <script type="text/javascript" src="http://10.71.197.167:8080/portal/api.js"></script> -->
<script type="text/javascript" src="http://10.71.197.160:6060/portal/api.js"></script>
<!-- <script type="text/javascript" src="/portal/module/maptest/standard/js/top.js"></script> -->
<style type="text/css">
	  html,body{width:100%;height:100%;}
</style>
<script type="text/javascript">
	var width=400;
	var height=500;
// 	showMapMenu(0,0,width);   callBack_onMapLoadBackFunction,callBack_extentChange,callBack_zoomEnd
	window.onload = initMap;
	function initMap(){
		showMap(0,0,null,null,"4","85.5","46",callBackOnloadFinish,callBack_extentChange,callBack_zoomEnd); //"74.822855","45.55284"
// 		showMap(0,0,null,null,"1","74.822855","45.55284");
	}
	
	function callBackOnloadFinish(){
		
// 		alert('地图加载完毕！');
	}
	
	function callBack_extentChange(xmin, ymin, xmax, ymax){
		
// 		alert("xmin:"+xmin+"\nymin:"+ymin+"\nxmax:"+xmax+"\nymax:"+ymax);
		
	}
	
	function callBack_zoomEnd(level, xmin, ymin, xmax, ymax){
// 		alert("level:"+level+"\nxmin:"+xmin+"\nymin:"+ymin+"\nxmax:"+xmax+"\nymax:"+ymax);
	}
	
	
	
	function getFMap(){
		return fMap;
	}
	function showEagle1() {
		
		
// 		getFMap().getFDraw().drawSimplePoint(84.822855,45.55284,'red','4',0);
		
		//sendMessage("vector","createSimplePoint",'2','0.8','0','circle','id',group)
// 		getFMap().getFVector.createSimplePoint('2','0.8','0','circle','id','group');
// 		alert(getFMap().getFVector());
		
// 		var  color_value = 		"#FF0000"; 
// 		var point_size=  		10;
// 		var point_type =  		0;
// 		var id =  		"id";
// 		var group = 		"group";
		
// 	getFMap().getFVector().createSimplePoint(color_value,point_size,point_type,id,group);

		
		
		
		
		
// 		this.drawImagePoint = function(x,y,imgurl,width,height,id,group) {
// 			ftool.sendMessage("draw",x,y,imgurl,width,height,id,group);
// 		}
		
		
		
//getFMap().getFDraw().drawImagePoint("84.822855","45.55284",'http://www.baidu.com/img/baidu_sylogo1.gif','500','500', 'id', 'group');
		
		
// 		alert('测试ing...');
		
// 		1
		getFMap().getFInput().inputPoint(callBackMessage);
		
// 		getFMap()
		
		//2  inputRect
// 		capturePartMap();
		
		//3inputLine
//		getFMap().getFInput().inputLine(null);
		
		//4 inputPoly
// 		getFMap().getFInput().inputPoly(null);
		
//		eagleFlag=!eagleFlag;
//		getFMap().showEagle(eagleFlag);
	}
	
	function callBackMessage(x,y){
		
		
// 		8）	画点图片
// 		sendMessage("draw","drawImagePoint","84.822855","45.55284",'http://www.baidu.com/img/baidu_sylogo1.gif','150','150', 'id', 'group',’window’ ,’ http://www.baidu.com/’ ,’point ,’500’ ,’400’)；

		
		
// 		getFMap().getFDraw().drawImagePoint (x,y,'http://www.baidu.com/img/baidu_sylogo1.gif','300','300', 'id', 'group','window','http://www.baidu.com/','point','500','400')
// 		getFMap().getFDraw().drawImagePoint (x,y,'http://www.baidu.com/img/baidu_sylogo1.gif','300','300', 'id', 'group','window','/portal/module/map/standard/invokedByFlex.jsp','point','500','400')
		getFMap().getFDraw().drawImagePoint (x,y,'http://www.baidu.com/img/baidu_sylogo1.gif','300','300', 'id', 'group','all','fixme,/portal/module/map/standard/invokedByFlex.jsp','point','500','400')
// 		getFMap().getFDraw().drawImagePoint (x,y,'http://www.baidu.com/img/baidu_sylogo1.gif','300','300', 'id', 'group','window','D:/lfc_Develop/eclipseWorkSpace7/pgis/portal/module/map/standard/invokedByFlex.jsp','point','500','400')
		
		getFMap().centerAt(x,y);
// 		alert(x+'---'+y);
		
	}
	
	
	function showEagle2() {
		
		alert('测试ing...');
		
		//1
		getFMap().getFInput().inputPoint();

 
	}
	function showEagle3() {
		
		
// 		var shell = new ActiveXObject('WScript.Shell');
		
// 		shell.SendKeys('{F11}');
		
		
		
// 		var name = 'TomAndJerry';
		
// 		var tempStr = "<invoke name=\""+name+"\" returntype=\"javascript\">"
		
		
// 		alert(tempStr);
		
		getFMap().fullScreenByJs();
		
		
		//getFMap().fullScreen('full');
		
		//alert('测试ing...');
		
 
		//getFMap().getFInput().inputPoly(null);
		
 
	}
	
	
	function showEagle31() {
		
// 		getFMap().fullScreenByJs();
		getFMap().fullScreen('full');
		
	}
	
	
	
	
	
	function showEagle4() {
		
// 		invokeBufferProcesser();
		invokeBufferProcesser201301041101();
	}
	 
	function capturePartMap() {
		getFMap().getFInput().inputRect(capturePartMapBack);
	}
	
	function capturePartMapBack(x1,y1,x2,y2) {
		alert("x1:"+x1+"--\ny1:"+y1+"--\nx2:"+x2+"--\ny2:"+y2);
		getFMap().clearInput();
		getFMap().captureMapBox(x1,y1,x2,y2,captureMapBack);
	}
	
	function dingwei(array){
		alert('here');
// 		getFMap().setMapLevel(2);
// 		for(var i=0;i<array.length;i++){
	
// 		getFMap().getFInput().inputPoint(callBackMessage);
	
// 		getFMap().getFDraw().drawImagePoint (85.09566,45.664479,'http://www.baidu.com/img/baidu_sylogo1.gif','20','20', 'id', 'group')
		getFMap().getFDraw().drawImagePoint ("74.822855","45.55284",'http://www.baidu.com/img/baidu_sylogo1.gif','300','300', 'id', 'group')
// 		}
// 		getFMap().setMapLevel(2);
// 		getFMap().centerAt(85.09566,45.664479);
		
		var temp1 = (getFMap().getMapMinx()+getFMap().getMapMaxx())*0.5;
		var temp2 =(getFMap().getMapMiny()+getFMap().getMapMaxy())*0.5;
		
// 		alert(temp1+"--"+temp2);
		
		
		getFMap().centerAt("74.822855","45.55284");
// 		getFMap().centerAt(85.09566,45.664479);
// 		getFMap().centerAt(temp1,temp2);
		
		
		

// 		this.getMapMinx = function() {
// 			var ret=ftool.getMessage("getMapMinx");
// 			return parseFloat(ret);
// 		}
// 		this.getMapMiny = function() {
// 			var ret=ftool.getMessage("getMapMiny");
// 			return parseFloat(ret);
// 		}
// 		this.getMapMaxx = function() {
// 			var ret=ftool.getMessage("getMapMaxx");
// 			return parseFloat(ret);
// 		}
// 		this.getMapMaxy = function() {
// 			var ret=ftool.getMessage("getMapMaxy");
// 			return parseFloat(ret);
// 		}
		
		
		
		getFMap().refresh();
		
	
		
	}
	
	//sendMessage ("map","toUrl"," http://www.baidu.com/ ","_blank")
	this.testing5 = function(){
		
		getFMap().toUrl("http://www.baidu.com","_blank");
		
	}
	
	this.testing6 = function(){
		
		getFMap().setMapLevel("5");
		
	}
	
	this.testing7 = function(){
		getFMap().centerAt2WebMercator("80","80");
	}
	
	this.testing8 = function(){
		alert('testing8');
		//102100坐标系(WGS 1984 Web Mercator Auxiliary Sphere坐标系)
		getFMap().centerAt("10000","2000000");
		
	}
	
	this.testing9 = function(){
		
		var Minx = getFMap().getMapMinx();
		var Miny = getFMap().getMapMiny();
		var Maxx = getFMap().getMapMaxx();
		var Maxy = getFMap().getMapMaxy();
		
		var extentStr = 'Minx:'+Minx+"\nMiny:"+Miny+"\nMaxx:"+Maxx+"\nMaxy:"+Maxy;
		
		alert(extentStr);
	}
	
	this.testing10 = function(){
		
	 //ftool.sendMessage("createSimplePoint",color,size,type,id,group,tipType,tipValue,label,w_width,w_height,edit,over);
		
	  getFMap().getFVector().createSimplePoint('2','10', 'circle','id','group' ,'all' ,'点,http://www.baidu.com/' ,'point' ,'500' ,'400',true,true,callBackcreateSimplePoint);//可编辑
// 		getFMap().getFVector().createSimplePoint('2','10', 'circle','id','group' ,'all','点','http://www.baidu.com/','point','500','400',true);
// 		getFMap().getFVector().createSimplePoint('2','10', 'circle','id','group' ,'tip','点','http://www.baidu.com/');
		
	}
	
	function callBackcreateSimplePoint(result){
		alert('callBackcreateSimplePoint-->'+result);
	}
	
	
	
	this.testing101 = function(){
		
// 		var str1:String = "txt,车站;txt,车站的位置;\ntxt,公交线路;";
// 	getFMap().getFVector().createSimplePoint('2',10', 'circle','id',’group’ ,’windowInfo’ , str1,"弹窗" ,’500’ ,’400’);
// 	自定义弹窗内容格式:	换行用"\n"，同一行的内容用";"隔开
// 	元素为txt （txt,要显示的文字）         举例"txt,车站"(元素属性用","隔开) 
// 	 	  link （link,按钮标签,按钮连接）    举例"link,驾车,http://news.baidu.com/"
// 		  img   (img,图片链接，图片宽,图片高) 举例"img,http://img.baidu.com/img/image/imglogo.gif,117,38"
// 		  video	(video,视频链接，视频宽, 视频高) 举例"video,http://10.71.197.160:8080/portal/module/map/standard/test.flv,180,170"
// 	图片和视频的宽高都不是必选项

		var str1 = "txt,车站;txt,车站的位置;\ntxt,公交线路;\nlink,http://news.baidu.com/\nlink,http://news.baidu.com/;\nimg,http://img.baidu.com/img/image/imglogo.gif,117,38;\nvideo,http://10.71.197.160:8080/portal/module/map/standard/test.flv,180,170";
        getFMap().getFVector().createSimplePoint('2','10', 'circle','id','group' ,'windowInfo' , str1,"弹窗" ,'500','400');
		
		//drawSimplePoint
		
// 		DispatchManager.sendMessage("draw","drawSimplePoint", "-100.88134765625","39.6923828125",'0','20','circle','id', 'group','windowInfo',str1,'123','300','280','','','');
				
		
		
// 		getFMap().getFDraw().drawSimplePoint("-100.88134765625","39.6923828125",'0','20','circle','id', 'group','windowInfo',str1,'123','300','280');
		
	}
	
	
	
	
	
	
	this.testing11 = function(){
		//ftool.sendMessage("drawSimplePoint",x,y,color,size,style,id,group,tipType,tipValue,label,w_width,w_height,over);
		getFMap().getFDraw().drawSimplePoint("84.82285548824052","45.55284093472116",'0','20','circle','id','group','window','http://www.baidu.com/','','','',true);
		
	}
	
    this.testing111 = function(){
		
// 		getFMap().getFDraw().drawSimplePoint("-100.88134765625","39.6923828125",'0','20','circle','id', 'group','windowInfo',str1,'123','300','280');
    	
    	var str1 = "txt,车站;txt,车站的位置;\ntxt,公交线路;\nlink,http://news.baidu.com/;\nimg,http://img.baidu.com/img/image/imglogo.gif,117,38;\nvideo,http://10.71.197.160:8080/portal/module/map/standard/test.flv,180,170";
    	
    	//DispatchManager.sendMessage("draw","drawSimplePoint", "-100.88134765625","39.6923828125",'0','20','circle','id', 'group','windowInfo',str1,'123','300','280','','','');
		getFMap().getFDraw().
		drawSimplePoint("84.82285548824052","45.55284093472116",'0','20','circle','id','group','windowInfo',str1,'http://www.baidu.com/','300','300');
		
		
// 		getFMap().getFVector().createSimplePoint('2','10', 'circle','id','group' ,'windowInfo' , str1,"弹窗" ,'500','400');
		
	}
	

	this.testing12 = function(){
		
		alert("flg_gloableOnMapLoad-->"+flg_gloableOnMapLoad);
		
	}
// 	testing12();
	
	this.testing13 = function(){
		                                  //11
   //sendMessage("vector","createRect",'1','0xff0000', '1','0.8','id',group, ’’ ,’’ ,’’,’’ ,’’ ,true)；
		getFMap().getFVector().createLine ('0xff0000,0','10', 'solid','id', 'group' ,'all','点,http://www.baidu.com/','8','9','10',true,true,callBack_createLine);
		
	}
	
	function callBack_createLine(result){
		
		alert('callBack_createLine-->'+result[0].getArray4Graphic()[0].getGrometry());
		
	}
	
	
	//自定义弹窗
	this.testing131 = function(){
		var str1 = "txt,车站;txt,车站的位置;\ntxt,公交线路;\nlink,http://news.baidu.com/;\nimg,http://img.baidu.com/img/image/imglogo.gif,117,38;\nvideo,http://10.71.197.160:8080/portal/module/map/standard/test.flv,180,170";
		getFMap().getFVector().createLine ('0xff0000','10', 'solid','id', 'group' ,'windowInfo',str1,'点,http://www.baidu.com/','http://www.baidu.com/');
		
	}
	
	
	this.testing14 = function(){
		
	   //sendMessage("vector","createPoly",'1','0xff0000', '1','0.8','id',’group’, ’7’ ,’8’ ,’9’,’10’ ,’11’ ,true)；
		getFMap().getFVector().createPoly ('1','0xff0000,0', '1','0.8','id','group','window','http://www.baidu.com/','9','10','11',true,true,callBack4createPolyNow);
		
	}
	
	function callBack4createPolyNow(js){
		
		alert('callBack4createPolyNow-->'+js[0].getArray4Graphic()[0].getGrometry());
		
		
	}
	
	
	
	function callBack4createPoly(objectJson){
		
// 		var object = eval(result);
// 		eval("var object = "+result);
		
		var geometryType = objectJson.result.type;
		
		alert('callBack4createPoly-->'+geometryType);
		
		
		var arrayGeometry = objectJson.result.geometry;
		
		alert(arrayGeometry.length);
		
		var xArray = new Array();
		var yArray = new Array();
		for(var i = 0 ; i < arrayGeometry.length ; i++){
			var currentCoord = arrayGeometry[i];
			var x = currentCoord.x;
			var y = currentCoord.y;
			alert("x:"+x+"\ny:"+y);
			xArray.push(x);
			yArray.push(y);
		}		
		
	}
	
	
	
	this.testing15 = function(){
		//sendMessage("vector","createCircle",'1','0xff0000', '1','0.8','id',group, ’7’ ,’8’ ,’9’,’10’ ,’11’ ,true)；
		getFMap().getFVector().createCircle ('1','0xff0000', '1','0.8','id','group','window','http://www.baidu.com/','','','',true,callBack4createCircle);
		
	}
	
	function callBack4createCircle(result){
		
		alert('callBack4createCircle-->'+result);
		
	}
	
	
	
	
	//自定义弹窗
	this.testing151 = function(){
		
		var str1 = "txt,车站;txt,车站的位置;\ntxt,公交线路;\nlink,驾车,http://news.baidu.com/;\nimg,http://img.baidu.com/img/image/imglogo.gif,117,38;\nvideo,http://10.71.197.160:8080/portal/module/map/standard/test.flv,180,170";
		getFMap().getFVector().createCircle ('1','0xff0000', '1','0.8','id','group','windowInfo',str1,'http://www.baidu.com/');
		
	}
	
	this.testing16 = function(){
// 		 sendMessage("vector","createRect",'1','0xff0000', '1','0.8','id',group, ’7’ ,’8’ ,’9’,’10’ ,’11’ ,true)；
		getFMap().getFVector().createRect ('1','0xff0000', '1','0.8','id','group','window','http://www.baidu.com/','','','',true,callBack4createRect);
		
	}
	
	function callBack4createRect(result){
		
		alert('callBack4createRect-->'+result);
		
	}
	
	
	
	
	this.testing17 = function(){
		
// 		ftool.sendMessage("createPointImage",    url,width,height,id,group,tipType,tipValue,label,w_width,w_height,over);
		getFMap().getFVector().createPointImage('http://www.baidu.com/img/baidu_sylogo1.gif','150','150','id','group','window' ,'http://www.baidu.com/','','','',true);		
	}
	
	this.testing18 = function(){
		
		getFMap().getFVector().createPointString('物价局','','15','0','true','id','group','window','http://www.baidu.com/');
		
	}
	
	
	this.testing19 = function(){
		
		getFMap().getFDraw().drawSimplePoint("90.82285548824052","45.55284093472116",'0','20','circle','id','group','window','http://www.baidu.com/','','','',true);	
		
	}
	
	this.testing20 = function(){
		//ftool.sendMessage("drawImagePoint",x,          y,          imgurl,width,height,id,group,tipType,tipValue,label,w_width,w_height,over);
		getFMap().getFDraw().drawImagePoint("84.822855","50.55284",'http://www.baidu.com/img/baidu_sylogo1.gif','150','150','id','group','window','http://www.baidu.com/','label','','',true);
		
	}
	
	this.testing21 = function(){
		
		getFMap().getFDraw().drawString("85","40",'物价局','','0','15','jj','kk','window','http://www.baidu.com/' ,'point' ,'500' ,'400');		
		
		
	}
	this.testing22 = function(){
		
		var x_Array = new Array('84.81139581434006','84.82285548824052','84.84083532142918','84.82739984168381');
// 		var x_Array = new Array(84.81139581434006,84.82285548824052,84.84083532142918,84.82739984168381);
		//[45.559558674593845,45.55284093472116,45.55639738524199,45.54355464725009]
		
// 		var y_Array = new Array(45.559558674593845,45.55284093472116,45.55639738524199,45.54355464725009);
		var y_Array = new Array('45.559558674593845','45.55284093472116','45.55639738524199','45.54355464725009');
// 		getFMap().getFDraw().drawLineSymbol([84.81139581434006,84.82285548824052,84.84083532142918,84.82739984168381],[45.559558674593845,45.55284093472116,45.55639738524199,45.54355464725009],'0','5','solid','id','group','window','http://www.baidu.com/' ,'point' ,'500' ,'400');		
		//ftool.sendMessage("drawLineSymbol",x_arr,y_arr,color,width,dashStyle,id,group,tipType,tipValue,label,w_width,w_height,over);
		getFMap().getFDraw().drawLineSymbol(x_Array,y_Array,'0xff0000,0','5','solid','id','group','window','http://www.baidu.com/' ,'point' ,'500' ,'400',true);		
		
		
	}
	
	this.testing23 = function(){
// 		ftool.sendMessage("drawPolygonSymbol",x_arr,y_arr,color,fillColor,weight,opacity,id,group,tipType,tipValue,label,w_width,w_height,over);
		getFMap().getFDraw().drawPolygonSymbol("60,70,70,60,60","40,40,50,50,40",'0','0xff0000,0',5,1,'id','group','window' ,'http://www.baidu.com/' ,'point' ,'500' ,'400',true);
		
	}
	
	this.testing24 = function(){
		
		getFMap().getFDraw().drawRect("60","50","84.82285548824052","45.55284093472116",'0','0xff0000','3','0.8','as','dd','window','http://www.baidu.com/','point' ,'500' ,'400');
		
	}
	
	this.testing25 = function(){
		//ftool.sendMessage("drawCircle",x,y,r,color,fillColor,weight,opacity,id,group,tipType,tipValue,label,w_width,w_height,over);
		getFMap().getFDraw().drawCircle("85","40",'80','0xff0000,0','0xff0000,0', '3','0.8','as','dd','window' ,'http://www.baidu.com/' ,'point' ,'500' ,'400',true);		
	}
	
	this.testing26 = function(){
		//first invokke testing25
		getFMap().getFVector().removeVectorById ('as');	
	}
	
	//1)	通过group删除绘制内容
	this.testing27 = function(){
		//first invokke testing25
		getFMap().getFVector().removeVectorByType ('dd');
		
	}
	
	this.testing28 = function(){
		
		getFMap().getFInput().inputPoint(callBackMessage4testing28);
		
	}
	
	function callBackMessage4testing28(x,y){
		alert("x:"+x+"y:"+y);
	}
	
	
	this.testing29 = function(){
		
		getFMap().getFInput().inputRect(capturePartMapBack);
		
	}
	
	this.testing30 = function(){
		
		getFMap().getFInput().inputLine(inputLineCallback);
		
	}
	
	this.inputLineCallback = function(xArray,yArray){
		alert('xArray:'+xArray+"\nyArray:"+yArray);
	}
	
	
	this.testing31 = function(){
		
		getFMap().getFInput().inputPoly(inputPolyCallback);
		
	}
	
	this.inputPolyCallback = function(xArray,yArray){
		
		alert('xArray:'+xArray+"\nyArray:"+yArray);
		
	}
	
	this.testing32 = function(){
		getFMap().pan();
	}
	
	this.testing33 = function(){
		getFMap().zoomIn();
	}
	
	this.testing34 = function(){
		getFMap().zoomOut();
	}
	
	this.testing35 = function(){
		
		//first click drawCircle
		
		//84.85182105606516,83.80731186700266,83.85235078887766,84.85685997794016,85.85182105606516
// 		var x_Array = new Array('84.85182105606516','83.80731186700266','83.85235078887766','84.85685997794016','85.85182105606516');
		
		//45.592498393845226,45.595663870407726,45.59917819540773,45.59602563915773,45.592498393845226
// 		var y_Array = new Array('45.592498393845226','45.595663870407726','45.59917819540773','45.59602563915773','45.592498393845226');
		
// 		var xstr:String="84.83475899999999,84.89088603906248,84.88687696484374,84.89088603906248,84.89088603906248,84.79867733203123,84.79867733203123,84.70245955078124,84.77061381249999,84.81872270312499,84.92295863281248,84.99111289453124,85.07931252734373,85.22363919921874,85.26372994140624";
// 		var ystr:String="44.393545787109375,44.43764560351563,44.50579986523437,44.585981349609376,44.64611746289062,44.81449858007812,44.870625619140625,45.06306118164062,45.23144229882812,45.41185063867187,45.52009564257812,45.58023175585937,45.64036786914062,45.72054935351562,45.76064009570
		
// 		var x_Array = new Array('84.83475899999999',''84.89088603906248,84.88687696484374,84.89088603906248,84.89088603906248,84.79867733203123,84.79867733203123,84.70245955078124,84.77061381249999,84.81872270312499,84.92295863281248,84.99111289453124,85.07931252734373,85.22363919921874,85.26372994140624);
		
		startPointMove();
		
// 		getFMap().getFVector().moveById("as","5000",x_Array,y_Array,"false");
	}
	
	function startPointMove(){//移动
		
		alert('先调用drawCircle，在页面画出操作图形实体\n尽量设置level为大级别，否则可能看不出移动效果');
		
		var xstr="84.83475899999999,84.89088603906248,84.88687696484374,84.89088603906248,84.89088603906248,84.79867733203123,84.79867733203123,84.70245955078124,84.77061381249999,84.81872270312499,84.92295863281248,84.99111289453124,85.07931252734373,85.22363919921874,85.26372994140624";
		var ystr="44.393545787109375,44.43764560351563,44.50579986523437,44.585981349609376,44.64611746289062,44.81449858007812,44.870625619140625,45.06306118164062,45.23144229882812,45.41185063867187,45.52009564257812,45.58023175585937,45.64036786914062,45.72054935351562,45.76064009570312";
		getFMap().getFVector().moveById('as',5000,xstr,ystr);
	}
	
	
	
	
	
	this.testing36 = function(){
		
		alert('先调用drawCircle，在页面画出操作图形实体\n尽量设置level为大级别，否则可能看不出移动效果');
		
		//84.85182105606516,83.80731186700266,83.85235078887766,84.85685997794016,85.85182105606516
		var x_Array = new Array('84.85182105606516','83.80731186700266','83.85235078887766','84.85685997794016','85.85182105606516');
		
		//45.592498393845226,45.595663870407726,45.59917819540773,45.59602563915773,45.592498393845226
		var y_Array = new Array('45.592498393845226','45.595663870407726','45.59917819540773','45.59602563915773','45.592498393845226');
		
		
		getFMap().getFVector().moveByGroup('dd',"5000",x_Array,y_Array,"false");
	}
	
	this.testing37 = function(){
		getFMap().getFInput().inputCircle(inputCircleBackFunc);
	}
	
	this.inputCircleBackFunc = function(x,y,r){
		alert("x:"+x+"\ny:"+y+"\nr:"+r);
	}
	
	this.testing38 = function(){
		
		alert('先调用drawCircle，在页面画出操作图形实体，\n并且调用 moveById or moveByGroup使其移动，并且保持移动状态\n尽量设置level为大级别，否则可能看不出移动效果');
		
		//testing17 createPointImage  start
		getFMap().getFVector().start();
		
	}
	
	this.testing39 = function(){
		alert('先调用drawCircle，在页面画出操作图形实体，\n并且调用 moveById or moveByGroup使其移动，并且保持移动状态\n尽量设置level为大级别，否则可能看不出移动效果');
		//testing17 createPointImage  start
		getFMap().getFVector().start();
		
	}
	this.testing40 = function(){
		alert('先调用drawCircle，在页面画出操作图形实体，\n并且调用 moveById or moveByGroup使其移动，并且保持移动状态\n尽量设置level为大级别，否则可能看不出移动效果');
		//testing17 createPointImage  start
		getFMap().getFVector().start();
		
	}
	this.testing41 = function(){
		alert('先调用drawCircle，在页面画出操作图形实体，\n并且调用 moveById or moveByGroup使其移动，并且保持移动状态\n尽量设置level为大级别，否则可能看不出移动效果');
		//testing17 createPointImage  start
		getFMap().getFVector().start();
		
	}
	this.testing412 = function(){
		alert('先调用drawCircle，在页面画出操作图形实体，\n并且调用 moveById or moveByGroup使其移动，并且保持移动状态\n尽量设置level为大级别，否则可能看不出移动效果');
		//testing17 createPointImage  start
		getFMap().getFVector().pause();
		
	}
	this.testing413 = function(){
		alert('先调用drawCircle，在页面画出操作图形实体，\n并且调用 moveById or moveByGroup使其移动，并且保持移动状态\n尽量设置level为大级别，否则可能看不出移动效果');
		//testing17 createPointImage  start
		getFMap().getFVector().resume('as');
		
	}
	this.testing414 = function(){
		alert('先调用drawCircle，在页面画出操作图形实体，\n并且调用 moveById or moveByGroup使其移动，并且保持移动状态\n尽量设置level为大级别，否则可能看不出移动效果');
		//testing17 createPointImage  start
		getFMap().getFVector().stop();
		
	}
	//14）	画闪烁点
	this.testing42 = function(){
		
		getFMap().getFDraw().drawDynPoint("85.50", "45.15","red","yellow","50","circle","5");
		
	}
	
	//画闪烁线
	this.testing43 = function(){
		
		getFMap().getFDraw().drawLineDynSymbol ([83.18,83.84,83.84,83.18],[44.66,44.66,45.63,45.63],"red",'blue',"20","solid","5");
		
	}
	
	//画闪烁面
	this.testing44 = function(){
		
		getFMap().getFDraw().drawPolygonDynSymbol([60,70,70,60,60],[40,40,50,50,40],"red",'blue',"black",'blue',"5","0.5","-1");
		
	}
	
	//画闪烁面
	this.testing45 = function(){
		
		getFMap().getFDraw().drawDynRect("60","50","84.82","45.55","red",'blue',"black",'blue',"5","0.5","6");
		
	}
	
	//画闪烁圆
	this.testing46 = function(){
		
		getFMap().getFDraw().drawDynCircle ("60","50","100","red",'blue',"black",'blue',"5","0.5","6");
		
	}
	
	this.testing47 = function(){
		
		captureMap();
		
		
	}
	
	
	this.testing48 = function(){
		window.open('/portal/module/map/standard/print2Arcgis.html');
	}
	
	this.testing481 = function(){
		alert('在showMap方法中加入，对应触发相应事件时进行响应的回调函数\ncallBackOnloadFinish\ncallBack_extentChange\ncallBack_zoomEnd\nshowMap(0,0,null,null,"4","85.5","46",callBackOnloadFinish,callBack_extentChange,callBack_zoomEnd);');
	}
	
	
	this.testing49 = function(){
<!-- 		sendMessage("routeByPoint","-107.6953125,-105.4541015625","41.0546875,41.0546875","http://tasks.arcgisonline.com/ArcGIS/rest/services/NetworkAnalysis/ESRI_Route_NA/NAServer/Route"); -->
			//x_arr,y_arr,url
// 			var x_arr = [-107.6953125,-105.4541015625];  
// 			var x_arr = new Array('-107.6953125','-105.4541015625');  
			var x_arr = "-107.6953125,-105.4541015625";  
// 			var y_arr = [41.0546875,41.0546875];  
// 			var y_arr = new Array('41.0546875','41.0546875');  
			var y_arr ="41.0546875,41.0546875";  
			var url = "http://tasks.arcgisonline.com/ArcGIS/rest/services/NetworkAnalysis/ESRI_Route_NA/NAServer/Route";
	        
			getFMap().getFRouteQuery().routeByPoint(x_arr,y_arr,url,callBack_routeByPoint);
			
	}
	
	function callBack_routeByPoint(stopx,stopy,linex,liney,distance){
		alert("distance-->"+distance);
		alert("hallo_stopx:"+stopx+"\nstopy:"+stopy+"\nlinex:"+linex+"\nliney:"+liney);
		
		
	}
	

	this.testing491 = function(){
		<!-- 		sendMessage("routeByPoint","-107.6953125,-105.4541015625","41.0546875,41.0546875","http://tasks.arcgisonline.com/ArcGIS/rest/services/NetworkAnalysis/ESRI_Route_NA/NAServer/Route"); -->
					//x_arr,y_arr,url
//		 			var x_arr = [-107.6953125,-105.4541015625];  
//		 			var x_arr = new Array('-107.6953125','-105.4541015625');  
					var x_arr = "-107.9953125,-105.5541015625";  
//		 			var y_arr = [41.0546875,41.0546875];  
//		 			var y_arr = new Array('41.0546875','41.0546875');  
					var y_arr ="41.1546875,41.1546875";  
					var url = "http://tasks.arcgisonline.com/ArcGIS/rest/services/NetworkAnalysis/ESRI_Route_NA/NAServer/Route";
			        
					getFMap().getFRouteQuery().routeByPoint(x_arr,y_arr,url,callBack_routeByPoint491);
					
			}
			
			function callBack_routeByPoint491(stopx,stopy,linex,liney){
				
				alert("hallo_stopx:"+stopx+"\nstopy:"+stopy+"\nlinex:"+linex+"\nliney:"+liney);
				
			}
	
	
// 		通过鼠标点击查询路径
	this.testing50 = function(){
		
	var url = "http://tasks.arcgisonline.com/ArcGIS/rest/services/NetworkAnalysis/ESRI_Route_NA/NAServer/Route";
		
	getFMap().getFRouteQuery().route(url,callBack_route);
	
	}
	
	function callBack_route(stopx,stopy,linex,liney,distance){
		
// 		alert("callBackfunction--"+'stopx:'+stopx+"\nstopy:"+stopy+"\nlinex:"+linex+"\nliney:"+liney+"\ndistance:"+distance);
		alert("\ndistance:"+distance);
		
		
	}
	
	//通过鼠标添加障碍物  (该方法需要先执行通过鼠标点击查询路径 之后再添加障碍物)
	this.testing502 = function(){
		
		getFMap().getFRouteQuery().addBarrierByMouse();
		
	}
	
	////通过鼠标添加站点 (该方法需要先执行通过鼠标点击查询路径 之后再添加站点)
	this.testing503 = function(){
		
		getFMap().getFRouteQuery().addStopByMouse();
		
	}
	
	
	
	
	
	//停止鼠标查询
	this.testing51 = function(){
		
		getFMap().getFRouteQuery().routeStop();
		
	}
	
	//清除查询获得的路径和点
	this.testing52 = function(){
		
		getFMap().getFRouteQuery().routeClear();
		
	}
	
	this.testing53 = function(){
		
		getFMap().measure();
		
	}
	
	this.testing54 = function(){
		
		getFMap().measureArea();
		
	}
	
	this.testing55 = function(){
		//87.215433125,35.269636875
		
		//70.340433125,108.836526875
		//23.140730625000003,44.761824375
		
      //getFMap().pointIn (x,y, x_arr, y_arr);	
// 		getFMap().pointIn (80,60, [60,70,70,60,60,80,60], [40,40,50,50,40,60,80],callBack_pointIn);	
// 		getFMap().pointIn (87.215433125,35.269636875, [70.340433125,108.836526875], [23.140730625000003,44.761824375],callBack_pointIn);	
		
		//97.234964375,37.379011875
		
		//70.340433125,23.140730625000003
		//108.836526875 ,23.140730625000003
		//108.836526875,44.761824375
		//87.215433125,108.836526875
		//70.340433125,23.140730625000003
		
		getFMap().pointIn (87.215433125,35.269636875, [70.340433125,108.836526875,108.836526875,87.215433125,70.340433125],[23.140730625000003,23.140730625000003,44.761824375,108.836526875,23.140730625000003],callBack_pointIn);	
		
	}
	
	function callBack_pointIn(flag){
		
		alert('回调flag:'+flag);
		
	}
	
	

	this.testing56 = function(){
		
// 		fMap.getFQuery.query(url,where, outFields) 
//sendMessage("query",'http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Demographics/ESRI_Census_USA/MapServer/5',"STATE_NAME = 'Alaska'",'MED_AGE,POP2007');
// getFMap().getFQuery().query('http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Demographics/ESRI_Census_USA/MapServer/5',"STATE_NAME = 'Alaska'",'MED_AGE,POP2007'); 
		
		//点
		//getFMap().getFQuery().query('http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Demographics/ESRI_Census_USA/MapServer/0',"ObjectID=0",'ObjectID'); 
		
		
		//线
		getFMap().getFQuery().query('http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Specialty/ESRI_StatesCitiesRivers_USA/MapServer/1',"FID=53",'FID',callBack_query); 
		
	//http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Specialty/ESRI_StatesCitiesRivers_USA/MapServer/layers
	
		
	}
	
	function callBack_query(data){
		
// 		alert("data:"+data);
		
// 		var straw = {"result":[{"array":{"y":43.82882039200006,"x":87.62735519900008},"attributes":{"ADDNAME":null,"NAME":"阳光绿岛酒店","TELEPHONE":null}},{"array":{"y":43.88078775400004,"x":87.55535452800007},"attributes":{"ADDNAME":null,"NAME":"阳光大饭店","TELEPHONE":null}}]};
		var aa={"result":[{"array":{"y":43.82882039200006,"x":87.62735519900008},"attributes":{"ADDNAME":null,"NAME":"阳光绿岛酒店","TELEPHONE":null}},{"array":{"y":43.88078775400004,"x":87.55535452800007},"attributes":{"ADDNAME":null,"NAME":"阳光大饭店","TELEPHONE":null}}]};
// 		alert('straw-->'+straw);
		var obj = aa;
// 		eval("var obj = "+ aa);
		
// 		alert(obj.result[0].array.y);
		alert(obj.result[0].array.y);
		
// 		var obj = eval(data);
		
// 		alert(obj.result[0].attributes.FID);
		
// 		var _data = {"result":[{"attributes":{"FID":53},"array":[[{"m":null,"x":-131.83674956293436,"y":56.65660234327722,"z":null,"spatialReference":null,"type":"esriGeometryPoint","extent":null},{"m":null,"x":-131.88137283455552,"y":56.64216214714732,"z":null,"spatialReference":null,"type":"esriGeometryPoint","extent":null},{"m":null,"x":-132.11335042166186,"y":56.707437822270464,"z":null,"spatialReference":null,"type":"esriGeometryPoint","extent":null},{"m":null,"x":-132.3100546962572,"y":56.635794144706495,"z":null,"spatialReference":null,"type":"esriGeometryPoint","extent":null}]]}]};	
// 		alert("_data === "+ _data.result[0].attributes.FID);
		
// 		var data2 = data;

// 		var dd = {"id":1,"name":"2"};
// 		alert("id === "+dd.id);
// 		dd.id = 1;
// 		dd.sub = new Array();
// 		dd.sub[0] = 1;
		
// 		eval("var obj = "+ data);

// 		var obj = data;
		
// 		alert(obj.result[0].attributes.FID);
		
	}
	
	//cutVector
	this.testing57 = function(){
		//x_arr	矢量经度数组
		//y_arr	矢量纬度数组
		//cutNumber	切割后的数量
		//this.cutVector = function(x_arr,y_arr,cutNumber,id,group,callBack){
			
		//x,y,color,fillColor,weight,opacity,id,group
// 		function(x,y,color,fillColor,weight,opacity,id,group) 
		var xArray = [84.85182105606516,84.84731186700266,84.85235078887766,84.85685997794016,84.85182105606516];
		var yArray = [ 45.592498393845226,45.595663870407726,45.59917819540773,45.59602563915773,45.592498393845226];
		getFMap().getFVector().addPoly(xArray,yArray,null,null,null,null,null,'id1','group1');	
// 		getFMap().getFVector().addPoly(xArray,yArray,color,fillColor,weight,opacity,'id1','group1');	
		
// 		getFMap().getFDraw().drawPolygonSymbol("60,70,70,60,60","40,40,50,50,40",'0','0xff0000',5,1,'id','group','window' ,'http://www.baidu.com/' ,'point' ,'500' ,'400');
		
// 		getFMap().getFVector().addPoly("84,85,85,84,84","44,44,45,45,44",null,null,null,null,null,'id1','group1');	
// 		getFMap().getFDraw().drawPolygonSymbol(xArray,yArray,'0','0xff0000',5,1,'id1','group1','window' ,'http://www.baidu.com/' ,'point' ,'500' ,'400');	
			
			
// 		var	x_arr ;
// 		var y_arr ;
// 		var cutNumber ;
// 		var id;
// 		var group;
		
			
// 		getFMap().getFVector().cutVector(x_arr,y_arr,cutNumber,id,group,callBack);		
	}
	
	this.testing58 = function(){
		var xArray = [84.85182105606516,84.84731186700266,84.85235078887766,84.85685997794016,84.85182105606516];
		var yArray = [ 45.592498393845226,45.595663870407726,45.59917819540773,45.59602563915773,45.592498393845226];
	
	//this.cutVector = function(x_arr,y_arr,cutNumber,id,group,callBack)
// 		getFMap().getFVector().cutVector([84.85182105606516,84.84731186700266,84.85235078887766,84.85685997794016,84.85182105606516],[ 45.592498393845226,45.595663870407726,45.59917819540773,45.59602563915773,45.592498393845226],2,'id1','group1',callBack_cutVector);
		getFMap().getFVector().cutVector(xArray,yArray,2,'id1','group1',callBack_cutVector);
	
	}
	
	function callBack_cutVector(x1,y1,x2,y2){
		
		
		
		alert("callBack_cutVector:\n"+"x1"+x1+"\ny1:"+y1+"\nx2:"+x2+"\ny2:"+y2);	
	
	}
	
	
	
	this.testing59 = function(){
		
		alert(getFMap().onMapLoadBackFunction);
// 		alert(getFMap().level);
		
		
// 		getFMap().getFVector().saveCutVector(callBack_saveCutVector);
		
		
	}
	
	this.testing60 = function(){
		
		
		var param = "callback=readyBack&id="+"id1"+"&kinds="+"kinds";
		
		getFMap().getFTool().PostAjax("getjs",param);
	}
	
	function readyBack(data){
		alert("data-->"+data);
	}
	
	
	
	function callBack_saveCutVector(x1,y1,x2,y2){
		
		alert('callBack_saveCutVector');
		alert('x1:'+x1+"\ny1:"+y1+"\nx2:"+x2+"\ny2:"+y2);
	
	}
	
	
    this.testingJson = function(){
    
    	var thing = { plugin: 'jquery-json', version: 2.4 };

    	var encoded = $.toJSON( thing );
    	// '{"plugin":"jquery-json","version":2.4}'
    	var name = $.evalJSON( encoded ).plugin;
    	// "jquery-json"
    	var version = $.evalJSON(encoded).version;
    	// 2.4
    }
	
	
//     AC_FL_RunContent(
//     		'codebase', 'http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab#version=9,0,45,0',
//     		'pluginspage', 'http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab',
//     		'allowFullScreen', 'true',
//     		'quality', 'best',
//     		'align', 'middle',
//     		'play', 'true',
//     		'loop', 'true',
//     		'scale', 'exactfit',
//     		'wmode', 'window',
//     		'devicefont', 'false',
//     		'bgcolor', '#000000',
//     		'menu', 'false',
//     		'allowScriptAccess','sameDomain',
//     		'width', '760',
//     		'height', '576',
//     		'src', 'index',
//     		'movie', 'index',
//     		'id', 'index',
//     		'name', 'index',
//     		'salign', ''
//     		); 
    
    
    //传递 jsObject --> jsonStr ---->> flex -->jsonStr-->>Servelet--jsonStr->JSONObject->jsStr-->>flex-->>page  
    this.commonProcessJSON = function(){
    	
    	var json = {  
    		    str : "abcde",  
    		    num : 6,  
    		    reg : /foobar/i,  
    		    array : [1,2,3,4,5],  
    		    func : function(x,y){return x+y},  
    		    obj : {a : "b"}  
    		}.toJSON();
    
    	var tempObject = new Object();
    	tempObject.str = "abcde";
    	tempObject.num = 6;
    	tempObject.reg = /foobar/i;
    	tempObject.array = [1,2,3,4,5];
    	tempObject.func = function(x,y){return x+y};
    	var parameterObject = new Object();
    	parameterObject.a = "b";
    	tempObject.obj = parameterObject; 
    	alert(tempObject.toJSON());
    
    
    }
    
    
    
    this.invokeBufferProcesser1 = function(){
		
    	var geometry = new Geometry();
    	geometry.type="line";
    	geometry.xArray=[1,2,3,4];
    	geometry.yArray=[22,22,34,56];
    	
    	var array4InGeometryArray = new Array();
    	
    	array4InGeometryArray.push(geometry);
    	
    	
    	var array4disArray = new Array();
    	
    	array4disArray.push(10.222);
    	array4disArray.push(37.28);
    	array4disArray.push(57.44);
    	
    	var objectBean = new Object();
    	
    	objectBean.inGeometryArray = array4InGeometryArray;
    	
    	objectBean.disArray = array4disArray;
    	
    	objectBean.unionResults = false;
    	
    	var objectBeanStr = objectBean.toJSON();
    	
    	alert('objectBeanStr-->'+objectBeanStr);
    	
		//ftool.sendMessage("query",layerName,where,callback);
    	//invoke servlet
    	var layerName = objectBeanStr;
    	var where ;
    	var x2 ;
    	var y2 ;
    	
    	getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
    	
    }
    
    
 this.invokeBufferProcesser2 = function(){
	
	 
	 //		Buffer	(Geometry[] InGeometryArray,doule[] disArray,bool unionResults)	Polygon[]	g1按distance的距离做缓冲区的图形

	 
	 
	 
	 var _Bean4Graphic = new Bean4Graphic();
	 _Bean4Graphic.id = "id_1318";
	 _Bean4Graphic.group = "group_1318";
	 
	 
	 	
	 	var _Graphic = new Bean4Graphic();	
	 	
	 	
// 	 	 Point _Point4Diy = geometryFactory.createPoint(new Coordinate(84.799,46.337));
// 		 Geometry _GeometryDiyPoint = _Point4Diy.buffer(10.337);
	 	
	 	
	 	var _Point = new Bean4Point();
	 	_Point.x=84.799;
	 	_Point.y=46.337;
	 	_Point.type = "point";
	 	
	 	_Bean4Graphic.geometry = _Point;
	 	
	 	//alert('_Bean4Graphic-->'+_Bean4Graphic.toJSON());
	 	
	 	_Graphic.id = "id1";
	 	
// 	 	_Graphic.setId('id_1');
		
		_Graphic.group = "group1";
		
// 	 	_Graphic.setGroup("group_1");
// 	 	_Graphic.SetGeometry(_Point);
	 	
	 	_Graphic.geometry = _Point;
	 	
	 	_Graphic.bufferParameterValue = 10.337;
	 	
// 	 	_Graphic.set_bufferParameterValue(10.337);
	 	
	 	
		var objectBeanStr = _Graphic.toJSON();
	 	
		
		alert('final--objectBeanStr-->'+objectBeanStr);
		
		
		var layerName = objectBeanStr;
    	var where ;
    	var x2 ;
    	var y2 ;
		
    	
    	
	 	
    	getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
    	
    }
    
    
 //   
 this.invokeBufferProcesser = function(){
	 //Bean4Graphic(_group,_id,_geometry)
	 
	 var xArray= new Array();
	 
	 xArray.push(84.799);
	 
	 var yArray = new Array();
	 
	 yArray.push(46.337);
	 
	 
	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
	 
	 
	 var _Graphic = new Bean4Graphic('group_1','id_1',_Bean4CoordinateItem,10.337);	
	 _Graphic.bufferParameterValue = 12345;
//  	  alert(_Graphic.toJSON());
 
	 
	 var xArray2= new Array();
	 
	 xArray2.push(84.799);
	 
	 var yArray2 = new Array();
	 
	 yArray2.push(46.337);
	 
	 
	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
	 
	 
	 var _Graphic2 = new Bean4Graphic('group_1','id_1',_Bean4CoordinateItem2,10.337);	
	 _Graphic2.bufferParameterValue = 12345;
//  	  alert(_Graphic2.toJSON());
 	  
 	  
 	  var array4Graphic = new Array();
 	  
 	 array4Graphic.push(_Graphic);
 	 array4Graphic.push(_Graphic2); 
 	  
 	 
//  	 alert("array4Graphic.length-->"+array4Graphic.length);
 	  
 	  
 	  var _Bean4GraphicSet = new Bean4GraphicSet(array4Graphic); 
 	  var _Bean4GraphicSet2 = new Bean4GraphicSet(array4Graphic); 
 	 
 	  var array4Bean4GraphicSet = new Array();
 	  
 	 array4Bean4GraphicSet.push(_Bean4GraphicSet); 
 	 array4Bean4GraphicSet.push(_Bean4GraphicSet2); 
 	  
 	  
//  	  alert(_Bean4GraphicSet.toJSON());
 	  
 	  
 	 var _TotalParameter4GraphicSet = new TotalParameter4GraphicSet(array4Bean4GraphicSet);
 	  
//  	  alert(_TotalParameter4GraphicSet.toJSON());
 	  
 	  
 	  
 	  
 	  //---------------------------------------------------------------------------------------
 	  
 		var layerName = _TotalParameter4GraphicSet.toJSON();
    	var where ;
    	var x2 ;
    	var y2 ;
		
    	
    	
	 	
    	getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
 	  
 	  
 	  
 }
    
    
 
 this.invokeBufferProcesser201301041101 = function(){
	 
	 
 	var xArray= new Array();
	 
	 xArray.push(84.799);
	 
	 var yArray = new Array();
	 
	 yArray.push(46.337);
	 
	 
	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
	 
	 
	 
	var xArray2= new Array();
	 
	 xArray2.push(84.799);
	 
	 var yArray2 = new Array();
	 
	 yArray2.push(46.337);
	 
	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
	 
		
	 
	 
	 
	 //-------------------------------------------------------------------------------------------------------
	 var geometeryArray = new Array();
	 geometeryArray.push(_Bean4CoordinateItem);
	 geometeryArray.push(_Bean4CoordinateItem2);
	 
	 var totalParameter = new Object();
	 
	 totalParameter.ModuleType = "Predicates";
	 totalParameter.ActionName = "Equals";
	 totalParameter.geometeryArray = geometeryArray;
	 
	 
	var layerName = totalParameter.toJSON();
	
	alert('数据结构：'+layerName);
	
 	var where ;
 	var x2 ;
 	var y2 ;
 	getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
 }
 
 
 //
 function invokeBufferProcesser201301051047(){
	//A POLYGON ((246.5 265, 360 270, 305 351.5, 223.5 347.5, 246.5 265))
	//Result: POLYGON ((236.8673342980277 262.3145295618744, 213.8673342980277 344.8145295618744, 213.5263356888873 346.7747274931195, 213.5801601385329 348.76363646783744, 214.02667692216937 350.7025224219421, 214.84820997643467 352.51463153064464, 216.01223763393946 354.12822862832957, 217.47268004419837 355.4794369569786, 219.17172331638724 356.5147668272726, 221.04210817239021 357.1932330913771, 223.00979251023566 357.4879776039486, 304.5097925102356 361.4879776039486, 306.5556370918703 361.37825861366247, 308.53618352175164 360.85389790945425, 310.3682980008664 359.93690562788834, 311.97507718851136 358.6657726878759, 313.2890762340993 357.09385512730626, 368.2890762340993 275.59385512730626, 369.20718268585165 273.90227971695435, 369.7842231580483 272.0661503317792, 369.9988220702746 270.15348357237554, 369.8430299345377 268.23513124913063, 369.32261783187226 266.3821557854356, 368.4568636314838 264.66319781906, 367.2778378716124 263.14193351486557, 365.8292157555675 261.8747157788146, 364.1646592707205 260.90848675088677, 362.3458293623792 260.27903890540654, 360.4401017985173 260.0096891736572, 246.9401017985173 255.00968917365722, 245.02714127416883 255.10906034930235, 243.16822424603018 255.57135904144937, 241.4315598190227 256.3796221584054, 239.8808712924233 257.50419216144553, 238.57305796556065 258.9038052866859, 237.5561073360364 260.5271056333177, 236.8673342980277 262.3145295618744))
	 
// 	 (Geometry[] InGeometryArray,doule[] disArray) 返回 Polygon[]  g1按distance的距离做缓冲区的图形
 
	var xArray= new Array();
	 
	 xArray.push(246.5);
	 xArray.push(360);
	 xArray.push(305);
	 xArray.push(223.5);
	 xArray.push(246.5);
	 
	 var yArray = new Array();
	 
	 yArray.push(265);
	 yArray.push(270);
	 yArray.push(351.5);
	 yArray.push(347.5);
	 yArray.push(265);
	 
	 
	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");
	 
	 
	 
// 	var xArray2= new Array();
	 
// 	 xArray2.push(84.799);
	 
// 	 var yArray2 = new Array();
	 
// 	 yArray2.push(46.337);
	 
// 	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
 
 	 
	 var array_Bean4CoordinateItem2 = new Array();
	 
	 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
// 	 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem2);
	 
	 var array4BufferRadius = new Array();
	 array4BufferRadius.push(10);
// 	 array4BufferRadius.push(10.343);
	 
	 
	 getFMap().getGeometryOperation().buffer(array_Bean4CoordinateItem2,array4BufferRadius,callBack4FSpatialQuery);

	 return;
	 
	 
	 
	 
	 var totalParameter = new Object();
	 
	 totalParameter.ModuleType = "Operation";
	totalParameter.ActionName = "Buffer";
// 	 totalParameter.ActionName = "ConvexHull";
	 totalParameter.geometeryArray = array_Bean4CoordinateItem2;
	 totalParameter.BufferRadius = array4BufferRadius;
 	
	 var layerName = totalParameter.toJSON();
		
	alert('数据结构：'+layerName);
		
	 var where ;
	 var x2 ;
	 var y2 ;
// 	 getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
 	
 }
    
 //转换为凸多边形
 function convexHull(){
		
	 //A       POLYGON ((256.5 238.5, 379 237, 356.5 347, 330 270, 256.5 238.5))
	 //Result: POLYGON ((379 237, 256.5 238.5, 356.5 347, 379 237))
	 
     var xArray= new Array();
	 
	 xArray.push(256.5);
	 xArray.push(379);
	 xArray.push(356.5);
	 xArray.push(330);
	 xArray.push(256.5);
	 
	 var yArray = new Array();
	 
	 yArray.push(238.5);
	 yArray.push(237);
	 yArray.push(347);
	 yArray.push(270);
	 yArray.push(238.5);
	  
	 
	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");
	 
 	 
	 var array_Bean4CoordinateItem2 = new Array();
	 
	 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
	 
	 
	 getFMap().getGeometryOperation().convexHull(array_Bean4CoordinateItem2,callBack4FSpatialQuery);
	 
	 
 }
 
 
 //转换为凸多边形
 function convexHull2(){
	//A LINESTRING (200 318, 326 317)
	//Result: LINESTRING (200 318, 326 317)
	
	  var xArray= new Array();
	  xArray.push(200);	
	  xArray.push(326);	
	
	
	
	  var yArray = new Array();
	  yArray.push(318);
	  yArray.push(317);
	 
	  var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Line");
	  
	  var array_Bean4CoordinateItem2 = new Array();
		 
	  array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
		 
		 
	  getFMap().getGeometryOperation().convexHull(array_Bean4CoordinateItem2,callBack4FSpatialQuery);
 }
 
 
 
 
 
 //   求g1与g2相交的图形
 function Intersection(){
 		
	 //A POLYGON ((381 332.5, 254 292, 370 210, 466 295.5, 381 332.5))
	 //B POLYGON ((180.5 225.5, 301.5 224.5, 273.5 350, 214 347.5, 180.5 225.5))
	 //Result: POLYGON ((292.5145163921057 264.7742211710977, 254 292, 284.2854737150388 301.6579660272368, 292.5145163921057 264.7742211710977))
	 
	 
	var xArray= new Array();
	 
	 xArray.push(381);
	 xArray.push(254);
	 xArray.push(370);
	 xArray.push(466);
	 xArray.push(381);
	 
	 var yArray = new Array();
	 
	 yArray.push(332.5);
	 yArray.push(292);
	 yArray.push(210);
	 yArray.push(295.5);
	 yArray.push(332.5);
	 
	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");
	 
	 
	 
	//B POLYGON ((180.5 225.5, 301.5 224.5, 273.5 350, 214 347.5, 180.5 225.5))
	var xArray2= new Array();
	 
	 xArray2.push(180.5);
	 xArray2.push(301.5);
	 xArray2.push(273.5);
	 xArray2.push(214);
	 xArray2.push(180.5);
	 
	 var yArray2 = new Array();
	 
	 yArray2.push(225.5);
	 yArray2.push(224.5);
	 yArray2.push(350);
	 yArray2.push(347.5);
	 yArray2.push(225.5);
	 
	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"Polygon");
	
	 
	 var array_Bean4CoordinateItem2 = new Array();
	 
	 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
	 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
	 
	 
	 getFMap().getGeometryOperation().intersection(array_Bean4CoordinateItem2,_Bean4CoordinateItem2,callBack4FSpatialQuery);
	 
	 return;
	 
 	var totalParameter = new Object();
	 
	totalParameter.ModuleType = "Operation";
	totalParameter.ActionName = "Intersection";
	
	totalParameter.geometeryArray = array_Bean4CoordinateItem2;
	
	totalParameter.mirrorGeometry = _Bean4CoordinateItem3;
    
	
	
	 var layerName = totalParameter.toJSON();
		
		alert('数据结构：'+layerName);
			
		 var where ;
		 var x2 ;
		 var y2 ;
		 getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
    	
    }
    
 
 function union(){
	 
	 //A  POLYGON ((310 370, 213.5 353.5, 300 250, 310 370))
     //B  POLYGON ((196 305.5, 287 315, 230 380, 94 341, 142.5 263, 196 305.5))
	 //C  POLYGON ((248.05698045196175 359.4087065021489, 310 370, 300 250, 248.99243182539487 311.032176948805, 196 305.5, 142.5 263, 94 341, 230 380, 248.05698045196175 359.4087065021489))
	 
	var xArray= new Array();
	 
	 xArray.push(310);
	 xArray.push(213.5);
	 xArray.push(300);
	 xArray.push(310);
	 
	 var yArray = new Array();
	 
	 yArray.push(370);
	 yArray.push(353.5);
	 yArray.push(250);
	 yArray.push(370);
	 
	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");
	 
	var xArray2= new Array();
	 
	 xArray2.push(196);
	 xArray2.push(287);
	 xArray2.push(230);
	 xArray2.push(94);
	 xArray2.push(142.5);
	 xArray2.push(196);
	 
	 var yArray2 = new Array();
	 
	 yArray2.push(305.5);
	 yArray2.push(315);
	 yArray2.push(380);
	 yArray2.push(341);
	 yArray2.push(263);
	 yArray2.push(305.5);
	 
	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"Polygon");
 	 
	 var array_Bean4CoordinateItem2 = new Array();
	
	 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
	 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem2);
	 
	 getFMap().getGeometryOperation().union(array_Bean4CoordinateItem2,callBack4FSpatialQuery);
 
 }
 
 
 function union2(){
	 
	 //A  LINESTRING (384 348, 276 317)
     //B  POLYGON ((202 289, 288 284, 276 356, 215 357, 202 289))
	 //C GEOMETRYCOLLECTION (LINESTRING (384 348, 282.2032400589102 318.780559646539), 
        //POLYGON ((282.2032400589102 318.780559646539, 288 284, 202 289, 215 357, 276 356, 282.2032400589102 318.780559646539)))
	 
	var xArray= new Array();
	 
	 xArray.push(384);
	 xArray.push(276);
	 
	 var yArray = new Array();
	 
	 yArray.push(348);
	 yArray.push(317);
	 
	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Line");
	 
	 
	 //B  POLYGON ((202 289, 288 284, 276 356, 215 357, 202 289))
	var xArray2= new Array();
	 
	 xArray2.push(202);
	 xArray2.push(288);
	 xArray2.push(276);
	 xArray2.push(215);
	 xArray2.push(202);
	 
	 var yArray2 = new Array();
	 
	 yArray2.push(289);
	 yArray2.push(284);
	 yArray2.push(356);
	 yArray2.push(357);
	 yArray2.push(289);
	 
	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"Polygon");
 	 
	 var array_Bean4CoordinateItem2 = new Array();
	
	 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
	 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem2);
	 
	 getFMap().getGeometryOperation().union(array_Bean4CoordinateItem2,callBack4FSpatialQuery);
 
 }
 
 
 
 	// g1 与  g2 不同的图形
 	function Difference(){
 		 //A: POLYGON ((376.5 354, 287 279.5, 428 227.5, 455.5 292.5, 376.5 354))
 		 //B: POLYGON ((218 233.5, 319 236, 280 350, 206.5 353, 218 233.5))
 		 //Result: POLYGON ((300.324121753061 290.5910287218217, 376.5 354, 455.5 292.5, 428 227.5, 306.5900256300726 272.2753096967108, 300.324121753061 290.5910287218217))
 		var xArray = new Array();
 		xArray.push(376.5);
 		xArray.push(287);
 		xArray.push(428);
 		xArray.push(455.5);
 		xArray.push(376.5);
 		 
 		 var yArray = new Array();
 		 yArray.push(354);
 		 yArray.push(279.5);
 		 yArray.push(227.5);
 		 yArray.push(292.5);
 		 yArray.push(354);
 		 
 		 
 		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");
 		 
 		 
 		 //B: POLYGON ((218 233.5, 319 236, 280 350, 206.5 353, 218 233.5))
 		var xArray2= new Array();
 		 
 		 xArray2.push(218);
 		 xArray2.push(319);
 		 xArray2.push(280);
 		 xArray2.push(206.5);
 		 xArray2.push(218);
 		 
 		 
 		 
 		 var yArray2 = new Array();
 		 
 		 yArray2.push(233.5);
 		 yArray2.push(236);
 		 yArray2.push(350);
 		 yArray2.push(353);
 		 yArray2.push(233.5);
 		 
 		 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"Polygon");
 		 
 	 	 
 		 var array_Bean4CoordinateItem2 = new Array();
 		 
 		 
 		 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
 		 
 		 
//  	  difference
 		  getFMap().getGeometryOperation().difference(array_Bean4CoordinateItem2,_Bean4CoordinateItem2,callBack4FSpatialQuery);
 		 
 		  return;
 		 
 		 
 	 	var totalParameter = new Object();
 		 
 		totalParameter.ModuleType = "Operation";
 		totalParameter.ActionName = "Difference";
 		
 		totalParameter.geometeryArray = array_Bean4CoordinateItem2;
 		
 		totalParameter.mirrorGeometry = _Bean4CoordinateItem3;
 	    
 		
 		
 		 var layerName = totalParameter.toJSON();
 			
 			alert('数据结构：'+layerName);
 				
 			 var where ;
 			 var x2 ;
 			 var y2 ;
 			 getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
 	
 	}
 
 	function simplify(){
	
//  		simplify	（Geometry[] InGeometryArray,doule[] toleranceArray)

		var xArray = new Array();
 		
 		xArray.push(84.22799);
 		 
 		 var yArray = new Array();
 		 
 		 yArray.push(46.322237);
 		 
 		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
 		 
 		 var xArray2= new Array();
 		 
 		 xArray2.push(84.799);
 		 
 		 var yArray2 = new Array();
 		 
 		 yArray2.push(46.337);
 		 
 		 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
 		
 		 var array_Bean4CoordinateItem2 = new Array();
 		 
 		 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
 		 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem2);
 		
 		var distanceToleranceArray = new Array();
 		distanceToleranceArray.push(0.006);
 		distanceToleranceArray.push(0.007);
 		
 		//
 		
 		getFMap().getGeometryOperation().simplify(array_Bean4CoordinateItem2,distanceToleranceArray,callBack4FSpatialQuery);
		 
		
 		return;
 		
 		
 		 var totalParameter = new Object();
		 
 		 totalParameter.ModuleType = "Operation";
 		 totalParameter.ActionName = "Simplify";
 		 
 		 totalParameter.geometeryArray = array_Bean4CoordinateItem2;
 		
 		 
 		totalParameter.distanceToleranceArray = distanceToleranceArray;
 		
 		var layerName = totalParameter.toJSON();
			
			alert('数据结构：'+layerName);
				
			 var where ;
			 var x2 ;
			 var y2 ;
			 getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
 	
 	}
	
 	//得到 Geometry的 length and area jsonArray str 
 	function GetLengthAndArea(){
 		
 		//A       POLYGON ((236 287, 322 286, 309 337, 238 345, 236 287))
 		//area :  4253.5
 		//length: 268.1203584505138
 		
 		
 		
		var xArray = new Array();
 		
 		xArray.push(236);
 		xArray.push(322);
 		xArray.push(309);
 		xArray.push(238);
 		xArray.push(236);
 		 
 		 var yArray = new Array();
 		 
 		 yArray.push(287);
 		 yArray.push(286);
 		 yArray.push(337);
 		 yArray.push(345);
 		 yArray.push(287);
 		 
 		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");
 		 
 		
 		 var array_Bean4CoordinateItem2 = new Array();
 		 
 		 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
 		 
//  		getLengthAndArea
 		 
 		 getFMap().getGeometryOperation().getLengthAndArea(array_Bean4CoordinateItem2,callBack4GetLengthAndArea);
 		 
 		 return;
 		 
 		 var totalParameter = new Object();
		 
 		 totalParameter.ModuleType = "Scalar";
 		 totalParameter.ActionName = "GetLengthAndArea"; 		
 		
 		totalParameter.geometeryArray = array_Bean4CoordinateItem2;
 		
 		var layerName = totalParameter.toJSON();
		
		alert('数据结构：'+layerName);
			
		 var where ;
		 var x2 ;
		 var y2 ;
		 getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
 		
 	}
 	
 	function callBack4GetLengthAndArea(js){
 		alert("callBack4GetLengthAndArea:"+js[0].length);
 	}
 	
 	
 	
 	//获取两个图形的最近距离
 	function GetDistance(){
 		
 		//A POLYGON ((343 346, 380 365, 399 306, 317 304, 343 346))
 		//B POLYGON ((236 290, 302 287, 301 286.5, 283 348, 230 337, 236 290))
 		//Result:20.27152669436981
 		
		var xArray = new Array();
 		
 		 xArray.push(343);
 		 xArray.push(380);
 		 xArray.push(399);
 		 xArray.push(317);
 		 xArray.push(343);
 		 
 		 var yArray = new Array();
 		 
 		 yArray.push(346);
 		 yArray.push(365);
 		 yArray.push(306);
 		 yArray.push(304);
 		 yArray.push(346);
 		 
 		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");
 		 
 		 
 		 
 		//B POLYGON ((236 290, 302 287, 301 286.5, 283 348, 230 337, 236 290))
 		 var xArray2= new Array();
 		 
 		 xArray2.push(236);
 		 xArray2.push(302);
 		 xArray2.push(301);
 		 xArray2.push(283);
 		 xArray2.push(230);
 		 xArray2.push(236);
 		 
 		 var yArray2 = new Array();
 		 
 		 yArray2.push(290);
 		 yArray2.push(287);
 		 yArray2.push(286.5);
 		 yArray2.push(348);
 		 yArray2.push(337);
 		 yArray2.push(290);
 		 
 		 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"Polygon");
 		
 		 var array_Bean4CoordinateItem2 = new Array();
 		 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
 		 
 		 
		 var array_Bean4CoordinateItem5 = new Array();
		 array_Bean4CoordinateItem5.push(_Bean4CoordinateItem2);
		 
 		 
	 	 getFMap().getGeometryOperation().getDistance(array_Bean4CoordinateItem2,array_Bean4CoordinateItem5,callBack4getDistance);
		 
		 return;
 		
		 
		 
		 
		 
 		 var totalParameter = new Object();
		 
 		 totalParameter.ModuleType = "Scalar";
 		 totalParameter.ActionName = "GetDistance"; 		
 		
 		totalParameter.geometeryArray = array_Bean4CoordinateItem2;

 		totalParameter.geometeryArraySecond = array_Bean4CoordinateItem5;
 		
		var layerName = totalParameter.toJSON();
		
		alert('数据结构：'+layerName);
			
		 var where ;
		 var x2 ;
		 var y2 ;
		 getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
 	}
 	
 	function callBack4getDistance(js){
 		
 		alert("callBack4getDistance:"+js)
 		alert(js[0]);
 	}
 	
 	
 	
 	function cut(){
 		
		
//  		 "xArray" : [112.30953420700707, 114.60567678513207, 114.58370412888207, 113.92452444138207, 112.47432912888207, 112.30953420700707],
//  		 "yArray" : [39.78572223339635, 39.77473590527135, 38.72004840527135, 37.70930621777135, 37.59944293652135, 39.78572223339635],
 		
 		
 		//polygon
 		var _xArray = [112.30953420700707, 114.60567678513207, 114.58370412888207, 113.92452444138207, 112.47432912888207, 112.30953420700707];
 		var _yArray = [39.78572223339635, 39.77473590527135, 38.72004840527135, 37.70930621777135, 37.59944293652135, 39.78572223339635];
 		
 		var xArray = new Array();
 		for(var i = 0 ; i< _xArray.length; i++){
 			xArray.push(_xArray[i]);
 		}
 		
 		var yArray = new Array();
 		for(var j = 0 ; j< _xArray.length; j++){
 			yArray.push(_yArray[j]);
 		}
 		
 		 var _Bean4CoordinateItemPolygon = new Bean4CoordinateItem(xArray,yArray,"Polygon");
 		
 		
 		 
 		 var _xArrayLine = [111.01314748825707, 115.57247366013207];
 		 var xArrayLine = new Array();
 		 for(var jj = 0 ; jj<_xArrayLine.length; jj++){
 			xArrayLine.push(_xArrayLine[jj]);
 		 }
 		 
 		 var _yArrayLine = [38.64314410839635, 38.93977496777135];
 		var yArrayLine = new Array();
 		 for(var jjj = 0 ; jjj<_xArrayLine.length; jjj++){
 			yArrayLine.push(_xArrayLine[jjj]);
  		 }
 		 
 		 var _Bean4CoordinateItemLine = new Bean4CoordinateItem(xArrayLine,yArrayLine,"Line");
 		 
 		 
		 var array_Bean4CoordinateItem = new Array();
		 array_Bean4CoordinateItem.push(_Bean4CoordinateItemPolygon);
		 
		 var array_Bean4CoordinateItemLine = new Array();
		 array_Bean4CoordinateItemLine.push(_Bean4CoordinateItemLine);
		 //this.cut = function(array_Bean4CoordinateItem,array_Bean4CoordinateItemLine){
		 getFMap().getGeometryOperation().cut(array_Bean4CoordinateItem,array_Bean4CoordinateItemLine,callBackFunction_Cut);
 		 
 		 
 		return;
 		
 	
 		//（&nbsp;Geometry[] Targets,&nbsp;Geometry[] Targets1）
 		var xArray = new Array();
 		
		 xArray.push(84.22799);
		 
		 var yArray = new Array();
		 
		 yArray.push(46.322237);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
		 
		 var xArray2= new Array();
		 
		 xArray2.push(84.799);
		 
		 var yArray2 = new Array();
		 
		 yArray2.push(46.337);
		 
		 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
		
		 var array_Bean4CoordinateItem2 = new Array();
		 
		 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem);
		 array_Bean4CoordinateItem2.push(_Bean4CoordinateItem2);
		 
		 
		var xArray5 = new Array();
		
		 xArray5.push(81.22799);
		 
		 var yArray5 = new Array();
		 
		 yArray5.push(47.322237);
		 
		 var _Bean4CoordinateItem5 = new Bean4CoordinateItem(xArray5,yArray5,"point");
		 
		var xArray6 = new Array();
		
		 xArray6.push(81.22799);
		 
		 var yArray6 = new Array();
		 
		 yArray6.push(47.322237);
		 
		 var _Bean4CoordinateItem6 = new Bean4CoordinateItem(xArray6,yArray6,"point");
		 
		 var array_Bean4CoordinateItem5 = new Array();
		 array_Bean4CoordinateItem5.push(_Bean4CoordinateItem5);
		 array_Bean4CoordinateItem5.push(_Bean4CoordinateItem6);
		 
		 
		 
		 
		 var totalParameter = new Object();
		 
		 totalParameter.ModuleType = "Operation";
		 totalParameter.ActionName = "Cut"; 		
		
		totalParameter.geometeryArray = array_Bean4CoordinateItem2;

		totalParameter.geometeryArraySecond = array_Bean4CoordinateItem5;
		
		var layerName = totalParameter.toJSON();
		
		alert('数据结构：'+layerName);
			
		 var where ;
		 var x2 ;
		 var y2 ;
		 getFMap().getFSpatialQuery().query(layerName,where,callBack4FSpatialQuery);
 	}
 	
		 
	function callBackFunction_Cut(js){
		
		alert("callBackFunction_Cut");
		
		alert("callBackFunction_Cut-->"+js[0].getArray4Graphic()[0].getGrometry());
		
	}
		 
		 
		 
 	//get the center point 
 	function getLablePoint(){
 		
 		//A POLYGON ((224 287, 311 291, 295 345, 229 363, 224 287))
 		//Result: POINT (263.71296296296293 325)
 		
		var xArray = new Array();
 		
 		 xArray.push(224);
 		 xArray.push(311);
 		 xArray.push(295);
 		 xArray.push(229);
 		 xArray.push(224);
 		 
 		 var yArray = new Array();
 		 
 		 yArray.push(287);
 		 yArray.push(291);
 		 yArray.push(345);
 		 yArray.push(363);
 		 yArray.push(287);
 		 
 		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");
 		
 		 var  array_Bean4CoordinateItem = new Array();
 		 
 		array_Bean4CoordinateItem.push(_Bean4CoordinateItem);
 		
 		getFMap().getGeometryOperation().getLablePoint(array_Bean4CoordinateItem,callBack4FSpatialQuery);
		 		
 	}
 	
 	
 	
 
    
    //Flex 执行的回调：call("fMap.getFSpatialQuery().queryBack", js);
    function callBack4FSpatialQuery(rsa){
    
    	alert('返回属性统计：'+rsa[0].getArray4Graphic().length);
    	alert('返回属性统计2：'+rsa[0].getArray4Graphic()[0].getId());
    	
//     	getArray4Graphic
    	
    	var _geometry = rsa[0].getArray4Graphic()[0].getGrometry();
    	
    	
    	alert('_geometry-->'+_geometry);
    	
    	
//     	alert('返回属性rsa.length：'+rsa.length);
		//alert('返回属性.getInfomation()：'+rsa[0].getInfomation());
		//alert('返回属性.getId()：'+rsa[0].getId());
		
		//var grometry = rsa[0].getGrometry();
		
		//alert("grometry20120140936-->"+grometry);
		
	//	alert("grometry.type20120140936-->"+grometry.getGeometryName());
//     	alert(rsaArray[0].group);
    
    }
    
    //两个图形是否相等
    function equals(){
    
   	//POLYGON ((315 338, 240 350, 369 364, 315 338))
   	//POLYGON ((209 278, 289 278, 276 335, 220 333, 209 278))
   	
    	
    	
     var xArray= new Array();
   	 
   	 xArray.push(84.799);
   	 
   	 var yArray = new Array();
   	 
   	 yArray.push(46.337);
   	 
   	 
   	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
   	 
   	 
   	 
   	var xArray2= new Array();
   	 
   	 xArray2.push(84.799);
   	 
   	 var yArray2 = new Array();
   	 
   	 yArray2.push(46.337);
   	 
   	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
    	
    	
 	 getFMap().getGeometryOperation().equals(_Bean4CoordinateItem,_Bean4CoordinateItem2,callBack4equals);

    
    
    }
    
    
    function touches(){
   			
    	
    	var xArray= new Array();
      	 
      	 xArray.push(84.799);
      	 
      	 var yArray = new Array();
      	 
      	 yArray.push(46.337);
      	 
      	 
      	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
      	 
      	 
      	 
      	var xArray2= new Array();
      	 
      	 xArray2.push(84.799);
      	 
      	 var yArray2 = new Array();
      	 
      	 yArray2.push(46.337);
      	 
      	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
       	
    	 getFMap().getGeometryOperation().touches(_Bean4CoordinateItem,_Bean4CoordinateItem2,callBack4equals);

    
    }
    
    
    function intersects(){
    
    	var xArray= new Array();
     	 
     	 xArray.push(84.799);
     	 
     	 var yArray = new Array();
     	 
     	 yArray.push(46.337);
     	 
     	 
     	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
     	 
     	 
     	 var xArray2= new Array();
     	 
     	 xArray2.push(84.799);
     	 
     	 var yArray2 = new Array();
     	 
     	 yArray2.push(46.337);
     	 
     	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
      	
   	    getFMap().getGeometryOperation().intersects(_Bean4CoordinateItem,_Bean4CoordinateItem2,callBack4equals);
    
    
    }
    
//     crosses()
    function crosses(){
        
    	var xArray= new Array();
     	 
     	 xArray.push(84.799);
     	 
     	 var yArray = new Array();
     	 
     	 yArray.push(46.337);
     	 
     	 
     	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
     	 
     	 
     	 var xArray2= new Array();
     	 
     	 xArray2.push(84.799);
     	 
     	 var yArray2 = new Array();
     	 
     	 yArray2.push(46.337);
     	 
     	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
      	
   	    getFMap().getGeometryOperation().crosses(_Bean4CoordinateItem,_Bean4CoordinateItem2,callBack4equals);
    
    
    }
    
    
 function within(){
        
    	var xArray= new Array();
     	 
     	 xArray.push(84.799);
     	 
     	 var yArray = new Array();
     	 
     	 yArray.push(46.337);
     	 
     	 
     	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
     	 
     	 
     	 var xArray2= new Array();
     	 
     	 xArray2.push(84.799);
     	 
     	 var yArray2 = new Array();
     	 
     	 yArray2.push(46.337);
     	 
     	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
      	
   	    getFMap().getGeometryOperation().within(_Bean4CoordinateItem,_Bean4CoordinateItem2,callBack4equals);
    
    
    }
    
 function _contains(){
     
 	var xArray= new Array();
  	 
  	 xArray.push(84.799);
  	 
  	 var yArray = new Array();
  	 
  	 yArray.push(46.337);
  	 
  	 
  	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
  	 
  	 
  	 var xArray2= new Array();
  	 
  	 xArray2.push(84.799);
  	 
  	 var yArray2 = new Array();
  	 
  	 yArray2.push(46.337);
  	 
  	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
   	
	 getFMap().getGeometryOperation().contains(_Bean4CoordinateItem,_Bean4CoordinateItem2,callBack4equals);
 
 
 }
    
 //_Overlaps
 function _Overlaps(){
     
	 	var xArray= new Array();
	  	 
	  	 xArray.push(84.799);
	  	 
	  	 var yArray = new Array();
	  	 
	  	 yArray.push(46.337);
	  	 
	  	 
	  	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
	  	 
	  	 
	  	 var xArray2= new Array();
	  	 
	  	 xArray2.push(84.799);
	  	 
	  	 var yArray2 = new Array();
	  	 
	  	 yArray2.push(46.337);
	  	 
	  	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
	   	
		 getFMap().getGeometryOperation().overlaps(_Bean4CoordinateItem,_Bean4CoordinateItem2,callBack4equals);
	 
	 
	 }
 	
 		//_Covers
 		function _Covers(){
	     
		 	var xArray= new Array();
		  	 
		  	 xArray.push(84.799);
		  	 
		  	 var yArray = new Array();
		  	 
		  	 yArray.push(46.337);
		  	 
		  	 
		  	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
		  	 
		  	 
		  	 var xArray2= new Array();
		  	 
		  	 xArray2.push(84.799);
		  	 
		  	 var yArray2 = new Array();
		  	 
		  	 yArray2.push(46.337);
		  	 
		  	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
		   	
			 getFMap().getGeometryOperation().covers(_Bean4CoordinateItem,_Bean4CoordinateItem2,callBack4equals);
	 
	 }
 	
 	//_CoveredBy	
 		function _CoveredBy(){
 		     
		 	var xArray= new Array();
		  	 
		  	 xArray.push(84.799);
		  	 
		  	 var yArray = new Array();
		  	 
		  	 yArray.push(46.337);
		  	 
		  	 
		  	 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");
		  	 
		  	 
		  	 var xArray2= new Array();
		  	 
		  	 xArray2.push(84.799);
		  	 
		  	 var yArray2 = new Array();
		  	 
		  	 yArray2.push(46.337);
		  	 
		  	 var _Bean4CoordinateItem2 = new Bean4CoordinateItem(xArray2,yArray2,"point");
		   	
			 getFMap().getGeometryOperation().coveredBy(_Bean4CoordinateItem,_Bean4CoordinateItem2,callBack4equals);
	 
	 }
 		
 
 
 
    
    function callBack4equals(js){
    	
    	alert('callBack4equals:'+js);
    	
    }
    
    
    function getfQueryEx(){
    
    	getFMap().getFQueryEx().helloWord(callBackFunction_getfQueryEx);
    
    }
    
    function commonQuery(){
    	//function(dataSource,layerName,_Bean4CoordinateItem,where,queryFlag,callback,around)
    	var dataSource = "orcl";
    	
    	var layerName = "BAS_SHELTERINF";
    	
    	var xArray = new Array();
 		
		 xArray.push(224);
		 xArray.push(311);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(224);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");
    	
		 var where = "";
		 
		 var queryFlag = 1;
		 
		 
    	getFMap().getFQueryEx().commonQuery(dataSource,layerName,_Bean4CoordinateItem,where,queryFlag,callBackFunction_getfQueryEx);
		    
    }
    
    function commonQuery_Rect(){
    	//function(dataSource,layerName,_Bean4CoordinateItem,where,queryFlag,callback,around)
    	var dataSource = "orcl";
    	
    	var layerName = "BAS_SHELTERINF";
    	
    	var xArray = new Array();
 		
		 xArray.push(224);
		 xArray.push(311);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(224);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Rect");
    	
		 var where = "";
		 
		 var queryFlag = 1;
		 
		 
    	getFMap().getFQueryEx().commonQuery(dataSource,layerName,_Bean4CoordinateItem,where,queryFlag,callBackFunction_getfQueryEx);
		    
    }
    
    
    function commonQuery_Line(){
    	
		
    	//function(dataSource,layerName,_Bean4CoordinateItem,where,queryFlag,callback,around)
    	var dataSource = "orcl";
    	
    	var layerName = "BAS_SHELTERINF";
    	
    	var xArray = new Array();
 		
		 xArray.push(224);
		 xArray.push(311);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(224);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Line");
    	
		 var where = "";
		 
		 var queryFlag = 1;
		 
		 
    	getFMap().getFQueryEx().commonQuery(dataSource,layerName,_Bean4CoordinateItem,where,queryFlag,callBackFunction_getfQueryEx);
    	
    	
    }
    
  function commonQuery_Circle(){
    	
		var dataSource = "orcl";
    	
    	var layerName = "BAS_SHELTERINF";
    	
    	var xArray = new Array();
 		
		 xArray.push(224);
		 xArray.push(311);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(224);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Circle",1000);
    	
		 var where = "";
		 
		 var queryFlag = 1;
		 
		 
    	getFMap().getFQueryEx().commonQuery(dataSource,layerName,_Bean4CoordinateItem,where,queryFlag,callBackFunction_getfQueryEx);
    
    
    }
    
  //
    
  function commonQuery_PoureQuery(){
  	
	  		var dataSource = "orcl";
	      	
	      	var layerName = "BAS_SHELTERINF";
	      	
	      	var xArray = new Array();
	   		
	  		 xArray.push(224);
	  		 xArray.push(311);
	  		 xArray.push(295);
	  		 xArray.push(229);
	  		 xArray.push(224);
	  		 
	  		 var yArray = new Array();
	  		 
	  		 yArray.push(287);
	  		 yArray.push(291);
	  		 yArray.push(345);
	  		 yArray.push(363);
	  		 yArray.push(287);
	  		 
	  		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Circle",1000);
	      	
	  		 var where = "1=1";
	  		 
	  		 var queryFlag = 1;
	  		 
	      	getFMap().getFQueryEx().commonQuery(dataSource,layerName,null,where,queryFlag,callBackFunction_getfQueryEx);
	      
	      
	      }    
    
    
    
    
    function showResult4RecordSet(rsa){
    	
    
    
    }
    
    
    
    
    function callBackFunction_getfQueryEx(rsa){
    	
    	alert("rsa.length:"+rsa.length);
    	
    	var recordSet = rsa[0];
    	var array4Record = recordSet.getRecords();
    	
    	alert("array4Record-->"+array4Record.length);
    	
    	
    	for(var i = 0 ; i< array4Record.length; i++){
			
    		alert("for");
    		
    		var everyRecord = array4Record[i];
    		var everyGeometryByRecord =  everyRecord.getGeometry();
    		alert("nidex:"+i+"/共"+array4Record.length+":"+everyGeometryByRecord);
    	}
    	
    	
//     	alert("callBackFunction_getfQueryEx:"+rsa[0].getRecords()[0].getGeometry());
    	
    	
//     	return ;
//     	var graphicSet = js[0];
    	
//     	var array4Graphic = graphicSet.getArray4Graphic();
    	
//     	for(var i = 0 ; i < array4Graphic ; i++){
//     		var graphic = array4Graphic[i];
    		
//     		var geometery = graphic.getGrometry();
    		
//     		alert(i+"/共"+array4Graphic.length+":"+geometery);
    		
    		
//     	}
    }
    
    //this.commonInsertGeometry = function(dataSource,layerName,_Bean4CoordinateItem,attributes,callback){
    function commonQuery_Insert_polygon(){
    	
//     	GJDM_AREA 

//DL   ---  dl

		var dataSource = "";
    	
    	var layerName = "GJDM_AREA";
    	
    	var xArray = new Array();
 		
		 xArray.push(224);
		 xArray.push(311);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(224);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");

    	var map = new Map();
    	
    	map.put("DL", "DL");
   
		 
		 
    	getFMap().getFQueryEx().commonInsertGeometry(dataSource,layerName,_Bean4CoordinateItem,map,callbackFunction4commonQuery_Insert);
    	
    	
    
    }
    
    //this.commonInsertGeometry = function(dataSource,layerName,_Bean4CoordinateItem,attributes,callback){
    function commonQuery_Insert_Line(){
    	
//     	GJDM_AREA 

//DL   ---  dl

		var dataSource = "";
    	
    	var layerName = "GJDM_LINE";
    	
    	var xArray = new Array();
 		
		 xArray.push(224);
		 xArray.push(311);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(224);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Line");

    	var map = new Map();
    	
    	map.put("DL", "DL");
   
		 
		 
    	getFMap().getFQueryEx().commonInsertGeometry(dataSource,layerName,_Bean4CoordinateItem,map,callbackFunction4commonQuery_Insert);
    	
    	
    
    }
    
    //this.commonInsertGeometry = function(dataSource,layerName,_Bean4CoordinateItem,attributes,callback){
    function commonQuery_Insert_point(){
    	
//     	GJDM_AREA 

//DL   ---  dl

		var dataSource = "";
    	
    	var layerName = "GJDM_POINT";
    	
    	var xArray = new Array();
 		
		 xArray.push(224);
	 
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
	 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"point");

    	var map = new Map();
    	
    	map.put("DL", "DL");
   
		 
		 
    	getFMap().getFQueryEx().commonInsertGeometry(dataSource,layerName,_Bean4CoordinateItem,map,callbackFunction4commonQuery_Insert);
    	
    	
    
    }
    
   function callbackFunction4commonQuery_Insert(js){
   	
	   alert(js);
   
   
   }
    
    
   //this.commonInsertGeometry = function(dataSource,layerName,_Bean4CoordinateItem,attributes,callback){
   function commonQuer_Update_polygon(){
   	
	   
	   
//    	GJDM_AREA 

//DL   ---  dl

		var dataSource = "";
   	
   	var layerName = "GJDM_AREA";
   	
   	var xArray = new Array();
		
		 xArray.push(222);
		 xArray.push(322);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(222);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");

   		var map = new Map();
   	
   		map.put("DL", "DL_Update");
  		var primaryKey = "41";
  		var where = "";
		 
//    	this.commonUpdateGeometry = function(dataSource,layerName,_Bean4CoordinateItem,map4attributes,primaryKey,where,callback)		 
   	getFMap().getFQueryEx().commonUpdateGeometry(dataSource,layerName,_Bean4CoordinateItem,map,primaryKey,where,callbackFunction4commonQuery_Insert);
   	
   	
   
   } 
    
   
   function commonQuer_Update_Line(){
   	
		var dataSource = "";
    	
    	var layerName = "GJDM_LINE";
    	
    	var xArray = new Array();
 		
		 xArray.push(222);
		 xArray.push(311);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(222);
		 
		 var yArray = new Array();
		 
		 yArray.push(333);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(333);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Line");

    	var map = new Map();
    	
    	map.put("DL", "DL_Update");
   
    	var primaryKey = "21";
  		var where = "";
		 
    	getFMap().getFQueryEx().commonUpdateGeometry(dataSource,layerName,_Bean4CoordinateItem,map,primaryKey,where,callbackFunction4commonQuery_Insert);
   
   }
   
   
   function commonQuer_Delete_ByPrimaryKeAndWhere(){
	   
	   var dataSource = "";
	   	
	   var layerName = "GJDM_AREA";
	   
	   var primaryKey = "41";
 	   
	   var where = "1=1";
	   
 	   //this.commonDeleteGeometry = function(dataSource,layerName,primaryKey,where,callback){
	   getFMap().getFQueryEx().commonDeleteGeometry(dataSource,layerName,primaryKey,where,callbackFunction4commonQuery_Insert);
	      
   }
   
  	function commonVectorCssPara(){
  		
  		var xArray = new Array();
		
		 xArray.push(222);
		 xArray.push(322);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(222);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Polygon");

		 //getFMap().getFVector().createPoly (
				 							//'1',                 		linecolor
				 							//'0xff0000,0',         	color
				 							//'1',                  	linewidth
				 							//'0.8',                	alpha
				 							//'id',                 	id
				 							//'group',              	group
				 							//'window',                 tipType
				 							//'http://www.baidu.com/',	tipValue   
				 							//'9',						label
				 							//'10',						w_width
				 							//'11',						w_height
				 							//true,						edit
				 							//true,						over
				 							//callBack4createPoly);	 
		
		 var linecolor = 1;		//边框颜色
		 var color = 0xff0000;			//填充颜色
		 var linewidth = 1;		//边框线宽
		 var alpha = 0.8;			//透明度
		
// this.PolygonSymbol = function(_linecolor,_color,_linewidth,_alpha,_shineSymbol,_mouseOverSymbol,_outline)
		var _PolygonSymbol = new PolygonSymbol();
		
		_PolygonSymbol.linecolor = linecolor;
		_PolygonSymbol.color = color;
		_PolygonSymbol.linewidth = linewidth;
		_PolygonSymbol.alpha = alpha;
		 
		var shineColor = 1;		  //闪烁颜色
		
		var shineNum = 100;  		  //闪烁次数
		
		var shineOutLineColor = 1;//闪烁边线颜色
		
		var shineFillColor = 0;   //闪烁填充颜色
		
		var _ShineSymbol = new ShineSymbol(null,shineNum,shineOutLineColor,shineFillColor);
		
		_ShineSymbol.shineColor = 100;
		
		_PolygonSymbol.shineSymbol = _ShineSymbol;
		
		var _MouseOverSymbol = new MouseOverSymbol(10);
		
		_PolygonSymbol.mouseOverSymbol = _MouseOverSymbol;
		
		
		
		alert("_PolygonSymbol-->"+_PolygonSymbol.toJSON());
		
		
		
		 var tipType = "window";
		 var tipValue = "http://www.baidu.com/";
		 var label = "label";
		 var w_width = 9;
		 var w_height = 10;
		 
		 
		 
// 		this.InfoWindow = function(_tipType,_tipValue,_label,__w_width,__w_height)
		
		
// 		_infoWindow.tipType = tipType;
// 		_infoWindow.tipValue = tipValue;
// 		_infoWindow.label = label;
// 		_infoWindow.w_width = w_width;
// 		_infoWindow.w_height = w_height;
  		
		
		
// 		var str1 = "txt,车站;txt,车站的位置;\ntxt,公交线路;\nlink,http://news.baidu.com/;\nimg,http://img.baidu.com/img/image/imglogo.gif,117,38;\nvideo,http://10.71.197.160:8080/portal/module/map/standard/test.flv,180,170";
		
// 		var _TipValue = new TipValue();
		
// 		var txtLinkImageVideoArray = new Array();
		
// 		txtLinkImageVideoArray.push("车站");
// 		txtLinkImageVideoArray.push("车站的位置");
// 		txtLinkImageVideoArray.push("公交线路");
		
// 		txtLinkImageVideoArray.push("http://news.baidu.com/");
// 		txtLinkImageVideoArray.push("http://news.baidu.com/");
		
		var _TipValueListElement = new TipValueListElement();
		_TipValueListElement.addEnter(5);
		_TipValueListElement.addTxt("车站");
		_TipValueListElement.addTxt("车站的位置");
		_TipValueListElement.addTxt("公交线路");
		_TipValueListElement.addLink("http://news.baidu.com/");
		_TipValueListElement.addLink("http://news.baidu.com/");
		_TipValueListElement.addPicture("http://img.baidu.com/img/image/imglogo.gif");
		_TipValueListElement.addPicture("http://img.baidu.com/img/image/imglogo.gif");
		_TipValueListElement.addVideo("http://10.71.197.160:8080/portal/module/map/standard/test.flv");
		_TipValueListElement.addVideo("http://10.71.197.160:8080/portal/module/map/standard/test.flv");
		
		var arrayTemp = _TipValueListElement.get_list4HtmlElement();
		
		
		var _infoWindow = new InfoWindow(tipType,arrayTemp,label,w_width,w_height);
		
		
		
		alert(_infoWindow.toJSON());
		
		
// 		var arrayTemp = _TipValueListElement.get_list4HtmlElement();
		
// 		alert("arrayTemp-->"+arrayTemp.toJSON());
		
// 		var map = new Map();
		
// 		map.put("key","value");
// 		map.put("key1","value1");

// 		alert(map.toJSON());
		
		
		
// 		this.commonCreateGeometry = function(_Bean4CoordinateItem,_symbol,_infoWindow,_CallBack){
		getFMap().getFVector().commonCreateGeometry(_Bean4CoordinateItem,_PolygonSymbol,_infoWindow);
		
		
  	}
  	
  	function commonVectorCssParaPoint(){
  		
//   	var str1 = "txt,车站;txt,车站的位置;\ntxt,公交线路;\nlink,http://news.baidu.com/;\nimg,http://img.baidu.com/img/image/imglogo.gif,117,38;\nvideo,http://10.71.197.160:8080/portal/module/map/standard/test.flv,180,170";
//      getFMap().getFVector().createSimplePoint('2','10', 'circle','id','group' ,'windowInfo' , str1,"弹窗" ,'500','400');
 	
  		
  		var xArray = new Array();
		
		 xArray.push(222);
		 xArray.push(322);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(222);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
		 var _Bean4CoordinateItem = new Bean4CoordinateItem(xArray,yArray,"Point");

		 //getFMap().getFVector().createPoly (
				 							//'1',                 		linecolor
				 							//'0xff0000,0',         	color
				 							//'1',                  	linewidth
				 							//'0.8',                	alpha
				 							//'id',                 	id
				 							//'group',              	group
				 							//'window',                 tipType
				 							//'http://www.baidu.com/',	tipValue   
				 							//'9',						label
				 							//'10',						w_width
				 							//'11',						w_height
				 							//true,						edit
				 							//true,						over
				 							//callBack4createPoly);	 
		
		 var linecolor = 1;		//边框颜色
		 var color = 0xff0000;			//填充颜色
		 var linewidth = 1;		//边框线宽
		 var alpha = 0.8;			//透明度
		
// this.PolygonSymbol = function(_linecolor,_color,_linewidth,_alpha,_shineSymbol,_mouseOverSymbol,_outline)
		var _PolygonSymbol = new PolygonSymbol();
		
		_PolygonSymbol.linecolor = linecolor;
		_PolygonSymbol.color = color;
		_PolygonSymbol.linewidth = linewidth;
		_PolygonSymbol.alpha = alpha;
		 
		 
		 var tipType = "window";
		 var tipValue = "http://www.baidu.com/";
		 var label = "label";
		 var w_width = 9;
		 var w_height = 10;
		 
		 
		 
// 		this.InfoWindow = function(_tipType,_tipValue,_label,__w_width,__w_height)
		var _infoWindow = new InfoWindow();
		
		_infoWindow.tipType = tipType;
		_infoWindow.tipValue = tipValue;
		_infoWindow.label = label;
		_infoWindow.w_width = w_width;
		_infoWindow.w_height = w_height;
  		
		
// 		this.commonCreateGeometry = function(_Bean4CoordinateItem,_symbol,_infoWindow,_CallBack){
		getFMap().getFVector().commonCreateGeometry(_Bean4CoordinateItem,_PolygonSymbol,_infoWindow);
		
		
  	}

	function _CallBackFunction4commonCreateGeometry(js){
	   alert(js);
   }
	
	
	
	function convertWGS84ToWebMercator(){
		
		var xArray = new Array();
		
		 xArray.push(222);
		 xArray.push(322);
		 xArray.push(295);
		 xArray.push(229);
		 xArray.push(222);
		 
		 var yArray = new Array();
		 
		 yArray.push(287);
		 yArray.push(291);
		 yArray.push(345);
		 yArray.push(363);
		 yArray.push(287);
		 
// 		 getFMap().getCommonMapTools().convertWGS84ToWebMercator(xArray,yArray,callBackFunction4convertWGS84ToWebMercator);
		 getFMap().getCommonMapTools().convertWebMercatorToWGS84(xArray,yArray,callBackFunction4convertWGS84ToWebMercator);
		 
	
	}
	
	function callBackFunction4convertWGS84ToWebMercator(xArray,yArray){
		
		alert("xArray-->"+xArray);
		alert("yArray-->"+yArray);
		
	}
    
	
	function addLegend(){
		//this.addLegend = function(id,url,left,top,width,height){
		getFMap().addLegend("id","",5,5,400,300);
		
		showLegend();
		
	}
	
	function showLegend(){
		
		getFMap().showLegend ("id",true);
	
	}
	
	
	
    
  //是否显示鹰眼
    var eagleFlag = true;
    function showEagle() {
    	eagleFlag = !eagleFlag;
    	getFMap().showEagle(eagleFlag);
    }
	
    var levelFlag = true;
    function showLevel() {
    	levelFlag = !levelFlag;
    	getFMap().showLevel(levelFlag);
    }
</script>


</head>

<!-- <body style="overflow:hidden;"> -->
<body style="overflow:hidden;">
	<div id="idDiv_ontimeTest" style="position: absolute; top: 0px; left: 0px; padding:5px; z-index: 99999;width: 600px">
		<button id="btn001" onclick="showEagle1()">testing1</button>
		<button id="btn001" onclick="dingwei(null)">Testing2</button>
		<button id="btn001" onclick="showEagle3()">全屏js</button>
		<button id="btn001" onclick="showEagle31()">全屏as</button>
		<button id="btn001" onclick="showEagle4()">JSObjectCovert2JSONString_Predicates</button>
		<button id="btn001" onclick="invokeBufferProcesser201301051047()">Operation_buffer</button>
		<button id="btn001" onclick="convexHull2()">Operation_convexHull</button>
		<button id="btn001" onclick="Intersection()">Intersection</button>
		<button id="btn001" onclick="union()">Union</button>
		<button id="btn001" onclick="Difference()">Difference</button>
		<button id="btn001" onclick="simplify()">simplify</button>
		<button id="btn001" onclick="GetLengthAndArea()">GetLengthAndArea</button>
		<button id="btn001" onclick="GetDistance()">GetDistance</button>
		<button id="btn001" onclick="cut()">cut</button>
		<button id="btn001" onclick="equals()">equals</button>
		<button id="btn001" onclick="touches()">touches</button>
		<button id="btn001" onclick="intersects()">intersects</button>
		<button id="btn001" onclick="crosses()">crosses</button>
		<button id="btn001" onclick="within()">within</button>
		<button id="btn001" onclick="_contains()">contains</button>
		<button id="btn001" onclick="_Overlaps()">Overlaps</button>
		<button id="btn001" onclick="_Covers()">covers</button>
		<button id="btn001" onclick="_CoveredBy()">CoveredBy</button>
		<button id="btn001" onclick="getLablePoint()">getLablePoint</button>
		<button id="btn001" onclick="commonQuery()">commonQuery</button>
		<button id="btn001" onclick="commonQuery_Rect()">commonQuery_Rect</button>
		<button id="btn001" onclick="commonQuery_Line()">commonQuery_Line</button>
		<button id="btn001" onclick="commonQuery_Circle()">commonQuery_Circle</button>
		<button id="btn001" onclick="commonQuery_PoureQuery()">commonQuery_PoureQuery</button>
		<button id="btn001" onclick="commonQuery_Insert_point()">commonQuery_Insert_point</button>
		<button id="btn001" onclick="commonQuer_Update_Line()">commonQuer_Update_Line</button>
		<button id="btn001" onclick="commonQuer_Delete_ByPrimaryKeAndWhere()">commonQuer_Delete_ByPrimaryKeAndWhere</button>
		<button id="btn001" onclick="commonVectorCssPara()">commonVectorCssPara</button>
		<button id="btn001" onclick="convertWGS84ToWebMercator()">convertWGS84ToWebMercator</button>
	</div>
	
	<div id="idDiv4MapSystem" style="position: absolute; top: 435px; left: 0px; padding:5px; z-index: 99999;width: 160px;">
		<button id="btn001" onclick="testing6()">setMapLevel5</button>
		<button id="btn001" onclick="testing7()">centerAt2WebMercator</button>
		<button id="btn001" onclick="testing8()">centerAt</button>
		<button id="btn001" onclick="testing9()">getExtent</button>
		<button id="btn001" onclick="testing12()">swf加载完毕flag</button>
		<button id="btn001" onclick="testing32()">pan漫游</button>
		<button id="btn001" onclick="testing33()">zoomIn放大</button>
		<button id="btn001" onclick="testing34()">pan缩小</button>
		<button id="btn001" onclick="testing5()">toUrl</button>
		<button id="btn001" onclick="testing48()">打印地图(新页面操作)</button>
		<button id="btn001" onclick="testing481()">设置Map的三个事件回调函数</button>
		<button id="btn001" onclick="showEagle()">是否显示鹰眼</button>
		<button id="btn001" onclick="showLevel()">是否显示导航</button>
		
		<button id="btn001" onclick="testing53()">测距</button>
		<button id="btn001" onclick="testing54()">测面积</button>
		<button id="btn001" onclick="testing55()">判断点是否在面上</button>
		<button id="btn001" onclick="addLegend()">添加图例</button>
	</div>
	
	<div id="idDiv4create" style="position: absolute; top: 0px; left: 1150px; padding:5px; z-index: 99999; width: 120px">
		<button id="btn001" onclick="testing10()">createSimplePoint</button>
		<button id="btn001" onclick="testing101()">createSimplePoint自定义弹窗</button>
		<button id="btn001" onclick="testing13()">createLine</button>
		<button id="btn001" onclick="testing131()">createLine自定义弹窗</button>
		<button id="btn001" onclick="testing14()">createPoly</button>
		<button id="btn001" onclick="testing15()">createCircle</button>
		<button id="btn001" onclick="testing151()">createCircle自定义弹窗</button>
		<button id="btn001" onclick="testing16()">createRect</button>
		<button id="btn001" onclick="testing17()">createPointImage</button>
		<button id="btn001" onclick="testing18()">createPointString</button>
	</div>
	
	<div id="idDiv4draw" style="position: absolute; top: 300px; left: 1150px; padding:5px; z-index: 99999;height: 100%;width: 120px">
		<button id="btn001" onclick="testing19()">drawSimplePoint19</button>
<!-- 		<button id="btn001" onclick="testing11()">drawSimplePoint4over</button> -->
		<button id="btn001" onclick="testing111()">drawSimplePoint19弹窗输入html</button>
		<button id="btn001" onclick="testing20()">drawImagePoint</button>
		<button id="btn001" onclick="testing21()">drawString</button>
		<button id="btn001" onclick="testing22()">drawLineSymbol</button>
		<button id="btn001" onclick="testing23()">drawPolygonSymbol</button>
		<button id="btn001" onclick="testing24()">drawRect</button>
		<button id="btn001" onclick="testing25()">drawCircle</button>
		<button id="btn001" onclick="testing42()">画闪烁点drawDynPoint</button>
		<button id="btn001" onclick="testing43()">画闪烁线drawLineDynSymbol</button>
		<button id="btn001" onclick="testing44()">画闪烁面drawPolygonDynSymbol</button>
		<button id="btn001" onclick="testing45()">画闪烁矩形drawDynRect</button>
		<button id="btn001" onclick="testing46()">画闪烁圆drawDynCircle</button>
	</div>
	
	<div id="idDiv4FVector" style="position: absolute; top: 0px; left: 1000px; padding:5px; z-index: 99999;height: 100%;width: 100px">
		<button id="btn001" onclick="testing26()">removeVectorById</button>
		<button id="btn001" onclick="testing27()">removeVectorByType</button>
		<button id="btn001" onclick="testing35()">moveById</button>
		<button id="btn001" onclick="testing36()">moveByGroup</button>
		<button id="btn001" onclick="testing38()">start</button>
		<button id="btn001" onclick="testing412()">pause</button>
		<button id="btn001" onclick="testing413()">resume</button>
		<button id="btn001" onclick="testing414()">stop</button>
		
	</div>
	
	<div id="idDiv4input" style="position: absolute; top: 200px; left: 1000px; padding:5px; z-index: 99999;height: 100%;width: 120px">
		<button id="btn001" onclick="testing28()">inputPoint</button>
		<button id="btn001" onclick="testing29()">inputRect</button>
		<button id="btn001" onclick="testing30()">inputLine</button>
		<button id="btn001" onclick="testing31()">inputPoly</button>
		<button id="btn001" onclick="testing37()">inputCircle返回xyr</button>
	</div>
	
	
	
	<div style="position: absolute; top: 10px; left: 1300px; padding:5px; z-index: 99999;height: 100%; width: 100px">
		
		<button id="btn001" onclick="testing49()">通过点查询路径</button>
		<button id="btn001" onclick="testing491()">通过点查询路径2</button>
		<button id="btn001" onclick="testing50()">通过鼠标点击查询路径</button>
		<button id="btn001" onclick="testing51()">停止鼠标查询</button>
		<button id="btn001" onclick="testing502()">通过鼠标添加障碍物</button>
		<button id="btn001" onclick="testing503()">询路径 之后再添加站点</button>
		
		<button id="btn001" onclick="testing52()">清除查询获得的路径和点</button>
		<button id="btn001" onclick="testing56()">按照条件查询并返回结果</button>
		
		
		<button id="btn001" onclick="testing57()">addPoly(只限160swf测试)</button>
		<button id="btn001" onclick="testing58()">cutVector(只限160swf测试)</button>
		<button id="btn001" onclick="testing59()">saveCutVector(只限160swf测试)</button>
		<button id="btn001" onclick="testing60()">dwr</button>
		<button id="btn001" onclick="testingJson()">testingJson</button>
	</div>
	
	<div style="position: absolute; top: 0px; left: 650px; padding:5px; z-index: 99999; width: 200px">
		
		<input type="checkbox" name="car"/>
		<input type="checkbox" name="car"/>
		<input type="checkbox" name="car"/>
		<input type="checkbox" name="car"/>
		<input type="checkbox" name="car"/>
		<input type="checkbox" name="car"/>
		<input type="checkbox" name="car"/>
		
	</div>
	
	
	
	
</body>
</html>

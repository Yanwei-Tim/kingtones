<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml" xmlns:v ="urn:schemas-microsoft-com:vml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=GB2312" />
		<title>3.ָ�ӵ���</title>
		<!--<SCRIPT src="http://10.44.128.151:9080/PGIS_S_TileMap/js/EzMapAPI.js" type="text/javascript"></SCRIPT> -->
		<link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/config.js"></script>
		<style>		
		v\:* {
			BEHAVIOR: url(#default#VML)
		}
		div.panel
		{
			margin:0px;
			padding:5px;
			text-align:center;
			background:#e5eecc;
			border:solid 1px #c3c3c3;
			height:460px;
			display:none;
		}
		#adiv1,#adiv2{
			border-bottom:1px solid #E6E6E6;			
			height:200px;
			width:450px;
			overflow:auto;
		}
		#bdiv1,#bdiv2{
			border-bottom:1px solid #E6E6E6;			
			height:90px;
			width:450px;
			overflow:auto;
		}
		</style>
		<script type="text/javascript">
		function toggle(){
			shou();

			$.ajax( {
				url : webroot + '/dw/jwGpsManagerAC!findUserJqforMap.action',
				// ���ݷ��ͷ�ʽ
				type : "post",
				// �������ݸ�ʽ
				dataType : "json",
				// �ص����������ܷ������˷��ظ��ͻ��˵�ֵ����resultֵ
				success : function(data) {
					var arrayObj = new Array();
					var arr = new Array();
					var msg1=" ";
					for ( var i = 0; i < eval(data.rows).length; i++) {
						arr = [ data.rows[i].y, data.rows[i].x,data.rows[i].userName, data.rows[i].account,
								data.rows[i].phone,data.rows[i].datetime ];
						arrayObj.push(arr);

						msg1+=(i+1)+"��<input type='checkbox' value="+(i+1)+","+data.rows[i].account+" name='check1'/>"+
						"<font color='blue'>��Ա:</font>"+data.rows[i].userName+"<br>";
					}
					document.getElementById('showuser1').innerHTML=msg1;
					document.getElementById("showuser").value = arrayObj;
					
					var arrayObj2 = new Array();
					var arr2 = new Array();
					var msg=" ";				
					for ( var i = 0; i < eval(data.jqlist).length; i++) {
						arr2 = [ data.jqlist[i].id,data.jqlist[i].alarmName,data.jqlist[i].alarmPhone,data.jqlist[i].address, 
									data.jqlist[i].content,data.jqlist[i].gps, data.jqlist[i].jqTime ];				
						arrayObj2.push(arr2);
						msg+=(i+1)+"��<input type='radio' value="+(i+1)+","+data.jqlist[i].id+" name='radio1'/>"+
						"<font color='blue'>����:</font>"+data.jqlist[i].content+",<font color='blue'>ʱ��:</font>"+data.jqlist[i].jqTime+"<br>";
					}
					document.getElementById('showjq1').innerHTML=msg;
					document.getElementById("showjq").value = arrayObj2;				
				}
			});			
			//onLoad();			
		}
		function rad(){
			var b1 = document.getElementById("bdiv1").innerHTML;
			var b2 = document.getElementById("bdiv2").innerHTML;
			if(b1!=""){
				if(b2!=""){
					//toggle();
					onLoad();	
				}else{
					alert("��ѡ��Ա��");
				}
			}else{
				alert("��ѡ���飡");
			}										
		}
		function radio(){
			var radiovalue = $("input[type=radio]:checked").val();
			var radio1 = radiovalue.split(",");
			if(radiovalue!=null){
				document.getElementById("bdiv1").innerHTML ="<font style='font-size:19px;color:green'>"+radio1[0]+"</font>"; 				
			}else{
				alert("��ѡ���飡");
			}		
		}
		function check(){
			var ch="";
			var arr=document.getElementsByName("check1");
			
			for(var i=0;i<arr.length;i++)    {					
				if(arr[i].checked==true){
					var check1 = arr[i].value.split(",");
					ch=ch+check1[0]+"<br>";
					//ch=ch+arr[i].value+"<br>";						
					document.getElementById("bdiv2").innerHTML="<font style='font-size:19px;color:green'>"+ch+"</font>"; 
				}					
			} 
			if(ch==""){
				alert("��ѡ��Ա��");
			}
		}
	function shou(){
		var text = document.getElementById("bt1").value;
		if("����" == text){
	        document.getElementById("bt1").value="����";
	    }
	    else{
	        document.getElementById("bt1").value="����";
	    }					
		$(".panel").slideToggle("slow");//$(selector).slideToggle(speed,callback);	
		document.getElementById("bdiv2").innerHTML="";	
		document.getElementById("bdiv1").innerHTML="";
	}
		
	// �����ͼ��
	var _MapApp=null;
	function onLoad() {		
		shou();				
		_MapApp = new EzMap(document.getElementById("map"));
		// ��ʾ��ͼ�������߿��ƿؼ�
		_MapApp.showMapControl();
		// ���õ�ͼ��������
		_MapApp.centerAndZoom(new Point(113.3842, 22.5120), 11);
		//_MapApp.showMapServer();	
		jq();
		jquser();
	}
	
	function jq() {		
		var pIcon=new Icon();
		pIcon.image="<%=path%>/flexgrid/w2.png";
		pIcon.height=24;
		pIcon.width=16;

		var radiovalue = $("input[type=radio]:checked").val();
		var radio1 = radiovalue.split(",");
		var dashu = document.getElementById("showjq").value;
		var array = dashu.split(",");
		var nums = [];		
		for ( var i = 0; i < array.length; i++) {
			nums.push(array[i]);
		}		
		var data_info = splitArray(nums, 8);//���ά
		for ( var i = 0; i < data_info.length; i++) {
			if(data_info[i][0]==radio1[1]){
				var point = new Point(data_info[i][5], data_info[i][6]);
				var marker = new Marker(point,pIcon,new Title("����",11,7,"����",null,"green","blue","1"));	
				_MapApp.addOverlay(marker);
			  	_MapApp.centerAndZoom(point, 12); // 12
			}
		}		
	}

	function jquser() {		
		var pIcon=new Icon();
		pIcon.image="<%=path%>/flexgrid/w1.png";
		pIcon.height=24;
		pIcon.width=16;
		var arr=document.getElementsByName("check1");	//��ѡ��	

		var dashu = document.getElementById("show").value;
		var array = dashu.split(",");
		var nums = [];
		for ( var i = 0; i < array.length; i++) {
			nums.push(array[i]);
		}
		var data_info = splitArray(nums, 6);//���ά		
		
		for ( var i = 0; i < data_info.length; i++) {

			for(var i=0;i<arr.length;i++)    {					
				if(arr[i].checked==true){
					var check1 = arr[i].value.split(",");
					if(check1[1]==data_info[i][3]){
						var point = new Point(data_info[i][0], data_info[i][1]);			
						var marker = new Marker(point,pIcon,new Title(data_info[i][2],11,7,"����",null,"green","blue","1"));
						
						addOpenInfoWindow(marker,data_info[i][2],data_info[i][3]);
					  	_MapApp.addOverlay(marker);
					  	_MapApp.centerAndZoom(point, 12); // 12
					}
				}
			}
		}
		function addOpenInfoWindow(obj,name,account){
			obj.addListener("click", function(){
				document.getElementById("username").value=name;
				document.getElementById("useraccount").value=account;
			});
		};
	}
		
	function splitArray(aim, size) { //һά������ά����   
		var result = [];
		var tempArray;
		for ( var count = 0; count < aim.length; count++) {
			if (count % size == 0) {
				if (tempArray) {
					result.push(tempArray);
				}
				tempArray = [];
			}
			tempArray[tempArray.length] = aim[count];
			if (count + 1 == aim.length) {
				result.push(tempArray);
			}
		}
		return result;
	}

	function callback(str){
		alert("�ѻ�ȡ����:"+str);
	}

	function send(){
		//var username = document.getElementById("username").value;
		var useraccount = document.getElementById("useraccount").value;
		var gps = document.getElementById("dataInputx").value;
		var word = document.getElementById("word").value;
		$.ajax( {
			url : webroot + '/dw/jwGpsManagerAC!sendJqMessage.action',
			// ���ݷ��ͷ�ʽ
			type : "post",
			data:'jqMessage.userAccount='+useraccount+'&jqMessage.message='+word+'&jqMessage.gps='+gps,
			dataType : "json",
			// �ص����������ܷ������˷��ظ��ͻ��˵�ֵ����resultֵ
			error: function(){
		       alert('����ʧ��');
		    },
			// �ص����������ܷ������˷��ظ��ͻ��˵�ֵ����resultֵ
			success : function(data) {
			}
		});
	}
</script>
	</head>
	<body onload="toggle()">

	<div class="panel">
	<table style="BORDER-TOP-STYLE: solid; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; BORDER-BOTTOM-STYLE: solid;text-align:center"
	 bgColor=#ffffff align="center"  border=2 height=40  width=80% bordercolor="green">
   		<tr >
   			<td colSpan=2 style="font-size: 18px">������Ա����</td>
   		</tr>
   		<tr>
   			<td style="font-size: 14px">����(��ѡ���飡)</td>
   			<td style="font-size: 14px">��Ա(��ѡ��Ա��)</td>
   		</tr>
   		<tr>
   			<td align="left"><input type="hidden" id="showjq" />
   				<div id="adiv1"> 
   					<div id="showjq1"></div> 				   									
   				</div>
   				<input type="button" onclick="radio()" value="ѡ��"/>
			</td>
   			<td align="left"><input type="hidden" id="showuser" />
   				<div id="adiv2">
   					<div id="showuser1"></div>   					
   				</div>
   				<input type="button" onclick="check()" value="ѡ��"/>
			</td>
   		</tr>
   		<tr>
   			<td><font color="red">��ѡ�������(�ڼ���)��</font><br>
   				<div id="bdiv1"></div>
   			</td>
   			<td><font color="red">��ѡ�������(�ڼ���)��</font><br>
   				<div id="bdiv2"></div>
			</td>
   		</tr>
   		<tr >
   			<td colSpan=2 style="font-size: 18px">
   			<input type="button" value="�����ͼ" onclick="rad()" style="width:120px;height:30px">
   			</td>
   		</tr>
   	</table>
	</div>

	<table style="width: 100%; height: 100%">
		<tr>
			<td style="width: *; height: 540px; border: 2px solid orange">
				<div id="map" style="width: 100%; height: 100%; border: 0px solid #FF0000;"></div>
			</td>

			<td style="width: 110px" valign="top">
			<table>
			
				<tr>
					<td style="width: 100%">
						<fieldset class=fieldstyle>
							<legend>�鿴������Ա�б�:</legend>
							<table style="width: 100%">
								<tr>
									<td>	
			<input type="button" style="width:99px;height:50px" id="bt1" onclick="toggle()" value="����">													
									</td>									
								</tr>
							</table>							
						</fieldset>						
					</td>
				</tr>
				
				<tr>
					<td style="width: 100%">
						<fieldset class=fieldstyle>
							<legend>��ͼ����</legend>
							<table style="width: 100%">
								<tr>
									<td>										
				<input type="button" style="width:100%" onclick="_MapApp.changeDragMode('drawPolyline',dataInputx,dataInputy,callback);" value="�滮·��" title="����϶�"></input>					
				
									</td>									
								</tr>
							</table>							
						</fieldset>						
					</td>
				</tr>
				<tr>
				<td>				
					<fieldset class=fieldstyle>
					<legend>·����Ϣ</legend>
						<table style="width: 100%">	
							<tr>
								<td>��Ա��</td>																		
							</tr>
							<tr>
								<td><input type="text" id="username" size="14" disabled>
									<input type="hidden" id="useraccount">
								</td>																		
							</tr>							
							<tr>
								<td>·�ߣ�</td>																		
							</tr>
							<tr>
								<td><input type="text" size="14" id="dataInputx" ></td>	
								<td><input type="hidden" size="14" id="dataInputy" ></td>																	
							</tr>								
							<tr>
								<td>�������ͣ�</td>																		
							</tr>
							<tr>
								<td><textarea id="word" rows="11" cols="12"></textarea></td>																		
							</tr>
							<tr>
								<td><input type="button" onclick="send()" value="ȷ������"></td>																		
							</tr>
						</table>
					</fieldset>
				</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>

	</body>
</html>


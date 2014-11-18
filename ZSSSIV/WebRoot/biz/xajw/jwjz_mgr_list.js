
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var addjz='none';
	var deljz ='none';
	var editjz='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("addjz")>=0){
				 addjz='inline';
			 }
			 if(temp1.indexOf("deljz")>=0){
				 deljz='inline';
			 }
			 if(temp1.indexOf("editjz")>=0){
				 editjz='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/xajw/jwUserAC!queryJwJzListByXzqh.action',
		dataType: 'json',
		colModel : [
		
			{display: '警种编号', name : 'id', width : 300, sortable : true, align: 'left'},
			{display: '警种名称', name : 'name', width : 300, sortable : true, align: 'left'},
			{display: '描述信息', name : 'description', width : 300, sortable : true, align: 'left'}
			],
		buttons : [
			//{name: '反选',  onpress : btn_even},
			//{separator: true},
			{name: '增加',  onpress : btn_even,state:addjz},
			{separator: true,sepstate:addjz},
			{name: '修改', onpress : btn_even,state:editjz},
			{separator: true,sepstate:editjz},
			{name: '删除', onpress : btn_even,state:deljz},
			{separator: true,sepstate:deljz}
			],
		
		sortname: "iso",
		sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		//title:'组织人员管理',
		showTableToggleBtn: true,
		resizable:false,  //窗口伸缩
		onSubmit: addFormData,
		width:800,
		height: 400
		}
		);	
		
		
	function addFormData()
	{
		return true;
	}
	//刷新列表	
	function refreshGrid(){
		$('#flex1').flexOptions({params: [{ name: 'null', value: 'null'}]}).flexReload();
	}	
	
var selectItemId;
	function btn_even(com,grid){
		if(com=='反选'){
			$('tr',grid).toggleClass('trSelected'); 
		}
		else if (com=='增加')
		{
			
			url=webroot+"/biz/xajw/jwjz_add.jsp";
          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}	
		else if (com=='修改')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){
			alert("请选择一项要修改的数据项！");
				return;
			
			}
			url=webroot+"/biz/xajw/jwjz_edit.jsp";
          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}else if (com=='删除')
		{
			if($('.trSelected',grid).length==0){
				alert("请选择要删除的数据项！");
				return;
			}
			else{
			 if(confirm('是否要删除该项！')){  
			var userIds = $('.trSelected',grid).find("td:first").eq(0).text();
			for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
				userIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
			}
			$.ajax({
		    	url: webroot+'/xajw/jwUserAC!delJwJz.action',
		      data:'ids='+userIds,
		    	type: 'POST',
			    dataType: 'json',
			  //  timeout: 1000,
			    error: function(){
					alert("删除失败");
			    },
			    success: function(data){
			        alert("删除成功");
					refreshGrid();
			    }
			});}}
		}	else if (com=='Excel导出')
		{   window.location=webroot+'/platform/userAC!excelDoOut.action'
			
		}	else if (com=='Excel导入')
		{ 
		url=webroot+"/platform/org/user_import.jsp";
          window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}	else if (com=='获取模板')
		{
		window.location=webroot+'/platform/userAC!ExcelTemp.action'
			
		}	
								
	}

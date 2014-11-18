
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var addapp='none';
	var delapp ='none';
	var editapp='none';
	var setapp='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("addapp")>=0){
				 addapp='inline';
			 }
			 if(temp1.indexOf("delapp")>=0){
				 delapp='inline';
			 }
			 if(temp1.indexOf("editapp")>=0){
				 editapp='inline';
			 }
			 if(temp1.indexOf("setapp")>=0){
				 setapp='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/commonbiz/updateAC!queryJwUpdateList.action',
		dataType: 'json',
		colModel : [
		
			{display: '应用编号', name : 'id', width : 1, sortable : true, align: 'left',hide: true},
			{display: '应用名称', name : 'name', width : 100, sortable : true, align: 'left'},
			{display: '版本号', name : 'version', width : 100, sortable : true, align: 'left'},
			{display: '更新时间', name : 'time', width : 100, sortable : true, align: 'left'},
			{display: '描述信息', name : 'desc', width : 100, sortable : true, align: 'left'},
			{display: '是否为当前版本', name : 'state', width : 100, sortable : true, align: 'left'}
			],
		buttons : [
			//{name: '反选',  onpress : btn_even},
			//{separator: true},
			{name: '增加',  onpress : btn_even,state:addapp},
			{separator: true,sepstate:addapp},
			{name: '修改', onpress : btn_even,state:editapp},
			{separator: true,sepstate:editapp},
			{name: '删除', onpress : btn_even,state:delapp},
			{separator: true,sepstate:delapp},
			{name: '设置为当前版本', onpress : btn_even,state:setapp},
			{separator: true,sepstate:setapp}
			],
		searchitems : [
			
			{display: '应用名称', name : 'name' , isdefault: true},
			
		    {display: '描述信息', name : 'desc'}
			
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
			
			url=webroot+"/biz/common/jwupdate_add.jsp";
           window.open(url,'opendialog','width=460,height=410,top=230,left=300');
			
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
			url=webroot+"/biz/common/jwupdate_edit.jsp";
          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}
		else if (com=='设置为当前版本')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){
			alert("请选择一项要修改的数据项！");
				return;
			
			}
			$.ajax({
		    	url: webroot+'/commonbiz/updateAC!changeState.action',
		      data:'ids='+selectItemId,
		    	type: 'POST',
			    dataType: 'json',
			  //  timeout: 1000,
			    error: function(){
					alert("设置失败");
			    },
			    success: function(data){
			    	refreshGrid();
			        alert("设置成功");
			    }
			});
			
		}
		else if (com=='删除')
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
		    	url: webroot+'/commonbiz/updateAC!delJwUpdate.action',
		      data:'ids='+userIds,
		    	type: 'POST',
			    dataType: 'json',
			  //  timeout: 1000,
			    error: function(){
					alert("删除失败");
			    },
			    success: function(data){
			    if(data.delInfo=="1"){
			      alert("选项有当前版本不能删除");
			      refreshGrid();
			    }else{
			        alert("删除成功");
					refreshGrid();
					
					}
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

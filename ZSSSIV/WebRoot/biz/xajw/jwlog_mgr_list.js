//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var isuse='none';
	var unuse ='none';
	var deljwlog='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("isuse")>=0){
				 isuse='inline';
			 }
			 if(temp1.indexOf("unuse")>=0){
				 unuse='inline';
			 }
			 if(temp1.indexOf("deljwlog")>=0){
				 deljwlog='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{  
		url: webroot+'/xajw/jwLogAC!queryLogList.action',
		dataType: 'json',
		colModel : [
		
			{display: '日志编号', name : 'id', width : 100, align: 'center',hide:true},
			{display: '用户账号', name : 'user_id', width : 100,align: 'left',hide:false},
			{display: '业务ID', name : 'biz_id', width : 100,align: 'left',hide:true},
			{display: '用户姓名', name : 'user_name', width : 100,align: 'left',hide:false},
			{display: '业务名称', name : 'biz_name', width : 100,align: 'left',hide:false},
			{display: '操作时间', name : 'op_time', width : 150, align: 'center',hide:false}
			
			],
		buttons : [
		//	{name: '反选',bclass:'select',  onpress : btn_even},
//			{name: '使用用户统计', bclass:'delete', onpress : btn_even,state:isuse},
//			{separator: true,sepstate:isuse},
//			{name: '未使用用户统计', bclass:'delete', onpress : btn_even,state:unuse},
//			{separator: true,sepstate:unuse},
			{name: '删除', bclass:'delete', onpress : btn_even,state:deljwlog},
			{separator: true,sepstate:deljwlog}
			
			],
		searchitems : [
		    {display: '用户账号', name : 'user_id', isdefault : true},
			{display: '用户姓名', name : 'user_name'},
			{display: '业务名称', name : 'biz_name'}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'日志列表',
		showTableToggleBtn: true,
		resizable:true,  //窗口伸缩
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
	
	function btn_even(com,grid){
		selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
		if(com=='反选'){
			$('tr',grid).toggleClass('trSelected'); 
		}
		else if (com=='删除')
		{
			if($('.trSelected',grid).length==0){
					alert("请选择要删除的项！");
					return;
				}
				
				var onSubmit=confirm('你确定要删除吗？');
				if(onSubmit==false)return;
				
				var bizIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					bizIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/xajw/jwLogAC!delJwLog.action',
			    	data:'logIds='+bizIds,
			    	type: 'POST',
				    dataType: 'json',
				    error: function(){
						alert("删除失败");
				    },
				    success: function(data){
						refreshGrid();
				    }
				});
		}else if (com=='使用用户统计')
		{ 
		url=webroot+"/biz/xajw/jwlog_tongji.jsp";
          window.open(url,'opendialog','width=460,height=410,top=230,left=300');
			
		}else if (com=='未使用用户统计')
		{ 
		url=webroot+"/biz/xajw/jwlog_ntongji.jsp";
          window.open(url,'opendialog','width=460,height=410,top=230,left=300');
			
		}
					
	}
	
	
	
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var deluserlog ='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("deluserlog")>=0){
				 deluserlog='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{  
		url: webroot+'/platform/logAC!queryLog.action',
		dataType: 'json',
		colModel : [
		
			{display: '操作时间', name : 'OPERATE_DATE', width : 100, align: 'center',hide:false},
			{display: '操作用户', name : 'OPERATE_USER', width : 100,align: 'left',hide:false},
			{display: '用户部门', name : 'OPERATE_DEPT', width : 100,align: 'left',hide:false},
			{display: '操作业务', name : 'OPERATE_OBJECT', width : 100,align: 'left',hide:false},
			{display: '操作详细', name : 'OPERATE_INFO', width : 150, align: 'center',hide:false}
			
			],
		buttons : [
		//	{name: '反选',bclass:'select',  onpress : btn_even},
		//	{name: '使用用户统计', bclass:'delete', onpress : btn_even},
		//	{separator: true},
		//	{name: '未使用用户统计', bclass:'delete', onpress : btn_even},
		//	{separator: true},
			{name: '删除', bclass:'delete', onpress : btn_even,state:deluserlog},
			{separator: true,sepstate:deluserlog}
			
			],
		searchitems : [
		    {display: '操作用户', name : 'OPERATE_USER', isdefault : true},
			{display: '用户部门', name : 'OPERATE_DEPT'},
			{display: '操作业务', name : 'OPERATE_OBJECT'}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'系统用户日志列表',
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
			    	url: webroot+'/platform/logAC!delUserLog.action',
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
          window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}else if (com=='未使用用户统计')
		{ 
		url=webroot+"/biz/xajw/jwlog_ntongji.jsp";
          window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}
					
	}
	
	
	
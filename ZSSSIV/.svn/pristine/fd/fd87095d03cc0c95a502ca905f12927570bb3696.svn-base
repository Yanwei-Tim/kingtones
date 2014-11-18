
	
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var parent=this.dialogArguments;
	
	$("#flex1").flexigrid(
	{   
	  
		url: webroot+'/commonbiz/tztgAC!queryTztgUserList.action?id='+parent.selectItemId,
		dataType: 'json',
		colModel : [
			{display: '编号', name : 'id', width : 40, sortable : true, align: 'center',hide: false},
			{display: '姓名', name : 'xm', width : 45, sortable : true, align: 'left'},
			//{display: '警号', name : 'jh', width : 80, sortable : true, align: 'left'},
			{display: '单位', name : 'dw', width : 80, sortable : true, align: 'left'},
			//{display: '部门', name : 'bm', width : 70, sortable : true, align: 'left'},
			{display: '签收状态', name : 'readstatus', width : 45, sortable : false, align: 'left'},		
			{display: '签收时间', name : 'receiveTime', width : 100, sortable : false, align: 'left'}
			
			],
	
		sortname: "iso",
		sortorder: "asc",
		usepager: true,
		title: false,//'组织单元列表',
		useRp: true,
		rp: 10,
		//title:'组织单位管理',
		showTableToggleBtn: true,
		resizable:false,  //窗口伸缩
		onSubmit: addFormData,
		width:850,
		height: 300
		}
		);	
	function addFormData()
	{
		return true;
	}
	//刷新列表	
	function refreshGrid(){
		$('#flex1').flexOptions({params: [{ name: 'treeNodeID', value: getSelectNodeId()}]}).flexReload();
	}	
	
	function refreshGrid2(){
		var type = $("#type").val();
		var sendStatus = $("#sendStatus").val();
		var startdate = $("#startdate").val();
		var enddate = $("#enddate").val();
		var sendDeptid = $("#sendDeptid").val();
		
		$("#flex1").flexOptions({params: [
		{ name:'sendStatus',value:sendStatus},
		{ name:'startdate',value:startdate},
		{ name:'enddate',value:enddate},
		{ name:'sendDeptid',value:sendDeptid},
		{ name:'type', value:type}
		]}).flexReload();
	}
	
	var selectItemId;
	function btn_even(com,grid){
		if(com=='返选'){
			$('tr',grid).toggleClass('trSelected'); 
		}
		else if (com=='删除')
		{
				if($('.trSelected',grid).length==0){
					alert("请选择要删除的项！");
					return;
				}else{
					if(confirm('是否要删除该项！')){
						var ids = $('.trSelected',grid).find("td:first").eq(0).text();
						for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
							ids+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
						}
						$.ajax({
					    	url: webroot+'/commonbiz/tztgAC!delNotice.action?ids='+ids,
					    
					    	type: 'POST',
						    dataType: 'json',
						    //timeout: 1000,
						    error: function(){
								alert("删除失败");
						    	refreshGrid2();
						    },
						    success: function(data){
								
						    	refreshGrid2();
						    }
						});
					}
				}
		}else if (com=='添加')
		{
			url=webroot+"/biz/common/tztg_add.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}else if (com=='编辑')
		{   selectItemId = $('.trSelected',grid).find("td:first").eq(0).text()
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){
			alert("请选择一项要修改的数据项！");
				return;
			
			}
			url=webroot+"/biz/common/tztg_edit.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}else if (com=='查看')
		{
			url=webroot+"/biz/common/tztg_add.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}		
	}

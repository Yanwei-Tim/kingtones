//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	$("#flex1").flexigrid(
	{
		url: webroot+'/biz/serviceAC!queryTabInfoList.action?bizId='+bizId,
		dataType: 'json',
		colModel : [
			{display: 'id', name : 'id', width : 200, align: 'center',hide:true},
			{display: '选项卡id', name : 'tab_id', width : 200, align: 'center',hide:false},
			{display: '业务id', name : 'b_id', width : 200,align: 'left',hide:false},
			{display: '选项卡标题', name : 'tab_name', width : 200,align: 'left',hide:false}
			],
		buttons : [
			{name: '增加',bclass:'add', onpress : btn_even,state:'inline'},
			{separator: true,sepstate:'inline'},
			{name: '修改',bclass:'edit', onpress : btn_even,state:'inline'},
			{separator: true,sepstate:'inline'},
			{name: '删除', bclass:'delete', onpress : btn_even,state:'inline'},
			{separator: true,sepstate:'inline'}
			],
		searchitems : [
			{display: '业务id', name : 'b_id', isdefault : true}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'选项卡信息表',
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
		if(com=='返选'){
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
				
				var tabInfoIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					tabInfoIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/biz/serviceAC!delTabInfo.action',
			    	type: 'POST',
			    	data:'tabInfoIds='+tabInfoIds,
				    dataType: 'json',
				    error: function(){
						alert("删除失败");
				    },
				    success: function(data){
						refreshGrid();
				    }
				});
		}else if (com=='增加')
		{
			url=webroot+"/biz/service/tabinfo_add.jsp";
            //window.open(url,'','width=460,height=260,top=230,left=300');
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}	
		else if (com=='修改')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}
			url=webroot+"/biz/service/tabinfo_edit.jsp";
			window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}		
	}

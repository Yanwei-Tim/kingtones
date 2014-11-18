//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	$("#flex1").flexigrid(
	{
		url: webroot+'/biz/serviceAC!queryColMappingList.action?bizId='+bizId,
		dataType: 'json',
		colModel : [
			{display: 'id', name : 'id', width : 10, align: 'center',hide:true},
			{display: '业务id', name : 'b_id', width :10,align: 'left',hide:true},
			{display: '系统字段', name : 'columns', width : 100, align: 'center',hide:false},
			{display: '系统字段名', name : 'cname', width : 100,align: 'left',hide:false},
			{display: '客户表名', name : 'table_name', width : 100,align: 'left',hide:false},
			{display: '客户字段', name : 'c_column', width : 100,align: 'left',hide:false},
			{display: '客户字段类型', name : 'cname_type', width : 100,align: 'left',hide:false},
			{display: '是否有资源', name : 'is_res', width : 50,align: 'left',hide:false},
			{display: '资源分类代码', name : 'res_id', width : 50,align: 'left',hide:false},
			{display: '操作符', name : 'op', width : 50,align: 'left',hide:false}
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
			{display: '系统字段', name : 'columns', isdefault : true},
			{display: '业务id', name : 'b_id', isdefault : false}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'字段映射表',
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
				
				var colMappingIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					colMappingIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				
				var ifexsitres=0;
				$.ajax({
			    	url: webroot+'/biz/serviceAC!queryExsitBizRes.action',
			    	data:'colMappingIds='+colMappingIds,
			    	type: 'POST',
			    	async:false,
				    dataType: 'json',
				    error: function(){
						//alert("数据查找失败");
				    },
				    success: function(data){
				    	//alert("11"+data.info);
				    	//alert(data.info=="true");
				    	//alert(data.info!=null);
						if(data.info!=null){
						if(data.info=="true")
						ifexsitres=1;
						else ifexsitres=2;
						}					
						//alert(ifexsitres);
				    }
				});
				if(ifexsitres==0){alert("数据查找失败");
				return ;
				}
				if(ifexsitres==1){
					alert("存在被关联组件使用的数据,请重新选择或先删除已使用的组件数据！");
					return;
				}
				
				$.ajax({
			    	url: webroot+'/biz/serviceAC!delColMapping.action',
			    	data:'colMappingIds='+colMappingIds,
			    	type: 'POST',
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
			url=webroot+"/biz/service/colmapping_add.jsp";
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
			url=webroot+"/biz/service/colmapping_edit.jsp";
			window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}		
	}

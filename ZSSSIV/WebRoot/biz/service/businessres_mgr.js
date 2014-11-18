//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	$("#flex1").flexigrid(
	{
		url: webroot+'/biz/serviceAC!queryBizResList.action?bizId='+bizId,
		dataType: 'json',
		colModel : [
			{display: 'id', name : 'id', width : 100, align: 'center',hide:true},
			{display: '组件id', name : 'w_id', width : 100, align: 'center',hide:true},
			{display: '业务id', name : 'b_id', width : 100,align: 'left',hide:true},
			{display: '组件标题', name : 'name', width : 100,align: 'left',hide:false},
			{display: '组件类型', name : 'type', width : 100,align: 'left',hide:false},
			{display: '组件资源', name : 'res_id', width : 100,align: 'left',hide:false},
			{display: '是否显示', name : 'visible', width : 100,align: 'left',hide:false},
			{display: '校验类型', name : 'validate_type', width : 100,align: 'left',hide:false},
			{display: '校验提示', name : 'validate_des', width : 100,align: 'left',hide:false},
			{display: '系统字段', name : 'code', width : 100,align: 'left',hide:false},
			{display: '校验数据类型', name : 'datatype', width : 100,align: 'left',hide:false},
			{display: '允许为空', name : 'isbenull', width : 100,align: 'left',hide:false},
			{display: '顺序编号', name : 'orders', width : 100,align: 'left',hide:false},
			{display: '选项卡号', name : 'tabgroup', width : 100,align: 'left',hide:false}
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
			{display: '组件标题', name : 'name',isdefault : true},
			{display: '组件类型', name : 'type'}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'业务组件列表',
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
		selectItemId = $('.trSelected',grid).find("td:first").eq(0).text()
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
				
				var bizResIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					bizResIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/biz/serviceAC!delBizRes.action',
			    	data:'bizResIds='+bizResIds,
			    	type: 'POST',
				    dataType: 'json',
				    //timeout: 1000,
				    error: function(){
						alert("删除失败");
				    },
				    success: function(data){
						//alert(data.delInfo);
						//refreshNode();
						refreshGrid();
				    }
				});
		}else if (com=='增加')
		{
			url=webroot+"/biz/service/businessres_add.jsp";
            //window.open(url,'','width=460,height=460,top=230,left=300');
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}	
		else if (com=='修改')
		{
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}
			url=webroot+"/biz/service/businessres_edit.jsp";
			window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}else if(com=='关联组件'){
			if(selectItemId==''){
				alert("请选择要关联的数据项！");
				return;
			}
		}else if(com=='关联业务'){
			if(selectItemId==''){
				alert("请选择要关联的数据项！");
				return;
			}
		}
					
	}

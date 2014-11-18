
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var dplay='none';
	var relaconf ='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		 
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("dplay")>=0){
				 dplay='inline';
			 }
			 if(temp1.indexOf("relaconf")>=0){
				 relaconf='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/biz/serviceAC!queryBizList.action?opType=0',
		dataType: 'json',
		colModel : [
			{display: '业务ID', name : 'b_id', width : 100, align: 'center',hide:false},
			{display: '业务名称', name : 'b_name', width : 100,align: 'left',hide:false},
			{display: '业务类型', name : 'b_type', width : 100,align: 'left',hide:false},
			{display: '图片名称', name : 'img_name', width : 100, align: 'center',hide:false},
			{display: '列表页面过滤', name : 'l_simple_items', width : 100, align: 'center',hide:false},
			{display: '详细页面过滤', name : 'd_simple_items', width : 100, align: 'center',hide:false},
			{display: 'L_SQL语句', name : 'l_sql', width : 100, align: 'center',hide:true},
			{display: 'D_SQL语句', name : 'd_sql', width : 100, align: 'center',hide:true},
			{display: '父节点ID', name : 'father_id', width : 100, align: 'center',hide:false},
			{display: '叶子节点', name : 'final_node', width : 100, align: 'center',hide:false},
			{display: '更新日期', name : 'edit_res_date', width : 100, align: 'center',hide:false},
			{display: '数据源', name : 'ds', width : 100, align: 'center',hide:false},
			{display: '排序', name : 'b_orders', width : 100, align: 'center',hide:false}			
			],
		buttons : [
			{name: '显示过滤',bclass:'edit', onpress : btn_even,state:dplay},
			{separator: true,sepstate:dplay},
			{name: '关联组件',  bclass:'relate', onpress : btn_even,state:relaconf},
			{separator: true,sepstate:relaconf}
			],
		searchitems : [
			{display: '业务ID', name : 'b_id', isdefault : true},
			{display: '业务名称', name : 'b_name'}//,
			//{display: '业务类型', name : 'b_type'}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'业务列表',
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
		$('#flex1').flexOptions({params: [{ name: 'opType', value: '0'}]}).flexReload();
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
				
				var bizIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					bizIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/biz/serviceAC!delBiz.action',
			    	data:'bizIds='+bizIds,
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
			url=webroot+"/biz/service/business_add.jsp";
            //window.open(url,'','width=460,height=260,top=230,left=300');
            window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}	
		else if (com=='显示过滤')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
			if(selectItemId==''){
				alert("请选择要显示过滤的数据项！"); // Modify by 陈萧如
				return;
			}else if($('.trSelected',grid).length>1){ // Add by 陈萧如 bug32对应
				alert("请选择一项要显示过滤的数据项！");
					return;
			}
			url=webroot+"/biz/service/busiconf_edit.jsp";
			window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}else if(com=='关联组件'){
			if(selectItemId==''){
				alert("请选择要关联的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){ // Add by 陈萧如 bug33对应
				alert("请选择一项要关联的数据项！");
					return;
			}
			url=webroot+"/biz/service/busiconfres_mgr.jsp?bizId="+selectItemId;
			checkIsLeaf(selectItemId,url);
			
			//window.location = url;
		}else if(com=='关联业务'){
			if(selectItemId==''){
				alert("请选择要关联的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){ // Add by 陈萧如 bug33对应
				alert("请选择一项要关联的数据项！");
					return;
			}
			url=webroot+"/biz/service/businessrel_mgr.jsp?bizId="+selectItemId;
			checkIsLeaf(selectItemId,url);
			//window.location = url;
		}else if(com=='选项卡'){
			if(selectItemId==''){
				alert("请选择一项要编辑选项卡的数据项！"); // Modify by 陈萧如
				return;
			}else if($('.trSelected',grid).length>1){ // Add by 陈萧如
				alert("请选择一项要编辑选项卡的数据项！");
					return;
			}
			url=webroot+"/biz/service/tabinfo_mgr.jsp?bizId="+selectItemId;
			checkIsLeaf(selectItemId,url);
			//window.location = url;
		}else if(com=='字段映射'){
			if(selectItemId==''){
				alert("请选择一项要编辑字段映射的数据项！"); // Modify by 陈萧如
				return;
			}else if($('.trSelected',grid).length>1){ // Add by 陈萧如
				alert("请选择一项要编辑字段映射的数据项！");
					return;
			}
			url=webroot+"/biz/service/colmapping_mgr.jsp?bizId="+selectItemId;
			checkIsLeaf(selectItemId,url);
			//window.location = url;
		}
					
	}
	
	
	function checkIsLeaf(bizId,url){
		$.ajax({
		url: webroot+'/biz/serviceAC!checkIsLeaf.action',
		data:'bizId='+bizId,
		type: 'POST',
		dataType: 'json',
	    error: function(){
			alert("查询失败");
		},
		success: function(data){
			if(data.info=='1'){
				alert("非叶子节点，不能维护！");
			}else{
				window.location = url;				
			}
	    }
	});  
	}

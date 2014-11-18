//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var addcode='none';
	var delcode ='none';
	var editcode='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("addcode")>=0){
				 addcode='inline';
			 }
			 if(temp1.indexOf("delcode")>=0){
				 delcode='inline';
			 }
			 if(temp1.indexOf("editcode")>=0){
				 editcode='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/biz/serviceAC!queryCodeTypeList.action',
		dataType: 'json',
		colModel : [
			{display: '分类代码', name : 'res_id', width : 100, align: 'center',hide:false},
			{display: '分类名称', name : 'res_name', width : 100,align: 'left',hide:false},
			{display: '更新日期', name : 'change_date', width : 100, align: 'center',hide:false},
			{display: '代码SQL', name : 'source', width : 300,align: 'left',hide:false},
			{display: '数据源', name : 'ds', width : 300,align: 'left',hide:false}
			],
		buttons : [
			{name: '增加',bclass:'add', onpress : btn_even,state:addcode},
			{separator: true,sepstate:addcode},
			{name: '修改',bclass:'edit', onpress : btn_even,state:editcode},
			{separator: true,sepstate:editcode},
			{name: '删除', bclass:'delete', onpress : btn_even,state:delcode},
			{separator: true,sepstate:delcode}
			],
		searchitems : [
			{display: '分类代码', name : 'res_id', isdefault : true},
			{display: '分类名称', name : 'res_name'}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'业务代码分类表',
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
				
				var codeTypeIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					codeTypeIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/biz/serviceAC!delCodeType.action',
			    	data:'codeTypeIds='+codeTypeIds,
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
			url=webroot+"/biz/service/codetype_add.jsp";
            //window.open(url,'','width=460,height=260,top=230,left=300');
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}	
		else if (com=='修改')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){ // Add by 陈萧如 bug34对应
				alert("请选择一项要修改的数据项！");
					return;
			}
			url=webroot+"/biz/service/codetype_edit.jsp";
			window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}
					
	}

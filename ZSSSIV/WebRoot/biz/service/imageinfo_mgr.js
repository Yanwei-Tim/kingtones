//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var addimg='none';
	var delimg ='none';
	var editimg='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("addimg")>=0){
				 addimg='inline';
			 }
			 if(temp1.indexOf("delimg")>=0){
				 delimg='inline';
			 }
			 if(temp1.indexOf("editimg")>=0){
				 editimg='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/biz/serviceAC!queryImageInfoList.action',
		dataType: 'json',
		colModel : [
			{display: '图片名称', name : 'img_name', width : 200, align: 'center',hide:false},
			{display: '图片路径', name : 'img_path', width : 200, align: 'center',hide:false},
			{display: '描述信息', name : 'img_des', width : 200,align: 'left',hide:false}
			],
		buttons : [
			{name: '增加',bclass:'add', onpress : btn_even,state:addimg},
			{separator: true,sepstate:addimg},
			{name: '修改',bclass:'edit', onpress : btn_even,state:editimg},
			{separator: true,sepstate:editimg},
			{name: '删除', bclass:'delete', onpress : btn_even,state:delimg},
			{separator: true,sepstate:delimg}
			],
		searchitems : [
			{display: '图片名称', name : 'img_name', isdefault : true},
			{display: '描述信息', name : 'img_des', isdefault : false}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'图片信息表',
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
				
				var imageInfoIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					imageInfoIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/biz/serviceAC!delImageInfo.action',
			    	type: 'POST',
			    	data:'imageInfoIds='+imageInfoIds,
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
			url=webroot+"/biz/service/imageinfo_add.jsp";
            //window.open(url,'','width=460,height=260,top=230,left=300');
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}	
		else if (com=='修改')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){ // Add by 陈萧如 bug30对应
				alert("请选择一项要修改的数据项！");
					return;
			}
			url=webroot+"/biz/service/imageinfo_edit.jsp";
			window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}		
	}

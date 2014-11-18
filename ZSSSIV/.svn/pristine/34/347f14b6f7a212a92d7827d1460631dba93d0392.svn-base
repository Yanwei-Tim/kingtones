//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var addsyscode='none';
	var delsyscode ='none';
	var editsyscode='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("addsyscode")>=0){
				 addsyscode='inline';
			 }
			 if(temp1.indexOf("delsyscode")>=0){
				 delsyscode='inline';
			 }
			 if(temp1.indexOf("editsyscode")>=0){
				 editsyscode='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/biz/serviceAC!queryCodeList.action',
		dataType: 'json',
		colModel : [
			{display: 'id', name : 'id', width : 10, align: 'center',hide:true},
			{display: '代码编码', name : 'key', width : 200, align: 'center',hide:false},
			{display: '代码值', name : 'value', width : 200,align: 'left',hide:false},
			{display: '代码分类编码', name : 'type', width : 200,align: 'left',hide:false}
			],
		buttons : [
			{name: '增加',bclass:'add', onpress : btn_even,state:addsyscode},
			{separator: true,sepstate:addsyscode},
			{name: '修改',bclass:'edit', onpress : btn_even,state:delsyscode},
			{separator: true,sepstate:delsyscode},
			{name: '删除', bclass:'delete', onpress : btn_even,state:editsyscode},
			{separator: true,sepstate:editsyscode}
			],
		searchitems : [
			{display: '代码编码', name : 'key', isdefault : true},
			{display: '代码值', name : 'value'},
			{display: '代码分类编码', name : 'type'}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'系统代码表',
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
				
				var codeIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					codeIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/biz/serviceAC!delCode.action',
			    	data:'codeIds='+codeIds,
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
			url=webroot+"/biz/service/code_add.jsp";
            //window.open(url,'','width=460,height=260,top=230,left=300');
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}	
		else if (com=='修改')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){ // Add by 陈萧如 bug35对应
				alert("请选择一项要修改的数据项！");
					return;
			}
			url=webroot+"/biz/service/code_edit.jsp";
			window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}		
	}

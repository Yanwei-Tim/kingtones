//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	/**
	var sendMessage='none';
	var session ='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		 temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
		 	 temp1=temp.split("=")[1];
			 if(temp1.indexOf("sendMessage")>=0){
				 sendMessage='inline';
			 }
			 if(temp1.indexOf("session")>=0){
				 session='inline';
			 }
			 break;
		}
	 }
	 */
	$("#flex1").flexigrid(
	{	
		url: webroot+'/platform/jwUserPNAC!getSessinList.action',
		dataType: 'json',
		colModel : [
			{display: '用户名', name : 'username', width : 100, sortable : true, align: 'center'},
			{display: '资 源', name : 'resource', width : 100, sortable : true, align: 'left'},
			{display: '状 态', name : 'status', width : 100, sortable : true, align: 'left'},
			{display: '状 态', name : 'presence', width : 100, sortable : true, align: 'left'},
			{display: '用户IP', name : 'clientIP', width : 100, sortable : true, align: 'left'},
			{display: '创建时间', name : 'createdDate', width : 100, sortable : true, align: 'left'}
			],
			/**
		buttons : [
			{name: '消息发送',  onpress : btn_even,state:sendMessage},
			{separator: true,sepstate:sendMessage},
			{name: 'Session', onpress : btn_even,state:session},
			{separator: true,sepstate:session}
			],
		searchitems : [
			{display: '用户ID', name : 'email' , isdefault: true},
			{display: '用户名', name : 'userName'}
			],*/
		sortname: "iso",
		sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		showTableToggleBtn: true,
		resizable:false,  //窗口伸缩
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
	var selectItemId;
	function btn_even(com,grid){
		if(com=='反选'){
			$('tr',grid).toggleClass('trSelected'); 
		}
		/**
		else if (com=='消息发送')
		{
			
			url=webroot+"/platform/dnp/sendMessage.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}
		else if (com=='session')
		{
		
		
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){
			alert("请选择一项要修改的数据项！");
				return;
			}
			url=webroot+"/biz/xajw/jwvideo_edit.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}	*/					
	}
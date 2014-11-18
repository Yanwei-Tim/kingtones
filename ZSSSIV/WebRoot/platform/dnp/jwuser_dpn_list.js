//----------------【定义flexgrid开始】--------------------------------------------------------------------------
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
	$("#flex1").flexigrid(
	{	
		url: webroot+'/platform/jwUserPNAC!queryUserPNList.action',
		dataType: 'json',
		colModel : [
			{display: 'onLine', name : 'online1', width : 100, sortable : true, align: 'center'},
			{display: '用户名ID', name : 'id', width : 100, sortable : true, align: 'left'},
			{display: '用户名', name : 'userName', width : 100, sortable : true, align: 'left'},
			{display: '邮箱', name : 'email', width : 100, sortable : true, align: 'left'},
			{display: '创建时间', name : 'createdDate', width : 100, sortable : true, align: 'left'}
			],
		buttons : [
			{name: '消息发送',  onpress : btn_even,state:sendMessage},
			{separator: true,sepstate:sendMessage},
			{name: 'Session', onpress : btn_even,state:session},
			{separator: true,sepstate:session}
			],
		searchitems : [
			{display: '用户ID', name : 'id' , isdefault: true},
			{display: '用户名', name : 'userName'}
			],
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
		else if (com=='消息发送')
		{
			
			url=webroot+"/platform/dnp/sendMessage.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}
		else if (com=='session')
		{
			url=webroot+"/platform/dnp/dpn_session_list.jsp";
			window.open(url,'opendialog','width=600,height=600,top=230,left=300');
		}					
	}
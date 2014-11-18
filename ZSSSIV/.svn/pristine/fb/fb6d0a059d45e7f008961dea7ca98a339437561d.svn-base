
  //让用户文本框获得焦点
  function getFocus(){
      window.parent.frames["topFrame"].location.href="manageTopPage.do";
      window.parent.frames["leftFrame"].location.href="manageLeftPage.do"; 
      document.getElementById("txt_UserName").focus();  
     //调用权限控制
     checkOperation();
  }
  //添加和修改
    function operate(method,operate){
        //获取当前页
        var curPage = document.getElementById("curPage").value;
        if(method=="add"){
           document.form1.action="systemUser.do?action=gotoUserAddUrl&systemUserCond.curPage="+curPage;
           document.form1.submit();
        }
        if(method=="update"){
           document.form1.action="systemUser.do?action=gotoUserUpdateUrl&systemuser.userID="+operate+"&systemUserCond.curPage="+curPage;
           document.form1.submit();
        }
    }
    
    //单个删除
    function del(userID){
      //获取当前页
      var curPage = document.getElementById("curPage").value;
      if(confirm("您确定要删除吗?")){   
         //到异步action中删除数据
         var url = "ajaxSystemUserList.do?action=deleteSystemUser&systemuser.userID="+userID+"&systemUserCond.curPage="+curPage;
         ajaxSelectSystemUser(url,'del'); 
         return false; 
      }else{
        return false;
      } 
    }  
   
   //批量删除
   function CheckNo(){
      //获取当前页
      var curPage = document.getElementById("curPage").value;
      //获取所有复选框 判断复选框是否处于选中状态
      var chs = document.getElementsByName("CheckBox_Sel");
      var j=0;
      //将选中的复选框ID进行拼接
      var userIDS="";
      for(var i=0;i<chs.length;i++){
         if(chs[i].checked==true){
            userIDS=userIDS+chs[i].value+",";
            j++;
         }
      }
      if(j==0){
         alert("您没有选择任何项!");
      }else{
         if(confirm("您确认要删除吗?")){
           //采取异步方式 批量删除用户信息
           var url = "ajaxSystemUserList.do?action=batchDeleteSystemUser&userIDS="+userIDS+"&systemUserCond.curPage="+curPage;
           ajaxSelectSystemUser(url,'batchDel'); 
            return false;
         }else{
            return false;
         }
      }      
   }
   
   //初始化用户密码
   function updatePWD(userID){
      //获取当前页
      var curPage = document.getElementById("curPage").value;
      if(confirm("您确认要初始化密码吗?")){   
         //到异步action中删除数据
         var url = "ajaxSystemUser.do?action=initPWD&systemuser.userID="+userID+"&systemUserCond.curPage="+curPage;
         ajaxInitUserPWD(url); 
         return false;
       }else{
         return false;
       }
   }
      
   //异步初始化用户密码
   function ajaxInitUserPWD(url)
    {
        var p = $("#form1").serialize();
		ajax_submit(true,url,p,false,"ajax_callback_init_userpwd",'');
    } 
      
    //初始化密码函数回调
    function ajax_callback_init_userpwd(ajaxResult,params)
      {
          if(ajaxResult[0])
          {
              var modulOperation = $(ajaxResult[1]).find("moduleandoperation").text();
              if(modulOperation=='111'){
                  alert("密码初始化成功");
              }else{
                 alert("密码初始化失败");
              }
          }
      }
      
  //查询用户管理数据
  function selectSystemUser(){
   //获取当前页
   document.getElementById("curPage").value=1;
   var curPage = document.getElementById("curPage").value;
     var userName = document.getElementById("txt_UserName");
     if(userName.value==''){
         //将单位ID清空
         document.getElementById("immediacyID").value=0;
     }
     //采取jquery实现异步查询
     var url = "ajaxSystemUserList.do?systemUserCond.curPage="+curPage;
     ajaxSelectSystemUser(url,'select');
  }
      
  //异步删除,查询用户管理数据
  function ajaxSelectSystemUser(url,param)
    {
        var p = $("#form1").serialize();
		ajax_submit(true,url,p,false,"ajax_callback_select_systemUser",param);
    } 
      
  //回调删除,查询用户数据
  function ajax_callback_select_systemUser(ajaxResult,params){
     if(ajaxResult[0]){              
        document.getElementById("tableDiv").innerHTML=ajaxResult[1];
        var usernames = document.getElementById("usernames"); 
        if(params=='batchDel'){
          if(usernames.value!=''){
           alert(usernames.value);
          }
        }
        //调用权限控制
        checkOperation();
     }
  }    
  
  //点击全选按钮触发事件
  function ckeckclick(){
        var chkAll = document.getElementById("chkAll");
        var CheckBox_Sel = document.getElementsByName("CheckBox_Sel");
        if(chkAll.checked==true){
            for(var i=0;i< CheckBox_Sel.length;i++){
                CheckBox_Sel[i].checked=true;
            }
        }else{
            for(var i=0;i< CheckBox_Sel.length;i++){
                CheckBox_Sel[i].checked=false;
            }
        }  
    } 
    
    
// 点击树节点,动态加载子节点
function loadChild(nodeid,areaCode) {
   ajaxLoadDeptChildNode(nodeid,areaCode);
}    
  
// 加载单位树
function ajaxLoadDeptChildNode(nodeid,areaCode) {
  //点击节点时候拿到单位ID
  document.getElementById("immediacyID").value=nodeid;
    var p = $("#form1").serialize();
	var url = "systemuserDeptTreeNodeAjax.do?action=loadChildNode&treeNodeID=" + nodeid;
	ajax_submit(true,url,p,false,"ajax_callback_depttree",areaCode);
}

 /*
 * event type ajax call back method
 */
function ajax_callback_depttree(ajaxResult,params) {
  if(ajaxResult[0]) {
    var ajaxRes = ajaxResult[1].split(';');
      var reg = new RegExp(/\r\n/gm); //替换换行
      // 加入新节点
      for(var i=0;i < ajaxRes.length;i++) {          
          if(ajaxRes[i] != null && ajaxRes[i] != '' && ajaxRes[i].indexOf(',') > 0) {
              var tempNode = ajaxRes[i].split('?');
              var id = tempNode[0].replace(reg,"");
              var pid = tempNode[1].replace(reg,"");
              d.add(id,pid,tempNode[2],tempNode[3],tempNode[4]);
          }
      }          
       var deptTreeDiv = document.getElementById("deptTreeDiv");
           deptTreeDiv.innerHTML="";
           deptTreeDiv.innerHTML=d;
       
       //当点击完树后并查询该树下的用户信息列表
      var url = "ajaxSystemUserList.do"
      //获取登录用户区域编码
      var areaCode = document.getElementById("areaCode").value;
      if(params==areaCode){
         ajaxSelectSystemUser(url,'area');
      }
    }  
  }	
  
   // 分页
    function setPage(pageno) {
         //点击时候赋予隐藏域中的当前页
         document.getElementById("curPage").value=pageno
         var url="ajaxSystemUserList.do?systemUserCond.curPage="+pageno;
         //点击上一页或下一页触发事件
         ajaxSelectSystemUser(url,'currePage');
     }
     function gotoPage() {      
         var pageno = document.getElementById('txtGOTOPageIndex').value;
         //获取总页数
         var totalPage = document.getElementById("totalPage").value;
         if(totalPage-pageno < 0) {
             alert("跳转的页面不存在！");
             return;
         }else if(pageno <= 0){
             alert("跳转的页面不存在！");
             return;
         }
         var url="ajaxSystemUserList.do?systemUserCond.curPage="+pageno;
         //点击Go触发事件
         document.getElementById("curPage").value=pageno   
         ajaxSelectSystemUser(url,'currePage');
     }
     
      //检查是否有操作权限
   function checkOperation(){
		//获取操作权限
		var operations=document.getElementById("operation").value;	
		var input = document.getElementsByTagName("input");	
		var inputs=document.getElementsByTagName("img");
		var imgs=document.getElementsByTagName("a");
		var len=inputs.length+imgs.length+input.length;
		var src=new Array(len);
		for(var z=0;z<input.length;z++){
			src[z]=input[z];
		}
		for(var z=0;z<inputs.length;z++){
			src[input.length+z]=inputs[z];
		}
		for(var z=0;z<imgs.length;z++){
			src[input.length+inputs.length+z]=imgs[z];
		}		
	    for(var i=0;i < src.length;++i)
	    {	
	        if(src[i].name.indexOf("fun_") != -1){		        
	        	var opeIds=src[i].name.split("_")[1];		        	
	        	var nums=opeIds.split(",");		        	
	        	for(var j=0;j < nums.length;j++){		        	 
	        		if(operations.indexOf(","+nums[j]+",") < 0){
	        		    if(src[i].name.indexOf("_btn_")!=-1){                               		        			 
		        		    src[i].disabled="disabled";
		        	     }
	        		 	if(src[i].name.indexOf("_img_")!=-1){		        		 	        
	        				src[i].disabled="disabled";
	        			}
	        			if(src[i].name.indexOf("_link_")!=-1){
	        				src[i].href="javascript:void(0)";
	        			}
							if(src[i].name.indexOf("_image_")!=-1){
						      src[i].style.display="none";
							}
	        			break;
	        		}
	        	} 
	        }
  }	
 }		    	    
//dd
$(document).ready(function(){
   		//更底层的ajax()函数
   		$.ajax({
	    	url: 'platform/menuAC!queryAccessibleMenus.action',
	    	type: 'POST',
		    dataType: 'json',
		    error: function(){
		    parent.location.href=webroot+"/platform/login_point.action";
		    	//document.url = "platform/login_point.action";
		       // alert('Error loading XML document');
		    },
		    success: function(data){
		       	//alert (data.menuList[3].name);
		       	//alert (data.menuList);
				$("#message").html(data.menuListStr);
		    }
		});
		
		/*
		//获取ac中的json并将其解析成js对象
		$.getJSON("platform/menuAC!getAccessibleMenus.action",function(data){
				alert (data.menuList[3].name);
				$("#message").html(data.menuListStr);
		});
		*/
		
		/*
		//解析ac中的json并将其转换成js对象    
		//注：当data {n:1}没有时，返回的是json数据没有转换成js对象
		$.post('platform/menuAC!getAccessibleMenus.action', {n:1}, function(data){  
		     alert(typeof data.menuList);  
		     alert(data.menuListStr);  
		     alert (data.menuList[3].name);
			 $("#message").html(data.menuListStr);
		}, 'json'); 
		*/
		
		/*
		$.post('platform/menuAC!getAccessibleMenus.action',{n:1}, function(data){  
			 alert (1);
	   		 alert(typeof data.menuList);  
		     alert(data);  
		     alert (data.menuList[3].name);
			 $("#message").html(decodeURI(data));
   		}, 'html');
   		*/  
});

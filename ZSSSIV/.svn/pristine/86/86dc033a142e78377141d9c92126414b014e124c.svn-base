
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head><title>
<%--左边菜单页面--%>
</title>
<link href="<%=request.getContextPath()%>/platform/images/css/QQBar_Main.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
 
</head>     
 
<body class="tree_bgcolor" leftMargin="0" topMargin="0" >
    <form name="form1" method="post" action="left.aspx" id="form1">
<script>     
    document.body.onresize=function()
      {
         // alert(screen.height+"-"+document.body.clientHeight);
          if(document.body.clientHeight>350)
             document.getElementById("PARENT").style.height =document.body.clientHeight-50;
         
         }
         document.body.onload=function()
      {
          //alert(screen.height+"-"+document.documentElement.clientHeight);
          if(document.body.clientHeight>350)
             document.getElementById("PARENT").style.height =document.body.clientHeight-50;
          
         } 
</script>

       <table id="tab" border="0" cellpadding="0" cellspacing="0" style="width: 200px" >
		  <tr>
			<td height="27" class="left1_bgimage"  valign="bottom" style="width: 200px" >
            </td>
		  </tr>
		  <tr height="100%">
			<td valign="top"  class="leftbj_bgimage" style="width: 187px; height: 100%;" >
               
               


  <div id="PARENT" style="width: 187px">	<ul id="nav"><div id="div15"> <li id="rptMenus_ctl0_dvA"> <a href="#Menu=M_15" onclick="DoMenu('M_15')">机构管理</a> <ul id="M_15" class="collapsed"><li id="rptMenus_ctl0_rptMenuItems_ctl0_dvA1"><a href="departList.action" target='main' >单位管理</a></li> </ul></li>	</div><div id="div15"> <li id="rptMenus_ctl1_dvA"> <a href="#Menu=M_4" onclick="DoMenu('M_4')">用户管理</a> <ul id="M_4" class="collapsed"><li id="rptMenus_ctl1_rptMenuItems_ctl0_dvA1"><a href="userQueryList.action" target='main' >用户管理</a></li> </ul></li>	</div><div id="div15"> <li id="rptMenus_ctl2_dvA"> <a href="#Menu=M_2" onclick="DoMenu('M_2')">权限管理</a> <ul id="M_2" class="collapsed"><li id="rptMenus_ctl2_rptMenuItems_ctl0_dvA1"><a href="roleQueryList.action" target='main' >角色管理</a></li> </ul></li>	</div><div id="div15"> <li id="rptMenus_ctl3_dvA"> <a href="#Menu=M_125" onclick="DoMenu('M_125')">设备管理</a> <ul id="M_125" class="collapsed"><li id="rptMenus_ctl3_rptMenuItems_ctl0_dvA1"><a href="mobileInfoList.action" target='main' >手机设备</a></li> </ul></li>	</div> </ul>	</div>


                
                 
            </td>
	    </tr>
	    <tr>
		    <td height="19" class="left2_bgimage"  valign="bottom" style="width: 187px">&nbsp;
               </td>
	    </tr>
	    </table>
	    
	  
     <script type="text/javascript" language="javascript">
 
var LastLeftID = "";
 
function DoMenu(emid)
{
    var obj = document.getElementById(emid); 
    obj.className = (obj.className == "expanded"?"collapsed":"expanded");
    if((LastLeftID!="")&&(emid!=LastLeftID))
    {
        document.getElementById(LastLeftID).className = "collapsed";
    }
    LastLeftID = emid;
}
function GetMenuID()
{
    var MenuID="";
    var _paramStr = new String(window.location.href);
    var _sharpPos = _paramStr.indexOf("#");
 
    if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
    {
        _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
    }
    else
    {
        _paramStr = "";
    }
 
    if (_paramStr.length > 0)
    {
        var _paramArr = _paramStr.split("&");
        if (_paramArr.length>0)
        {
            var _paramKeyVal = _paramArr[0].split("=");
            if (_paramKeyVal.length>0)
            {
                MenuID = _paramKeyVal[1];
            }
        }
    }
 
    if(MenuID!="")
    {
        DoMenu(MenuID)
    }
}
 
GetMenuID();
 
 function OpenGis() {
    var url="http://121.10.2.227:7080/JsGIS/index.html";
    var features = "width="+screen.width+",height="+screen.height+",top=0,left=0,toolbar=yes,menubar=yes,scrollbars=yes,resizable=yes,location=yes,status=yes";
       window.open(url,"_blank",features);
     }
     
 
 
      
      </script> 
         
    </form>
</body>
</html>

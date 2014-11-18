<%@ page language="java" pageEncoding="UTF-8"%>
<html>
 <%String path = request.getContextPath(); %>
<head>
<title></title>
<link href="<%=request.getContextPath()%>/platform/images/css/QQBar_Main.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/platform/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/platform/framework/left.js"></script>
<script type="text/javascript" src="<%=path%>/config.js"></script>
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
</script>
</head>     
 
<body class="tree_bgcolor" leftMargin="0" topMargin="0">
    <form name="form1" method="post" action="left.aspx" id="form1">
       <table id="tab" border="0" cellpadding="0" cellspacing="0" style="width: 200px" >
           <tr>
			    <td height="27" class="left1_bgimage"  valign="bottom" style="width: 200px" >
                </td>
		   </tr>
		   <tr height="100%">
			    <td valign="top"  class="leftbj_bgimage" style="width: 187px; height:100%;" >
     		        <div id="message"></div>
                </td>
	       </tr>
	       <tr>
		       <td height="19" class="left2_bgimage"  valign="bottom" style="width: 187px">&nbsp;
               </td>
	        </tr>
	    </table>
    </form>
    <script type="text/javascript" language="javascript">
	
</script> 
</body>

</html>

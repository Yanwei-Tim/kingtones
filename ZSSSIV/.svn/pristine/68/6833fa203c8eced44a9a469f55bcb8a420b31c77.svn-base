
	//列表页面通用翻页
	function gotoPage(formname,pagenum){
		//更底层的ajax()函数
	   		$.ajax({
		    	url: 'platform/unitAC!showUnitList.action',
		    	type: 'POST',
			    dataType: 'json',
			    //timeout: 1000,
			    error: function(){
			        alert('Error loading XML document');
			    },
			    success: function(data){
			    	printHtml(data);
			    }
			});
	}
	
	function printHtml(data){
			unitList=data.unitList;
			    	var html = "";
				    $("#data").empty();
			    	html+="<tr class='rtr_bg2'>";
					html+="<td align='center' width='7%'><strong>编号</strong></td>";
					html+="<td align='left' width='20%'><strong>单位全称</strong></td>";
					html+="<td align='left' width='20%'><strong>单位简称</strong></td>";
					html+="<td align='left' width='20%'><strong>所属单位</strong></td>";
					html+="<td align='center' width='6%'><strong>状态</strong></td>";
					html+="<td align='center' width='15%'><strong>操 作</strong></td>";
					html+="</tr>";
			       	$.each(data.unitList,function(n,unit){
			       		html+="<tr onmouseover='highlightTr(this);' onmouseout='highlightTr(this);'>";
				       		html+="<td id='id' align='center' width='7%'>"+unit.id+"</td>";
							html+="<td id='unitName' align='left' width='20%'>"+unit.unitName+"</td>";
							html+="<td id='parentId' align='left' width='20%'>"+unit.parentId+"</td>";
							html+="<td id='description' align='left' width='20%'>"+unit.description+"</td>";
							html+="<td align='center' width='6%'>1</td>";
							html+="<td align='center' width='15%'>";
							html+="	<a href='javascript:unit_edit("+unit.id+")'> <img alt='浏览' border='0' src='<%=path%>/platform/images/address/look.gif' /> </a>&nbsp;";
							html+="	<a href=''> <img alt='禁用' border='0' src='<%=path%>/platform/images/role/stop.gif' /> </a>&nbsp;";
							html+="	<a href=''> <img alt='启用' border='0' src='<%=path%>/platform/images/role/normal.gif' /> </a>&nbsp;";
							html+="	<a href=''> <img alt='编辑' border='0' src='<%=path%>/platform/images/role/edit.gif' /> </a>&nbsp;";
							html+="	<a href=''> <img alt='删除' border='0' src='<%=path%>/platform/images/role/del.gif' /> </a>&nbsp;";
							html+="</td>";
						html+="</tr>";	
			       	});
			       	$("#data").html(html);
		}
	
	//列表鼠标经过高亮显示
	function highlightTr(o){ 
	var regStr=/\b\s*trHover\b/g;
	if(o.className.indexOf('trHover')==-1){
	o.className+=" trHover"; 
	}
	else{ 
	o.className=o.className.replace(regStr,""); }
	}
	
	//列表页面全选
	function checkSelAll(chkbox,formName,checkboxName){
			var ischecked=chkbox.checked;
			var frm = document.forms(formName);
			 for (var i=0; i<frm.length; i++)
                {
                    if(frm.elements[i].name.indexOf('selectid') !=-1)
                    {
	        			if(ischecked){
	        			frm.elements[i].checked=true;
	        			}else{
	        			frm.elements[i].checked=false;
	        			}
                    }
		       	}
		return true;
	}
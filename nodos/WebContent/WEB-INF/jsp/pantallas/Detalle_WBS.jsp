<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
<head>
<meta name="GENERATOR" content="PageBreeze Free HTML Editor (http://www.pagebreeze.com)">
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1" >
<title>Listado General de Proyectos</title>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>
 
<link rel="stylesheet" type="text/css" href="${ contextPath }/easy-ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/easy-ui/themes/icon.css">
<script type="text/javascript" src="${ contextPath }/js/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ contextPath }/easy-ui/jquery.easyui.min.js"></script>
 
<script>

$(function(){
	$('#test').treegrid({
		title:'WBS',
		iconCls:'icon-save',
		width:800,
		height:350,
		nowrap: false,
		rownumbers: true,
		animate:true,
		collapsible:true,
		url:'cargaWBS.go',
		idField:'code',
		treeField:'code',
		frozenColumns:[[
            {title:'ID DE TAREAS',field:'code',width:200,
                formatter:function(value){
                	return '<span style="color:red">'+value+'</span>';
                }
            }
		]],
		columns:[[
			{field:'name',title:'DESCRIPCION',width:120},
			{field:'addr',title:'FECHA INICIO',width:120,rowspan:2},
			{field:'col4',title:'FECHA FIN',width:150,rowspan:2}
		]],
		onBeforeLoad:function(row,param){
			if (row){
				$(this).treegrid('options').url = 'subDatosWBS.go';
			} else {
				$(this).treegrid('options').url = 'cargaWBS.go';
			}
		},
		onContextMenu: function(e,row){
			e.preventDefault();
			$(this).treegrid('unselectAll');
			$(this).treegrid('select', row.code);
			$('#mm').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
		}
	});
});

function reload(){
	var node = $('#test').treegrid('getSelected');
	if (node){
		$('#test').treegrid('reload', node.code);
	} else {
		$('#test').treegrid('reload');
	}
}
function getChildren(){
	var node = $('#test').treegrid('getSelected');
	if (node){
		var nodes = $('#test').treegrid('getChildren', node.code);
	} else {
		var nodes = $('#test').treegrid('getChildren');
	}
	var s = '';
	for(var i=0; i<nodes.length; i++){
		s += nodes[i].code + ',';
	}
	alert(s);
}
function getSelected(){
	var node = $('#test').treegrid('getSelected');
	if (node){
		alert(node.code+":"+node.name);
	}
}
function collapse(){
	var node = $('#test').treegrid('getSelected');
	if (node){
		$('#test').treegrid('collapse', node.code);
	}
}
function expand(){
	var node = $('#test').treegrid('getSelected');
	if (node){
		$('#test').treegrid('expand', node.code);
	}
}
function collapseAll(){
	var node = $('#test').treegrid('getSelected');
	if (node){
		$('#test').treegrid('collapseAll', node.code);
	} else {
		$('#test').treegrid('collapseAll');
	}
}
function expandAll(){
	var node = $('#test').treegrid('getSelected');
	if (node){
		$('#test').treegrid('expandAll', node.code);
	} else {
		$('#test').treegrid('expandAll');
	}
}
function expandTo(){
	$('#test').treegrid('expandTo', '02013');
	$('#test').treegrid('select', '02013');
}
var codeIndex = 1000;
function append(){
	codeIndex++;
	var data = [{
		code: 'code'+codeIndex,
		name: 'name'+codeIndex,
		addr: 'address'+codeIndex,
		col4: 'col4 data'
	}];
	var node = $('#test').treegrid('getSelected');
	$('#test').treegrid('append', {
		parent: (node?node.code:null),
		data: data
	});
}
function remove(){
	var node = $('#test').treegrid('getSelected');
	if (node){
		$('#test').treegrid('remove', node.code);
	}
}
</script>

<style>
a.navwhite:link { text-decoration: none; color: #ffffff; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: bold; }
a.navwhite:visited { text-decoration: none; color: #ffffff; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: bold; }
a.navwhite:hover { text-decoration: underline; color: #ffffff; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: bold; }
a.navblack:link { text-decoration: none; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: bold; }
a.navblack:visited { text-decoration: none; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: bold; }
a.navblack:hover { text-decoration: underline; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: bold; }
</style>

<style>
<!--
h1 { font-family: Arial, sans-serif; font-size: 30px; color: #004080;}
h2 { font-family: Arial, sans-serif; font-size: 18px; color: #004080;}

body,p,b,i,em,dt,dd,dl,sl,caption,th,td,tr,u,blink,select,option,form,div,li { font-family: Arial, sans-serif; font-size: 12px; }

/* IE Specific */
body, textarea {
  scrollbar-3dlight-color: #808080;
  scrollbar-highlight-color: #808080;
  scrollbar-face-color: #004080;
  scrollbar-shadow-color: #808080;
  scrollbar-darkshadow-color: #805B32;
  scrollbar-arrow-color: #000000;
  scrollbar-track-color: #F8EFE2;
}
/* END IE Specific */
-->
</style>


</head>
<body bgcolor="#ffffff" >
<p>
<table cellspacing="1" cellpadding="3" width="863" align="center" bgcolor="#004080" 
border="0" borderColor=#000000 style="WIDTH: 863px; HEIGHT: 872px">
  <tbody>
  
  <tr>
    <td>
      <h1 align="center"><br><font color="#ffffff">Listado General de Proyectos</font></h1>
      <p>&nbsp;</p></td></tr>
  <tr>
      <td bgcolor="#c0c0c0">
      <p align="center">
      <font color="#0080ff" size="2" face=Verdana>
      <strong>&nbsp;</strong></font>
      <strong>
      	<font size=2 face=Verdana color=#004080>
	      	<a href="altaProyecto.go">
	      		Alta de Proyecto
	      	</a>
      	</font>
      </strong>&nbsp; |&nbsp;<a 
      href="listadoProyectos.go"><font size="2" face=Verdana><strong>Listado General de 
      Proyectos</strong></font></a>&nbsp; | &nbsp; 
<strong >
<font color="#0080ff" size="2" 
      face=Verdana>Administración del 
      Sistema
      </font></strong></p></td></tr>
  <tr>
      <td bgcolor="#ffffff" bordercolor="#000000">
      <p align="center">&nbsp;</p>
      <p align="center">
                <table border="0" cellspacing="0" cellpadding="3" width="100%" align="center">
        
        <tr>        
            <td width="20px">
            </td>
            <td>
				
				<table id="test" align = "center"></table>
				
				<div id="mm" class="easyui-menu" style="width:120px;">
					<div onclick="append()">Append</div>
					<div onclick="remove()">Remove</div>
				</div>

            </td>
        </tr>

	</table></ 
      p></ p>
      <p align="center"><strong><font color="#000000" 
      size=2></font></strong>&nbsp;</p>
      <p align="center"><font color="#000000"></font>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td></tr>
</tbody>

</table>
</p>
</body>
</html>
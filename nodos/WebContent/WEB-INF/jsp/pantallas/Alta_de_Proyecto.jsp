<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
<head>
<meta name="GENERATOR" content="PageBreeze Free HTML Editor (http://www.pagebreeze.com)">
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1" >
<title>Alta de Proyecto</title>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${ contextPath }/easy-ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/easy-ui/themes/icon.css">
<script type="text/javascript" src="${ contextPath }/js/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ contextPath }/easy-ui/jquery.easyui.min.js"></script>

	<script>
		var listaTiposRH = [
		    {humanoid:'1',name:'Analista'},
		    {humanoid:'2',name:'Diseñador'},
		    {humanoid:'3',name:'Programador'},
		    {humanoid:'4',name:'Tester'},
		    {humanoid:'5',name:'Lider de Proyecto'},
		    {humanoid:'6',name:'Arquitecto'},
		    {humanoid:'7',name:'Ingeniero'}
		];
		function productFormatter(value){
			for(var i=0; i<listaTiposRH.length; i++){
				if (listaTiposRH[i].humanoid == value) return listaTiposRH[i].name;
			}
			return value;
		}
		$(function(){
			var lastIndex;
			$('#tt').datagrid({
				toolbar:[{
					text:'agregar',
					iconCls:'icon-add',
					handler:function(){
					$('#tt').datagrid('endEdit', lastIndex);
						$('#tt').datagrid('appendRow',{
							humanoid:'',
							numeroRecursosHumanos:''
						});
						var lastIndex = $('#tt').datagrid('getRows').length-1;
						$('#tt').datagrid('beginEdit', lastIndex);
					}
				},'-',{
					text:'eliminar',
					iconCls:'icon-remove',
					handler:function(){
						var row = $('#tt').datagrid('getSelected');
						if (row){
							var index = $('#tt').datagrid('getRowIndex', row);
							$('#tt').datagrid('deleteRow', index);
						}
					}
				},'-',{
					text:'aceptar',
					iconCls:'icon-save',
					handler:function(){
						$('#tt').datagrid('acceptChanges');
					}
				},'-',{
					text:'deshacer',
					iconCls:'icon-undo',
					handler:function(){
						$('#tt').datagrid('rejectChanges');
					}
				}],
				onBeforeLoad:function(){
					$(this).datagrid('rejectChanges');
				},
				onClickRow:function(rowIndex){
					if (lastIndex != rowIndex){
						$('#tt').datagrid('endEdit', lastIndex);
						$('#tt').datagrid('beginEdit', rowIndex);
					}
					lastIndex = rowIndex;
				}
			});
		});

		//-----------------------------------------grid 2----------------------------------------------
		
		var listaTiposRT = [
		    {tecnicoid:'1',name:'Desktops'},
		    {tecnicoid:'2',name:'Ipads'},
		    {tecnicoid:'3',name:'Celulares'},
		    {tecnicoid:'4',name:'Impresoras'},
		    {tecnicoid:'5',name:'Monitores'},
		    {tecnicoid:'6',name:'Lap Tops'},
		    {tecnicoid:'7',name:'Imac'}
		];

		function productFormatterRT(value){
			for(var i=0; i<listaTiposRT.length; i++){
				if (listaTiposRT[i].tecnicoid == value) return listaTiposRT[i].name;
			}
			return value;
		}

		var listaPersonas = [
    		    {personaid:'1',personaName:'Mario'},
       		    {personaid:'2',personaName:'Javier'},
      		    {personaid:'3',personaName:'Gerardo'},
      		    {personaid:'4',personaName:'Pedro'},
       		    {personaid:'5',personaName:'Luis'},
       		    {personaid:'6',personaName:'Carlos'},
       		    {personaid:'7',personaName:'Ernesto'}
     		];
 		
   		function productFormatterPersonas(value){
      			for(var i=0; i<listaPersonas.length; i++){
       				if (listaPersonas[i].personaid == value) return listaPersonas[i].personaName;
       			}
      			return value;
      		}

		
		$(function(){
			var lastIndex;
			$('#tt2').datagrid({
				toolbar:[{
					text:'agregar',
					iconCls:'icon-add',
					handler:function(){
					$('#tt2').datagrid('endEdit', lastIndex);
						$('#tt2').datagrid('appendRow',{
							tecnicoid:'',
							numeroRecursosTecnicos:''
						});
						var lastIndex = $('#tt2').datagrid('getRows').length-1;
						$('#tt2').datagrid('beginEdit', lastIndex);
					}
				},'-',{
					text:'eliminar',
					iconCls:'icon-remove',
					handler:function(){
						var row = $('#tt2').datagrid('getSelected');
						if (row){
							var index = $('#tt2').datagrid('getRowIndex', row);
							$('#tt2').datagrid('deleteRow', index);
						}
					}
				},'-',{
					text:'aceptar',
					iconCls:'icon-save',
					handler:function(){
						$('#tt2').datagrid('acceptChanges');
					}
				},'-',{
					text:'deshacer',
					iconCls:'icon-undo',
					handler:function(){
						$('#tt2').datagrid('rejectChanges');
					}
				}],
				onBeforeLoad:function(){
					$(this).datagrid('rejectChanges');
				},
				onClickRow:function(rowIndex){
					if (lastIndex != rowIndex){
						$('#tt2').datagrid('endEdit', lastIndex);
						$('#tt2').datagrid('beginEdit', rowIndex);
					}
					lastIndex = rowIndex;
				}
			});
		});

		function enviaDatosSMS(){

			var ids = [];
			var rows = $('#tt').datagrid('getRows');
			for(var i=0;i<rows.length;i++){
				ids.push("{'humanoid':" + rows[i].humanoid + ",'numeroRecursosHumanos':" + rows[i].numeroRecursosHumanos + ",'costoPersona':" + rows[i].costoPersona + "}");
			}

			$.getJSON("enviaSMS.go", {servicios: ids.join(','),telefono:$('#txtTelefono').val() }, function(json){
				//$('#txtApellidoPaterno').val(json.data.apellidoPaterno);
				
				if(json.success){
					alert("SMS enviado Exitosamente");
				}else{
					alert("No pudo enviarse el SMS");
				}				
			});	
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

<body bgcolor="#ffffff">







<table cellspacing="1" cellpadding="3" width="863" align="center" bgcolor="#004080" 
border="0" style="WIDTH: 863px; HEIGHT: 872px">
  
  <tr>
    <td>
      <h1 align="center"><br><font color="#ffffff"> Alta de Proyecto</font></h1>
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
    <td bgcolor="#ffffff">    

<h1 align="center">        </h1>    

<h1 align="center">
                          <table border="0" cellspacing="0" cellpadding="2" width="100%" align="center" 
     >
        
        <tr>
              <td bgcolor="#aed7ff"><strong><font size="4" 
            face=Calibri 
            color=#004080>Proyecto</font></strong></td>
            <td></td></tr>
        <tr></tr>
        <tr>
            <td bgcolor="#e9e9e9">
            <p align="left"><select size="1" name="TIpodeProyecto"><option selected value=0>--- 
          Selecciona el Tipo de Proyecto ---</option> <option 
          value=1>Multimedia</option> <option value="2">Innovacion</option> 
          <option value="3">Software</option> <option value="4">Dispositivos 
          Móviles</option> &lt;\SELECT&gt;</select></p>
            <p align="left">&nbsp;</p></td>
          <td bgcolor="#e9e9e9">
            <p align="left"> 
       
      <input value="Titulo del Proyecto" size="50" 
      name=TituloProyecto></p>
            <p align="left">&nbsp;</p></td></tr>
        <tr>
          <td bgcolor="#dfdfdf">
            <p align="left"><input value="Clave del Sujeto de Apoyo" 
      size=30 
      name=ClaveSujetoApoyo></p>
            <p align="left"></p>
            <p align="left"></p></td>
          <td bgcolor="#dfdfdf">
            <p>        
      <input value="Nombre del Sujeto de Apoyo" size="30" 
      name=NombreSujetoApoyo></p>
            <p>&nbsp;</p></td></tr>
        <tr>
          <td bgcolor="#ebebeb">
            <p align="left"><select size="1" 
        name=EntidadFederativa><option selected value=0>--- Seleccione la 
        Entidad Federativa ---</option> <option value="1">Aguascalientes</option> 
        <option value="4">Coahuila</option> <option value="2">Durango</option> 
        <option value="Distrito Federal.3">Distrito Federal.3</option> <option 
        value=4>Guanajuato</option> 
  &lt;\SELECT&gt;</select></p>
            <p align="left"></p>
            <p align="left"></p></td>
          <td bgcolor="#ebebeb">
		      <p>        
		      <input value="Presupuesto del proyecto" size="30" 
		      name=PresupuestoProyecto></p>
		      <p>&nbsp;</p>
		  </td>
		</tr></table>            </h1>
<p><font size="4" face="Calibri"><strong>
          <table border="0" cellspacing="0" cellpadding="2" width="100%" bgcolor="#e9e9e9" 
      align=center>
        
        <tr>
              <td bgcolor="#aed7ff"><strong><font size="4" 
            face=Calibri 
            color=#004080>Recursos</font></strong></td>
          <td></td>
          <td></td></tr>
        <tr>
          <td><font size="4" face="Calibri">
            <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
              <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
    <p><font size="4" face="Calibri">Humanos</font></p></blockquote></blockquote></font></td>
          <td></td>
          <td></td></tr>
        <tr>
          <td bgcolor="#dfdfdf"></td>
          <td bgcolor="#dfdfdf">&nbsp; 
				<table id="tt" style="width:510px;height:auto"
						title="Edita los Recursos Humanos del proyecto" iconCls="icon-edit" singleSelect="true"
						idField="itemid" url="datagrid_data2.json">
					<thead>
						<tr>
							<th field="humanoid" width="250" formatter="productFormatter" editor="{type:'combobox',options:{valueField:'humanoid',textField:'name',data:listaTiposRH,required:true}}">Selecciona el tipo de recurso Humano</th>
							<th field="numeroRecursosHumanos" width="140" formatter="productFormatterPersonas" editor="{type:'combobox',options:{valueField:'personaid',textField:'personaName',data:listaPersonas,required:true}}">Selecciona el Recurso</th>
							<th field="costoPersona" width="108" align="right" editor="{type:'numberbox',options:{precision:0}}">Introduce el costo</th>
						</tr>
					</thead>
				</table>
          </td>
       </tr>
       <tr>
       		<td bgcolor="#dfdfdf"></td>
       
	       	<td>
		       	<p align="left"><input value="Costos de Infraestructura" size=30 name=CostosInfraestructura></p>
	       	</td>
       </tr>

       <tr>
       		<td bgcolor="#dfdfdf"></td>
       
	       	<td>
	      		<div align="center">
				      <a href="#" class="easyui-linkbutton" iconCls="icon-save" onclick="enviaDatosSMS()">	      
				      	Enviar Mensaje Demo SMS
				      </a>      			       
	      		</div>
	       	</td>

	       	
       </tr>
	   <tr>
       		<td bgcolor="#dfdfdf"></td>
	   
	       	<td>
	      		<div align="center">
			      	<input class="easyui-validatebox" value="4498941315" id="txtTelefono" type="text" size="60px" name="txtTelefono" validType="text"></input>
	      		</div>
	       	</td>
	  </tr>
       
       <tr>
          <td>
            <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
              <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
                <p><font size="4" face=Calibri>Técnicos</font></p></blockquote></blockquote>
          </td>
          <td>
          </td>
          <td>
          </td>
       </tr>
       <tr>
          <td bgcolor="#dfdfdf"></td>
          <td bgcolor="#dfdfdf">&nbsp;

				<table id="tt2" style="width:510px;height:auto"
						title="Edita los Recursos Tecnicos del Proyecto" iconCls="icon-edit" singleSelect="true"
						idField="itemid" url="datagrid_data2.json">
					<thead>
						<tr>
							<th field="tecnicoid" width="250" formatter="productFormatterRT" editor="{type:'combobox',options:{valueField:'tecnicoid',textField:'name',data:listaTiposRT,required:true}}">Selecciona el tipo de recurso Técnico</th>
							<th field="numeroRecursosTecnicos" width="220" align="right" editor="{type:'numberbox',options:{precision:0}}">Introduce el número de Recursos</th>
						</tr>
					</thead>
				</table>

          
          </td>
          <td bgcolor="#dfdfdf" width = "20px">&nbsp;</td>
          
      </tr>

       <tr>
       		<td bgcolor="#dfdfdf"></td>
       
	       	<td>
		       	<p align="left"><input value="Otros" size=30 name=otros></p>
	       	</td>
       </tr>
      
 </table></ strong></font></p>
<p><font size="4" face="Calibri"><strong>
          <table border="0" cellspacing="0" cellpadding="3" width="100%" align="center">
        
        <tr>
            <td bgcolor="#aed7ff"><strong><font size="4" 
          face=Calibri 
            color=#004080>Tiempos</font></strong></td>
          <td></td></tr>
        <tr>
          <td bgcolor="#e9e9e9"></td>
          <td bgcolor="#e9e9e9">
<p>Fecha de 
    arranque&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input value="MM/DD/AAAA" size="12" 
    name=FechaArranqueProy></p></td></tr>
        <tr>
          <td bgcolor="#e9e9e9"></td>
          <td bgcolor="#e9e9e9">
<p>Fecha de terminación&nbsp;&nbsp; <input 
    value=MM/DD/AAAA size=12 
name=FechaTerminacionProy></p></td></tr>

		<tr>	
          <td bgcolor="#e9e9e9"></td>
		</tr>

		<tr>	
          <td bgcolor="#e9e9e9"></td>
          <td bgcolor="#e9e9e9">
		        <div>
		            <label for="message">Comentarios / Notas:</label>
		            <textarea name="message" style="height:60px;width:250px;"></textarea>
		        </div>          
		  </td>			
		</tr>


</table></font></p>
<blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
  <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
    <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
      <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
        <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
          <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
            <blockquote style="MARGIN-RIGHT: 0px" dir="ltr">
<p><font 
                    style="BACKGROUND-COLOR: #ffffff" size=1 
                    face=Verdana></font>&nbsp;</p>
<p><font 
                    style="BACKGROUND-COLOR: #ffffff" size=1 face=Verdana><input value="Limpiar Campos" type="reset" name="Reset"></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<input value="Crear Proyecto" type="submit" name="AltaProyecto"></p></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></strong></strong>
</td></tr>

<tr>
      <td ></td></tr></table>s
</body>
</html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Facturaci�n</title>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${ contextPath }/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ contextPath }/themes/icon.css">
<script type="text/javascript" src="${ contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ contextPath }/js/jquery.easyui.min.js"></script>

</head>

<script type="text/javascript">

$(document).ready(function(){
	$('#w').window('close');
	$('#wFactura').window('close');
	cargaServicios();
});

function getSelections(){
	var ids = [];
	var rows = $('#tt').datagrid('getSelections');
	for(var i=0;i<rows.length;i++){
		ids.push(rows[i].costo);
	}
	alert(ids.join(':'));
}

//----------------------------------------
		function productFormatter(value){
			for(var i=0; i<products.length; i++){
				if (products[i].productid == value) return products[i].name;
			}
			return value;
		}
		
		$(function(){
			var lastIndex;
			$('#tt').datagrid({
				frozenColumns:[[
			                {field:'ck',checkbox:true}
							]],
				toolbar:[{
					text:'accept',
					iconCls:'icon-save',
					handler:function(){
						$('#tt').datagrid('acceptChanges');
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

//----------------------------------------

function cargaServicios(){
	$('#cc').combobox({
		url:'listaServicios.go',
		valueField:'idServicio',
		textField:'descripcionServicio'
	});
}

//dato es para sabe la condicion de busqueda y value es para saber el valor de la busqueda
function guardarDatosFactura(){

	var ids = [];
	var rows = $('#tt').datagrid('getSelections');
	for(var i=0;i<rows.length;i++){
		ids.push("{'costo':" + rows[i].costo + ",'idServicio':" + rows[i].idServicio +"}");
	}

	//JsonObject to convert on server
	var datosFactura = "{'nombre':'" + $('#txtNombreFactura').val() + "','" +
	 "apellidoPaterno':'" + $('#txtApellidoPaternoFactura').val() + "','" +
	 "apellidoMaterno':'" + $('#txtApellidoMaternoFactura').val() + "','" +
	 "rfc':'" + $('#txtRFC').val() + "','" +
	 "domicilio':'" + $('#txtDomicilioFactura').val() + "','" +	 
	 "ciudad':'" + $('#txtCiudadFactura').val() + "','" +
	 "giro':'" + $('#txtGiroFactura').val() + "','" +
	 "email':'" + $('#txtEmailFactura').val() + "','" +
	 "codigoPostal':'" + $('#txtCodigoPostalFactura').val() + "','" +
	 "tel1':'" + $('#txtTel1factura').val() + "','" +
	 "tel2':'" + $('#txtTel2factura').val() + "'}" ;
		
	$.getJSON("guardaFactura.go", { factura: datosFactura, servicios: ids.join(','), cliente: $('#idClienteHidden').val() }, function(json){
		//$('#txtApellidoPaterno').val(json.data.apellidoPaterno);
		
		if(json.success){
			alert("Factura Guardada Exitosamente");
		}else{
			alert("La factura no pudo guardarse");
		}
		
	});	
}

//---------------------------------grid de busqueda--------------------

function abrirBusqueda(dato,value){
		$('#w').window('open');
		
		$(function(){
			$('#test').datagrid({
				title:'Lista de clientes disponibles',
				iconCls:'icon-search',
				width:600,
				height:350,
				nowrap: false,
				striped: true,
				collapsible:true,
				url:'listaClientes.go',
				queryParams:{llave: dato, valor: value},
				sortName: 'apellidoPaterno',
				sortOrder: 'asc',
				remoteSort: false,
				idField:'idCliente',
				frozenColumns:[[
	                {field:'ck',checkbox:true}
				]],
				columns:[[
			        
				],[
					{field:'apellidoPaterno',title:'Apellido Paterno',width:100},
					{field:'apellidoMaterno',title:'Apellido Materno',width:100},
					{field:'nombre',title:'Nombre(s)',width:100},
					{field:'domicilio',title:'Domicilio',width:100},
					{field:'telCelular',title:'Tel. Celular',width:100},					
					{field:'email',title:'Email',width:100},					
					{field:'codigoPostal',title:'Codigo Postal',width:100},					
					{field:'telCasa',title:'Telefono Casa',width:100,rowspan:2}
				]],
				rownumbers:false,
				pagination:false,
				singleSelect:true
				
			});
			var p = $('#test').datagrid('getPager');
			if (p){
				$(p).pagination({
					onBeforeRefresh:function(){
						alert('before refresh');
					}
				});
			}
		});

		$('#test').datagrid('clearSelections');
}

function abrirBusquedaFactura(dato,value){
	$('#wFactura').window('open');
	
	$(function(){
		$('#gridFactura').datagrid({
			title:'Lista de facturas anteriores',
			iconCls:'icon-search',
			width:600,
			height:350,
			nowrap: false,
			striped: true,
			collapsible:true,
			url:'listaFacturas.go',
			queryParams:{llave: dato, valor: value},
			sortName: 'apellidoPaterno',
			sortOrder: 'asc',
			remoteSort: false,
			idField:'idFactura',
			frozenColumns:[[
                {field:'ck',checkbox:true}
			]],
			columns:[[
		        
			],[
				{field:'nombre',title:'Nombre(s)',width:100},
				{field:'apellidoPaterno',title:'Apellido Paterno',width:100},
				{field:'apellidoMaterno',title:'Apellido Materno',width:100},
				{field:'rfc',title:'RFC',width:100},
				{field:'domicilio',title:'Domicilio',width:100},
				{field:'ciudad',title:'Ciudad',width:100},					
				{field:'giro',title:'Giro',width:100},					
				{field:'email',title:'Email',width:100},					
				{field:'codigoPostal',title:'Codigo Postal',width:100},					
				{field:'tel1',title:'Telefono(1)',width:100},					
				{field:'tel2',title:'Telefono(2)',width:100},					
				{field:'moralFl',title:'Moral',width:100}				
			]],
			rownumbers:false,
			pagination:false,
			singleSelect:true
			
		});
		var p = $('#gridFactura').datagrid('getPager');
		if (p){
			$(p).pagination({
				onBeforeRefresh:function(){
					alert('before refresh');
				}
			});
		}
	});

	$('#gridFactura').datagrid('clearSelections');
}

		function getSelected(){
			var selected = $('#test').datagrid('getSelected');
			if (selected){
				$('#txtApellidoPaterno').val(selected.apellidoPaterno);
				$('#txtApellidoMaterno').val(selected.apellidoMaterno);
				$('#txtNombreCliente').val(selected.nombre);
				$('#txtTelCasa').val(selected.telCasa);

				$('#txtCelular').val(selected.telCelular);
				$('#txtEmail').val(selected.email);
				$('#txtDomicilio').val(selected.domicilio);
				$('#txtCodigoPostal').val(selected.codigoPostal);

				$('#idClienteHidden').val(selected.idCliente);
			}
		}

//		function disable(){
//			$('#txtApellidoPaterno').validatebox('disable');
//		}
//		function enable(){
//			$('#nn').numberbox('enable');
//		}
		
		function getSelectedFactura(){
			var selected = $('#gridFactura').datagrid('getSelected');
			if (selected){
				$('#txtNombreFactura').val(selected.nombre);
				$('#txtApellidoPaternoFactura').val(selected.apellidoPaterno);
				$('#txtApellidoMaternoFactura').val(selected.apellidoMaterno);
				$('#txtRFC').val(selected.rfc);
				$('#txtDomicilioFactura').val(selected.domicilio);
				$('#txtCiudadFactura').val(selected.ciudad);
				$('#txtGiroFactura').val(selected.giro);
				$('#txtEmailFactura').val(selected.email);
				$('#txtCodigoPostalFactura').val(selected.codigoPostal);
				$('#txtTel1factura').val(selected.tel1);
				$('#txtTel2factura').val(selected.tel2);
				$('#idFacturaHidden').val(selected.idFactura);
				
//				if (selected.moralFl){
//					$('RadioGroupFactura_2').selected(true);
//					$('#RadioGroupFactura_3').val(false);
//				}else{
//					$('#RadioGroupFactura_3').val(true);
//					$('#RadioGroupFactura_2').val(false);
//				}
			}
		}
		
		function limpiaDatosCliente(){
			$('#txtApellidoPaterno').val('');
			$('#txtApellidoMaterno').val('');
			$('#txtNombreCliente').val('');
			$('#txtTelCasa').val('');
			$('#txtCelular').val('');
			$('#txtEmail').val('');
			$('#txtDomicilio').val('');
			$('#txtCodigoPostal').val('');
			$('#idClienteHidden').val('');

		}

		function limpiaDatosFactura(){
			$('#txtNombreFactura').val('');
			$('#txtApellidoPaternoFactura').val('');
			$('#txtApellidoMaternoFactura').val('');
			$('#txtRFC').val('');
			$('#txtDomicilioFactura').val('');
			$('#txtCiudadFactura').val('');
			$('#txtGiroFactura').val('');
			$('#txtEmailFactura').val('');
			$('#txtCodigoPostalFactura').val('');
			$('#txtTel1factura').val('');
			$('#txtTel2factura').val('');	
			$('#idFacturaHidden').val('');		
		}		

		function clearSelections(){
			$('#test').datagrid('clearSelections');
		}
</script>


<body>
<!--	<div style="margin-bottom:10px;">-->
<!--		<a href="#" onclick="getSelections()">carga servicios</a>-->
<!--	</div>-->
<form id="form1" name="form1" method="post" action="">
  
  <input type='hidden' id='idClienteHidden' value='' />
  <input type='hidden' id='listaServiciosHidden' value='' />
  <input type='hidden' id='idFacturaHidden' value='' />

  <table width="100%" border="1">
    <tr>
      <td colspan="6"><div align="center">
        <h1>FACTURACION</h1>
      </div></td>
    </tr>
    <tr>
      <td colspan="6"><h2><strong>Datos del Cliente</strong></h2></td>
    </tr>
    <tr>
      <td width="10%"><div align="right">Apellido Paterno:</div></td>
      <td width="36%">
      	<input class="easyui-validatebox" id="txtApellidoPaterno" type="text" size="60%" name="txtApellidoPaterno" validType="text"></input>
      	</td>
      <td width="6%">
<!--	      <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="cargaDatosCliente('paterno',$('#txtApellidoPaterno').val())">	      -->
	      <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="abrirBusqueda('paterno',$('#txtApellidoPaterno').val())">	      
	      	Buscar
	      </a>      
	      
		<div id="w" class="easyui-window" title="Buscar Cliente" iconCls="icon-search" style="width:650px;height:480px;padding:5px;background: #fafafa;">
			<div class="easyui-layout" fit="true">
				<div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
										
					<table id="test"></table>

				</div>
				<div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
					<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="getSelected();$('#w').window('close');">Ok</a>
					<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="$('#w').window('close');">Cancel</a>
				</div>
			</div>
		</div>
	      
      </td>
<!--      	<td width="7%"><div align="right">Fecha Creacion:</div>-->
      </td>
      <td colspan="2">
<!--      	<input name="txtFecha" type="text" id="txtFecha" size="60%" />-->
      </td>
    </tr>
    <tr>
      <td><div align="right">Apellido Materno:</div></td>
      <td><input name="txtApellidoMaterno" type="text" id="txtApellidoMaterno" size="60%" /></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">Nombre del Cliente:</div></td>
      <td><input name="txtNombreCliente" type="text" id="txtNombreCliente" size="60%" /></td>
      <td>
<!--      	<input type="submit" name="btnNombreCliente" id="btnNombreCliente" value="Buscar" />-->
	      <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="abrirBusqueda('nombreCliente',$('#txtNombreCliente').val())">	      
	      	Buscar
	      </a>      

      </td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">Domicilio:</div></td>
      <td><input name="txtDomicilio" type="text" id="txtDomicilio" size="60%" /></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">Tel. Casa:</div></td>
      <td>
      	<input name="txtTelCasa" type="text" id="txtTelCasa" size="50%" />
<!--      	<input type="submit" name="btnTelCasa" id="btnTelCasa" value="Buscar" />-->
	      <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="abrirBusqueda('telCasa',$('#txtTelCasa').val())">	      
	      	Buscar
	      </a>      

      </td>
	      <td colspan="2">
	      	<div align="right">Tel. Celular:</div>
	      </td>
	      <td width="36%">
	      	<input name="txtCelular" type="text" id="txtCelular" size="60%" />
	      </td>
		  <td width="5%">
<!--		  	<input type="submit" name="btnCel" id="btnCel" value="Enviar" />-->
	      	<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="abrirBusqueda('telCelular',$('#txtCelular').val())">	      
	      	Buscar
	      	</a>   
	      </td>   

      </td>
    </tr>
    <tr>
      <td><div align="right">Email:</div></td>
      <td><input name="txtEmail" type="text" id="txtEmail" size="60%" /></td>
      <td colspan="2" rowspan="2"><p>
<!--        <label>-->
<!--          <input type="radio" name="RadioGroupFactura" value="true" id="RadioGroupFactura_0" />-->
<!--          Factura-->
<!--        </label>-->
        <br />
<!--        <label>-->
<!--          <input type="radio" name="RadioGroupFactura" value="false" id="RadioGroupFactura_1" />-->
<!--          Recibo-->
<!--        </label>-->
        <br />
      </p></td>
      <td colspan="2" rowspan="2">
      	<div align="right">
<!--        	<input type="submit" name="btnLimpiarCliente" id="btnLimpiarCliente" value="Limpiar Datos Cliente" />-->
	      	<a href="#" class="easyui-linkbutton" onclick="limpiaDatosCliente()">	      
	      	Limpiar Datos Cliente
	      	</a>   

      	</div></td>
    </tr>
    <tr>
      <td><div align="right">Código Postal:</div></td>
      <td><input name="txtCodigoPostal" type="text" id="txtCodigoPostal" size="60%" /></td>
    </tr>
    <tr>
      <td colspan="6">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="6"><h2>Datos de la Factura</h2></td>
    </tr>
    <tr>
      <td colspan="4" rowspan="2"><p align="center">
        <label>
          <input type="radio" name="RadioGroupFactura" value="true" id="RadioGroupFactura_2" />
          Persona moral</label>
        <br />
        <label>
          <input type="radio" name="RadioGroupFactura" value="false" id="RadioGroupFactura_3" />
          Persona Física</label>
        <br />
      </p></td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">Nombre:</div></td>
      <td>
<!--      		<input name="txtNombreFactura" type="text" id="txtNombreFactura" size="60%" />-->
      	<input class="easyui-validatebox" id="txtNombreFactura" type="text" size="60%" name="txtNombreFactura" validType="text"></input>
      		
      </td>
      <td>
<!--      		<input type="submit" name="btnNombreFactura" id="btnNombreFactura" value="Buscar" />-->
	      <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="abrirBusquedaFactura('nombre',$('#txtNombreFactura').val())">	      
	      	Buscar
	      </a>      

		<div id="wFactura" class="easyui-window" title="Buscar Factura" iconCls="icon-search" style="width:650px;height:480px;padding:5px;background: #fafafa;">
			<div class="easyui-layout" fit="true">
				<div region="center" border="false" style="padding:10px;background:#fff;border:1px solid #ccc;">
										
					<table id="gridFactura"></table>

				</div>
				<div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
					<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="getSelectedFactura();$('#wFactura').window('close');">Ok</a>
					<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="$('#wFactura').window('close');">Cancel</a>
				</div>
			</div>
		</div>

      </td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>Apellido Paterno</td>
      <td>
<!--      		<input name="txtApellidoPaternoFactura" type="text" id="txtApellidoPaternoFactura" size="60%" />-->
      	<input class="easyui-validatebox" id="txtApellidoPaternoFactura" type="text" size="60%" name="txtApellidoPaternoFactura" validType="text"></input>

      </td>
      <td>
<!--      		<input type="submit" name="btnApPatFactura" id="btnApPatFactura" value="Buscar" />-->
	      <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="abrirBusquedaFactura('paterno',$('#txtApellidoPaternoFactura').val())">	      
	      	Buscar
	      </a>      

      </td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>Apellido Materno</td>
      <td>
<!--      		<input name="txtApellidoMaternoFactura" type="text" id="txtApellidoMaternoFactura" size="60%" />-->
      	<input class="easyui-validatebox" id="txtApellidoMaternoFactura" type="text" size="60%" name="txtApellidoMaternoFactura" validType="text"></input>

      </td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">RFC:</div></td>
      <td>
<!--      		<input name="txtRFC" type="text" id="txtRFC" size="60%" />-->
      	<input class="easyui-validatebox" id="txtRFC" type="text" size="60%" name="txtRFC" validType="text"></input>

      </td>
      <td>
<!--      		<input type="submit" name="btnRFC" id="btnRFC" value="Buscar" />-->
	      <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="abrirBusquedaFactura('rfc',$('#txtRFC').val())">	      
	      	Buscar
	      </a>      

      </td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">Domicilio:</div></td>
      <td>
<!--      		<input name="txtDomicilioFactura" type="text" id="txtDomicilioFactura" size="60%" />-->
      	<input class="easyui-validatebox" id="txtDomicilioFactura" type="text" size="60%" name="txtDomicilioFactura" validType="text"></input>

      </td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">Ciudad:</div></td>
      <td>
<!--      		<input name="txtCiudadFactura" type="text" id="txtCiudadFactura" size="60%" />-->
      	<input class="easyui-validatebox" id="txtCiudadFactura" type="text" size="60%" name="txtCiudadFactura" validType="text"></input>
      		
      </td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">Giro:</div></td>
      <td>
<!--      		<input name="txtGiroFactura" type="text" id="txtGiroFactura" size="60%" />-->
      		<input class="easyui-validatebox" id="txtGiroFactura" type="text" size="60%" name="txtGiroFactura" validType="text"></input>
      </td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">Email:</div></td>
      <td>
<!--      		<input name="txtEmailFactura" type="text" id="txtEmail" size="60%" />-->
      		<input class="easyui-validatebox" id="txtEmailFactura" type="text" size="60%" name="txtEmailFactura" validType="text"></input>
      </td>
      
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>Código Postal:</td>
      <td>
<!--      		<input name="txtCodigoPostalFactura" type="text" id="txtCodigoPostal" size="60%" />-->
      		<input class="easyui-validatebox" id="txtCodigoPostalFactura" type="text" size="60%" name="txtCodigoPostalFactura" validType="text"></input>
      		
      </td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>Telefono 1:</td>
      <td>
<!--      	<input name="txtTel1factura" type="text" id="txtTel1factura" size="50%" />-->
			<input class="easyui-validatebox" id="txtTel1factura" type="text" size="60%" name="txtTel1factura" validType="text"></input>
<!--      	<input type="submit" name="btnTel1Factura" id="btnTel1Factura" value="Buscar" /></td>-->
	      <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="abrirBusquedaFactura('tel1',$('#txtTel1factura').val())">	      
	      	Buscar
	      </a>      

      <td colspan="2">Telefono 2:</td>
      <td colspan="2">
<!--      		<input name="txtTel2factura" type="text" id="txtTel2factura" size="50%" />-->
			<input class="easyui-validatebox" id="txtTel2factura" type="text" size="60%" name="txtTel2factura" validType="text"></input>
      		
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2"><div align="right">
<!--        <input type="submit" name="btnLimpiarFactura" id="btnLimpiarFactura" value="Limpiar Datos Factura" />-->
	      <a href="#" class="easyui-linkbutton" onclick="limpiaDatosFactura()">	      
	      	Limpiar Datos Factura
	      </a>      

      </div></td>
    </tr>
    <tr>
      <td colspan="6">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="6"><h2>Servicios</h2></td>
    </tr>
<!--    <tr>-->
<!--      <td colspan="3"><div align="right">Categoria Servicios:</div></td>-->
<!--      <td colspan="3">-->
<!--      -->
<!--		<select id="cc" class="easyui-combobox" name="state" style="width:200px;" required="false">-->
<!--		</select>-->
<!--		-->
<!--      </td>-->
<!--    </tr>-->
    <tr>
		<td colspan="6">
			<div>
				<table id="tt" style="width:650px;height:auto"
						title="Editable DataGrid" iconCls="icon-edit" singleSelect="false"
						idField="idServicio" url="listaServicios.go">
					<thead>
						<tr align = "center">
							<th field=idServicio align="left" width="80">Id</th>
							<th field="descripcionServicio" width="200" align="left" editor="numberbox">Descripcion</th>
							<th field="costo" width="200" align="left" editor="{type:'numberbox',options:{precision:2}}">List Price</th>
						</tr>
					</thead>
				</table>
			</div>
		</td>
    </tr>
    <tr>
      <td colspan="6">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="6">
      		<div align="center">
			      <a href="#" class="easyui-linkbutton" iconCls="icon-save" onclick="guardarDatosFactura()">	      
			      	Guardar Datos Factura
			      </a>      
		        
      		</div>
      </td>
      
    </tr>
  </table>
</form>
</body>
</html>

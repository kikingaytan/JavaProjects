<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
<head>
<meta name="GENERATOR" content="PageBreeze Free HTML Editor (http://www.pagebreeze.com)">
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1" >
<title>Listado General de Proyectos</title>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>
 
   <script language="javascript" type="text/javascript" src="${ contextPath }/js/jqplot/js/excanvas.js"></script>
  <link rel="stylesheet" type="text/css" href="${ contextPath }/js/jqplot/css/jquery.jqplot.css" />
  <link rel="stylesheet" type="text/css" href="${ contextPath }/js/jqplot/css/examples.css" />
 
 <!--  <script language="javascript" type="text/javascript" src="../jquery-1.4.2.min.js"></script>-->
  <script language="javascript" type="text/javascript" src="${ contextPath }/js/jquery/jquery-1.4.2.min.js"></script>
  <!-- END: load jquery -->
 
  <script type="text/javascript" src="${ contextPath }/js/jqplot/js/jquery.jqplot.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.cursor.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.pieRenderer.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.ohlcRenderer.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.categoryAxisRenderer.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.barRenderer.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.meterGaugeRenderer.js"></script>

  <link rel="stylesheet" type="text/css" href="${ contextPath }/jquery-ui/css/ui-lightness/jquery-ui-1.8.1.custom.css" />
  
  <script type="text/javascript" src="${ contextPath }/jquery-ui/js/jquery-ui-1.8.1.custom.min.js"></script>

<script>
$(document).ready(function(){

    tiempo = [0.5];
    plotTiempo = $.jqplot('chartTiempo',[tiempo],{
        seriesDefaults: {
            renderer: $.jqplot.MeterGaugeRenderer,
            rendererOptions: {
                showTickLabels: false,
                intervals:[1,3,4],
                intervalColors:['#66cc66', '#E7E658','#cc6666']
            }
        }
    });

    costo = [0.9];
    plotCosto = $.jqplot('chartCosto',[costo],{
        seriesDefaults: {
            renderer: $.jqplot.MeterGaugeRenderer,
            rendererOptions: {
                showTickLabels: false,
                intervals:[1,3,4],
                intervalColors:['#66cc66', '#E7E658','#cc6666']
            }
        }
    });

    $(function() {
    	$( "#progressbar" ).progressbar({
    		value: 45
    	});
    });

    $('#txtProgreso').val($('#progressbar').progressbar( "value" )+'%');

    tiempo2 = [1.2];
    plotTiempo2 = $.jqplot('chartTiempo2',[tiempo2],{
        seriesDefaults: {
            renderer: $.jqplot.MeterGaugeRenderer,
            rendererOptions: {
                showTickLabels: false,
                intervals:[1,3,4],
                intervalColors:['#66cc66', '#E7E658','#cc6666']
            }
        }
    });

    costo2 = [3];
    plotCosto2 = $.jqplot('chartCosto2',[costo2],{
        seriesDefaults: {
            renderer: $.jqplot.MeterGaugeRenderer,
            rendererOptions: {
                showTickLabels: false,
                intervals:[1,3,4],
                intervalColors:['#66cc66', '#E7E658','#cc6666']
            }
        }
    });

    $(function() {
    	$( "#progressbar2" ).progressbar({
    		value: 75
    	});
    });

    $('#txtProgreso2').val($('#progressbar2').progressbar( "value" )+'%');
    
    
});


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
          <td bgcolor="#0080ff">
            <p align="center"><strong><font face="Verdana"><strong><font 
            face=Verdana></font></strong><font color="#ffffff">Clave de 
            Proyecto</font>  
            </font></strong></p></td>
          <td bgcolor="#0080ff">
            <p align="center"><strong><font face="Verdana" 
            color=#ffffff>Nombre de 
            Proyecto</font></strong></p></td>
          <td bgcolor="#0080ff">
            <p align="center"><strong><font face="Verdana" 
            color=#ffffff>Tipo de 
            Proyecto</font></strong></p></td>
          <td bgcolor="#0080ff">
            <p align="center"><strong><font face="Verdana" 
            color=#ffffff>En 
            Tiempo</font></strong></p></td>
          <td bgcolor="#0080ff">
            <p align="center"><strong><font face="Verdana" 
            color=#ffffff>En 
            Costo</font></strong></p></td>
          <td bgcolor="#0080ff">
            <p align="center"><strong><font 
            face=Verdana 
            color=#ffffff>Progreso</font></strong></p></td>
          <td bgcolor="#0080ff">
            <p align="center"><strong><font face="Verdana" 
            color=#ffffff>Fecha 
            Fin</font></strong></p></td></tr>
        <tr>
          <td>
            <p align="center"><font color="#000000"><a 
            href="detalleProyecto.go">NodTec101</a></font></p></td>
          <td>
            <p align="center"><font color="#000000">Desarrollo de Aplicaciones 
            Bancarias</font></p></td>
          <td>
            <p align="center"><font color="#000000">Innovación</font></p></td>
          <td>

            <div id="chartTiempo" class="plot" style="width:120px;height:70px;"></div>

          </td>
          <td>

			<div id="chartCosto" class="plot" style="width:120px;height:70px;"></div>

          </td>
    	  <td width = "150px">
		    	<table>
		    		<tr>
			    		<td>
			    			<input name="txtProgreso" type="text" id="txtProgreso" disabled="true" size="3%"/>
			    		</td>
			    		<td width = "150px">
			    			<div id="progressbar"></div>
			    		</td>
		    		</tr>		    		
		    	</table>
		  </td>
          <td>
            <p align="center"><font color="#000000">31 Dic 2010</font></p></td></tr>
        <tr>
          <td bgcolor="#efefef">
            <p align="center"><font color="#000000"><font 
            color=#000000></font><a 
            href="detalleProyecto.go">NodMult110</a></font></p></td>
          <td bgcolor="#efefef">
            <p align="center"><font color="#000000">Creación de Presentaciones 
            Digitales</font></p></td>
          <td bgcolor="#efefef">
            <p align="center"><font color="#000000">Multimedia</font></p></td>
          <td bgcolor="#efefef">

            <div id="chartTiempo2" class="plot" style="width:120px;height:70px;"></div>
	
          </td>
          <td bgcolor="#efefef">
			<div id="chartCosto2" class="plot" style="width:120px;height:70px;"></div>
          </td>
    	  <td width = "150px">
		    	<table>
		    		<tr>
			    		<td>
			    			<input name="txtProgreso2" type="text" id="txtProgreso2" disabled="true" size="3%"/>
			    		</td>
			    		<td width = "150px">
			    			<div id="progressbar2"></div>
			    		</td>
		    		</tr>		    		
		    	</table>
		  </td>
          <td bgcolor="#efefef">
            <p align="center"><font color="#000000">31 Marzo 2011</font></p></td></tr>
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
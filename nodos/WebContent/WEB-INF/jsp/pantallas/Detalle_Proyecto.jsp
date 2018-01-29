<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
<head>
<meta name="GENERATOR" content="PageBreeze Free HTML Editor (http://www.pagebreeze.com)">
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1" >
<title>Detalle de Proyecto</title>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>
 
   <script language="javascript" type="text/javascript" src="${ contextPath }/js/jqplot/js/excanvas.js"></script>
  <link rel="stylesheet" type="text/css" href="${ contextPath }/js/jqplot/css/jquery.jqplot.css" />
  <link rel="stylesheet" type="text/css" href="${ contextPath }/js/jqplot/css/examples.css" />
 
    
   <style type="text/css">
    .ui-tabs-nav, .ui-accordion-header {
      font-size: 12px;
      font-color: #ffffff;
    }
    
    .ui-tabs-panel, .ui-accordion-content {
      font-size: 14px;
    }
    
    .jqplot-target {
      font-size: 18px;
    }
    
    body > table {
      width: 700px;
      margin-left:auto;
      margin-right: auto;
    }
    body > table, body > table > tr, body > table > td {
      width: 700px;
      border none;
    }
    
    td>p {
      font-family:"Trebuchet MS",Arial,Helvetica,sans-serif;
      font-size: 14px;
    }
  </style>
 
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

  <script type="text/javascript" language="javascript">
  
  $(document).ready(function(){
    
    $.jqplot.config.enablePlugins = false;

    hum = [['Desarrolladores',60], ['Lideres', 10], ['Analistas', 25], ['Arquitectos', 15]];

    mat = [['Desktops',60], ['Ipads', 10], ['Celulares', 25], ['Impresoras', 15], ['Monitores', 80]];
    
    // plot will size to the "data-width" and "data-height" attributes
		$("#accordion").accordion();
		
    plotRecHum = $.jqplot('chartRecHum', [hum], {
    	title:'Recursos Humanos',
        grid: {
        drawBorder: false, 
        drawGridlines: false,
        background: '#ffffff',
        shadow:false
	    },
	    axesDefaults: {	        
	    },
	    seriesDefaults:{
	        renderer:$.jqplot.PieRenderer,
	        rendererOptions: {
	            showDataLabels: true
	        }
	    },
	    legend: {
	        show: true,
	        location: 'e'
	    }
      });

    plotRecMat = $.jqplot('chartRecMat', [mat], {
    	title:'Recursos Materiales',
        grid: {
        drawBorder: false, 
        drawGridlines: false,
        background: '#ffffff',
        shadow:false
	    },
	    axesDefaults: {	        
	    },
	    seriesDefaults:{
	        renderer:$.jqplot.PieRenderer,
	        rendererOptions: {
	            showDataLabels: true
	        }
	    },
	    legend: {
	        show: true,
	        location: 'e'
	    }
      });


    presupuestado = [[01, 15], [04, 20], [08, 80], [12, 100]];
    consumido = [[01, 85], [04, 80], [08, 20], [12, 0]];
    
    plotPresupuesto = $.jqplot('chartPresupuesto', [presupuestado, consumido], {
        stackSeries: true,
        legend: {
            show: true,
            location: 'nw'
        },
        title: 'Estado del Presupuesto',
        seriesDefaults: {
            fill: true,
            showMarker: false
        },
        series: [{
            label: 'Consumido'
        },
        {
            label: 'Presupuestado',
            fill: true
        }],
        axes: {
            xaxis: {
                ticks: [01, 04, 08, 12],
                tickOptions: {
                    formatString: '%d'
                }
            },
            yaxis: {
                min: 0,
                max: 200
            }
        }
    });
        
    line1 = [[40,'Desarrollo'],[60,'Dise&ntildeo'],[20,'Arquitectura'],[50,'Pruebas'],[60,'Fixes']];
    
    plotTareas = $.jqplot('chartTareas', [line1], {
        title:'Tareas del Proyecto',
         seriesDefaults:{
           renderer:$.jqplot.BarRenderer, 
           rendererOptions:{
             barWidth:25, 
             barPadding:-25, 
             barMargin:25, 
             barDirection: 'horizontal',
             varyBarColor: true
           }, 
           shadow:false
         },
         legend: {show:false},
         axes:{
             xaxis:{min:0, tickOptions: {formatString: '%.0f',showGridLine: false}},
             yaxis:{show: true, renderer: $.jqplot.CategoryAxisRenderer,
                        tickOptions: {show: true, showLabel: true},
                        showTicks: true}
             }
     });

    $(function() {
		$( "#progressbar" ).progressbar({
			value: 45
		});
	});

    $(function() {
		$( "#progressbarPresupuesto" ).progressbar({
			value: 65
		});
	});
    
    $('#txtProgreso').val($('#progressbar').progressbar( "value" )+'%');

    $('#txtPresupuesto').val($('#progressbarPresupuesto').progressbar( "value" )+'%');
    
    $( "#fechaFin" ).val('03/03/2012');

    s1 = [1.8];
    plotStatus = $.jqplot('chartStatus',[s1],{
        seriesDefaults: {
            renderer: $.jqplot.MeterGaugeRenderer,
            rendererOptions: {
                showTickLabels: false,
                intervals:[1,3,4],
                intervalColors:['#cc6666', '#E7E658', '#66cc66']
            }
        }
    });

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
    
    $('#accordion').bind('accordionchange', function(event, ui) {
      var index = $(this).find("h3").index ( ui.newHeader[0] );
      //alert (index);
      
      if (index == 3) {
      }
      
      if (index == 2) {
//    	  plot3.replot();
        plotRecHum.replot();
        plotRecMat.replot();
      }
      if (index == 1) {
    	  plotPresupuesto.replot();
      }

      if (index == 0) {
//    	  plot3.replot();
        plotTareas.replot();
      }
      
    });

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
      <h1 align="center"><br><font color="#ffffff">Detalle de Proyecto</font></h1>
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
      	<td>

			<div id="accordion" style="margin-top:20px">
			
				<h3>
					<a href="#">Resumen de Proyecto</a>
				</h3>
				<div>
					<p>Datos generales del proyecto</p>		
			
					<table width="100%" border="1">
					  <tr>
					  	<td>WBS</td>
					    <td>PROYECTO</td>
					    <td>STATUS</td>
					    <td>AVANCE</td>
					    <td>F.FIN</td>
					    <td>EN TIEMPO</td>
					    <td>PRESUPUESTO</td>
					  </tr>
					  <tr>
					  	<td>
							<a href="detalleWBS.go">
					      		Ver WBS
					      	</a>					  	
						</td>
					  
					    <td>
					    	Proyecto Nodos
						</td>
						
					    <td>				
							<div id="chartStatus" class="plot" style="width:120px;height:70px;"></div>
						</td>
					    <td width = "150px">
					    	<table>
					    		<tr>
						    		<td>
						    			<input name="txtProgreso" type="text" id="txtProgreso" disabled="true" size="3%"/>
						    		</td>
						    		<td width = "110px">
						    			<div id="progressbar"></div>
						    		</td>
					    		</tr>		    		
					    	</table>
						</td>
					    <td>
							<input type="text" size="10%" id="fechaFin" disabled="true"/>
						</td>
					    <td>
							<div id="chartTiempo" class="plot" style="width:120px;height:70px;"></div>
						</td>
					    <td>
					    	<table>
					    		<tr>
						    		<td>
						    			<input name="txtPresupuesto" type="text" id="txtPresupuesto" disabled="true" size="3%"/>
						    		</td>
						    		<td width = "110px">
						    			<div id="progressbarPresupuesto"></div>
						    		</td>
					    		</tr>		    		
					    	</table>				
						</td>
					  </tr>
					</table>
					
					<div id="chartTareas" style="width:500px;height:250px;margin-top:15%; margin-left:25%;"></div>
					
			        <div style="width:500px;height:100px;margin-top:15%; margin-left:25%;">
			            <label for="message">Comentarios / Notas:</label>
			            <textarea name="message" style="height:60px;width:250px;"></textarea>
			        </div>          
					
					
				</div>
			  
				<h3>
					<a href="#">Detalle de Presupuesto</a>
				</h3>
				<div>
					<p>Detalle de Presupuesto</p>		
				    <div id="chartPresupuesto" style="margin-top:15%; margin-left:25%; width:360px; height:300px;"></div>
				</div>
				
				<h3>
					<a href="#">Detalle de Recursos</a>
				</h3>	
				<div>
			
					<div id="chartRecHum" align ="center" style="margin-top:15%; margin-left:25%;"></div>
			
					<div id="chartRecMat" style="margin-top:10%; margin-left:25%;"></div>
					
				</div>

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
      <p>&nbsp;</p></td>
 </tr>
 
 </tbody></table>
 </p>
</body>
</html>
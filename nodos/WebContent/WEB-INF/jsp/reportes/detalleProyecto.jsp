<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
  <c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Plots in Hidden Containers</title>

  <script language="javascript" type="text/javascript" src="${ contextPath }/js/jqplot/js/excanvas.js"></script>
<!--  <link rel="stylesheet" type="text/css" href="../jquery.jqplot.css" />-->
  <link rel="stylesheet" type="text/css" href="${ contextPath }/js/jqplot/css/jquery.jqplot.css" />
<!--  <link rel="stylesheet" type="text/css" href="examples.css" />-->
  <link rel="stylesheet" type="text/css" href="${ contextPath }/js/jqplot/css/examples.css" />
  
  <style type="text/css">
    .ui-tabs-nav, .ui-accordion-header {
      font-size: 12px;
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
  
  <!-- BEGIN: load jquery -->
<!--  <script language="javascript" type="text/javascript" src="../jquery-1.4.2.min.js"></script>-->
  <script language="javascript" type="text/javascript" src="${ contextPath }/js/jquery/jquery-1.4.2.min.js"></script>
  <!-- END: load jquery -->
  
  <!-- BEGIN: load jqplot -->
<!--  <script language="javascript" type="text/javascript" src="../jquery.jqplot.js"></script>-->
<!--  <script language="javascript" type="text/javascript" src="../plugins/jqplot.cursor.js"></script>-->
<!--  <script language="javascript" type="text/javascript" src="../plugins/jqplot.pieRenderer.js"></script>-->
<!--  <script language="javascript" type="text/javascript" src="../plugins/jqplot.ohlcRenderer.js"></script>-->
<!--  <script language="javascript" type="text/javascript" src="../plugins/jqplot.categoryAxisRenderer.js"></script>-->
  
  <script type="text/javascript" src="${ contextPath }/js/jqplot/js/jquery.jqplot.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.cursor.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.pieRenderer.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.ohlcRenderer.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.categoryAxisRenderer.js"></script>
  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.barRenderer.js"></script>

  <script type="text/javascript" src="${ contextPath }/plugins/jqplot.meterGaugeRenderer.js"></script>
  
<!--  <link type="text/css" href="jquery-ui/css/ui-lightness/jquery-ui-1.8.1.custom.css" rel="Stylesheet" />	-->
  <link rel="stylesheet" type="text/css" href="${ contextPath }/jquery-ui/css/ui-lightness/jquery-ui-1.8.1.custom.css" />
  
<!--  <script type="text/javascript" src="jquery-ui/js/jquery-ui-1.8.1.custom.min.js"></script>-->
  <script type="text/javascript" src="${ contextPath }/jquery-ui/js/jquery-ui-1.8.1.custom.min.js"></script>
  
  <!-- END: load jqplot -->
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
  </head>
  <body>
<?php include "nav.inc"; ?>
    <table><tr><td>
      <h1>Detalle del proyecto NODUS</h1>
      

<div id="accordion" style="margin-top:50px">

	<h3>
		<a href="#">Resumen de Proyecto</a>
	</h3>
	<div>
		<p>Datos generales del proyecto</p>		

		<table width="100%" border="1">
		  <tr>
		    <td>WBS</td>
		    <td>GANTT</td>
		    <td>PROYECTO</td>
		    <td>STATUS</td>
		    <td>AVANCE</td>
		    <td>F.FIN</td>
		    <td>EN TIEMPO</td>
		    <td>PRESUPUESTO</td>
		  </tr>
		  <tr>
		    <td>
		    	<a href="pay.go">ver WBS</a>
		    </td>
		    <td>
		    	<a href="statusProyectos.go">ver Gantt</a>
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
			    		<td width = "150px">
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
			    		<td width = "150px">
			    			<div id="progressbarPresupuesto"></div>
			    		</td>
		    		</tr>		    		
		    	</table>				
			</td>
		  </tr>
		</table>
		
		<div id="chartTareas" style="width:500px;height:250px;margin-top:15%; margin-left:25%;"></div>
		
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
</td></tr></table>
  </body>
</html>
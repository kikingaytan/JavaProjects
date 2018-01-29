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

  
  
<!--  <link type="text/css" href="jquery-ui/css/ui-lightness/jquery-ui-1.8.1.custom.css" rel="Stylesheet" />	-->
  <link rel="stylesheet" type="text/css" href="${ contextPath }/jquery-ui/css/ui-lightness/jquery-ui-1.8.1.custom.css" />
  
<!--  <script type="text/javascript" src="jquery-ui/js/jquery-ui-1.8.1.custom.min.js"></script>-->
  <script type="text/javascript" src="${ contextPath }/jquery-ui/js/jquery-ui-1.8.1.custom.min.js"></script>
  
  <!-- END: load jqplot -->
  <script type="text/javascript" language="javascript">
  
  $(document).ready(function(){
    
    $.jqplot.config.enablePlugins = false;

    l1 = [18, 36, 14, 11];
    l2 = [[2, 14], [7, 2], [8,5]];
    l3 = [4, 7, 9, 2, 11, 5, 9, 13, 8, 7];
    l4 = [['peech',3], ['cabbage', 2], ['bean', 4], ['orange', 5]];

    // plot will size to the "data-width" and "data-height" attributes
    var options = {
      title: "I was hidden",
      lengend:{show:true},
      series:[{},{yaxis:'y2axis'}, {yaxis:'y3axis'}],
      cursor:{show:true, zoom:true},
      axesDefaults:{useSeriesColor:true}
    }
    
    
		$("#tabs").tabs();
		$("#accordion").accordion();
		
    plot1 = $.jqplot('chart1', [l1, l2, l3],  options);
    
    plot2 = $.jqplot('chart2', [l4], {
      height: 200,
      width: 300,
      series:[{renderer:$.jqplot.PieRenderer}],
      legend:{show:true}
    });
    
    var catOHLC = [[1, 138.7, 139.68, 135.18, 135.4],
    [2, 143.46, 144.66, 139.79, 140.02],
    [3, 140.67, 143.56, 132.88, 142.44],
    [4, 136.01, 139.5, 134.53, 139.48],
    [5, 143.82, 144.56, 136.04, 136.97],
    [6, 136.47, 146.4, 136, 144.67],
    [7, 124.76, 135.9, 124.55, 135.81],
    [8, 123.73, 129.31, 121.57, 122.5]];
    
    var ticks = ['Tue', 'Wed', 'Thu', 'Fri', 'Mon', 'Tue', 'Wed', 'Thr'];
        
    plot3 = $.jqplot('chart3',[catOHLC],{
      grid:{ drawGridlines:true},
      title: 'A CandleStick Chart',
      axes: {
          xaxis: {
              renderer:$.jqplot.CategoryAxisRenderer,
              ticks:ticks
          },
          yaxis: {
              tickOptions:{formatString:'$%.2f'}
          }
      },
      series: [{renderer:$.jqplot.OHLCRenderer, rendererOptions:{candleStick:true}}]
    });
    
    $('#tabs').bind('tabsshow', function(event, ui) {
      if (ui.index == 1 && plot1._drawCount == 0) {
        plot1.replot();
      }
      else if (ui.index == 2 && plot2._drawCount == 0) {
        plot2.replot();
      }
    });
    
    $('#accordion').bind('accordionchange', function(event, ui) {
      var index = $(this).find("h3").index ( ui.newHeader[0] );
      if (index == 1) {
        plot3.replot();
      }
    });

  });
  
  </script>
  </head>
  <body>
<?php include "nav.inc"; ?>
    <table><tr><td>
      <p>This page demonstrates using plots within containers that are initially hidden.  Examples are shown for jQuery UI tabs and Accordions</p>
  <div id="tabs">
  	<ul>
  		<li><a href="#tabs-1">Tab 1</a></li>
  		<li><a href="#tabs-2">Tab 2</a></li>
  		<li><a href="#tabs-3">Tab 3</a></li>
  	</ul>
  	<div id="tabs-1">
  	  <p>Tab 2 and tab 3 contain plots which are initially hidden.  Using a combination of alternate sizing specification and the plots "replot" method the plots are properly displayed when their containers are shown.</p>
  	  <p>The alternate sizing specifications for setting plot height and width are needed because a hidden element (or child of a hidden element) has no size.  The first example in tab 2 uses custom "data-height" and "data-width" attributes on the plot target element to specify height.  The second example uses "width" and "height" properties specified on the options object passed into the $.jqplot() function.</p>
    
    <p>The default size is 300px wide by 400px high. The default setting can be overriden by specifying different values to the $.jqplot.config.defaultHeight and $.jqplot.config.defaultWidth properties.  Height and width values are taken in this order of prececence:</p>
      
      <ol>
        <li>The css properties if available and plot is not hidden with display:none.</li>
        <li>Options object passed into the $.jqplot() function.</li>
        <li>Custom data-height and data-width attributes on the plot target.</li>
        <li>The config defaults.</li>
      </ol>
  	  
  	  <p>Here is how the replot method can be used to bind to the "tabsshow" event of the UI tabs:</p>
  	    
<pre>
    $('#tabs').bind('tabsshow', function(event, ui) {
      if (ui.index == 1) {
        plot1.replot();
      }
      else if (ui.index == 2) {
        plot2.replot();
      }
    });
</pre>

<p>The ui.index property is the index of the tab that was shown. </p>
  	</div>
  	
  	<div id="tabs-2">
  		<p>This plot was in an initially hidden container.  It's hieght and width are set by the "data-height" and "data-width" properties of the plot container.</p>
        <div id="chart1" data-height="260px" data-width="480px" style="margin-top:20px; margin-left:20px;"></div>
  	</div>
  	
  	<div id="tabs-3">
  		<p>This plot is in an initially hidden container.  It's height and width are set by the 'height' and 'width' properties of the options object passed into the plot constructor.</p>
        <div id="chart2" style="margin-top:20px; margin-left:20px;"></div>
  	</div>
  	
  </div> 
  
<div id="accordion" style="margin-top:50px">
  
	<h3><a href="#">Section 1</a></h3>
	<div>
		<p>Secion 2 contains a plot.  Sizing plots in hidden accordion sections is very similar to sizing in a tab widget.  Because of the default animation on accordions, however, the plot will not draw itself until the entire accordion panel is shown.</p>
		
		<p>Binidng to the accordion "accordionchange" event is also similar as with tabs:</p>
		
		<pre>
    $('#accordion').bind('accordionchange', function(event, ui) {
      var index = $(this).find("h3").index ( ui.newHeader[0] );
      if (index == 1) {
        plot3.replot();
      }
    });
    </pre>
	</div>
	
	<h3><a href="#">Section 2</a></h3>
	<div>
		<p>
		This plot also has it's height and width set with the data-height and data-width attributes.  Note, if you want the accordian widget to properly size itself </em>before</em> the plot is shown, you must also specify a css height and width on the plot target.
		</p>
		<div id="chart3" data-height="200" data-width="400" style="width:400px; height: 200px; margin-top: 20px; margin-left: 20px"></div>
	</div>
	
</div>
</td></tr></table>
  </body>
</html>
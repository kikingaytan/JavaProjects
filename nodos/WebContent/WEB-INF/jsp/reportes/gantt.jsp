<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html lang="en">
<head>
    <c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>
   
<!--	<link rel="stylesheet" type="text/css" href="reset.css" />-->
    <link rel="stylesheet" type="text/css" href="${ contextPath }/gantt/css/reset.css" />
<!--	<link rel="stylesheet" type="text/css" href="../jquery.ganttView.css" />-->
    <link rel="stylesheet" type="text/css" href="${ contextPath }/gantt/css/jquery.ganttView.css" />
    
	<style type="text/css">
		body {
			font-family: tahoma, verdana, helvetica;
			font-size: 0.8em;
			padding: 10px;
		}
	</style>
	<title>jQuery Gantt</title>
</head>
<body>

	<div id="ganttChart"></div>

<!--	<script type="text/javascript" src="../lib/jquery-1.4.2.js"></script>-->
    <script language="javascript" type="text/javascript" src="${ contextPath }/js/jquery/jquery-1.4.2.min.js"></script>
<!--	<script type="text/javascript" src="../lib/date.js"></script>-->
    <script language="javascript" type="text/javascript" src="${ contextPath }/gantt/js/date.js"></script>

<!--	<script type="text/javascript" src="../jquery.ganttView.js"></script>-->
	<script language="javascript" type="text/javascript" src="${ contextPath }/gantt/js/jquery.ganttView.js"></script>
<!--	<script type="text/javascript" src="data.js"></script>-->
    <script language="javascript" type="text/javascript" src="${ contextPath }/gantt/js/data.js"></script>
    
	<script type="text/javascript">
		$(function () {
			$("#ganttChart").ganttView({ 
				data: ganttData,
				start: new Date(2010,00,01),
				end: new Date(2010,04,15),
				slideWidth: 900
			});
		});
	</script>

</body>
</html>

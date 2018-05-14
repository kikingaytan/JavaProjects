$(function () {

 var coverageRestUrl = "http://localhost:8084/InsuranceCoverage/v1/coverage/";
   $.ajax({type:'GET',url:coverageRestUrl,dataType:'json' 
  }).then(function(data) {
		var row=null;

 	row=$("<div class='row'>")
	row.appendTo("#coverageDiv");
	var col2 = $("<div class='col-md-12'>");
	col2.appendTo(row);
	var h2 = $("<h4>Coverages</h4>");
	h2.appendTo(col2);
	var hr = $("<hr></hr>");
	hr.appendTo(col2);
    $.each(data, function(index, item) {
		if (index==0 || index%2==0){
			row=$("<div class='row'>")
			row.appendTo("#coverageDiv");
			console.log("creating one row;"+index);
		}			
		if (data.length ==index+1){
			var col2 = $("<div class='col-md-12'>");
			col2.appendTo(row);
			var row2=$("<div class='row'>")
			row2.appendTo(col2);
			var col = $("<div class='centerColumn col-md-6'>");
			col.appendTo(row2);
		}else {
			var col = $("<div class='col-md-6'>");
			col.appendTo(row);
		}
		var header = $("<h4>"+item.coverage+"  <span><i class='fa fa-external-link'></i></span></h4>");
		header.appendTo(col);
	  
	  
      $("<p>").text( item.description).appendTo(col);
    });
  }).fail(function( jqxhr, textStatus, error ) {
    var err = textStatus + ", " + error;
    console.log( "Request Failed: " + err );
  });
});
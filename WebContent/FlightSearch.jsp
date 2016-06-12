<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Flight Search</title>

    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    
 	<!--- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
   	<script type="text/javascript">
    
 	// COLLECT TEMPLATE INFORMATION
 	
 	$(function() {
 		
 	    var airports = ["ATL", "ANC", "AUS", "BWI", "BOS", "CLT", "MDW", "ORD", "CVG", "CLE", "CMH", "DFW", "DEN", "DTW", "FLL", "RSW", "BDL", "HNL", "IAH", "HOU", "IND", "MCI", "LAS", "LAX", "MEM", "MIA", "MSP", "BNA", "MSY", "JFK", "LGA", "EWR", "OAK", "ONT", "MCO", "PHL", "PHX", "PIT", "PDX", "RDU", "SMF", "SLC", "SAT", "SAN", "SFO", "SJC", "SNA", "SEA", "STL", "TPA", "IAD", "DCA"];
 	   $( "#Source" ).autocomplete({
 	      source: airports
 	    });
 	   
 	  $( "#Destination" ).autocomplete({
 	      source: airports
 	    });
 	  
 	});
 	/*
 	function airportCodes(){
    var listTemplate = $('#selectDiv').find('script').html(); //assigning the template given in the parameters 
    
    var text = '';
    
    var airports = ["ATL", "ANC", "AUS", "BWI", "BOS", "CLT", "MDW", "ORD", "CVG", "CLE", "CMH", "DFW", "DEN", "DTW", "FLL", "RSW", "BDL", "HNL", "IAH", "HOU", "IND", "MCI", "LAS", "LAX", "MEM", "MIA", "MSP", "BNA", "MSY", "JFK", "LGA", "EWR", "OAK", "ONT", "MCO", "PHL", "PHX", "PIT", "PDX", "RDU", "SMF", "SLC", "SAT", "SAN", "SFO", "SJC", "SNA", "SEA", "STL", "TPA", "IAD", "DCA"];
    for (var i=0; i< airports.length; i++){
    	console.log(airports[i]);
    	text += listTemplate.format( airports[i]);
    	
    }
    
  //APPEND NEW DATA TO UI
    text = $(text);
    $("body").find("#selectDiv").append(text);
    
 	};
 	airportCodes();
    
  
    // Simple Templating Function
    String.prototype.format = function() {
           var args = arguments;
           return this.replace(/{(\d+)}/g, function(match, number) {
               return typeof args[number] != 'undefined'
                       ? args[number]
                       : match
                       ;
           });
       };
       */
    </script>
  
  
    
     <!-- Custom styles for this template -->
    <link href="Custom/myStyleSheet.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <c:choose>
		<c:when test="${sessionScope.username==null}">
			<c:redirect url="Login.jsp" />
		</c:when>
		<c:otherwise>
			<c:set var="username" value="${sessionScope.username}" />
		</c:otherwise>
	</c:choose>
	
	<c:url value="/FlightSearch" var="completeURL">
	  <c:param name="sessionId" value="${pageContext.session.id}"/>
	</c:url>
	
	<c:url value="/BookingHistoryServlet" var="BookingHistoryServletURL">
	  <c:param name="sessionId" value="${pageContext.session.id}"/>
	</c:url>
	
	
<%@ include file="/WEB-INF/header.jsp" %>
		
    <div class="container">
    
    <div class="search-background">
	<div class="login">
    

      <form class="form-signin" role="form" action="${completeURL}"  method="post">
        <h2 class="form-signin-heading">Flight Search</h2>
        
        <div class="row">
        	<div class="col-md-6">
        		<div class="radio">
  				<label><input type="radio" name="tripType">One way</label>
				</div>
        	</div>
        	<div class="col-md-6">
        		<div class="radio">
  				<label><input type="radio" name="tripType">Roundtrip</label>
				</div>
        	</div>
        </div>
        
        <div class="row">
        	<div class="col-md-6">
       			 <input class="form-control" id="Source" placeholder="Source" name="source" required>
       		</div>
       		<div class="col-md-6"> 
        		<input class="form-control" id="Destination" placeholder="Destination" name="destination" required><br />
        	</div>
        </div>	
        
        <div class="row">
        	<div class="col-md-6">
        		<input type="date" class="form-control" placeholder="Departing Date" name="departureDate" required><br/>
        	</div>
        	<div class="col-md-6">
        		<input type="date" class="form-control" placeholder="Returning Date" name="returnDate" ><br/>
        	</div>
        </div>	
        
        
        <div class="row">
        	<div class="col-md-6">
        	<select class="form-control" name="numberOfTickets">
	        	<option value="1">1</option>
	        	<option value="2">2</option>
	        	<option value="3">3</option>
	        	<option value="4">4</option>
	        	<option value="5">5</option>
	        	<option value="6">6</option>
	        	<option value="7">7</option>
        	</select>
        	</div>
           <div class="col-md-6">	
       		 <select class="form-control" name="flightClass">
  				<option value="Business">Business</option>
  				<option value="Economy">Economy</option>
  				<option value="FirstClass">First Class</option>
 			</select>
 			</div>
 			</div>	
 		<br />
        <button class="btn btn-lg btn-primary btn-block" type="submit">Search</button><br/>
        <a href="${BookingHistoryServletURL}">
        	<button class="btn btn-lg btn-primary btn-block" type="submit">Booking History</button><br/>
        </a>
     
      </form>
      
      </div>
      </div>

    </div> <!-- /container -->  
   

  </body>
</html>
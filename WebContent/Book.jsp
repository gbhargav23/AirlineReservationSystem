<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="BookAirlines.JDBCAuthentication"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View/Book</title>
<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!--- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>

<style>
.inactive {
	display: none;
}
</style>

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
	
	<c:url value="/FlightSearch.jsp" var="FlightSearchURL">
	  <c:param name="sessionId" value="${pageContext.session.id}"/>
	</c:url>
	
	<c:url value="/ShoppingCart.jsp" var="ShoppingCartURL">
	  <c:param name="sessionId" value="${pageContext.session.id}"/>
	</c:url>

	<%@ include file="/WEB-INF/header.jsp"%>
	<div class="container-fluid">
		<h2 class="sub-header">Selected Flights</h2>
		<div class="table-responsive">
			<!--  <form name="View/Book" action="ViewBook_servlet" method="post"> -->
			<table class="table table-striped" border="1">
				<thead>
					<tr>


						<th>Flight Number</th>
						<th>Number of Stops</th>
						<th>Departure Date</th>
						<th>Source</th>
						<th>Destination</th>
						<th>Class</th>
						<th>Cost</th>
						<th>No: of Tickets</th>
						<th>BOOK</th>

					</tr>
				</thead>

				<tbody>
					<c:set var="bookList" value="${sessionScope.bookList}" />

					<tr>
						<td><c:out value="${bookList.flightId}" /></td>
						<td>2</td>
						<td><c:out value="${bookList.departuteDate}" /></td>
						<td><c:out value="${bookList.source}" /></td>
						<td><c:out value="${bookList.destination}" />
						<td><c:out value="${bookList.flightClass}" />
						<td>350$</td>
						<td><select id="ticketsSelectable">

						</select></td>
						<td>
							
								<button name="addToCart" id="addToCart" value="addToCart">Add to Cart</button>
                                 <input type="hidden" name="flight_id" id="flight_id" value="<c:out value="${bookList.flightId}" />"/>
                                  <input type="hidden" name="flight_class" id="flight_id" value="<c:out value="${bookList.flightClass}" />" />	
						</td>
					</tr>

				</tbody>
			</table>
			<!--  </form> -->
		</div>



		<div class="row">
			<div class="col-md-6">

				<!--  <a href="SearchResult_servlet"><button type="button" class="btn btn-lg btn-primary" >Back(Search Results)</button></a>-->
				<a href="${FlightSearchURL}"><button type="button"
						class="btn btn-lg btn-primary">Home</button></a> 
				<a href="${ShoppingCartURL}"><button type="button"
						class="btn btn-lg btn-primary">Shopping Cart</button></a>

			</div>
		</div>
		<br /> <br /> <br />
		<div class="inactive" id="AddedShoopingCart">
			<div class="row">
				<div class="jumbotron">
					<h3>Flight Successfully added to shopping cart !</h3>

				</div>
			</div>
		</div>

		<div class="inactive" id="NotAdded">
			<div class="row ">
				<div class="jumbotron">
					<h3>Error! No Added to shopping cart. Please try again</h3>
				</div>
			</div>
		</div>
	</div>



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="./dist/js/bootstrap.min.js"></script>
	<script src="./assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./assets/js/ie10-viewport-bug-workaround.js"></script>
	<script>
    $(function(){
        var $select = $(".1-100");
        for (i=1;i<=5;i++){
            $select.append($('<option></option>').val(i).html(i))
        }
   
    });
   
 			
  	  // function to auto generate number of availabe tickets.
  	    
  	    var flight_id= $("#flight_id").val();
  	    console.log(flight_id);
  	    var flight_class =  $("#flight_class").val();
	    $.get("ViewBook_servlet?flight_id="+flight_id+"&flight_class="+flight_class,function(data,status){
	     // alert("Data: " + data + "\nStatus: " + status);
	      
	      var ticketsAvailable = parseInt(data);
	      console.log(ticketsAvailable);
	      
	     // var ticketsAvailableList = new Array();
	     if(ticketsAvailable <10){
	      for (var i=1;i<=ticketsAvailable;i++){
	    	  $("#ticketsSelectable").append("<option value="+i+">"+i).append("</option>");
	      }
	      }
	     else {
	    	 for (var i=1;i<=10;i++){
		    	  $("#ticketsSelectable").append($('<option></option>').val(i).html(i));
		    	 
		      }
	     }
	     	
	      
	     /*$("#tickets").autocomplete({
	 	      source: ticketsAvailableList
	 	    });*/
	     
	    });
   
   
	    
	    $(document).ready(function(){
	    	var numberOfTickets = $("#ticketsSelectable").val();
	    	
	    		  $("#addToCart").on("click",function(){
	    			  var numberOfTickets = $("#ticketsSelectable").val();
	    			  console.log("yo1");
	    		    	 console.log(numberOfTickets);
	    			 
	    		     $.post("AddToCart_servlet",
	    			  {
	    				  flight_id: flight_id,
	    				  flight_class: flight_class,
	    				  numberOfTickets: numberOfTickets
	    			    
	    			  },
	    			  function(data,status){
	    				  console.log(data);
	    			   // alert("Data: " + data + "\nStatus: " + status);
	    			    if(data == "Flight successfully added to cart"){
	    			    	console.log(data);
	    			    	$("#AddedShoopingCart").toggleClass("inactive");
	    			    }
	    			    else{
	    			    	console.log(data);
	    			    	$("#NotAdded").toggleClass("inactive");
	    			    }
	    			  });
	    			});
	    	  
	    	});
	  

    </script>
</body>
</html>
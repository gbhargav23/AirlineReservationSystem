<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional: Include the jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Optional: Incorporate the Bootstrap JavaScript plugins -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>
<body>

<%@ page import="java.util.List" %>
<%@ page import="BookAirlines.ShoppingCartBean" %>

<c:choose>
		<c:when test="${sessionScope.username==null}">
			<c:redirect url="Login.jsp" />
		</c:when>
		<c:otherwise>
			<c:set var="username" value="${sessionScope.username}" />
		</c:otherwise>
	</c:choose>
	
	<c:url value="/ConfirmBooking.jsp" var="ConfirmBookingURL">
	  <c:param name="sessionId" value="${pageContext.session.id}"/>
	</c:url>
	
<%@ include file="/WEB-INF/header.jsp" %>

<script>


</script>

<div class="container-fluid">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <h2 class="sub-header">Transactions</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  
                  <th>Flight Number</th>
                  <!--  <th>Date</th>
                  <th>Source</th>
                  <th>Destination</th>-->
                  <th>Class</th>
                  <th>Number of Tickets</th>
                  <th>Cost</th>
                  
                </tr>
              </thead >
              <tbody>
              <c:set var="sum" value="${0}"/>
	<c:forEach items="${cart}" var="flight" varStatus="loop">
	
	 <tr>
   		<td>
   			<c:out value="${flight.flight_id}"/>
   		</td>
   		<td>
   			<c:out value="${flight.flight_class}"/>
   		</td>
   		<td>
   			<c:out value="${flight.numberOfTickets}"/>
   		</td>
   		<td>
   			<c:out value="${flight.total_cost}"/>
   			<c:set var="sum" value="${sum + flight.total_cost}" />
   		</td>
   	
	 	
   	</tr>  
   	
	</c:forEach>
	<c:set var="total_purchaseCost" value="${sum}" scope="session"  />
         </tbody>    	
            </table>
            
           </div>
           <br /> <br /> <br />
           <a href="${ConfirmBookingURL}"><button type="button" id="book" class="btn btn-primary btn-lg btn-block">Check Out</button></a>
         </div>
        </div>
 </div>
 
   
   <script>
	/*var flight_id =  $("input[name='flight_id']").val();
	var numberOfTickets=  $("input[name='numberOfTickets']").val();
	var total_cost =  $("input[name='total_cost']").val();
	var flight_class =  $("input[name='flight_class']").val();
	console.log(flight_class);
	
	$("#addRows").append('<tr><td>'+flight_id)
				.append('</td><td>'+flight_class)
				.append('</td><td>'+numberOfTickets)
				.append('</td><td>'+total_cost)
				.append('</td></tr>'); */
		
				
				      
				
	
	
   </script>
              
</body>

</html>
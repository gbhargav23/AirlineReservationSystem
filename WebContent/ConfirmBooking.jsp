<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional: Include the jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Optional: Incorporate the Bootstrap JavaScript plugins -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction</title>
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
    
     <style>
        .inactive{
           display:none;
        }
        </style>
</head>
<body>
<%@ include file="/WEB-INF/header.jsp" %>

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
	
	<c:url value="/FlightSearch.jsp" var="URLFlightSearch">
	  <c:param name="sessionId" value="${pageContext.session.id}"/>
	</c:url>
	
	<c:url value="/BookingHistoryServlet" var="URLBookingHistoryServlet">
	  <c:param name="sessionId" value="${pageContext.session.id}"/>
	</c:url>


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
   			<c:set var="sum" value="${sum + flight.total_cost}"/>
   		</td>
   	
	 	
   	</tr>  
   	
	</c:forEach>
              </tbody>
              </table>
              </div>
              </div>
              </div>
              

			<!--  <form name="BankAccountInfo" action="Conformation_servlet" method="post"> -->
              <div class ="row">
              <h2 >Bank Information</h2>
              
        <input type="text" class="form-control" id="" name="account_name" placeholder="Account holder's name" required autofocus>
        <input type="text" class="form-control" id="account_number" name="account_number" placeholder="Account Number" required>
        <input type="hidden" id="total_purchaseCost" value="${sessionScope.total_purchaseCost}" />
        
        
        </div> <br/> <br />
        
        <div class ="row">
        <div class="text-center">
        <button class="btn btn-lg btn-primary " onClick="confirmTransaction()">Confirm</button></a> &nbsp;&nbsp; &nbsp; &nbsp;
       <a href="${URLFlightSearch}"> <button class="btn btn-lg btn-primary " >Cancel</button></a> &nbsp;&nbsp; &nbsp; &nbsp;
	   <a href="${URLBookingHistoryServlet}"> <button class="btn btn-lg btn-primary " >Booking History</button></a> &nbsp;&nbsp; &nbsp; &nbsp;
		
        </div>
        
        
              
              
              </div>
             <!--  </form> -->
              <br /> <br /> <br />
         
       <div class="row inactive" id="NoAccount">
       		<div class="jumbotron">
  			<h1>Sorry, Invalid Account!</h1>
  			<p>The account number you have entered is invalid, please give a valid account number.</p>
  			</div>      
        </div> 
        
        
        <div class="row inactive" id="NoFunds">
       		<div class="jumbotron">
  			<h1>Sorry, Insufficient Funds!</h1>
  			<p>Please enter another account with sufficient funds to make the purchase.</p>
  			</div>      
        </div> 
        
        
        <div class="row inactive" id="TransactionSuccessful">
       		<div class="jumbotron">
  			<h1>Transaction Successful !</h1>
  			
  			<!--  <input type="text" class="form-control1" name="name" id="name" placeholder="Full Name" required autofocus>
       		<input type="text" class="form-control1" name="age" id="age" placeholder="Age" required>
       		<input type="radio" name="sex" value="male">Male<br>
			<input type="radio" name="sex" value="female">Female-->
  			
  			
  			</div>      
        </div> 
               
              
</div>
             
            
                  
      <script type="text/javascript">
      function confirmTransaction(){
    	var account_number =  $("input[name='account_number']").val();
    	var total_purchaseCost= $("#total_purchaseCost").val();
    	console.log(total_purchaseCost);
    	/*var flight_id =  $("input[name='flight_id']").val();
    	var numberOfTickets=  $("input[name='numberOfTickets']").val();
    	var total_cost =  $("input[name='total_cost']").val();
    	var flight_class =  $("input[name='flight_class']").val();*/
    	
    	// function for bank Transactions
    	
    	
    	  
    	  $.post("/Team9-Homework3-Banking/Transaction_servlet",
    			  {
    		  		account_number: account_number ,
    		  		total_purchaseCost: total_purchaseCost,
    		  		  		  	    			    
    			  },
    			  function(data,status){
    				  console.log(data);
    			   // alert("Data: " + data + "\nStatus: " + status);
    			    if(data == "Transaction Successful"){
    			    	console.log(data);
    			    	$("#TransactionSuccessful").toggleClass("inactive");
    			    }
    			    else if(data=="No Funds"){
    			    	console.log(data);
    			    	$("#NoFunds").toggleClass("inactive");
   			    	
    			    }
    			    else{
    			    	console.log(data);
    			    	$("#NoAccount").toggleClass("inactive");
    			    	
    			    }
    			  });
    			
      }
      </script>         
                 



</body>
</html>
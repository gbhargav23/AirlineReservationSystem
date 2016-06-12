<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction Successful</title>
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
</head>
<body>
<%
	// checking if session exists, if not then redirect to login page
		if(session.getAttribute("username") == null){
			response.sendRedirect("login.jsp");
		}
	
	%>
<%@ include file="/WEB-INF/header.jsp" %>


<div class="container">
	<div class="jumbotron">
		<div class ="row">
			<div class="col-md-12">
						<legend><strong>Purchase Details</strong></legend>
						
						<strong> From: <span class="sourceFont"><%= session.getAttribute("source") %></span><br/>
						To: <span class="destinationFont"> <%= session.getAttribute("destination") %> </span></strong>
						
						<table class="table table-striped">
					       
					       <tbody>
					       	<tr>
					       		<th>Username</th>
					       		<td><%= session.getAttribute("username")  %></td>
					       	</tr>
					       </tbody>
					       
					      
					       <tbody>
					       	<tr>
					       		<th>Source</th>
					       		<td><%= session.getAttribute("source") %></td>
					       	</tr>
					       </tbody>
					       
					       <tbody>
					       	<tr>
					       		<th>Destination</th>
					       		<td><%= session.getAttribute("destination") %></td>
					       	</tr>
					       </tbody>

					       <tbody>	
					       	<tr>
					       		<th>Flight ID</th>
					       		<td><%= session.getAttribute("flight_id") %></td>
					       	</tr>
					       </tbody>
					       <tbody> 	
					       	<tr>
					       		<th>Departure Date</th>
					       		<td><%= session.getAttribute("departureDate") %></td>
					       	</tr>
					       </tbody>
					       
					      
					      
					       <tbody>
					       	<tr>
					       		<th>Number of Tickets Booked</th>
					       		<td><%= session.getAttribute("numberOfTickets") %></td>
					       	</tr>
					       	</tbody>
					       	
					       	 <tbody>
						            <tr>
						            	<th>Ticket Class</th>
						                <td><%= session.getAttribute("flight_class") %></td>
						            </tr>
						        </tbody>
						        
					       <tbody>
					       	<tr>
					       		<th>Total Cost</th>
					       		<td>$<%= session.getAttribute("total_cost") %></td>
					       	</tr>
					       	</tbody>

					   </table>

					   </div>
				</div>
				</div>
				</div>
				


<script type="text/javascript">

$(document).ready(function(){
	
	window.print();
	
});
</script>
<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="./dist/js/bootstrap.min.js"></script>
    <script src="./assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./assets/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>
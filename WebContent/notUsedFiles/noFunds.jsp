<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>No Funds </title>
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
<%@ include file="/WEB-INF/header.jsp" %>
<h2>Sorry, insufficent funds in your account. Please go back and provide valid details.</h2>
<!--  <tr>
                  <th>Index Number</th>
                  <th>Flight Number</th>
                  <th>Date</th>
                  <th>Source</th>
                  <th>Destination</th>
                  <th>Class</th>
                  <th>Number of Tickets</th>
                  <th>Cost</th>
                  
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td><%= request.getAttribute("flight_id") %></td>
                  <td><%= session.getAttribute("departureDate") %></td>
                   <td><%= session.getAttribute("source") %></td>
                   <td><%= session.getAttribute("destination") %></td>
                  <td><%= request.getAttribute("flight_class") %></td>
                   <td><%= request.getAttribute("numberOfTickets") %></td>
                  <td><%= request.getAttribute("total_cost") %></td>
                </tr> 
                
                
                
                
                
                <input type="hidden" class="form-control" name="flight_id" value="<%= request.getAttribute("flight_id") %>" >
        <input type="hidden" class="form-control" name="numberOfTickets" value="<%= request.getAttribute("numberOfTickets") %>" >
        <input type="hidden" class="form-control" name="total_cost" value="<%= request.getAttribute("total_cost") %>" >
        <input type="hidden" class="form-control" name="flight_class" value="<%= request.getAttribute("flight_class") %>" >
                
                
                -->

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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction Confirmation</title>
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
<div class="container-fluid">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <h2 class="sub-header">Transaction Confirmation</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Index Number</th>
                  <th>Flight Number</th>
                  <th>Date</th>
                  <th>Departure Time</th>
                  <th>Arrival Time</th>
                  <th>Number of Stops</th>
                  <th>Cost</th>
                  
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>1001</td>
                  <td>05/23/2014</td>
                  <td>09.00 AM</td>
                  <td>01.00 PM</td>
                  <td>2</td>
                  <td>250$</td>
                </tr>
              </tbody>
              </table>
              </div>
              </div>
              </div><br /> <br /> <br /> <br />
              <div class="row">
              <blockquote><h1> <small>Your purchase has been confirmed.</small></h1></blockquote>
              </div><br /><br /> <br /> <br />
              <div class ="row">
        <div class="text-center">
     
       <a href="FlightSearch.jsp"> <button class="btn btn-lg btn-primary " type="submit">Home</button></a> &nbsp;&nbsp; &nbsp; &nbsp;
        </div>
              
              
              </div>
              </div>
              
            
            
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
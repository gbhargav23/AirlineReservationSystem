<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="BookAirlines.FlightSearch"%>
<%@ page import="BookAirlines.Results"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Flight Search Results</title>

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

</head>
<body>
	<%@ include file="/WEB-INF/header.jsp"%>
	<c:choose>
		<c:when test="${sessionScope.username==null}">
			<c:redirect url="Login.jsp" />
		</c:when>
		<c:otherwise>
			<c:set var="username" value="${sessionScope.username}" />
		</c:otherwise>
	</c:choose>
	
	<c:url value="/SearchResults_servlet" var="completeURL">
	  <c:param name="sessionId" value="${pageContext.session.id}"/>
	</c:url>


	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<h2 class="sub-header">Search Results</h2>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>

								<th>Flight Number</th>
								<th>Departure Date</th>
								<th>Departure Time</th>
								<th>Arrival Time</th>
								<th>Class</th>
								<th>Cost</th>
								<th>View/Book</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="flightList" value="${sessionScope.flightList}" />
							<c:forEach items="${flightList}" var="flightList" varStatus="loop">
								<tr>
									<td><c:out value="${flightList.flight}" /></td>
									<td><c:out value="${flightList.departuteDate}" /></td>
									<td><c:forTokens items="${flightList.departureTime}" delims=":" var="departureTime">
									<c:out value="${departureTime}" /></c:forTokens></td>
									<td><c:forTokens items="${flightList.arrivalTime}" delims=":" var="arrivalTime">
									<c:out value="${arrivalTime}" /></c:forTokens></td>
									
									<td><c:out value="${flightList.classType}" />
									<td>350$</td>	
						            <td>
						            <form name="View/Book" action="${completeURL}"
											method="post">
										<input id="book" type="submit" name="View/Book"
												value="View/Book" /> 
										<input type="hidden" name="flight_id"
												value="<c:out value="${flightList.flight}" />" /> 
										<input
										type="hidden" name="flight_class"
										value="<c:out value="${flightList.classType}" />" />
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
</body>
</html>
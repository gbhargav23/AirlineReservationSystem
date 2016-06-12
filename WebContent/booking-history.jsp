<%@page import="java.util.ArrayList"%>
<%@page import="BookAirlines.Booking"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking History</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional: Include the jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Optional: Incorporate the Bootstrap JavaScript plugins -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>
<body>
	
		<c:if test="${pageContext.session.id==null}">
			<c:redirect url="Login.jsp" />
		</c:if>
		<c:if test="${pageContext.session.id!=null}">
			<c:set var="username" value="${sessionScope.username}" />
		</c:if>

	
	<%@ include file="/WEB-INF/header.jsp"%>
	<div class="container-fluid">
		<h2 class="sub-header">Booking List</h2>
		<div class="table-responsive">
			<form name="View/Book" action="ViewBook_servlet" method="post">
				<table class="table table-striped" border="1">
					<thead>
						<tr>
							<th>Booking ID</th>
							<th>Flight ID</th>
							<th>Number of Seats</th>
							<th>Cost</th>

						</tr>
					</thead>

					<tbody>
						<c:set var="booking_list" value="${sessionScope.booking_list}" />
						<c:forEach items="${booking_list}" var="bookList" varStatus="loop">

							<tr>
								<td><c:out value="${bookList.booking_id}" />
								<td><c:out value="${bookList.flight_id}" /></td>
								<td><c:out value="${bookList.number_of_seats}" /></td>
								<td><c:out value="${bookList.total_cost}" /></td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<br />
		<div class="row" style="text-align: center;">
			<div class="col-md-4 "
				style="display: inline-block; float: none;
	/* reset the text-align */ text-align: left;
	/* inline-block space fix */ margin-right: -90px;">
				<a href="FlightSearch.jsp"><button type="button"
						class="btn btn-lg btn-primary">Home</button></a>
			</div>
		</div>
</body>
</html>
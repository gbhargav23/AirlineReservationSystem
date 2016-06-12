<script>
$(document).ready(function(){
      $('.dropdown').hover(
              function() {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
              }, 
              function() {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut();
              }
            );
});
</script>

<nav role="navigation" class="navbar navbar-default navbar-inverse navbar-fixed-top">
	<div class="container">
        <div class="navbar-header">
				<a class="navbar-brand" href="FlightSearch.jsp">BOOK AIRLINES</a>
		</div>
        <!-- Collection of nav links, forms, and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">Welcome ${sessionScope.username} of Organization:${sessionScope.org.orgname }<b class="caret"></b></a>
                    <ul role="menu" class="dropdown-menu">
                        <li><a href="Registration.jsp">Register</a></li>
                        <li><a href="ShoppingCart.jsp">Shopping Cart</a></li>
                        <li><a href="BookingHistoryServlet">Booking History</a></li>
                        <li><a href="FlightSearch.jsp">Flight Search</a></li>
                        <li class="divider"></li>
                        <li><a href="Logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
     </div>
</nav>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!--- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
 
</head>
<body>
<input type="text" id="tickets" name="numberOfTickets" oninput="checkAvailability()"> 
<p> </p>
<script type="text/javascript">

	  
	    $.get("ViewBook_servlet?numberOfTickets=5"+"&flight_id=8847"+"&flight_class=Business",function(data,status){
	      alert("Data: " + data + "\nStatus: " + status);
	      
	      var ticketsAvailable = parseInt(data);
	      console.log(ticketsAvailable);
	      var ticketsAvailableList = new Array();
	     
	      for (i=0;i<ticketsAvailable;i++){
	    	  ticketsAvailableList[i] = i+1;
	      }
	      
	      $("#tickets").autocomplete({
	 	      source: ticketsAvailableList
	 	    });
	     
	    });
	  
	
	/*function checkAvailability(){
		var numberOfTickets = $("#tickets").val();
		console.log(numberOfTickets);
		
		var xmlhttp;
		
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
			  var numberofTicketsAvailable = xmlhttp.responseText;
			  console.log(numberofTicketsAvailable);
			  
		    //document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
		    //write the jqrey fuction for theno.of tickets available.
		    }
		  else{
			  console.log("some error with ajax and server response");
		  }
		  }
		xmlhttp.open("GET","ViewBook_servlet?numberOfTickets="+numberOfTickets+"&flight_id=8847"+"&flight_class=Business",true);
		xmlhttp.send();
		} */
	
	
	$("p").html("hello");
</script>
<!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


<!-- Optional: Incorporate the Bootstrap JavaScript plugins -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
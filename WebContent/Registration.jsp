<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Bootstrap core CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="Custom/myStyleSheet.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>Registration Page</title>
</head>
<body>


<div class="container">

<div class="registration-background">
		<div class="login">

      <form class="form-signin" role="form" action="Registration" method="post">
        <h2 class="form-signin-heading">Please Register</h2>
        <input type="text" class="form-control" name="username" placeholder="Username" required autofocus>
        <input type="password" class="form-control" name="pass1" id="pass1" placeholder="Password" required>
        <input type="password" class="form-control" placeholder=" Confirm Password" name="pass2" id="pass2" onkeyup="checkPass(); return false;" required>
        <input type="text" class="form-control" name="orgName" placeholder="Organization Name"autofocus>
        <input type="text" class="form-control" name="orgAddr" placeholder="Organization Address" autofocus>
        <span id="confirmMessage" class="confirmMessage"></span>
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
      </form>
</div>
</div>
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./js/ie10-viewport-bug-workaround.js"></script>
    <script>
    function checkPass()
    {
        //Store the password field objects into variables ...
        var pass1 = document.getElementById('pass1');
        var pass2 = document.getElementById('pass2');
        //Store the Confimation Message Object ...
        var message = document.getElementById('confirmMessage');
        //Set the colors we will be using ...
        var goodColor = "#66cc66";
        var badColor = "#ff6666";
        //Compare the values in the password field 
        //and the confirmation field
        if(pass1.value == pass2.value){
            //The passwords match. 
            //Set the color to the good color and inform
            //the user that they have entered the correct password 
            pass2.style.backgroundColor = goodColor;
            message.style.color = goodColor;
            message.innerHTML = "Passwords Match!"
        }else{
            //The passwords do not match.
            //Set the color to the bad color and
            //notify the user.
            pass2.style.backgroundColor = badColor;
            message.style.color = badColor;
            message.innerHTML = "Passwords Do Not Match!"
        }
    }  
    
    </script>
</body>
</html>
<?php include 'connection.php'; ?>



<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title></title>
<link rel="stylesheet" href="Content/style1.css" type="text/css" />
</head>  
<body>  
<div id="main">
<?php
if(!empty($_POST['username']) && !empty($_POST['password']))
{
	$username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    
	 $checkusername = mysql_query("SELECT * FROM users WHERE Username ='$username'");
     
     if(mysql_num_rows($checkusername) == 1)
     {
     	echo "<h1>Error</h1>";
        echo "<p>Sorry, that username is taken. Please go back and try again.</p>";
     }
     else
     {
      
     	$registerquery = mysql_query("INSERT INTO users (Username, Password, EmailAddress) VALUES('$username', '$password', '$email') ");
        if($registerquery)
        {
        	//echo "<h1>Success</h1>";
        	//echo "<p>Your account was successfully created. Please <a href=\"test.php\">click here to login</a>.</p>";
            header( 'Location: index.php' ); 
        }
        else
        {
     		echo "<h1>Error</h1>";
        	echo "<p>Sorry, your registration failed. Please go back and try again.</p>";    
        }    	
     }
}
else
{
	?>
    
   <h1>Register</h1>
    
   <p>Please enter your details below to register.</p>
    
	<form method="post" action="register.php" name="registerform" id="registerform">
	<fieldset>
		<label for="username">Username:</label><input type="text" name="username" id="username" REQUIRED title="please fill the username"/><br />
		<label for="password">Password:</label><input type="password" name="password" id="password" REQUIRED title="please fill the password" /><br />
        <label for="email">Email Address:</label><input type="email" name="email" id="email" REQUIRED title="please fill email"/><br />
		<input id="login" type="submit" name="register"  value="Register" />
	</fieldset>
	</form>
    
   <?php
}
?>
</div>
</body>
</html>
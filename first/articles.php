<?php

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="Content/style1.css" type="text/css" />

        <style>
    .Panel
            {
                margin-top: 100px;
                margin-left: 200px;
            }
            
         #story
            {
               width: 300px;
               height: 200px; 
            }
            
    </style>


        <meta charset="utf-8" />
        <title></title>
    </head>
    <body>

        <div class="Panel">
         <form method="post" action="makeart.php" name="loginform" id="loginform"> <!--onsubmit="return check()"-->
	
		<label for="username">Images Url:</label><input type="text" name="url" id="username" REQUIRED title="please fill the username"/><br />
		<label for="password">Heading:</label><input type="text" name="heading" id="password" REQUIRED title="please fill the password"/><br />
		<label for="password">Story:</label><textarea  name="story" id="story" REQUIRED title="please fill the password" ></textarea><br />
        <label for="password">Footer:</label><input type="text" name="footer" id="footer" REQUIRED title="please fill the password"/><br />
        <input type="submit" name="login" id="login" value="Make Article" />
	
	</form>

            </div>
        
    </body>
</html>

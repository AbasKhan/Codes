
    <?php

$con = mysql_connect("localhost:3306","root","abbas");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }
  
mysql_select_db("abbas", $con);
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title></title>
    </head>
    <body>
        
    </body>
</html>

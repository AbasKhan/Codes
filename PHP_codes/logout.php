<?php 

session_start(); 
$con = mysql_connect("localhost:3306","root","abbas");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("abbas", $con);

 
 
 
  $_SESSION = array(); session_destroy(); ?>
<meta http-equiv="refresh" content="0;index.php">
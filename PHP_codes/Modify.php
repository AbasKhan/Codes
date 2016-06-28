<?php include 'connection.php'; ?>








 <?php
            $d=$_POST["id"];
            $dsp=$_POST["username"];
           $dsp1=$_POST["password"];
           $dsp2=$_POST["email"];
           
          echo $dsp1;
           

$sql=("UPDATE users Set Password ='$dsp1', Username='$dsp' ,EmailAddress='$dsp2' Where UserId='$d' ");                
$result = mysql_query($sql);

header( 'Location: find.php' ); 

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

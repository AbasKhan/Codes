
<?php include 'connection.php'; ?>



       
 <?php
            $d=$_POST["id"];
            echo $d;

           $sql=("DELETE FROM users where UserId=$d ");                
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

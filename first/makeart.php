<?php include 'connection.php'; ?>



<?php
          
            $url=$_POST["url"];
            
            $header=$_POST["heading"];

            $story=$_POST["story"];

            $footer=$_POST["footer"];

           echo $url ;
           echo "<br>".$header;
           echo "<br>".$story;
           echo "<br>".$footer;

            $sql="insert into article (heading,story,footer,url) values('$header','$story','$footer','$url') ";   

            $result=mysql_query($sql);
            
             
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

<?php include 'connection.php'; ?>




<!DOCTYPE html>
<html lang="en">
    <head>
        <style>

            #holder
            {
                display: inline-block;
                border: 1px solid ;
                width: 150px;
                height: 150px;
               margin-left: 75%;
            }
            #news
            {
                display: inline-block;
                height: 140px;
            }
</style>
        <meta charset="utf-8" />
        <title></title>
    </head>
    <body>
 
           <?php
                
$result = mysql_query("SELECT * FROM article  ");

while($row = mysql_fetch_array($result))
  {
   
   $url=$row['url'];
  
   ?>
        <div id="holder">
            
            <img alt="ss"class='fix' <?php echo " src='$url' "?> width='150' height='150' />
     <?php    }   ?> 
   </div>

        
           <textarea id="news" > this is a story</textarea>
            

         </body>
</html>

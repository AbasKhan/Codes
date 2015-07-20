<?php include 'connection.php'; ?>




 <?php
          
            $url=$_POST["url"];

            $heading=$_POST["heading"];

            $story=$_POST["story"];

            $footer=$_POST["footer"];
           

          
           ?> 







<!DOCTYPE html>
<html lang="en">
    <head>

        <style>
            
            #picholder
            {
                width: 800px;
                height: 300px;
               margin-left: 18%;
               margin-top: 2cm;
                border:2px solid #a1a1a1;
padding:10px 40px; 
border-radius:25px;
-moz-border-radius:25px;
                
            }
            
            
            #header
            {
             
                width: 800px;
                height: 30px;
                border:2px solid #a1a1a1;
            
                margin-left: 18%;
                margin-top: 1cm;
               padding:10px 40px; 
border-radius:25px;
-moz-border-radius:25px;
            }
            
            
            
             #story
            {
             
                width: 800px;
                height: 500px;
                border:2px solid #a1a1a1;
            
                margin-left: 18%;
                margin-top: 1cm;
               padding:10px 40px; 
border-radius:25px;
-moz-border-radius:25px;
            }
            
            
           
             #footer
            {
             
                width: 800px;
                height: 30px;
                border:2px solid #a1a1a1;
            
                margin-left: 18%;
                margin-top: 1cm;
               padding:10px 40px; 
border-radius:25px;
-moz-border-radius:25px;
            }
            
            
          
            
            
            
               
    </style>

        <meta charset="utf-8" />
        <title></title>
    </head>
    <body>
        










        <div id="picholder" style="background-image: url('<?php echo $url ;?> '); background-repeat:no-repeat;
             background-color:grey; ">
          
            </div>


        <div id="header">
          <?php    echo $heading ;  ?>
              </div>


        <div id="story">
        
            <?php    echo $story ;  ?>
                </div>


        <div id="footer">
        <?php    echo $footer ;  ?>
                </div>


    </body>
</html>


<!-- this code i wrote to test admin editing user data -->


<?php include 'connection.php'; ?>


<!-- dont name any class submit1 its already styled in edit.css -->

<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
         
            
        </style>
          <link href="Content/edit.css" rel="stylesheet" type="text/css">
        <meta charset="utf-8" />
        <title></title>

      
    </head>
    <body>
        
    </body>
</html>




    <?php
                
$result = mysql_query("SELECT * FROM users where ban=0");
while($row = mysql_fetch_array($result))
  {
      $id=$row['UserId'];

    ?> 


<form class="frm" action="edit.php" method="post">
    
<input type="text"  value=<?php echo $row['Username']  ?> disabled />




<?php echo "<input type='hidden' name='fname'  value='$id' />" ;?>
<input class="submit" type="submit" value="Edit"/>
  
    </form> 

<?php
      

  }
 
?>



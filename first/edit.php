<?php include 'connection.php'; ?>


<!DOCTYPE html>
<html lang="en">
    <head>
        
         <link href="Content/edit.css" rel="stylesheet" type="text/css">
        
        
        <meta charset="utf-8" />
      
          <title></title>

        <style>
           
          
            
            
            </style>
    </head>
    <body>
        
    </body>
</html>











 <?php
          
            $dsp=$_POST["fname"];
           
           ?> 



            <?php
                
$result = mysql_query("SELECT * FROM users WHERE UserId='$dsp' ");
echo "<table>";
while($row = mysql_fetch_array($result))
  {
     ?>

    <tr>
        <td>
 <form class="frm" action="Modify.php" method="post">
  <input type="hidden" name="id" value=<?php echo $row['UserId'] ?> >

  <input type="text" name="username" value=<?php echo $row['Username'] ?> >
  <input type="text" name="password" value=<?php echo $row['Password'] ?> >
  <input type="text" name="email" value=<?php echo $row['EmailAddress'] ?> >
 <input type="text" name="status" value=<?php echo $row['ban'] ?> >
     <input class="submit" type="submit" value="Modify"/> 

     </form>
            </td>
        <td>
 <form class="frm" action="delete.php" method="post">
     <input type="hidden" name="id" value=<?php echo $row['UserId'] ?> >
    <input class="submit" type="submit" value="delete"/> 
    </form>
            </td>

<?php
  }
 ?>
        </table>


<?php include 'connection.php'; ?>



<!DOCTYPE html>
<html>
    <head>


   
        <link href="Content/store2.css" rel="stylesheet" type="text/css">
         <link href="Content/index.css" rel="stylesheet" type="text/css">
         

        <link rel="stylesheet" type="text/css" media="screen" href="Content/style.css"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400italic,400,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>





        </head>








    <body style="background: url('Images/wallpaper.jpg') no-repeat fixed center top">

       





                <div id='cssmenu'>
<ul>
   <li><a href='show-articles.php'><span>Home</span></a></li>
   <li class='has-sub '><a href='#'><span>Products</span></a>
      <ul>
         <li class='has-sub '><a href='#'><span>For Him</span></a>
            <ul>
               <li><a href='#'><span>Apparel</span></a></li>
               <li><a href='check.html'><span>Foot wear</span></a></li>
            </ul>
         </li>
         <li class='has-sub '><a href='#'><span>For Her</span></a>
            <ul>
               <li><a href='#'><span>Apparel</span></a></li>
               <li><a href='#'><span>Foot wear</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
   <li><a href='#'><span>About</span></a></li>
   <li><a href='test.php'><span>Login</span></a></li>
   <li><a href='ad.php'><span>Admin</span></a></li>
      <li ><pre></pre> <form id="searchbox" action="search.php" method="post" class="find">



                <input type="text" name="nm" placeholder="search our website"><input class="submit" type="submit" value="Go" />
             
  
            
               </form>
</li>
</ul>
                    </div>
        


        <div id="heading"></div>


        <div id="layr">



            <?php
                
$result = mysql_query("SELECT * FROM one  ");

echo "<table>";

$i=0;
$con=0;
while($row = mysql_fetch_array($result))
  {
     
    
      if($i==4)
      {
          $i=0;
          echo "<tr>";

      }
  $url=$row['Image'];
  
 $p=$row['Price'];
  echo" <td>";
 ?>
  

            <form action="welcome.php" method="post">
      <figure> 

  <img alt="ss"class='fix' <?php echo " src='$url' "?> width='150' height='150' />
       

             <figcaption><?php echo $row['Description'] ?><br/>

  <?php echo  "Price : $".$p." <br/>"?> 
     
          <?php echo "<input type='hidden' name='fname'  value='$url' />" ;?>

<input class="submit" type="submit" value="Buy"/>     
             
             </figcaption> 

      
      </figure>
                
                </td>
</form>  
<?php
  $i++;
  
  }
  echo "</table>";
?>
 


            </div>
        <!--<div class="sidepic"></div>-->    
</body>
</html>
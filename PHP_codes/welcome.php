


<html>
    <head>
        <style>
          
</style>
        
        <link href="Content/welcome.css" rel="stylesheet" type="text/css">
        <link href="Content/store2.css" rel="stylesheet" type="text/css">


        </head>
<body style="background: url('Images/std1.jpg') no-repeat fixed center top">





    <div id='cssmenu'>
<ul>
   <li><a href='find.php'><span>Home</span></a></li>
   <li class='has-sub '><a href='lab.php'><span>Products</span></a>
      <ul>
         <li class='has-sub '><a href='#'><span>For Him</span></a>
            <ul>
               <li><a href='#'><span>Apparel</span></a></li>
               <li><a href='shoes.php'><span>Foot wear</span></a></li>
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
  
      <li ><pre></pre> <form id="searchbox" action="search.php" method="post" class="find">



                <input type="text" name="nm" placeholder="search our website"><input class="submit" type="submit" value="Go" />
             
  
            
               </form>
</li>
</ul>
                    </div>
        

<?php include 'connection.php'; ?>

 <?php
          
            $dsp=$_POST["fname"];
           
           ?> 


    <div id="layr">
  


     <div id="img">     <img alt="ss"  <?php  echo " src='$dsp' " ?> height="200" width="200" /> </div>


    
            <?php
                
$result = mysql_query("SELECT * FROM one WHERE Image='$dsp' ");

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

 //echo "<h1>".$p."</h1>";
  echo" <td>";
  }
 ?>
    <div id="cart">
    <form oninput="total.value = (nights.valueAsNumber *   <?php echo $p?> )">


  <pre>
</pre>
  <label>How many would you like to buy:</label><br>
  <input type="number" id="nights" name="nights" value="1" min="1" max="30" required>
        <pre>
</pre>

  <label>Estimated total:</label>
  $<output id="total" name="total"><?php echo $p ?></output>.00
  <br><br>
        <input class="submit" type="submit" value="order" />

</form>
        </div>
         
    <div id="backg"> </div>
        </div>
</body>
</html>
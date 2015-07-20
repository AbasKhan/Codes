<?php include 'connection.php'; ?>

<html>
    <head>
         <link href="Content/store2.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" media="screen" href="Content/style.css"/>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400italic,400,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
     <style>
                  #searchbox {
            float: right;
            }
            #layr {
              
             margin-left: 200px;
             margin-top: 100px;
            
             //border: 1px solid grey;
             border-top: 15px solid grey;
             border-bottom: 1px solid grey;
             border-left: 1px solid grey;
             border-right: 1px solid grey;
             width: 960px;
             
            
            }

            .sidepic {
            width: 170px;
            height: 1100px;
            margin-left: 0px;
           background-color: #808080;
           background-image: url('Images/sidepic.jpg');
           background-position: right top;
           background-repeat: no-repeat;
            
            margin-top: 0px;
          
            }

            .submit {
            width: auto;  
    padding: 9px 15px;  
    background: #617798;  
    border: 0;  
    font-size: 14px;  
    color: #FFFFFF;  
     -webkit-border-radius: 5px;  
    -moz-border-radius: 5px;  
    cursor:pointer
            }
            .noeffect {
            display: inline;}

         figcaption {
         font-size: 12px;}
         
         .find {
            
            padding-left: 18cm;
            }
         
</style>
            </head>


 <body style="background: url('Images/P.jpg') no-repeat fixed center top">

       
                    


          
             
  
            
               



        <div id='cssmenu'>
<ul>
   <li><a href='#'><span>Home</span></a></li>
   <li class='has-sub '><a href='#'><span>Products</span></a>
      <ul>
         <li class='has-sub '><a href='#'><span>For Him</span></a>
            <ul>
               <li><a href='#'><span>Apparel</span></a></li>
               <li><a href='#'><span>Foot wear</span></a></li>
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
</ul>
</div>
            <?php
   session_start(); 
if(!empty($_SESSION['LoggedIn']) && !empty($_SESSION['Username']))
{
	 ?>
    

  	 <span class="noeffect"style="color: rgb(160,160,160)">Hello <b><?=$_SESSION['Username']?></b></span>
    
    
       <a href="logout.php"> <input class="submit" type="submit" value="logout"/></a>
    

   <?php 
}
   ?> 
    
        


        <div id="heading"></div>
        <div id="layr">       

                   




         <?php
            $q=$_POST["nm"];
           
           ?> 
         



     
          <?php
                
$result = mysql_query("SELECT * FROM one WHERE Description LIKE '%$q%' ");

echo "<table>";

$i=0;
$con=0;

if(mysql_num_rows($result)==0)
{
    echo"your query returned no results";
}
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
  <img alt="ss"class='fix' <?php echo " src='$url' "?> width='150' height='150'/><figcaption><?php echo $row['Description'] ?><br/>
  <?php echo  "Price : $".$p." <br/>"?> 
     
          
<?php echo "<input type='hidden' name='fname'  value='$url' />" ;?>
<input type="submit" value="Buy" class="submit"/>     </figcaption> </figure></td>
</form>  
<?php
  $i++;
  
  }
  echo "</table>";
?>
 
         </div>
</body>
</html>



<?php
session_start();

if(empty($_SESSION['LoggedIn']) && empty($_SESSION['Username']))
{

    echo "hello";

	 }
     else
     {

	 ?>



<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="Content/store2.css" rel="stylesheet" type="text/css">
        
        <meta charset="utf-8" />
        <title></title>
    </head>
    <body>
        
                      <div id='cssmenu'>
<ul>
   <li><a href='index.php'><span>Home</span></a></li>
   <li class='has-sub '><a href='articles.php'><span>Articles</span></a>
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
   <li><a href='find.php'><span>Users</span></a></li>
   <li><a href='test.php'><span>Reports</span></a></li>

</ul>
                    </div>
          
    </body>
</html>

<?php     } ?>
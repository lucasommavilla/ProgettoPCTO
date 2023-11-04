<?php
session_start();

checkUserSession();


//----------Funzioni

function checkUserSession(){
    if(!isset($_SESSION["username"]))  
   {  
        header("location:login.php?action=login");  
        die();
   }  
}

?>
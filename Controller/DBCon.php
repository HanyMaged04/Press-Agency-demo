<?php 
    $hostName = "localhost";
    $username = "root";
    $password = "";
    $DB_Name = "testprojectphp";
    try{
        $conn = mysqli_connect($hostName,
        $username,
        $password,
        $DB_Name);
    }catch(Exception $e){
        echo"Where is the dataBase bro :( <br>";
    }
?>
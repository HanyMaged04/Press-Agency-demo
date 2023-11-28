<?php
    include("DBCon.php");
    $type = 'Admin';
    $fname = 'hany';
    $lname = 'maged';
    $phoneNum = '01553117738';
    $email = 'hany.maged@gmail.com';
    $userType = 1;
    $password = '3';
    $q = "INSERT INTO users (type, fname, lname, phoneNum, email, userType, password)
    VALUES ('$type', '$fname', '$lname', '$phoneNum', '$email', $userType, '$password')";    
    mysqli_query($conn, $q);
    mysqli_close($conn);
?>
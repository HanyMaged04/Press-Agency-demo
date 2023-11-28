<?php
    include("DBCon.php");
    $title = 'Your Title';
    $body = 'Your post content';
    $postType = 0;
    $ownerId = 1;
    $q = "INSERT INTO post (title, body, postType, ownerId)
        VALUES (?, ?, ?, ?)";

    $stmt = mysqli_prepare($conn, $q);

    mysqli_stmt_bind_param($stmt, "ssii", $title, $body, $postType, $ownerId);
    mysqli_stmt_execute($stmt);

    mysqli_stmt_close($stmt);
    mysqli_close($conn);
?>

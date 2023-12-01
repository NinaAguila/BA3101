<?php require "../connections/connection.php"; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
   
    <div class="sidebar">
        <img src="../images/logo.png" alt="Sidebar Icon">
        <?php // Check if the admin is logged in and display the username
        if (isset($_SESSION["admin_name"])) {
            echo '<p style="text-align: center; color: white;">Admin: ' .
                $_SESSION["admin_name"] .
                "</p>";
        } ?>
        <a href="../admin/admin-dashboard.php"><i class="fa-solid fa-dashboard"></i> DASHBOARD/OVERVIEW</a>
        <a href="../admin/admin-staff.php"><i class="fa-solid fa-user"></i>&nbsp;ADMIN/STAFF</a>
        <a href="../admin/admin-adddelete-equipment.php"><i class="fa-solid fa-plus"></i>ADD/DELETE ITEM</a>
        <a href="../admin/admin-adddelete-staff.php"><i class="fa-solid fa-plus"></i>ADD ADMIN/STAFF</a>
        <br>
        <br>
        <a href="../logout/logout-admin.php"><i class="fa-solid fa-arrow-right-from-bracket"></i>LOG OUT</a>
    </div>
</body>
</html>
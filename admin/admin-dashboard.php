<?php
session_start();
require "../connections/connection.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Overview</title>
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <link rel="stylesheet" href="../css/display-borrowers.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <?php include "../admin/sidebar.php"; ?>

    <div class="form-container">
        <div class="labeled-rectangle">
            <h2>Dashboard</h2>
        </div>
        <h2>Hello Admin!!</h2>
        <h4>Welcome Back to Dashboard</h4>

    <?php
    // Query to count the number of staff
    $staffQuery = "SELECT COUNT(*) AS staff_count FROM tbstaff";
    $staffResult = mysqli_query($connection, $staffQuery);

    if (!$staffResult) {
        die("Error: " . mysqli_error($connection));
    }

    // Query to count the number of admins
    $adminQuery = "SELECT COUNT(*) AS admin_count FROM tbadmin";
    $adminResult = mysqli_query($connection, $adminQuery);

    if (!$adminResult) {
        die("Error: " . mysqli_error($connection));
    }

    // Query to count the number of equipment
    $equipmentQuery = "SELECT COUNT(*) AS equipment_count FROM tbequipment";
    $equipmentResult = mysqli_query($connection, $equipmentQuery);

    if (!$equipmentResult) {
        die("Error: " . mysqli_error($connection));
    }

    $stockQuery =
        "SELECT SUM(equipment_quantity) AS equipment_qty_count FROM tbequipment";
    $stockResult = mysqli_query($connection, $stockQuery);

    if (!$stockResult) {
        die("Error: " . mysqli_error($connection));
    }

    $staffCount = 0;
    $equipmentCount = 0;
    $stockCount = 0;
    $adminCount = 0;

    if ($staffResult && $adminResult && $equipmentResult && $stockResult) {
        $staffRow = mysqli_fetch_assoc($staffResult);
        $adminRow = mysqli_fetch_assoc($adminResult);
        $equipmentRow = mysqli_fetch_assoc($equipmentResult);
        $stockRow = mysqli_fetch_assoc($stockResult);

        $staffCount = $staffRow["staff_count"];
        $adminCount = $adminRow["admin_count"];
        $equipmentCount = $equipmentRow["equipment_count"];
        $stockCount = $stockRow["equipment_qty_count"];

        // Add the count of admins to the count of staff
        $staffCount += $adminCount;
    }
    ?>
    
    <!-- Display the count of staff, admins, equipment, and stocks below the table -->
    <div class="count-boxes">
        <div class="count-box">
            <p><?php echo $equipmentCount; ?></p>
            <h5>No. of Equipments</h5>
        </div>
        <div class="count-box">
            <p><?php echo $staffCount; ?></p>
            <h5>No. of Staff and Admin</h5>
        </div>
        <div class="count-box">
            <p><?php echo $stockCount; ?></p>
            <h5>No. of Stocks</h5>
        </div>
    </div>


    <?php include "../action/display-equip.php"; ?>
    
</body>
</html>
<?php
session_start();
require('../connections/connection.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard/Overview</title>
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <link rel="stylesheet" href="../css/staffin-dashboard.css">
</head>
<body>
    <?php include('../staff-in/sidebar-staffin.php'); ?>
    
    <div class="form-container">
        <div class="labeled-rectangle">
            <h2>Dashboard</h2>
        </div>
        <h2>Hello Staff!!</h2>
        <h4>Welcome Back to Dashboard</h4>

    <div class="table-container">
        <table class="display-data">
            <thead>
                <tr>
                    <th>Equipment</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $query = 'SELECT tbequipment.equipment_name, tbequipment.equipment_quantity
                          FROM tbequipment';
                $result = mysqli_query($connection, $query);//

                if (!$result) {
                    die('Query failed: ' . mysqli_error($connection));
                }

                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<tr>';
                    echo '<td>' . $row['equipment_name'] . '</td>';
                    echo '<td>' . $row['equipment_quantity'] . '</td>';
                    
                    echo '</tr>';
                }

                mysqli_close($connection);
                ?>
            </tbody>
        </table>
    </div>
    </div>
</body>
</html>
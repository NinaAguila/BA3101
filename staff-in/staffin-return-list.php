<?php
session_start();
require "../connections/connection.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff In Return List</title>
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <link rel="stylesheet" href="../css/staffin-return-list.css">
</head>
<body>
    <?php include "../staff-in/sidebar-staffin.php"; ?>
    <div class="form-container">
        <div class="labeled-rectangle">
            <h2>Return List</h2>
        </div>
        <h2>Hello Staff!!</h2>
        <h4>Welcome Back to Return List</h4>

    <div class="table-container">
        <table class="display-data">
            <thead>
                <tr>
                    <th>Date Borrowed</th>
                    <th>SR Code</th>
                    <th>Name</th>
                    <th>Equipment Borrowed</th>
                    <th>Borrowed Quantity</th>
                    <th>Return Quantity</th>
                    <th>Equipment Damage</th>
                    <th>Equipment Missing</th>
                    <th>Date Returned</th>
                </tr>
            </thead>
            <tbody>

            <?php
            $query = "SELECT 
                tbstudent.sr_code,
                CONCAT(tbstudinfo.lastname, ' ', tbstudinfo.firstname) AS name, 
                tbequipment.equipment_name, 
                tbequipment.is_active, 
                tbborrow.equipment_quantity, 
                tbborrow.date_borrowed, 
                tbreturned.returned_date,
                tbreturned.returned_quantity,
                tbreturned.equipment_damaged,
                tbreturned.equipment_missing
            FROM tbstudent
            join tbstudinfo on tbstudent.studid = tbstudinfo.studid
            JOIN tbborrow ON tbstudent.studid = tbborrow.studid
            JOIN tbequipment ON tbborrow.equipment_ID = tbequipment.equipment_ID
            JOIN tbreturned ON tbborrow.borrow_ID = tbreturned.borrow_ID
            WHERE tbreturned.returned_date IS NOT NULL ORDER BY tbreturned.returned_date DESC";

            $result = mysqli_query($connection, $query);

            if (!$result) {
                die("Query failed: " . mysqli_error($connection));
            }

            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . date("F d, Y", strtotime($row["date_borrowed"])) . "</td>";
                echo "<td>" . $row["sr_code"] . "</td>";
                echo "<td>" . $row["name"] . "</td>";
                echo "<td>" . $row["equipment_name"] . "</td>";
                echo "<td>" . $row["equipment_quantity"] . "</td>";
                echo "<td>" . $row["returned_quantity"] . "</td>";
                echo "<td>" . $row["equipment_damaged"] . "</td>";
                echo "<td>" . $row["equipment_missing"] . "</td>";
                echo "<td>" . date("F d, Y", strtotime($row["returned_date"])) . "</td>";
                echo "</tr>";
            }

            mysqli_close($connection);
            ?>
            </tbody>
        </table>
    </div>
    </div>
</body>
</html>

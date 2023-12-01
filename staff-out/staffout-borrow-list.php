<?php require "../connections/connection.php"; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow List</title>
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <link rel="stylesheet" href="../css/borrow-list.css">
</head>
<body>
<div class="form-container">
    <div class="labeled-rectangle">
        <h2>Borrow List</h2>
    </div>
    <h2>Hello Staff!!</h2>
    <h4>Welcome back to Borrow List</h4>
    <br>
    <?php include "../staff-out/sidebar-staffout.php"; ?>
    <div class="table-container">
        <table class="display-data">
            <thead>
                <tr>
                    <th>Sr-Code</th>
                    <th>Student Name</th>
                    <th>Equipment</th>
                    <th>Quantity</th>
                    <th>Date Borrowed</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $query = 'SELECT tbstudent.sr_code, CONCAT(tbstudinfo.firstname, " ", tbstudinfo.lastname) AS student_name,
                          tbborrow.equipment_quantity, tbborrow.date_borrowed, tbequipment.equipment_name
                          FROM tbborrow
                          JOIN tbstudinfo ON tbborrow.studid = tbstudinfo.studid
                          JOIN tbstudent ON tbstudinfo.studid = tbstudent.studid
                          JOIN tbequipment ON tbborrow.equipment_ID = tbequipment.equipment_ID
                          ORDER BY tbborrow.date_borrowed DESC;';

                $result = mysqli_query($connection, $query);

                if (!$result) {
                    die("Query failed: " . mysqli_error($connection));
                }

                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>";
                    echo "<td>" . $row["sr_code"] . "</td>";
                    echo "<td>" . $row["student_name"] . "</td>";
                    echo "<td>" . $row["equipment_name"] . "</td>";
                    echo "<td>" . $row["equipment_quantity"] . "</td>";
                    // Format the date using date() function
                    echo "<td>" . date("F d, Y", strtotime($row["date_borrowed"])) . "</td>";
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

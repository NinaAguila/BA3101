<?php
session_start();
require "../connections/connection.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin/Staff</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/admin-admin-staff.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
</head>
<body>
<div class="form-container">
<div class="labeled-rectangle">
            <h2>Admin/Staff</h2>
        </div>
        <h2>Hello Admin!!</h2>
        <h4>Welcome Back to Admin/ Staff</h4>


    <div class="table-container">
        <table class="display-data">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Position</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $query = "SELECT CONCAT(e.firstname, ' ', e.lastname) AS staff_name, s.staff_position
                          FROM tbempinfo e
                          JOIN tbstaff s ON s.empid = e.empid
                          UNION
                          SELECT CONCAT(e.firstname, ' ', e.lastname) AS staff_name, 'ADMIN' AS staff_position
                          FROM tbempinfo e
                          JOIN tbadmin a ON a.empid = e.empid";

                $result = mysqli_query($connection, $query);

                if (!$result) {
                    die("Query failed: " . mysqli_error($connection));
                }

                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>";
                    echo "<td>" . $row["staff_name"] . "</td>";
                    echo "<td>" . $row["staff_position"] . "</td>";
                    echo "</tr>";
                }

                mysqli_free_result($result);
                mysqli_close($connection);
                ?>
            </tbody>
        </table>
    </div>
</div>
<?php include "../admin/sidebar.php"; ?> 
</body>
</html>
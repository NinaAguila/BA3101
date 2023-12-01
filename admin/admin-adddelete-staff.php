<?php
session_start();
require "../connections/connection.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add/Delete Admin and Staff</title>
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <link rel="stylesheet" href="../css/add-delete-staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 <?php include "../admin/sidebar.php"; ?>

   <div class="form-container">
   <div class="labeled-rectangle">
            <h2>Add Delete Admin/Staff</h2>
        </div>
        <h2>Hello Admin!!</h2>
        <h4>Welcome Back Add Delete Admin/Staff</h4>
        
  <div class="flex"> 
  <div class="contain-form">

<form action="../form/form-staff-submit.php" method="post">
    <label for="username">Employee:</label>
    <select name="employee" required>
        <option disabled selected hidden>Choose Employee</option>
        <?php
            $resultStaff = $connection->query("SELECT empid, CONCAT(firstname, ' ', lastname) AS staff_name 
                                   FROM tbempinfo");

            while ($rowStaff = $resultStaff->fetch_assoc()) {
                echo "<option value=\"{$rowStaff["empid"]}\">{$rowStaff["staff_name"]}</option>";
            }
            ?>
    </select>

    <label for="username">Username:</label>
    <input type="text" name="username" required>

    <label for="password">Password:</label>
    <input type="password" name="password" required>

    <label for="position">Position:</label>
    <select name="position" required>
        <option disabled selected hidden>Choose Position</option>
        <option value="IN">IN</option>
        <option value="OUT">OUT</option>
        <option value="Admin">ADMIN</option>
    </select>

    <input type="submit" value="Submit">
</form>

</div>

<div class="delete-form">
    <!-- Delete Staff Form -->
   
    <form action="../action/delete-staff.php" method="post">
        <label for="deleteStaffId">Select Staff to Delete:</label>
        <select name="deleteStaffId" id="deleteStaffId" required>
            <option disabled selected hidden>Choose Staff</option>
            <?php
            $resultStaff = $connection->query("SELECT staff_ID, CONCAT(firstname, ' ', lastname) AS staff_name 
                                   FROM tbstaff 
                                   JOIN tbempinfo ON tbstaff.empid = tbempinfo.empid");

            while ($rowStaff = $resultStaff->fetch_assoc()) {
                echo "<option value=\"{$rowStaff["staff_ID"]}\">{$rowStaff["staff_name"]}</option>";
            }
            ?>
        </select>
        <input type="submit" value="Delete Staff">
    </form>

    <!-- Delete Admin Form -->
    
    <form action="../action/delete-admin.php" method="post">
        <label for="deleteAdminId">Select Admin to Delete:</label>
        <select name="deleteAdminId" id="deleteAdminId" required>
            <option disabled selected hidden>Choose Admin</option>
            <?php
            $resultAdmin = $connection->query("SELECT admin_ID, CONCAT(firstname, ' ', lastname) AS admin_name
                               FROM tbadmin  
                               JOIN tbempinfo ON tbadmin.empid = tbempinfo.empid");

            while ($rowAdmin = $resultAdmin->fetch_assoc()) {
                echo "<option value=\"{$rowAdmin["admin_ID"]}\">{$rowAdmin["admin_name"]}</option>";
            }
            ?>
        </select>
        <input type="submit" value="Delete Admin">
    </form>
</div>
        </div>
        </div> 

 
 <script src="../js/addDeleteStaffAdmin.js"></script>
</body>
</html>
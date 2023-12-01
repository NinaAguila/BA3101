<?php
session_start();
require('../connections/connection.php');

if (isset($_POST['admin_user']) && isset($_POST['admin_pass'])) {
    $admin_user = $_POST['admin_user'];
    $admin_pass = $_POST['admin_pass'];

    // Query to check admin credentials and retrieve employee information
    $query = "SELECT a.admin_user, e.firstname, e.lastname 
              FROM tbadmin a
              INNER JOIN tbempinfo e ON a.empid = e.empid
              WHERE a.admin_user = '$admin_user' AND a.admin_pass = '$admin_pass'";

    $result = $connection->query($query);

    if ($result && $result->num_rows == 1) {
        $adminData = $result->fetch_assoc();
        $admin_name = $adminData['firstname'] . ' ' . $adminData['lastname'];

        $_SESSION['admin_name'] = $admin_name;
        $_SESSION['admin_user'] = $admin_user;
        
        echo json_encode(["success" => true, "redirect" => "../admin/admin-dashboard.php"]);
        exit();
    } else {
        // Handle invalid credentials or no matching rows
        echo json_encode(["success" => false, "message" => "Incorrect Username or password"]);
        exit();
    }
    
    $connection->close();
}
?>
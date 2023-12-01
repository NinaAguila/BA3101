<?php
session_start();
require('../connections/connection.php');

if (isset($_POST['staff_user']) && isset($_POST['staff_pass'])) {
    $staff_user = $_POST['staff_user'];
    $staff_pass = $_POST['staff_pass'];

    // Query to check staff credentials and retrieve relevant information from tbstaff and tbempinfo tables
    $query = "SELECT s.staff_user, s.staff_position, e.firstname, e.lastname 
              FROM tbstaff s
              INNER JOIN tbempinfo e ON s.empid = e.empid
              WHERE s.staff_user = '$staff_user' AND s.staff_pass = '$staff_pass'";

    $result = $connection->query($query);

    if ($result && $result->num_rows == 1) {
        $staffData = $result->fetch_assoc();
        $staff_position = $staffData['staff_position'];
        $staff_name = $staffData['firstname'] . ' ' . $staffData['lastname'];

        $_SESSION['staff_user'] = $staff_user;
        $_SESSION['staff_name'] = $staff_name;

        if ($staff_position == 'IN' || $staff_position == 'OUT') {
            $_SESSION['staff_position'] = $staff_position;
            // Redirect to the respective dashboard based on position
            if ($staff_position == 'IN') {
                echo json_encode(["success" => true, "redirect" => "../staff-in/staffin-dashboard.php"]); // Change redirect URL accordingly
                exit();
            } else {
                echo json_encode(["success" => true, "redirect" => "../staff-out/staffout-dashboard.php"]); // Change redirect URL accordingly
                exit();
            }
            exit();
        } else {
            echo json_encode(["success" => false, "message" => "Invalid position. Please contact support."]);
            exit();
        }
    } else {
        // Handle invalid credentials or no matching rows
        echo json_encode(["success" => false, "message" => "Incorrect Username or password"]);
        exit();
    }
    
    $connection->close();
}
?>

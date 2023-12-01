<?php
require "dbConnection.php";

$usernameInput = $_POST['username'];
$passwordInput = $_POST['password'];
$error = "";

$sql = "SELECT ea.employeePassword, ea.employeeRole, ei.lastname, ei.firstname 
        FROM tbl_employeeaccount ea
        JOIN tbempinfo ei ON ea.employeeCount = ei.empid
        WHERE ea.employeeID='$usernameInput' OR ea.employeeEmail='$usernameInput'";
$result = $conn->query($sql);

if ($result) {
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $password = $row['employeePassword'];
        $role = $row['employeeRole'];
        $lastName = $row['lastname'];
        $firstName = $row['firstname'];

        if ($passwordInput === $password) {
            $response = $role . '|' . $lastName . '|' . $firstName;
            echo $response;
            exit();
        } else {
            $error = 'Invalid password. Please try again!';
        }
    } else {
        $error = 'User not found. Please try again!';
    }
} else {
    $error = 'Database error';
}

$conn->close();

echo $error;
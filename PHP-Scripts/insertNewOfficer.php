<?php
require "dbConnection.php";

// Get data from the POST request
$data = json_decode(file_get_contents("php://input"));

// Extract data
$employeeID = $data->employeeID;
$employeeLastName = $data->employeeLastName;
$employeeFirstName = $data->employeeFirstName;
$employeeEmail = $data->employeeEmail;
$employeePassword = $data->employeePassword;
$employeeDepartment = $data->employeeDepartment;
$employeeRole = $data->employeeRole;

// Initialize response array
$response = array();

// Insert data into tbl_employeeaccount
$sqlEmployeeAccount = "INSERT INTO tbl_employeeaccount (employeeID, employeePassword, employeeEmail, employeeRole)
VALUES ('$employeeID', '$employeePassword', '$employeeEmail', '$employeeRole')";

if ($conn->query($sqlEmployeeAccount) === TRUE) {
    $response["employeeAccount"] = "Data inserted into tbl_employeeaccount successfully";
} else {
    $response["employeeAccount"] = "Error inserting data into tbl_employeeaccount: " . $conn->error;
}

// Insert data into tbempinfo
$sqlEmpInfo = "INSERT INTO tbempinfo (lastname, firstname, department)
VALUES ('$employeeLastName', '$employeeFirstName', '$employeeDepartment')";

if ($conn->query($sqlEmpInfo) === TRUE) {
    $response["success"] = true; // Set success flag to true
} else {
    $response["success"] = false; // Set success flag to false
}

// Close the database connection
$conn->close();

// Send JSON response
echo json_encode($response);
?>

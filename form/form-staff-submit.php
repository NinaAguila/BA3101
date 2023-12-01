<?php
session_start();
require "../connections/connection.php";

$response = array('success' => false, 'message' => '');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (
        isset(
            $_POST["username"],
            $_POST["password"],
            $_POST["employee"],
            $_POST["position"]
        )
    ) {
        $username = $_POST["username"];
        $password = $_POST["password"];
        $employee = $_POST["employee"];
        $position = $_POST["position"];

        // Check if empid exists in tbadmin or tbstaff
        $checkQuery = "SELECT COUNT(*) AS count FROM tbadmin WHERE empid = '$employee' 
                       UNION ALL 
                       SELECT COUNT(*) AS count FROM tbstaff WHERE empid = '$employee'";
        $result = $connection->query($checkQuery);

        if (!$result) {
            $response['message'] = $checkQuery . "<br>" . $connection->error;
        }

        $rowCount = 0;
        while ($row = $result->fetch_assoc()) {
            $rowCount += $row['count'];
        }

        if ($rowCount > 0) {
            $response['message'] = "Employee ID already exists in tbadmin or tbstaff.";
        } else {
            // Insert into tbadmin or tbstaff based on position
            if ($position === "Admin") {
                $insertAdminQuery = "INSERT INTO tbadmin (admin_user, admin_pass, empid) VALUES ('$username', '$password', '$employee')";
                if ($connection->query($insertAdminQuery) === false) {
                    $response['message'] = "Error: " . $insertAdminQuery . "<br>" . $connection->error;
                } else {
                    $response['success'] = true;
                    $response['message'] = "Employee added successfully";
                }
            } else {
                $insertStaffQuery = "INSERT INTO tbstaff (staff_user, staff_pass, empid, staff_position) VALUES ('$username', '$password', '$employee', '$position')";
                if ($connection->query($insertStaffQuery) === false) {
                    $response['message'] = "Error: " . $insertStaffQuery . "<br>" . $connection->error;
                } else {
                    $response['success'] = true;
                    $response['message'] = "Employee added successfully";
                }
            }
        }

        // Send JSON response and exit
        header('Content-Type: application/json');
        echo json_encode($response);
        exit();
    } else {
        $response['message'] = "Required fields not set";
    }
} else {
    $response['message'] = "Form not submitted with POST data";
}

header('Content-Type: application/json');
echo json_encode($response);
$connection->close();
?>

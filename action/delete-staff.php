<?php
require "../connections/connection.php";

$response = array('success' => false, 'message' => '');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["deleteStaffId"])) {
        $deleteId = $_POST["deleteStaffId"];
        $sqlDelete = "DELETE FROM tbstaff WHERE staff_ID = $deleteId";

        if ($connection->query($sqlDelete) === true) {
            $response['success'] = true;
            $response['message'] = "Staff Deletion Complete";
        } else {
            $response['message'] = "Failed to delete staff. Please try again later";
        }
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
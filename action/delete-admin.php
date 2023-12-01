<?php
require "../connections/connection.php";

$response = array('success' => false, 'message' => '');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["deleteAdminId"])) {
        $deleteId = $_POST["deleteAdminId"];
        $sqlDelete = "DELETE FROM tbadmin WHERE admin_ID = $deleteId";

        if ($connection->query($sqlDelete) === true) {
            $response['success'] = true;
            $response['message'] = "Admin Deletion Complete";
        } else {
            $response['message'] = "Failed to delete admin. Please try again later";
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
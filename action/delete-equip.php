<?php
require "../connections/connection.php";

// Prepare a response array
$response = array('success' => false, 'message' => '');

// Check if the form is submitted for deletion
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if 'deleteId' is set in the $_POST array
    if (isset($_POST["deleteId"])) {
        $deleteId = $_POST["deleteId"];

        // Validate if the ID is a positive integer
        if (!filter_var($deleteId, FILTER_VALIDATE_INT) || $deleteId <= 0) {
            $response['message'] = "Invalid Equipment ID";
        } else {
            // Check if the equipment has been returned
            $checkReturnedQuery = "SELECT return_ID FROM tbreturned WHERE return_ID = $deleteId";
            $returnedResult = $connection->query($checkReturnedQuery);

            if ($returnedResult->num_rows > 0) {
                $response['message'] = "Equipment has been returned and cannot be deleted";
            } else {
                // Check if the equipment is borrowed but not returned yet
                $checkBorrowedQuery = "SELECT borrow_ID FROM tbborrow WHERE equipment_ID = $deleteId AND borrow_ID NOT IN (SELECT borrow_ID FROM tbreturned)";
                $borrowedResult = $connection->query($checkBorrowedQuery);

                if ($borrowedResult->num_rows > 0) {
                    $response['message'] = "Equipment is currently borrowed and not returned yet. Cannot delete.";
                } else {
                    // Set equipment quantity to zero and mark as inactive before deletion
                    $deleteEquipmentQuery = "UPDATE tbequipment SET equipment_quantity = 0, is_active = 0 WHERE equipment_ID = $deleteId";

                    if ($connection->query($deleteEquipmentQuery) === true) {
                        $response['success'] = true;
                        $response['message'] = "Equipment Deletion Successful.";
                    } else {
                        $response['message'] = "Error: " . $deleteEquipmentQuery . "<br>" . $connection->error;
                    }
                }
            }
        }
    } else {
        $response['message'] = "Equipment ID not provided";
    }
}

// Return the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
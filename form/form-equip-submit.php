<?php
require "../connections/connection.php";

// Prepare a response array
$response = array('success' => false, 'message' => '');

// Check if form is submitted with POST data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if the necessary fields are set in the $_POST array
    if (
        isset(
            $_POST["equipment_name"],
            $_POST["equipment_quantity"],
            $_POST["equipment_description"],
            $_POST["date_arrived"]
        )
    ) {
        // Assign values from $_POST to variables
        $name = ucwords($_POST["equipment_name"]); // Capitalize first letter of each word
        $quantity = $_POST["equipment_quantity"];
        $description = $_POST["equipment_description"];
        $dateArrived = $_POST["date_arrived"];

        // File upload
        $image_path = "../images/image-eqp/" . basename($_FILES["image-eqp"]["name"]);
        move_uploaded_file($_FILES["image-eqp"]["tmp_name"], $image_path);

        // Check if the equipment name already exists in the table
        $checkQuery = "SELECT * FROM tbequipment WHERE equipment_name = ?";
        $checkStatement = $connection->prepare($checkQuery);
        $checkStatement->bind_param("s", $name);
        $checkStatement->execute();
        $checkResult = $checkStatement->get_result();

        if ($checkResult->num_rows > 0) {
            // Equipment name already exists
            $response['message'] = "Equipment name '$name' already exists in the table.";
        } else {
            // Equipment name is unique, proceed with the insertion using prepared statement
            $insertQuery = "INSERT INTO tbequipment (equipment_name, equipment_quantity, equip_photos, equipment_description, date_arrived) VALUES (?, ?, ?, ?, ?)";
            $insertStatement = $connection->prepare($insertQuery);
            $insertStatement->bind_param("sisss", $name, $quantity, $image_path, $description, $dateArrived);

            if ($insertStatement->execute()) {
                $response['success'] = true;
                $response['message'] = "New Equipment has been saved!";
            } else {
                $response['message'] = "Error: " . $insertStatement->error;
            }
        }
    } else {
        $response['message'] = "Error: Required fields not set.";
    }
} else {
    $response['message'] = "Error: Form not submitted with POST data.";
}

$connection->close();

// Return the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
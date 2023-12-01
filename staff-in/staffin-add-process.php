<?php
require "../connections/connection.php"; // Database connection code

$equipment = $_POST["equipment_name"];
$quantity = $_POST["equipment_quantity"];

// Check if the equipment already exists in the table
$check_query = "SELECT * FROM tbequipment WHERE equipment_name = '$equipment'";
$check_result = mysqli_query($connection, $check_query);

if (mysqli_num_rows($check_result) > 0) {
    // Equipment already exists, update the quantity
    $update_query = "UPDATE tbequipment SET equipment_quantity = equipment_quantity + $quantity
                     WHERE equipment_name = '$equipment'";

    if (mysqli_query($connection, $update_query)) {
        // Equipment stock updated successfully
        echo "success"; // Echo a simple string or any value to indicate success
    } else {
        // Error updating equipment stock
        echo "error: " . mysqli_error($connection); // Echo an error message or code
    }
} else {
    // Equipment doesn't exist, insert a new row
    $insert_query = "INSERT INTO tbequipment (equipment_name, equipment_quantity) 
                     VALUES ('$equipment', $quantity)";

    if (mysqli_query($connection, $insert_query)) {
        // Equipment stock added successfully
        echo "success";
    } else {
        // Error adding equipment stock
        echo "error: " . mysqli_error($connection);
    }
}

mysqli_close($connection);
?>

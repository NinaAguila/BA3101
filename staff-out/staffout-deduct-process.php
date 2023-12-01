<?php
require "../connections/connection.php"; // Database connection code

$equipment = $_POST["equipment_name"];
$quantity = $_POST["equipment_quantity"];

// Check if the equipment already exists in the table
$check_query = "SELECT * FROM tbequipment WHERE equipment_name = '$equipment'";
$check_result = mysqli_query($connection, $check_query);

if (mysqli_num_rows($check_result) > 0) {
    $row = mysqli_fetch_assoc($check_result);
    $available_quantity = $row["equipment_quantity"];

    // Check if there are enough stocks to deduct
    if ($available_quantity >= $quantity) {
        // Deduct the quantity
        $update_query = "UPDATE tbequipment SET equipment_quantity = equipment_quantity - $quantity
                         WHERE equipment_name = '$equipment'";

        if (mysqli_query($connection, $update_query)) {
            // Equipment stock deducted successfully
            echo "success";
        } else {
            // Error deducting equipment stock
            echo "error: " . mysqli_error($connection);
        }
    } else {
        // Insufficient stock
        echo "error: Insufficient stock";
    }
} else {
    // Equipment doesn't exist
    echo "error: Equipment not found";
}

mysqli_close($connection);
?>

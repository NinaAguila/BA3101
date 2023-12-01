<?php
require "dbConnection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $productID = $_POST['prodid'];
    $productName = $_POST['Product_Name'];
    $description = $_POST['description'];
    $price = $_POST['Price'];

    // Using prepared statements to prevent SQL injection
    $sql = "INSERT INTO tbl_addnewproduct (prodid, product_Name, description, price) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);

    // Check if the prepare statement succeeded
    if ($stmt) {
        // Bind parameters
        $stmt->bind_param("sssd", $productID, $productName, $description, $price);

        // Execute the statement
        if ($stmt->execute()) {
            // Success: show alert and redirect
            echo '<script>alert("Product added successfully!");</script>';
            echo '<script>window.location.href = "your_redirect_page.php";</script>';
        } else {
            // Error: show alert and do not redirect
            echo '<script>alert("Error: ' . $stmt->error . '");</script>';
        }

        // Close the statement
        $stmt->close();
    } else {
        // Error in prepare: show alert and do not redirect
        echo '<script>alert("Error in prepare: ' . $conn->error . '");</script>';
    }
}

$conn->close();
?>

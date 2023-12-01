<?php
require "dbConnection.php";

$response = array(); // Create an associative array for the response

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $productName = $_POST["product-name"];
    $productImage = $_FILES["product-image"]["name"];
    $sizes = $_POST["product-sizes"];
    $prices = $_POST["product-prices"];

    $sql = "INSERT INTO tbl_products (productName, productImage) VALUES ('$productName', '$productImage')";
    if ($conn->query($sql) === TRUE) {
        $productID = $conn->insert_id;

        for ($i = 0; $i < count($sizes); $i++) {
            $size = $sizes[$i];
            $price = $prices[$i];
            $sql = "INSERT INTO tbl_size (productID, productSize, productPrice) VALUES ('$productID', '$size', '$price')";
            if ($conn->query($sql) !== TRUE) {
                $response['error'] = "Error: " . $sql . "<br>" . $conn->error;
                echo json_encode($response);
                exit;
            }
        }

        $response['success'] = "Form submitted successfully";
        echo json_encode($response);
    } else {
        $response['error'] = "Error: " . $sql . "<br>" . $conn->error;
        echo json_encode($response);
    }
}

$conn->close();
?>
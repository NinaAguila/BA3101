<?php
require "dbConnection.php";

// Fetch total stock out count
$totalStockOutSql = "SELECT COUNT(*) as totalStockOut FROM tbl_stockout";
$totalStockOutResult = $conn->query($totalStockOutSql);

if ($totalStockOutResult === false) {
    die("Error executing the total stock out count query: " . $conn->error);
}

if ($totalStockOutResult->num_rows > 0) {
    $totalStockOutRow = $totalStockOutResult->fetch_assoc();
    $totalStockOutCount = $totalStockOutRow["totalStockOut"];
    $response['totalStockOut'] = $totalStockOutCount;
} else {
    $response['error'] = 'No stock out data found';
}

// Fetch the product count
$productCountSql = "SELECT COUNT(*) as productCount FROM tbl_products";
$productCountResult = $conn->query($productCountSql);

if ($productCountResult === false) {
    die("Error executing the product count query: " . $conn->error);
}

// Fetch the product count
$productCount = $productCountResult->fetch_assoc()['productCount'];
$response['productCount'] = $productCount;

// Return the response as JSON
echo json_encode($response);
?>

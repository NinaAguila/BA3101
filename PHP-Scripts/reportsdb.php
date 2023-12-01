<?php
require "dbConnection.php";

// Your SQL query for stock IN
$reportSqlIN = "
    SELECT
        si.stockInID,
        si.recordDate,
        ea.employeeID,
        p.productID,
        s.productSize,
        si.quantityIn
    FROM
        tbl_stockin si
    JOIN
        tbl_employeeaccount ea ON si.employeeID = ea.employeeID
    JOIN
        tbl_products p ON si.productID = p.productID  
    JOIN
        tbl_size s ON si.productSize = s.productSize       
    GROUP BY
        si.stockInID, si.recordDate, ea.employeeID, p.productID, s.productSize, si.quantityIn
";


// Execute the query for stock IN
$reportResultIN = $conn->query($reportSqlIN);

// Check for errors for stock IN
if (!$reportResultIN) {
    die("Query for stock IN failed: " . $conn->error);
}

// Your SQL query for stock OUT
$reportSqlOUT = "
    SELECT
        so.stockOutID,
        so.recordDate,
        ea.employeeID,
        p.productID,
        s.productSize,
        so.quantityOut
    FROM
        tbl_stockout so
    JOIN
        tbl_employeeaccount ea ON so.employeeID = ea.employeeID
    JOIN
        tbl_products p ON so.productID = p.productID  
    JOIN
        tbl_size s ON so.productSize = s.productSize       
    GROUP BY
        so.stockOutID, so.recordDate, ea.employeeID, p.productID, s.productSize, so.quantityOut
";

// Execute the query for stock OUT
$reportResultOUT = $conn->query($reportSqlOUT);

// Check for errors for stock OUT
if (!$reportResultOUT) {
    die("Query for stock OUT failed: " . $conn->error);
}

// Close the connection
$conn->close();

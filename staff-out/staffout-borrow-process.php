<?php
require "../connections/connection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $equipmentID = $_POST["equipment_ID"];
    $quantity = $_POST["equipment_quantity"];
    $dateBorrowed = $_POST["date_borrowed"];
    $srCode = $_POST["sr_code"];

    // Retrieve student information based on SR Code
    $studentInfoQuery = "SELECT tbstudinfo.studid, tbstudinfo.firstname, tbstudinfo.lastname FROM tbstudinfo
                         JOIN tbstudent ON tbstudinfo.studid = tbstudent.studid
                         WHERE tbstudent.sr_code = '$srCode'";
    $studentResult = $connection->query($studentInfoQuery);

    if ($studentResult && $studentResult->num_rows > 0) {
        $row = $studentResult->fetch_assoc();
        $studentId = $row["studid"];
        $studentName = $row["firstname"];
        $studentlname = $row["lastname"];

        // Check if there are enough items in stock
        $checkStockQuery = "SELECT equipment_quantity, is_active FROM tbequipment WHERE equipment_ID = '$equipmentID'";
        $stockResult = $connection->query($checkStockQuery);

        if ($stockResult->num_rows > 0) {
            $stockRow = $stockResult->fetch_assoc();
            $availableStock = $stockRow["equipment_quantity"];
            $isActive = $stockRow["is_active"];

            if ($availableStock >= $quantity && $isActive == 1) {
                // Insert into tbborrow table
                $insertBorrowQuery = "INSERT INTO tbborrow (studid, equipment_ID, equipment_quantity, date_borrowed)
                      VALUES ('$studentId', '$equipmentID', '$quantity', '$dateBorrowed')";
                $connection->query($insertBorrowQuery);

                // Update tbequipment table by deducting the borrowed quantity
                $updateStocksQuery = "UPDATE tbequipment SET equipment_quantity = equipment_quantity - '$quantity' WHERE equipment_ID = '$equipmentID'";
                $connection->query($updateStocksQuery);

                // Send success response with student name and SR code
                echo "success|" . $studentName . " " . $studentlname . "|" . $srCode . "success";
            } else {
                echo "Equipment not available for borrowing"; // Send error response to JavaScript
            }
        } else {
            echo "Equipment not found"; // Send error response to JavaScript
        }
    } else {
        echo "Student not found"; // Send error response to JavaScript
    }
}

$connection->close();
?>

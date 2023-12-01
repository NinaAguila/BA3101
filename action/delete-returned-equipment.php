<?php
require "../connections/connection.php";

// Get the list of returned equipment
$query = "SELECT borrow_ID, equipment_ID FROM tbreturned";
$result = mysqli_query($connection, $query);

if (!$result) {
    die("Query failed: " . mysqli_error($connection));
}

while ($row = mysqli_fetch_assoc($result)) {
    $borrowID = $row['borrow_ID'];
    $equipmentID = $row['equipment_ID'];

    // Check if the equipment has been returned
    $checkReturnedQuery = "SELECT COUNT(*) AS count FROM tbreturned WHERE borrow_ID = '$borrowID'";
    $returnedResult = mysqli_query($connection, $checkReturnedQuery);

    if (!$returnedResult) {
        die("Query failed: " . mysqli_error($connection));
    }

    $returnedRow = mysqli_fetch_assoc($returnedResult);
    $returnCount = $returnedRow['count'];

    // Check if the equipment is still borrowed
    $checkBorrowedQuery = "SELECT COUNT(*) AS count FROM tbborrow WHERE borrow_ID = '$borrowID'";
    $borrowedResult = mysqli_query($connection, $checkBorrowedQuery);

    if (!$borrowedResult) {
        die("Query failed: " . mysqli_error($connection));
    }

    $borrowedRow = mysqli_fetch_assoc($borrowedResult);
    $borrowCount = $borrowedRow['count'];

    if ($returnCount > 0 && $borrowCount === 0) {
        // Delete the equipment record from tbequipment
        $deleteEquipmentQuery = "DELETE FROM tbequipment WHERE equipment_ID = '$equipmentID'";
        $deleteResult = mysqli_query($connection, $deleteEquipmentQuery);

        if (!$deleteResult) {
            die("Deletion failed: " . mysqli_error($connection));
        }

        echo "Equipment record deleted for returned equipment with borrow ID: $borrowID";
    } else {
        echo "Equipment with borrow ID: $borrowID is still borrowed or not returned";
    }
}

mysqli_close($connection);
?>

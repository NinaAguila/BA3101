<?php
require "../connections/connection.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $borrowID = $_POST["borrow_ID"];
    $returnedDate = $_POST["returned_date"];
    $returnedQuantity = $_POST["returned_quantity"];
    $equipmentMissing = $_POST["equipment_missing"];
    $equipmentDamaged = $_POST["equipment_damage"];

    // Fetch borrowed details including student ID and equipment name
    $borrowQuery = "SELECT tb.borrow_ID, tb.equipment_quantity, tb.equipment_ID, si.studid, te.equipment_name 
                    FROM tbborrow tb 
                    INNER JOIN tbstudinfo si ON tb.studid = si.studid
                    INNER JOIN tbequipment te ON tb.equipment_ID = te.equipment_ID
                    WHERE tb.borrow_ID = '$borrowID'";

    $borrowResult = mysqli_query($connection, $borrowQuery);

    if ($borrowResult && mysqli_num_rows($borrowResult) > 0) {
        $borrowRow = mysqli_fetch_assoc($borrowResult);
        $borrowedQuantity = $borrowRow["equipment_quantity"];
        $studentID = $borrowRow["studid"];
        $equipmentName = $borrowRow["equipment_name"];

        // Check if returned quantity is within borrowed limits
        if ($returnedQuantity <= $borrowedQuantity) {
            // Get the equipment ID based on equipment name
            $equipmentQuery = "SELECT equipment_ID FROM tbequipment WHERE equipment_name = '$equipmentName'";
            $equipmentResult = mysqli_query($connection, $equipmentQuery);

            if ($equipmentResult && mysqli_num_rows($equipmentResult) > 0) {
                $equipmentRow = mysqli_fetch_assoc($equipmentResult);
                $equipmentID = $equipmentRow["equipment_ID"];

                // Prepare update query for tbreturned table
                $updateReturnedQuery = "INSERT INTO tbreturned (studid, returned_date, borrow_ID, returned_quantity, equipment_damaged, equipment_missing) 
                                        VALUES ('$studentID', '$returnedDate', '$borrowID', '$returnedQuantity', '$equipmentDamaged', '$equipmentMissing')";

                // Prepare update query for tbequipment table
                $updateStocksQuery = "UPDATE tbequipment 
                                      SET equipment_quantity = equipment_quantity + '$returnedQuantity' 
                                      WHERE equipment_ID = '$equipmentID'";

                $updatedReturned = mysqli_query($connection, $updateReturnedQuery);
                $updatedStocks = mysqli_query($connection, $updateStocksQuery);

                if ($updatedReturned && $updatedStocks) {
                    mysqli_commit($connection);
                    $response = [
                        "success" => true,
                        "message" => "Equipment returned successfully.",
                    ];

                    // Clear the form data if the update is successful
                    $_POST = [];
                } else {
                    mysqli_rollback($connection);
                    $errorInfo = mysqli_error($connection);
                    $response = [
                        "success" => false,
                        "message" => "Error processing return: " . $errorInfo,
                    ];
                }
            } else {
                $response = [
                    "success" => false,
                    "message" => "Error retrieving equipment ID.",
                ];
            }
        } else {
            $response = [
                "success" => false,
                "message" => "Returned quantity exceeds borrowed quantity.",
            ];
        }
    } else {
        $response = [
            "success" => false,
            "message" => "Error retrieving borrowed quantity.",
        ];
    }

    header("Content-Type: application/json");
    echo json_encode($response);

    mysqli_close($connection);
}
?>

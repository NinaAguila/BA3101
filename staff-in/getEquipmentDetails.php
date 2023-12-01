<?php
require('../connections/connection.php');

if (isset($_POST['studentID'])) {
    $borrowID = $connection->real_escape_string($_POST['studentID']); // Sanitize input

    $query = "SELECT tbequipment.equipment_name, tbborrow.equipment_quantity, tbborrow.date_borrowed
              FROM tbborrow
              JOIN tbequipment ON tbborrow.equipment_ID = tbequipment.equipment_ID
              WHERE tbborrow.borrow_ID = $borrowID"; // Query to retrieve specific borrow details

    $result = $connection->query($query);

    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();

        $equipmentDetails = array(
            'equipment_name' => $row['equipment_name'],
            'equipment_quantity' => $row['equipment_quantity'], // Correctly retrieve the borrowed quantity
            'date_borrowed' => $row['date_borrowed']
        );

        echo json_encode($equipmentDetails); // Return equipment details as JSON
    } else {
        echo json_encode(array('error' => 'No equipment details found for the selected student.'));
    }

    $connection->close();
}
?>
<?php
session_start();
require('../connections/connection.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff In Return Equip</title>
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <link rel="stylesheet" href="../css/staffin-return.css">
</head>
<body>
    <?php include('../staff-in/sidebar-staffin.php'); ?>
    <div class="form-container">
        <div class="labeled-rectangle">
            <h2>Returns</h2>
        </div>
        <h2>Hello Staff!!</h2>
        <h4>Welcome Back to Returns</h4>

        <div class="contain-form">
            <form action="" method="POST" id="returneeForm">
                <label>Returnees</label>
                <select name="student" id="student">
                    <option disabled selected hidden>Choose Returnee</option>
                    <?php
                        $resultStaff = $connection->query("
                            SELECT 
                                tbborrow.borrow_ID AS borrow_ID, 
                                tbstudent.sr_code,
                                CONCAT(tbstudinfo.firstname, ' ', tbstudinfo.lastname) AS name,
                                tbequipment.equipment_name, 
                                tbborrow.equipment_quantity, 
                                tbborrow.date_borrowed
                            FROM tbborrow
                            JOIN tbstudent ON tbborrow.studid = tbstudent.studid
                            JOIN tbstudinfo ON tbstudent.studid = tbstudinfo.studid
                            JOIN tbequipment ON tbborrow.equipment_ID = tbequipment.equipment_ID
                            LEFT JOIN tbreturned ON tbborrow.borrow_ID = tbreturned.borrow_ID
                            WHERE tbreturned.returned_date IS NULL
                            
                        ");

                        // Outputting options for students
                        while ($rowStaff = $resultStaff->fetch_assoc()) {
                            echo "<option value=\"{$rowStaff["borrow_ID"]}\">{$rowStaff["name"]}</option>";
                        }
                    ?>
                </select>
                <button type ="button" class ="button" onclick="showEquipmentDetails()">Search</button>
            </form>
             <div class="pop-up-return" id="pop-up">
                <div class="container">
                    <form>
                        <div class="form-element">
                            <label>Equipment Borrowed:</label>
                            <input type="text" id="equipmentName" readonly>
                            <label>Borrowed Quantity</label>
                            <input type="number" name="number1" id="equipmentQuantity" readonly>
                            <label>Date Borrowed</label>
                            <input type="text" id="dateBorrowed" readonly>
                            <label>Returned Quantity</label>
                            <input type="number" name="returned_quantity" id="ReturnedQuantity" required>
                            <label>Equipment Missing?</label>
                            <input type="number" name="equipment_missing" id="EquipmentMissing" required>
                            <label>Equipment Damaged?</label>
                            <input type="number" name="equipment_damage" id="EquipmentDamage" required>
                            <label>Date Returned</label>
                            <input type="date" name="date_returned" id="DateReturned" required>
                            <button class="button" onclick="submitReturnedDate()">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div> <!-- Closing div for form-container -->
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    function showEquipmentDetails() {
        var selectedStudentID = document.getElementById('student').value;

        $.ajax({
            url: '../staff-in/getEquipmentDetails.php',
            method: 'POST',
            data: { studentID: selectedStudentID },
            success: function(response) {
                var equipmentDetails = JSON.parse(response);
                displayEquipmentDetails(equipmentDetails);
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }

    function displayEquipmentDetails(details) {
        document.getElementById('equipmentName').value = details.equipment_name || 'Not available';
        document.getElementById('equipmentQuantity').value = details.equipment_quantity || 'Not available';
        document.getElementById('dateBorrowed').value = details.date_borrowed || 'Not available';
    }

    function submitReturnedDate() {
        var studentID = document.getElementById('student').value;
        var returnedQuantity = document.getElementById('ReturnedQuantity').value;
        var equipmentMissing = document.getElementById('EquipmentMissing').value;
        var equipmentDamage = document.getElementById('EquipmentDamage').value;
        var dateReturned = document.getElementById('DateReturned').value;

        $.ajax({
            url: '../staff-in/staffin-return-process.php',
            method: 'POST',
            data: {
                studid: studentID,
                returned_date: dateReturned,
                borrow_ID: studentID,
                returned_quantity: returnedQuantity,
                equipment_missing: equipmentMissing,
                equipment_damage: equipmentDamage
            },
            success: function(response) {
                // Handle response accordingly
                if (response.success) {
                    // Show success SweetAlert
                    Swal.fire({
                        icon: 'success',
                        title: 'Equipment Returned',
                        text: 'Equipment returned successfully.',
                    });
                    
                    // Clear form data
                    document.getElementById('ReturnedQuantity').value = '';
                    document.getElementById('EquipmentMissing').value = '';
                    document.getElementById('EquipmentDamage').value = '';
                    document.getElementById('DateReturned').value = '';
                } else {
                    // Show error SweetAlert
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: response.message,
                    });
                }
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
</script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../js/returnEquipment.js"></script>
</body>
</html>

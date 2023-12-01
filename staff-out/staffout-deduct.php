<?php
require "../connections/connection.php"; ?>

<!DOCTYPE html>
<html>
<head>
    <title>Deduct Equipment Stock Form</title>
    <link rel="stylesheet" href="../css/stock-deduct.css">
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../js/staff-deduct.js"></script>
</head>
<body>
    <?php include "../staff-out/sidebar-staffout.php"; ?>
    
    <div class="form-container">
<div class="labeled-rectangle">
            <h2>Deduct Equipment Stock</h2>
        </div>
        <h2>Hello Staff!!</h2>
        <h4>Welcome to Deduct Equipment Stock</h4>

    <div class="table-container">
    <?php // Check if the form is submitted

if (isset($_POST["submit"])) {
        require "../staff-out/staffout-deduct-process.php";
    } ?>

    <form action="" method="post" id="equipmentForm">
        <label for="equipment">Equipment:</label>
        <select id="equipment" name="equipment_name" required>
            <option value="" disabled selected hidden>Select Equipment</option>
            <?php
            $query = "SELECT equipment_name FROM tbequipment";
            $result = mysqli_query($connection, $query);
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<option value='" .
                    $row["equipment_name"] .
                    "'>" .
                    $row["equipment_name"] .
                    "</option>";
            }
            ?>
        </select>

        <label for="quantity">Quantity to Deduct:</label>
        <input type="number" id="quantity" name="equipment_quantity" required>

        <input type="submit" name="submit" value="Deduct Stock">
    </form>

    <script>
        // Submit form using AJAX
        document.getElementById('equipmentForm').addEventListener('submit', function (event) {
            event.preventDefault();

            // Send AJAX request
            var formData = new FormData(this);

            fetch('staffout-deduct-process.php', {
                method: 'POST',
                body: formData
            })
                .then(response => response.text())
                .then(data => {
                    showAlert(data); // Use the showAlert function from staff_deduct.js
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        });

    </script>
    </div>
</body>
</html>
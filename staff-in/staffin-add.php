<?php
session_start();
require "../connections/connection.php";
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Equipment Stock Form</title>
    <link rel="stylesheet" href="../css/stock-add.css">
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../js/stock-add.js"></script>
</head>
<body>
    <?php include "../staff-in/sidebar-staffin.php"; ?>
     
    <div class="form-container">
        <div class="labeled-rectangle">
            <h2>Add Equipment Stock</h2>
        </div>
        <h2>Hello Staff!!</h2>
        <h4>Welcome Back to Add Equipment Stock</h4>


    <div class="contain-form">
    <form action="" method="post" id="equipmentForm">
        <label for="equipment">Equipment:</label>
        <select id="equipment" name="equipment_name" required>
            <option value="" disabled selected hidden>Select Equipment</option>
            <?php
            $query = "SELECT equipment_name FROM tbequipment";
            $result = mysqli_query($connection, $query);
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<option value='" .$row["equipment_name"] . "'>" .$row["equipment_name"] ."</option>";
            }
            ?>
        </select>

        <label for="quantity">Quantity to Add:</label>
        <input type="number" id="quantity" name="equipment_quantity" required>

        <input type="submit" name="submit" value="Add Stock">
    </form>
    </div>
    <script>
    // Submit form using AJAX
    document.getElementById('equipmentForm').addEventListener('submit', function (event) {
        event.preventDefault();

        // Send AJAX request
        var formData = new FormData(this);

        fetch('../staff-in/staffin-add-process.php', {
            method: 'POST',
            body: formData
        })
            .then(response => response.text())
            .then(data => {
                showAlert(data); // Pass 'data' received from the server
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });

</script>

    </div>

</body>
</html>
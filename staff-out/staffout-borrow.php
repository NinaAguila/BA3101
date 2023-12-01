<?php require "../connections/connection.php"; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Form</title>
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <link rel="stylesheet" href="../css/borrow.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<div class="form-container">
<div class="labeled-rectangle">
            <h2>Borrowing</h2>
        </div>
        <h2>Hello Staff!!</h2>
        <h4>Welcome back to Borrowing</h4>
        <br>
    <?php include "../staff-out/sidebar-staffout.php"; ?>
    <div class="borrow-container">
        
        <form id="borrow-form" action="../staff-out/staffout-borrow-process.php" method="POST" onsubmit="borrowEquipment(); return false;">
            <label for="sr-code">SR Code:</label>
            <input type="text" id="sr-code" name="sr_code" required>

            <label for="student-id"></label>
            <input type="hidden" id="student-id" name="student_id" readonly>

            <label for="student_name"></label>
            <input type="hidden" id="student_name" name="student_name" readonly>

            <label for="equipment">Name of Equipment:</label>
            <select id="equipment" name="equipment_ID" required>
                <option value="" disabled selected hidden>Select Equipment</option>
                <?php
                $equipmentQuery = "SELECT equipment_ID, equipment_name, is_active FROM tbequipment";
                $equipmentResult = $connection->query($equipmentQuery);

                while ($row = $equipmentResult->fetch_assoc()) {
                    // Convert is_active value to YES or NO
                    $isActive = $row["is_active"] == 1 ? "YES" : "NO";
                    echo "<option value='" . $row["equipment_ID"] . "'>" . $row["equipment_name"] . " (Active: $isActive)</option>";
                }

                $connection->close();
                ?>
            </select>

            <label for="quantity">Equipment Quantity:</label>
            <input type="number" id="quantity" name="equipment_quantity" required>

            <label for="date-borrowed">Date Borrowed:</label>
            <input type="date" id="date-borrowed" name="date_borrowed" required>

            <button class="button">Submit</button>
        </form>
    </div>

    <script src="../js/stock-borrow.js"></script>
    <?php include "../staff-out/staffout-borrow-process.php"; ?>
</div>
</body>
</html>
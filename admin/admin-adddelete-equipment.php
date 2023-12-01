<?php
session_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add/Delete Equipment</title>
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="../css/form-equip.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <?php include "../admin/sidebar.php"; ?>

    <div class="form-container">
   <div class="labeled-rectangle">
            <h2 >Add Delete Admin/Staff</h2>
        </div>
        <h2>Hello Admin!!</h2>
        <h4>Welcome Back Add Delete Admin/Staff</h4>
    
     <div class="flex"> 
    <div class="contain-form">
        <h3 class="form-text">Submit Equipment Information</h1>
        <form action="../form/form-equip-submit.php" method="post" enctype="multipart/form-data">
    <label for="equipment_name">Equipment Name:</label>
    <input type="text" name="equipment_name" required>

    <label for="equipment_quantity">Quantity:</label>
    <input type="number" name="equipment_quantity" required>

    <label for="image-eqp">Choose Image for Equipment:</label>
    <input type="file" name="image-eqp" accept="image/*" required>

    <label for="equipment_description">Description:</label>
    <textarea name="equipment_description" required></textarea>

    <label for="date-arrived">Date Arrived</label>
    <input type="date" name="date_arrived" id="DateArrived" required>
    
    <input type="submit" value="Submit">
</form>
    </div>

    <div class="delete-form">
        <h3 class="form-text">Delete Equipment</h3>
        <form action="../action/delete-equip.php" method="post">
            <label for="deleteId">Select Equipment to Delete:</label>
            <select name="deleteId" required>
                <option disabled selected hidden>Choose Equipment</option>
                <?php
                // Fetch only active (not deleted) equipment for deletion dropdown
                $query =
                    "SELECT equipment_ID, equipment_name FROM tbequipment WHERE is_active = 1";
                $result = $connection->query($query);

                if ($result) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<option value=\"{$row["equipment_ID"]}\">{$row["equipment_name"]}</option>";
                    }
                } else {
                    echo "Error: " . $connection->error;
                }

                $connection->close();
                ?>
            </select>
            <input type="submit" id="submit-delete-equip" value="Delete">
        </form>
    </div>
    </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../js/addDeleteEquipAdmin.js"></script>

</body>
</html>
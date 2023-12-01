
<?php
require "../connections/connection.php";

// Initialize $equipment variable
$equipment = [];

// Check if equipment ID is provided in the URL
if (isset($_GET['id'])) {
    $equipment_id = $_GET['id'];

    // Fetch equipment data based on the provided ID
    $query = "SELECT * FROM tbequipment WHERE equipment_id = ?";
    $stmt = mysqli_prepare($connection, $query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "i", $equipment_id);

        if (mysqli_stmt_execute($stmt)) {
            $result = mysqli_stmt_get_result($stmt);
            $equipment = mysqli_fetch_assoc($result);
        } else {
            die("Query failed: " . mysqli_error($connection));
        }

        mysqli_stmt_close($stmt);
    } else {
        die("Preparation failed: " . mysqli_error($connection));
    }
} else {
    // Redirect if equipment ID is not provided
    header("Location: ../admin/display_equipment.php");
    exit();
}

mysqli_close($connection);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>Edit Equipment Details</h1>

    <form action="" method="post" enctype="multipart/form-data">
        <label for="newEquipmentPhoto">Equipment Photo:</label>
        <img src="<?php echo $equipment['equip_photos']; ?>" alt="Current Equipment Photo" class="equipment-photo">
        <input type="file" id="newEquipmentPhoto" name="newEquipmentPhoto" accept="image/*">

        <label for="newEquipmentName">Equipment Name:</label>
        <input type="text" id="newEquipmentName" name="newEquipmentName" value="<?php echo $equipment['equipment_name']; ?>" required>

        <label for="newEquipmentDescription">Equipment Description:</label>
        <textarea id="newEquipmentDescription" name="newEquipmentDescription" required><?php echo $equipment['equipment_description']; ?></textarea>

        <label for="newIsAvailable">Is Available?</label>
        <input type="checkbox" id="newIsAvailable" name="newIsAvailable" <?php echo $equipment['is_active'] == 1 ? 'checked' : ''; ?>>

        <button type="submit" name="update">Update</button>
    </form>
</body>
</html>

<?php
require "../connections/connection.php";

// Check if equipment ID is provided in the URL
if (isset($_GET['id'])) {
    $equipment_id = $_GET['id'];

    // Fetch equipment data based on the provided ID
    $query = "SELECT * FROM tbequipment WHERE equipment_id = ?";
    $stmt = mysqli_prepare($connection, $query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "i", $equipment_id);

        if (mysqli_stmt_execute($stmt)) {
            $result = mysqli_stmt_get_result($stmt);
            $equipment = mysqli_fetch_assoc($result);
        } else {
            die("Query failed: " . mysqli_error($connection));
        }

        mysqli_stmt_close($stmt);
    } else {
        die("Preparation failed: " . mysqli_error($connection));
    }
} else {
    // Redirect if equipment ID is not provided
    header("Location: ../admin/display_equipment.php");
    exit();
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $newEquipmentName = $_POST['newEquipmentName'];
    $newEquipmentDescription = $_POST['newEquipmentDescription'];
    $newIsAvailable = isset($_POST['newIsAvailable']) ? 1 : 0;

    // Check if a new photo is uploaded
    if ($_FILES['newEquipmentPhoto']['error'] == 0) {
        $uploadDir = "../images/image-eqp/";  // Set your upload directory
        $newPhotoName = uniqid() . "_" . basename($_FILES["newEquipmentPhoto"]["name"]);
        $targetFile = $uploadDir . $newPhotoName;

        // Upload the new photo
        if (move_uploaded_file($_FILES["newEquipmentPhoto"]["tmp_name"], $targetFile)) {
            // Update the equipment data in the database
            $updateQuery = "UPDATE tbequipment SET
    equip_photos = CONCAT('$uploadDir', ?),
    equipment_name = ?,
    equipment_description = ?,
    is_active = ?
    WHERE equipment_id = ?";


            $updateStmt = mysqli_prepare($connection, $updateQuery);

            if ($updateStmt) {
                mysqli_stmt_bind_param($updateStmt, "ssssi", $newPhotoName, $newEquipmentName, $newEquipmentDescription, $newIsAvailable, $equipment_id);

                if (mysqli_stmt_execute($updateStmt)) {
                    echo "<script>alert('Equipment data updated successfully!');</script>";
                } else {
                    echo "Update failed: " . mysqli_error($connection);
                }

                mysqli_stmt_close($updateStmt);
            } else {
                die("Preparation failed: " . mysqli_error($connection));
            }
        } else {
            echo "File upload failed.";
        }
    } else {
        // Update the equipment data without changing the photo
        $updateQuery = "UPDATE tbequipment SET
            equipment_name = ?,
            equipment_description = ?,
            is_active = ?
            WHERE equipment_id = ?";

        $updateStmt = mysqli_prepare($connection, $updateQuery);

        if ($updateStmt) {
            mysqli_stmt_bind_param($updateStmt, "sssi", $newEquipmentName, $newEquipmentDescription, $newIsAvailable, $equipment_id);

            if (mysqli_stmt_execute($updateStmt)) {
                echo "<script>alert('Equipment data updated successfully!');</script>";
            } else {
                echo "Update failed: " . mysqli_error($connection);
            }

            mysqli_stmt_close($updateStmt);
        } else {
            die("Preparation failed: " . mysqli_error($connection));
        }
    }
}

mysqli_close($connection);
?>
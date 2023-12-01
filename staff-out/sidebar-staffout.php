<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
    <div class="sidebar">
        <img src="../images/logo.png" alt="Sidebar Icon">
        <?php if (
            isset($_SESSION["staff_name"]) &&
            isset($_SESSION["staff_position"])
        ) {
            echo '<p style="text-align: center; color: white;">Staff: ' .
                $_SESSION["staff_name"] .
                "</p>";
            echo '<p style="text-align: center; color: white;">Staff: ' .
                $_SESSION["staff_position"] .
                "</p>";
        } ?>
        <a href="../staff-out/staffout-dashboard.php"><i class="fa-solid fa-dashboard"></i>Dashboard/Overview</a>
        <a href="../staff-out/staffout-deduct.php"><i class="fa-solid fa-minus"></i>Deduct Equipment Stock</a>
        <a href="../staff-out/staffout-borrow.php"><i class="fa-solid fa-hand-holding"></i>Borrowing</a>
        <a href="../staff-out/staffout-borrow-list.php"><i class="fa-solid fa-list"></i>Borrow List</a>
        <br>
        <br>
        <a href="../logout/logout-staff.php"><i class="fa-solid fa-arrow-right-from-bracket"></i>Log Out</a>
</div>
</body>
</html>
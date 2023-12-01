<?php
$host = "localhost";
$user = "root";
$pass = "";
$database = "db_ba3101";

$connection = mysqli_connect($host, $user, $pass, $database);

if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}
?>

<?php
session_start();
// Clear all session variables
$_SESSION = array();

// Destroy the session
session_destroy();

// Redirect to the login page after logging out
header('Location: ../login/login-admin.php');
?>

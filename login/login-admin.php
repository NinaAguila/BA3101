<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin</title>
    <link rel="stylesheet" href="../css/login.css">
    <link rel="shortcut icon" href="../images/logo.png" type="image/x-icon">
</head>
<body>
         <div class="login-container">         
             
        <form class="login-form" action="../login/login-auto-admin.php" method="post">
        <h4>LOGIN FOR ADMIN</h4>

            <input type="text" name="admin_user" placeholder="Username" required>
            <input type="password" name="admin_pass" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
     
      <div class ="side" >
        <img src="../images/logo.png" alt="Logo">
      </div>
</div>
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../js//loginAuto.js"></script>

</body>
</html>
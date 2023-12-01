<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../styles/Login-Page.css" />
</head>

<body>
    <canvas class="background"></canvas>

    <div class="container">
        <div class="left-container">
            <img src="../images/RedSpartan-Logo.png" alt="Red Spartan Logo" />

            <div class="office-name">
                <h1>Resource Generation Office</h1>

                <h3>Lipa Campus</h3>
            </div>
        </div>

        <div class="right-container">
            <h2>Account Login</h2>

            <div id="error-message" class="error-message"></div>

            <form action="" method="post" id="login-form" autocomplete="off">
                <div class="input-email">
                    <input type="text" name="username" id="username" class="input-box" autocomplete="off" required />

                    <label class="username-label">Username<sup>*</sup></label>
                </div>

                <div class="input-password">
                    <input type="password" name="password" id="password" class="input-box" autocomplete="off"
                        required />

                    <label class="password-label">Password<sup>*</sup></label>

                    <div class="show-password">
                        <label>
                            <input type="checkbox" id="show-password" />

                            <div class="show-off"><span class="material-symbols-outlined">visibility_off</span></div>

                            <div class="show-on"><span class="material-symbols-outlined">visibility</span></div>
                        </label>
                    </div>
                </div>

                <button type="submit" id="login-button" class="button">
                    <span>Login</span>

                    <div class="border button"></div>
                </button>

                <div class="forgot-password">
                    <p>Forgot Password?</p>
                    <a href="#" id="forgot-password-link">Click Here</a>
                </div>
            </form>
        </div>
    </div>

    <script src="../JS-Scripts/passwordToggle.js"></script>
    <script src="../JS-Scripts/loginHandler.js"></script>
</body>

</html>
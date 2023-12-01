<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../styles/Admin-Pages.css" />
    <title>Admin Page</title>
</head>

<body>
    <div class="container">
        <div class="header">
            <img src="../images/BatStateU-Logo.png" alt="BatStateU-Logo" />
    
            <div class="user-information">
                <input type="text" name="employee-name" id="employee-name" class="employee-name" value="" readonly />
    
                <input type="text" name="employee-designation" id="employee-designation" class="employee-designation" value="Administrator" readonly />
            </div>
    
            <div class="display-date-time">
                <span class="material-symbols-outlined">calendar_today</span>
                <p class="current-date-time" id="current-date-time"></p>
            </div>
    
            <div class="logout-button" id="logout-button">
                <span class="material-symbols-outlined">logout</span>
                <p>Exit / Log out</p>
            </div>
        </div>
    
        <div class="main-content">
            <div class="sidebar">
                <nav>
                    <div class="overview" id="overview-link">
                        <span class="material-symbols-outlined">overview</span>
                        <li>Overview</li>
                    </div>
                    <div class="view-stocks" id="view-stocks-link">
                        <span class="material-symbols-outlined">inventory_2</span>
                        <li>View Stocks</li>
                    </div>
                    <div class="add-new-products" id="add-new-products-link">
                        <span class="material-symbols-outlined" id="openFormIcon">add_circle</span>
                        <li>Add New Products</li>
                    </div>
                    <div class="add-officers" id="add-officers-link">
                        <span class="material-symbols-outlined">person_add</span>
                        <li>Add Officers</li>
                    </div>
                </nav>
            </div>
    
    
            <div class="display-section" id="display-section">
                <div class="overview-content" id="overview-content">
                    <div class="info-counts">
                        <div class="employeeIN-info">
                            <div class="employeeIN-icon">
                                <span class="material-symbols-outlined">person</span>
                            </div>
    
                            <div class="employeeIN-count">
                                <p class="total-employeeIN" id="count-in">0</p>
                                <p class="subtitle">Employee | Stock IN</p>
                            </div>
                        </div>
    
                        <div class="employeeOUT-info">
                            <div class="employeeOUT-icon">
                                <span class="material-symbols-outlined">person</span>
                            </div>
    
                            <div class="employeeOUT-count">
                                <p class="total-employeeOUT" id="count-out">0</p>
                                <p class="subtitle">Employee | Stock OUT</p>
                            </div>
                        </div>
    
    
                        <div class="product-info">
                            <div class="product-icon"><span class="material-symbols-outlined">shopping_cart</span></div>
    
                            <div class="product-count">
                                <p class="total-product" id="display-total">0</p>
                                <p class="subtitle">Products</p>
                            </div>
                        </div>
    
                        <div class="sales-info">
                            <div class="sales-icon">
                                <span class="material-symbols-outlined">payments</span>
                            </div>
    
                            <div class="sales-count">
                                <p class="total-sales" id="total-sales">0</p>
                                <p class="subtitle">Sales</p>
                            </div>
                        </div>
                    </div>
    
                    <?php
                    require "../PHP-Scripts/dbConnection.php";
    
                    $stockCountSql = "SELECT 
                        SUM(CASE WHEN employeeRole = 'Stock In' THEN 1 ELSE 0 END) as stockInCount, 
                        SUM(CASE WHEN employeeRole = 'Stock Out' THEN 1 ELSE 0 END) as stockOutCount 
                        FROM tbl_employeeaccount";
                    $stockCountResult = $conn->query($stockCountSql);
    
                    if ($stockCountResult === false) {
                        die("Error executing the stock count query: " . $conn->error);
                    }
    
                    if ($stockCountResult->num_rows > 0) {
                        $stockRow = $stockCountResult->fetch_assoc();
                        $stockInCount = $stockRow["stockInCount"];
                        $stockOutCount = $stockRow["stockOutCount"];
    
                        echo "<script>
                            document.getElementById('count-in').innerHTML = '$stockInCount';
                            document.getElementById('count-out').innerHTML = '$stockOutCount';
                        </script>";
                    } else {
                        echo "<script>console.log('No stock data found');</script>";
                    }
    
                    // Assuming $reportResultIN and $reportResultOUT are defined somewhere in your code
                    // ...
    
                    // Example: Replace with actual code
                    $reportResultIN = $conn->query("SELECT * FROM tbl_stockin");
                    $reportResultOUT = $conn->query("SELECT * FROM tbl_stockout");
    
                    ?>
    
                    <div class="stocksReport">
                        <div class="stockTableContainerIN" id="stockTableContainerIN">
                            <h3>Stock In Report</h3>
    
                            <table>
                                <tr>
                                    <th>Stock In ID</th>
                                    <th>Record Date</th>
                                    <th>Product ID</th>
                                    <th>Employee ID</th>
                                    <th>Size</th>
                                    <th>Quantity</th>
                                </tr>
                                <?php
                                // Reset the pointer to the beginning of the result set for stock IN
                                $reportResultIN->data_seek(0);
    
                                while ($row = $reportResultIN->fetch_assoc()) { ?>
                                    <tr>
                                        <td><?php echo $row['stockInID'] ?></td>
                                        <td><?php echo $row['recordDate']; ?></td>
                                        <td><?php echo $row['productID']; ?></td>
                                        <td><?php echo $row['employeeID']; ?></td>
                                        <td><?php echo $row['productSize']; ?></td>
                                        <td><?php echo $row['quantityIn'] ?></td>
                                    </tr>
                                <?php } ?>
                            </table>
                        </div>
    
                        <div class="stockTableContainerOUT" id="stockTableContainerOUT">
                            <h3>Stock Out Report</h3>
    
                            <table>
                                <tr>
                                    <th>Stock Out ID</th>
                                    <th>Record Date</th>
                                    <th>Product ID</th>
                                    <th>Employee ID</th>
                                    <th>Size</th>
                                    <th>Quantity</th>
                                </tr>
                                <?php
                                // Reset the pointer to the beginning of the result set for stock OUT
                                $reportResultOUT->data_seek(0);
    
                                while ($row = $reportResultOUT->fetch_assoc()) { ?>
                                    <tr>
                                        <td><?php echo $row['stockOutID']; ?></td>
                                        <td><?php echo $row['recordDate']; ?></td>
                                        <td><?php echo $row['productID']; ?></td>
                                        <td><?php echo $row['employeeID']; ?></td>
                                        <td><?php echo $row['productSize']; ?></td>
                                        <td><?php echo $row['quantityOut'] ?></td>
                                    </tr>
                                <?php } ?>
                            </table>
                        </div>
                    </div>
                </div>
    
                <div class="view-stocks-content" id="view-stocks-content">
                    
                </div>
    
                <div class="add-officers-content" id="add-officers-content">
                    <h2 class="registration">Create Account</h2>
                    <form id="userForm" method="post" action="">
                        <div class="Id-First-Last">
                            <div class="inputEmployeeID">
                                <input type="text" id="employeeID" name="employeeID" placeholder="Enter Employee ID" required />
                            </div>
    
                            <div class="inputEmployeeLastName">
                                <input type="text" id="employeeLastName" name="employeeLastName" placeholder="Enter Employee Last Name" required />
                            </div>
    
                            <div class="inputEmployeeFirstName">
                                <input type="text" id="employeeFirstName" name="employeeFirstName" placeholder="Enter Employee First Name" required />
                            </div>
                        </div>

                        <div class="Email-Password">
                            <div class="inputEmployeeEmail">
                                <input type="text" id="employeeEmail" name="employeeEmail" placeholder="Enter Employee Email" required />
                            </div>
    
                            <div class="inputEmployeePassword">
                                <input type="password" id="employeePassword" name="employeePassword" placeholder="Enter Password" required />
                            </div>
                        </div>

                        <div class="Department-Role">
                            <div class="inputEmployeeDepartment">
                                <input type="text" id="employeeDepartment" name="employeeDepartment" placeholder="Enter Employee Department" required />
                            </div>
    
                            <div class="inputEmployeeRole">
                                <select id="employeeRole" name="employeeRole"  required>
                                    <option value="default" disabled selected hidden>Select Role</option>
                                    <option value="Stock Out">Employee Out</option>
                                    <option value="Stock In">Employee In</option>
                                </select>
                            </div>
                        </div>
                        
    
                        <!-- End of New Fields -->
                        <div class="createbtn">
                            <input type="submit" name="submit" value="Create Account" />
                        </div>
                    </form>
                </div>
            </div>
    
            <div class="background"></div>
        </div>
    </div>
    
    <script src="../JS-Scripts/displayUserInfo.js" defer></script>
    <script src="../JS-Scripts/displayDateTime.js" defer></script>
    <script src="../JS-Scripts/logout.js" defer></script>
    <script src="../JS-Scripts/navigation.js" defer></script>
    <script src="../JS-Scripts/displayInfoCounts.js" defer></script>
    <script src="../JS-Scripts/addNewProduct.js" defer></script>
    <script src="../JS-Scripts/addNewOfficer.js" defer></script>
</body>
</html>
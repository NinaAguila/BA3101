document.addEventListener("DOMContentLoaded", function () {
    // Get the userForm element
    const userForm = document.getElementById("userForm");

    // Add an event listener to the form on submission
    userForm.addEventListener("submit", function (event) {
        // Prevent the default form submission behavior
        event.preventDefault();

        // Fetch values from form elements
        const employeeID = document.getElementById("employeeID").value;
        const employeeLastName = document.getElementById("employeeLastName").value;
        const employeeFirstName = document.getElementById("employeeFirstName").value;
        const employeeEmail = document.getElementById("employeeEmail").value;
        const employeePassword = document.getElementById("employeePassword").value;
        const employeeDepartment = document.getElementById("employeeDepartment").value;
        const employeeRole = document.getElementById("employeeRole").value;

        // Here you can use fetch() or any other method to send the data to the server if needed
        // Example using fetch():
        fetch("../PHP-Scripts/insertNewOfficer", {
            method: "POST",
            body: JSON.stringify({
                employeeID,
                employeeLastName,
                employeeFirstName,
                employeeEmail,
                employeePassword,
                employeeDepartment,
                employeeRole
            }),
            headers: {
                "Content-Type": "application/json",
            },
        })
        .then(response => response.json())
        .then(data => {
            // Handle the response from the server
            console.log("Server Response:", data);

            // Check if the insertion was successful
            if (data.success) {
                // Display SweetAlert for success and clear input fields
                Swal.fire({
                    title: 'Success',
                    icon: 'success',
                    heightAuto: false,
                }).then((result) => {
                    // Clear input fields if the user clicks "OK"
                    if (result.isConfirmed) {
                        clearInputFields();
                    }
                });
            } else {
                // Display SweetAlert for error
                Swal.fire({
                    title: 'Error',
                    icon: 'error',
                    heightAuto: false,
                });
            }
        })
        .catch(error => console.error("Error:", error));
    });

    // Function to clear input fields
    function clearInputFields() {
        document.getElementById('employeeID').value = '';
        document.getElementById('employeeLastName').value = '';
        document.getElementById('employeeFirstName').value = '';
        document.getElementById('employeeEmail').value = '';
        document.getElementById('employeePassword').value = '';
        document.getElementById('employeeDepartment').value = '';
        document.getElementById('employeeRole').value = '';
    }
});

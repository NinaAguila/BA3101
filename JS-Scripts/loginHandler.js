document.addEventListener("DOMContentLoaded", function () {
	const usernameInput = document.getElementById("username");
	const passwordInput = document.getElementById("password");

	const loginButton = document.getElementById("login-button");

	function performLogin() {
		const username = usernameInput.value;
		const password = passwordInput.value;

		fetch("../PHP-Scripts/loginVerification.php", {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded",
			},
			body: `username=${username}&password=${password}`,
		})
			.then((response) => {
				if (response.ok) {
					return response.text();
				} else {
					throw new Error("Login failed");
				}
			})
			.then((data) => {
				const [employeeRole, lastName, firstName] = data.trim().split("|");
				if (employeeRole === "Admin") {
					window.location.href = `Admin-Page.php?lastName=${lastName}&firstName=${firstName}`;
				} else if (employeeRole === "Stock In") {
					window.location.href = `StockIN-Page.php?lastName=${lastName}&firstName=${firstName}`;
				} else if (employeeRole === "Stock Out") {
					window.location.href = `StockOUT-Page.php?lastName=${lastName}&firstName=${firstName}`;
				} else {
					document.getElementById("error-message").innerText = "Invalid Role";
				}
			})
			.catch((error) => {
				console.error("Error:", error);
			});
	}

	loginButton.addEventListener("click", function (event) {
		event.preventDefault();
		performLogin();
	});

	window.addEventListener("pageshow", function (event) {
		if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
			usernameInput.value = "";
			passwordInput.value = "";
		}
	});
});

document.addEventListener("DOMContentLoaded", function () {
	const logoutButton = document.getElementById("logout-button");

	function logoutUser() {
		window.location.href = "Login-Page.php";
	}

	logoutButton.addEventListener("click", function () {
		logoutUser();
	});
});

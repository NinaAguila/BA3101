document.addEventListener("DOMContentLoaded", function () {
	const showPasswordCheckbox = document.getElementById("show-password");
	const passwordInput = document.getElementById("password");

	function togglePassword() {
		if (passwordInput.type === "password") {
			passwordInput.type = "text";
		} else {
			passwordInput.type = "password";
		}
	}

	showPasswordCheckbox.addEventListener("change", function () {
		togglePassword();
	});
});

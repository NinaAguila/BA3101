document.addEventListener("DOMContentLoaded", function () {
	const urlParams = new URLSearchParams(window.location.search);
	const lastName = urlParams.get("lastName");
	const firstName = urlParams.get("firstName");

	console.log("Last Name:", lastName);
	console.log("First Name:", firstName);

	const fullName = lastName + ", " + firstName;

	document.getElementById("employee-name").value = fullName;
});

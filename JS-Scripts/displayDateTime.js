document.addEventListener("DOMContentLoaded", function () {
	const currentDateTimeElement = document.getElementById("current-date-time");

	function getCurrentDateTime() {
		const now = new Date();
		const options = { weekday: "long", year: "numeric", month: "long", day: "numeric", hour: "numeric", minute: "numeric", second: "numeric" };
		const formattedDateTime = now.toLocaleDateString("en-US", options).replace(" at", " |");

		return formattedDateTime;
	}

	function updateDateTime() {
		currentDateTimeElement.textContent = getCurrentDateTime();
	}

	updateDateTime();

	setInterval(updateDateTime, 1000);
});

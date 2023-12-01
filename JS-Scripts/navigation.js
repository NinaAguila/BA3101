document.addEventListener("DOMContentLoaded", function () {
	const overviewLink = document.getElementById("overview-link");
	const contentSections = document.querySelectorAll(".main-content > .display-section > div");

	function showOverviewContent() {
		contentSections.forEach((section) => {
			section.style.display = "none";
		});
		document.getElementById("overview-content").style.display = "block";
	}

	function highlightLink(link) {
		const allLinks = document.querySelectorAll(".sidebar nav div");
		allLinks.forEach((navLink) => {
			navLink.classList.remove("highlighted");
		});
		link.classList.add("highlighted");
	}

	function showClickedContent(event) {
		const clickedLink = event.target.closest("div");

		if (clickedLink) {
			const contentIdToShow = clickedLink.id.replace("-link", "-content");
			const contentToShow = document.getElementById(contentIdToShow);

			if (contentToShow) {
				contentSections.forEach((section) => {
					section.style.display = "none";
				});
				contentToShow.style.display = "block";
				highlightLink(clickedLink);
			}
		}
	}

	overviewLink.addEventListener("click", function () {
		showOverviewContent();
		highlightLink(overviewLink);
	});

	showOverviewContent();
	highlightLink(overviewLink);

	const navigationLinks = document.querySelectorAll(".sidebar nav div");
	navigationLinks.forEach((link) => {
		link.addEventListener("click", showClickedContent);
	});
});

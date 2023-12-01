document.querySelector("#show-login").addEventListener("click", function () {
  document.querySelector("#pop-up").classList.add("active");
});

document
  .querySelector(".pop-up-return .close")
  .addEventListener("click", function () {
    document.querySelector("#pop-up").classList.remove("active");
  });
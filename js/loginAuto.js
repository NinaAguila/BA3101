$(document).ready(function () {
  $(".login-form").on("submit", function (e) {
    e.preventDefault();
    var formData = $(this).serialize();
    var actionUrl = $(this).attr("action");

    $.ajax({
      type: "POST",
      url: actionUrl,
      data: formData,
      dataType: "json",
      success: function (response) {
        if (response.success) {
          Swal.fire({
            icon: "success",
            title: "Success",
            text: "Login Successful",
          }).then(function () {
            window.location.href = response.redirect;
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error",
            text: response.message,
            showConfirmButton: true,
          });
        }
      },
      error: function (xhr, status, error) {
        console.error(error);
        Swal.fire({
          icon: "error",
          title: "Error",
          text: "An error occurred. Please try again.",
          showConfirmButton: true,
        });
      },
    });
  });
});

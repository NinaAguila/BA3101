$(document).ready(function () {
  // AJAX for adding or updating employee
  $("form[action='../form/form-staff-submit.php']").submit(function (e) {
      e.preventDefault();
      var formData = new FormData(this);

      $.ajax({
          type: "POST",
          url: "../form/form-staff-submit.php",
          data: formData,
          processData: false,
          contentType: false,
          dataType: "json", // Expect JSON response
          success: function (response) {
              Swal.fire({
                  icon: response.success ? "success" : "error",
                  title: response.success ? "Success" : "Error",
                  text: response.message,
                  showConfirmButton: false,
                  timer: response.success ? 3000 : 2000,
              }).then(function () {
                  if (response.success) {
                      window.location.href = "../admin/admin-adddelete-staff.php";
                  }
              });
          },
          error: function (xhr, status, error) {
              console.error(error);
              Swal.fire({
                  icon: "error",
                  title: "Error",
                  text: "Failed to add employee. Please try again.",
              });
          },
      });
  });

  // AJAX for deleting staff
  $("form[action='../action/delete-staff.php']").submit(function (e) {
      e.preventDefault();
      var deleteStaffId = $(this).find("select[name='deleteStaffId']").val();

      $.ajax({
          type: "POST",
          url: "../action/delete-staff.php",
          data: { deleteStaffId: deleteStaffId },
          dataType: "json",
          success: function (response) {
              Swal.fire({
                  icon: response.success ? "success" : "error",
                  title: response.success ? "Success" : "Error",
                  text: response.message,
                  showConfirmButton: false,
                  timer: response.success ? 3000 : 2000,
              }).then(function () {
                  if (response.success) {
                      window.location.href = "../admin/admin-adddelete-staff.php";
                  }
              });
          },
          error: function (xhr, status, error) {
              console.error(error);
              Swal.fire({
                  icon: "error",
                  title: "Error",
                  text: "Failed to delete staff. Please try again.",
              });
          },
      });
  });

  // AJAX for deleting admin
  $("form[action='../action/delete-admin.php']").submit(function (e) {
      e.preventDefault();
      var deleteAdminId = $(this).find("select[name='deleteAdminId']").val();

      $.ajax({
          type: "POST",
          url: "../action/delete-admin.php",
          data: { deleteAdminId: deleteAdminId },
          dataType: "json",
          success: function (response) {
              Swal.fire({
                  icon: response.success ? "success" : "error",
                  title: response.success ? "Success" : "Error",
                  text: response.message,
                  showConfirmButton: false,
                  timer: response.success ? 3000 : 2000,
              }).then(function () {
                  if (response.success) {
                      window.location.href = "../admin/admin-adddelete-staff.php";
                  }
              });
          },
          error: function (xhr, status, error) {
              console.error(error);
              Swal.fire({
                  icon: "error",
                  title: "Error",
                  text: "Failed to delete admin. Please try again.",
              });
          },
      });
  });
});

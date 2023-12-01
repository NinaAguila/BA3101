$(document).ready(function () {
  $("form[action='../form/form-equip-submit.php']").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);

    $.ajax({
      type: "POST",
      url: "../form/form-equip-submit.php",
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
            window.location.href = "../admin/admin-adddelete-equipment.php";
          }
        });
      },
      error: function (xhr, status, error) {
        console.error(error);
        Swal.fire({
          icon: "error",
          title: "Error",
          text: "Failed to add equipment. Please try again.",
        });
      },
    });
  });

  // Additional AJAX for equipment deletion form
  $("form[action='../action/delete-equip.php']").submit(function (e) {
    e.preventDefault();
    var deleteId = $(this).find("select[name='deleteId']").val();

    $.ajax({
      type: "POST",
      url: "../action/delete-equip.php",
      data: { deleteId: deleteId },
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
            window.location.href = "../admin/admin-adddelete-equipment.php";
          }
        });
      },
      error: function (xhr, status, error) {
        console.error(error);
        Swal.fire({
          icon: "error",
          title: "Error",
          text: "Failed to delete equipment. Please try again.",
        });
      },
    });
  });
});$(document).ready(function () {
  $("form[action='../form/form-equip-submit.php']").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);

    $.ajax({
      type: "POST",
      url: "../form/form-equip-submit.php",
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
            window.location.href = "../admin/admin-adddelete-equipment.php";
          }
        });
      },
      error: function (xhr, status, error) {
        console.error(error);
        Swal.fire({
          icon: "error",
          title: "Error",
          text: "Failed to add equipment. Please try again.",
        });
      },
    });
  });

  // Additional AJAX for equipment deletion form
  $("form[action='../action/delete-equip.php']").submit(function (e) {
    e.preventDefault();
    var deleteId = $(this).find("select[name='deleteId']").val();

    $.ajax({
      type: "POST",
      url: "../action/delete-equip.php",
      data: { deleteId: deleteId },
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
            window.location.href = "../admin/admin-adddelete-equipment.php";
          }
        });
      },
      error: function (xhr, status, error) {
        console.error(error);
        Swal.fire({
          icon: "error",
          title: "Error",
          text: "Failed to delete equipment. Please try again.",
        });
      },
    });
  });
});
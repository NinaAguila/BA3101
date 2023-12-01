function showAlert(status, message) {
  if (status === "success") {
    Swal.fire({
      icon: "success",
      title: "Success",
      text: "Equipment stock deducted successfully.",
    }).then(function () {
      // Reset the form after successful deduction
      document.getElementById("equipmentForm").reset();
    });
  } else if (status.startsWith("error")) {
    Swal.fire({
      icon: "error",
      title: "Error",
      text: "Error deducting equipment stock: " + message,
    });
  } else {
    // Handle other cases if needed
  }
}

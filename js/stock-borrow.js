function borrowEquipment() {
  var formData = new FormData(document.getElementById("borrow-form"));

  // AJAX request to send form data to PHP script
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "../staff-out/staffout-borrow-process.php", true);
  xhr.onload = function () {
    if (xhr.status == 200) {
      var responseArray = xhr.responseText.split("|");

      if (responseArray[0] === "success") {
        var studentName = responseArray[1];
        var srCode = responseArray[2];

        swal(
          "Success",
          "Equipment borrowed successfully\nStudent Name: " +
            studentName +
            "\nSR Code: " +
            srCode
        ).then(function () {
          // Reset the form after successful borrowing
          document.getElementById("borrow-form").reset();
        });
        // You can add additional actions after successful borrowing
      } else {
        swal("Error", responseArray[0], "error");
      }
    }
  };
  xhr.send(formData);
}

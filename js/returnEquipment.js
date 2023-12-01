function returnEquipment(studentID, quantityReturned, equipmentName, borrowID) {
  var returnDate = prompt("Enter the return date (YYYY-MM-DD):");

  if (returnDate !== null) {
    // AJAX request to send data to the server
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../staff-in/staffin-return-process.php", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onload = function () {
      if (xhr.status === 200) {
        var response = JSON.parse(xhr.responseText);
        alert(response.message);
        // Reload the page or update the table as needed
        location.reload();
      }
    };

    var data =
      "studid=" +
      studentID +
      "&borrowed_quantity=" +
      quantityReturned +
      "&equipment_name=" +
      equipmentName +
      "&returned_date=" +
      returnDate +
      "&borrow_ID=" +
      borrowID;

    xhr.send(data);
  }
}
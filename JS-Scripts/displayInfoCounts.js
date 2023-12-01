document.addEventListener('DOMContentLoaded', function () {
    fetch('../PHP-Scripts/getInfoCounts.php')
        .then(response => response.json())
        .then(data => {
            const totalStockOutCount = data.totalStockOut;
            document.getElementById('total-sales').innerHTML = totalStockOutCount;
        })
        .catch(error => console.error('Error fetching total stock out count:', error));

    fetch('../PHP-Scripts/getInfoCounts.php')
        .then(response => response.json())
        .then(data => {
            document.getElementById('display-total').textContent = data.productCount;
        })
        .catch(error => console.error('Error fetching product count:', error));
});

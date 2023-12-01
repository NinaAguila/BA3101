document.getElementById("add-new-products-link").addEventListener("click", function () {
    Swal.fire({
        title: "Add New Product",
        html:
            '<form id="addProductForm" enctype="multipart/form-data" autocomplete="off">' +
            '<div class="swal2-input-group">' +
            '   <label for="productName" class="swal2-label">Product Name</label>' +
            '   <input type="text" id="productName" name="product-name" class="swal2-input" placeholder="Product Name" required>' +
            '</div>' +
            '<div class="swal2-input-group">' +
            '   <label for="productImage" class="swal2-label">Product Image</label>' +
            '   <input type="file" id="productImage" name="product-image" class="swal2-file" accept="image/*" required>' +
            '</div>' +
            '<div id="dynamicInput" class="swal2-input-group">' +
            '   <label for="productSize" class="swal2-label">Product Size</label>' +
            '   <input type="text" class="swal2-input" placeholder="Product Size" name="product-sizes[]" required>' +
            '</div>' +
            '<div id="dynamicInput" class="swal2-input-group">' +
            '   <label for="productPrice" class="swal2-label">Product Price</label>' +
            '   <input type="number" class="swal2-input" placeholder="Product Price" name="product-prices[]" required>' +
            '</div>' +
            '<button type="button" onclick="addInput()">Add Another Size</button>' +
            '</form>',
        showCancelButton: true,
        confirmButtonText: "Add Product",
        showLoaderOnConfirm: true,
        heightAuto: false,
        preConfirm: () => {
            const productName = Swal.getPopup().querySelector("#productName").value;
            const productImage = Swal.getPopup().querySelector("#productImage").files[0];
            const productSizes = document.querySelectorAll("#dynamicInput input[name='product-sizes[]']");
            const productPrices = document.querySelectorAll("#dynamicInput input[name='product-prices[]']");

            // Create FormData to handle file upload and dynamic sizes/prices
            const formData = new FormData();
            formData.append("product-name", productName);
            formData.append("product-image", productImage);

            productSizes.forEach((size, index) => {
                formData.append(`product-sizes[${ index }]`, size.value);
            });

            productPrices.forEach((price, index) => {
                formData.append(`product-prices[${ index }]`, price.value);
            });

            // Send data to the server or database using fetch
            return fetch("../PHP-Scripts/insertNewProduct.php", {
                method: "POST",
                body: formData,
            })
                .then(response => {
                    console.log('Response from server:', response);
                    if (!response.ok) {
                        throw new Error('Error adding product');
                    }
                    return response.json();
                })

                .then(data => {
                    // Process the response data if needed
                    return data;
                })
                .catch(error => {
                    console.error('Error:', error);
                    Swal.showValidationMessage(`Request failed: ${ error.message }`);
                    return Promise.reject(error);
                });

        },
        allowOutsideClick: () => !Swal.isLoading(),
    })// ...

    .then(result => {
        if (result.isConfirmed) {
            const addedProductName = document.getElementById("productName").value;
            const addedProductImageInput = document.getElementById("productImage");
            const addedProductImage = addedProductImageInput.files.length > 0
                ? addedProductImageInput.files[0].name
                : null;

            // Save the product information to localStorage
            const productData = {
                name: addedProductName,
                image: addedProductImage,
            };

            // Generate a unique key for each product
            const productKey = `product_${Date.now()}`;

            localStorage.setItem(productKey, JSON.stringify(productData));

            // Display the product in the view-stocks-content
            displayProductInUI(addedProductName, addedProductImage, productKey);
    
            Swal.fire({
                title: 'Product Added!',
                text: '',
                icon: 'success',
                timer: 2000,
                showConfirmButton: false,
                heightAuto: false,
            });
        }
    });
});

// ... Your existing code ...

function displayProductInUI(productName, productImage, productKey) {
    const newProductBox = document.createElement("div");
    newProductBox.classList.add("product-box");

    const productImageElement = document.createElement("div");
    productImageElement.classList.add("product-image");
    productImageElement.innerHTML = `<img src="../images/${productImage}" alt="${productName}">`;
    newProductBox.appendChild(productImageElement);

    const productNameElement = document.createElement("div");
    productNameElement.classList.add("product-name");
    productNameElement.textContent = productName;
    newProductBox.appendChild(productNameElement);

    // Store the productKey in a data attribute for later retrieval
    newProductBox.setAttribute("data-product-key", productKey);

    const viewStocksContent = document.getElementById("view-stocks-content");

    // Check if the product-container already exists, create one if not
    let productContainer = viewStocksContent.querySelector(".product-container");
    if (!productContainer) {
        productContainer = document.createElement("div");
        productContainer.classList.add("product-container");
        viewStocksContent.appendChild(productContainer);
    }

    // Append the product-box to the product-container
    productContainer.appendChild(newProductBox);
}

// ... Your existing code ...


// Call the function to display products when the page loads
displayProductsFromStorage();





    
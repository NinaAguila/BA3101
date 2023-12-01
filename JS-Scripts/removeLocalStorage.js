// Assuming you have a specific key for the item you want to remove
const itemKeyToRemove = 'yourItemKey';

// Remove the item from local storage
localStorage.removeItem(itemKeyToRemove);

// Optional: Update the UI or perform any other actions after removing the item
// For example, if you want to remove the corresponding element from the view-stocks-content
const removedElement = document.querySelector(`[data-product-key="${itemKeyToRemove}"]`);
if (removedElement) {
    removedElement.remove();
}


// Remove all items from local storage
localStorage.clear();

// Optional: Update the UI or perform any other actions after clearing local storage
// For example, if you want to clear all elements from the view-stocks-content
const viewStocksContent = document.getElementById("view-stocks-content");
viewStocksContent.innerHTML = '';

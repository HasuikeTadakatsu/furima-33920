function item_price() {
  const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('input', () => {
      const price = itemPrice.value;
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      const taxPrice = price * 0.1;
      const saleProfit = price - taxPrice;
      
      addTaxPrice.innerHTML = taxPrice;
      profit.innerHTML = saleProfit; 
  });
}
window.addEventListener("load", item_price);
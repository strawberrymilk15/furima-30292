window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const salesCommission = document.getElementById("add-tax-price");
    salesCommission.innerHTML = Math.floor(inputValue * 0.1);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - salesCommission.innerHTML);
  })
});

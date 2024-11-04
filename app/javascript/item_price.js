const price = () => {
 const priceInput = document.getElementById("item-price");
 const salesCommission = document.getElementById("add-tax-price");
 const salesProfit = document.getElementById("profit");

priceInput.addEventListener('input', () => {
  const inputValue = priceInput.value;
  const tax = 0.1;
  const commission = Math.floor(inputValue * tax);
  const profit = inputValue - commission;
  salesCommission.innerHTML = commission;
  salesProfit.innerHTML = profit;
});
};

  window.addEventListener("turbo:load", price);
  window.addEventListener("turbo:render", price);

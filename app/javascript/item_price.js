const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () =>{
  const inputValue = priceInput.value;
  inputValue

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  addTaxDom

  const salesProfit = document.getElementById("profit");
  salesProfit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  salesProfit
})
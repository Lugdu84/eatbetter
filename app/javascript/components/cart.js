const up = document.querySelector("#up");
const down = document.querySelector("#down");
const displayQuantity = document.querySelector("#display-quantity");
let integerQuantity = Number(displayQuantity.innerText);
up.addEventListener("click", event => {
  if (integerQuantity <= 19) {
  integerQuantity += 1;
  displayQuantity.innerText = integerQuantity.toString();
  }
})
down.addEventListener("click", event => {
  if (integerQuantity >= 2) {
  integerQuantity -= 1;
  displayQuantity.innerText = integerQuantity.toString();
  }
})



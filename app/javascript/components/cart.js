const initCart = () => {
  const up = document.querySelector("#up");
  const down = document.querySelector("#down");
  const displayQuantity = document.querySelector("#display-quantity");
  if (displayQuantity) {
    const numberValue = document.getElementById('myNumber');
    let integerQuantity = Number(displayQuantity.innerText);
    up.addEventListener("click", event => {
      if (integerQuantity <= 19) {
        integerQuantity += 1;
        displayQuantity.innerText = integerQuantity.toString();
        numberValue.value = integerQuantity
      }
    })
    down.addEventListener("click", event => {
      if (integerQuantity >= 2) {
        integerQuantity -= 1;
        displayQuantity.innerText = integerQuantity.toString();
        numberValue.value = integerQuantity;
      }
    })
  }
  }


export { initCart };



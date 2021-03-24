const initCart = () => {
  const up = document.querySelector("#up");
  const down = document.querySelector("#down");
  const displayQuantity = document.querySelector("#display-quantity");
  if (displayQuantity) {
    const numberValue = document.getElementById('myNumber');
    const productPrice = document.getElementById('price-product');
    const totalPrice = document.getElementById('total-item');
    let integerQuantity = Number(displayQuantity.innerText);
    let integerProductPrice = Number(productPrice.innerText);
    up.addEventListener("click", event => {
      if (integerQuantity <= 19) {
        integerQuantity += 1;
        let total = Math.round((integerQuantity * integerProductPrice) * 100) / 100;
        displayQuantity.innerText = integerQuantity.toString();
        numberValue.value = integerQuantity;
        totalPrice.innerText = `TOTAL : ${total.toString()}`;
      }
    })
    down.addEventListener("click", event => {
      if (integerQuantity >= 2) {
        integerQuantity -= 1;
        let total = Math.round((integerQuantity * integerProductPrice) * 100) / 100;
        displayQuantity.innerText = integerQuantity.toString();
        numberValue.value = integerQuantity;
        totalPrice.innerText = `TOTAL : ${total.toString()}`;
      }
    })
  }
  }


export { initCart };



const initCart= () => {
  const cart= document.querySelector("#product-cart")
  if (cart) {
    const up = document.querySelector("#up")
    const down = document.querySelector("#down")
    const displayQuantity = document.querySelector("#display-quantity")
  //j'école le click sur UP
    up.addEventListener("click",(event)=>{
      if (displayQuantity.innerText !== "10") {
        const newValue = Number(document.querySelector("#myNumber").value)+1
        document.querySelector("#myNumber").value = newValue
        document.querySelector("#display-quantity").innerText = newValue
      }
    })
  //je récupére la valeur dans Input
  // j'ajoute +1
  // j'affecte la nouvelle valeur a Input et au display quantity
    down.addEventListener("click",(event)=>{
        if (displayQuantity.innerText !== "1") {
          const newValue = Number(document.querySelector("#myNumber").value)-1
          document.querySelector("#myNumber").value = newValue
          document.querySelector("#display-quantity").innerText = newValue
        }
    })
  }
}
export {initCart}

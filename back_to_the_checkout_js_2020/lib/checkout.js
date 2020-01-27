
const priceList = {
  A: {price: 50, specialRules:[{qty: 3, price: 130}]},
  B: {price: 30, specialRules:[]},
  C: {price: 20, specialRules:[]}
}

// const priceList = {
//   A: (qty) => {
//     return Math.floor(qty /3) * 130 + (qty % 3) * 50

//   },
// }


class Checkout {

  constructor(pl = priceList) {
    this.priceList = pl
    this.total = 0
    this.items = {}
  }

  scan(sku) {
    this.items[sku] = this.items[sku] + 1 || 1
  }
  
  getTotal() {
    const total = Object.keys(this.items).reduce((acc, sku) => {
      return acc + this.priceList[sku].price * this.items[sku]
    }, 0)
    return total
  }

}

// function Checkout() {
//   this.total = 0
// }

// Checkout.prototype.scan = function(sku){
//   this.total = 50
// }

module.exports = Checkout
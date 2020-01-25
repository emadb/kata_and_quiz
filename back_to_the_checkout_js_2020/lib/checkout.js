class Checkout {
  constructor() {
    this.total = 0
  }

  scan(sku) {
    this.total += 50
  }

}

// function Checkout() {
//   this.total = 0
// }

// Checkout.prototype.scan = function(sku){
//   this.total = 50
// }

module.exports = Checkout
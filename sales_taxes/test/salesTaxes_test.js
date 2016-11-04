var assert = require("chai").assert;
var SalesTaxes = require("../libs/SalesTaxes");
var st = null

describe("Sales taxes", function() {
  
  beforeEach(function(){
    st = new SalesTaxes()
  })

  it("return true", function() {    
    assert.isTrue(st.foo())
  })

  it('one item with taxes', function() {

    var items = [
      {qty: 1, type: 'book', price: 12.49},
      {qty: 1, type: 'music CD', price: 14.99},
      {qty: 1, type: 'chocolate bar', price: 0.85},
    ]

    var receipt = st.receipt(items)

    assert.equal(receipt.salesTaxes, 1.50)
    assert.equal(receipt.total, 29.83)
  })

  it('imported items with taxes', function() {

    var items = [
      {qty: 1, type: 'box of chocolates', price: 10.00, imported: true},
      {qty: 1, type: 'bottle of perfume', price: 47.50, imported: true},
    ]

    var receipt = st.receipt(items)

    assert.equal(receipt.salesTaxes, 7.63)
    assert.equal(receipt.total, 65.13)
  })

  it('imported items with taxes 2', function() {

    var items = [
      {qty: 1, type: 'box of chocolates', price: 11.25, imported: true},
      {qty: 1, type: 'bottle of perfume', price: 27.99, imported: true},
      {qty: 1, type: 'bottle of perfume', price: 18.99},
      {qty: 1, type: 'headache pills', price: 9.75, }
    ]

    var receipt = st.receipt(items)

    assert.equal(receipt.salesTaxes, 6.66)
    assert.equal(receipt.total, 74.64)
  })



})

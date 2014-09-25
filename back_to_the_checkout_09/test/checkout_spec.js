var sinon = require("sinon");
var Checkout = require("../libs/checkout");
var should = require("should");

describe("Checkout", function() {
  var checkout;

  beforeEach(function() {
    var pricingRules = [
      { sku: "A", price: 50, quantity: 1},
      { sku: "A", price: 130, quantity: 3},
      { sku: "B", price: 30, quantity: 1},
      { sku: "B", price: 45, quantity: 2},
      { sku: "C", price: 20, quantity: 1},
      { sku: "D", price: 15, quantity: 1},
      
    ];
    checkout = new Checkout(pricingRules);
  }); 

  it("scan an empty sku should return 0", function() {
    checkout.scan("");

    checkout.total().should.equal(0);
  });

  it("scan A should return 50", function() {
    checkout.scan("A");

    checkout.total().should.equal(50);
  });

  it("scan A and B should return 80", function() {
    checkout.scan("A");
    checkout.scan("B");
    checkout.total().should.equal(80);
  });

  it("scan C, D, B, A should return 115", function() {
    checkout.scan("C");
    checkout.scan("D");
    checkout.scan("B");
    checkout.scan("A");
    checkout.total().should.equal(115);
  });
  
  it("scan A, A should return 100", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.total().should.equal(100);
  });

  it("scan A, A, A should return 130", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.total().should.equal(130);
  });

  it("scan A, A, A, A should return 180", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.total().should.equal(180);
  });


  it("scan A, A, A, B, B should return 175", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("B");
    checkout.scan("B");
    checkout.total().should.equal(175);
  });
});
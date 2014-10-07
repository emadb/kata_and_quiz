var Checkout = require("../libs/checkout");
var pricingRules = require("../libs/pricingRules");
var should = require("should");


describe("Integration", function() {

  beforeEach(function(){
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

  it("scan A, A, A, A should return 180", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.total().should.equal(180);
  });

  it("scan A, A, A, A, A should return 230", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.total().should.equal(230);
  });

  it("scan A, A, A, A, A, A should return 260", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.total().should.equal(260);
  });

  it("scan A, A, A, B should return 160", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("B");
    checkout.total().should.equal(160);
  });

  it("scan A, A, A, B, B should return 175", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("B");
    checkout.scan("B");
    checkout.total().should.equal(175);
  });

  it("scan A, A, A, B, B, D should return 190", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("B");
    checkout.scan("B");
    checkout.scan("D");
    checkout.total().should.equal(190);
  });

  it("scan D, A, B, A, B, A should return 190", function() {
    checkout.scan("D");
    checkout.scan("A");
    checkout.scan("B");
    checkout.scan("A");
    checkout.scan("B");
    checkout.scan("A");
    checkout.total().should.equal(190);
  });
});
var sinon = require("sinon");
var should = require("should");
var pricingRules = require("../libs/pricingRules");


describe("PricingRules", function() {

  it("sku A, qty 0 should return 0", function() {
    var price = pricingRules("A", 0);

    price.should.equal(0);
  });

  it("sku A, qty 1 should return 50", function() {
    var price = pricingRules("A", 1);

    price.should.equal(50);
  });

  it("sku A, qty 2 should return 100", function() {
    var price = pricingRules("A", 2);

    price.should.equal(100);
  });

  it("sku A, qty 3 should return 130", function() {
    var price = pricingRules("A", 3);

    price.should.equal(130);
  });

  it("sku B, qty 1 should return 30", function() {
    var price = pricingRules("B", 1);

    price.should.equal(30);
  });

  it("sku B, qty 2 should return 45", function() {
    var price = pricingRules("B", 2);

    price.should.equal(45);
  });
});
var sinon = require("sinon");
var Checkout = require("../libs/checkout");
var should = require("should");


describe("Checkout", function() {
  var pricingRules = sinon.stub();
  beforeEach(function(){
    checkout = new Checkout(pricingRules);
  });

  it("scan an empty sku should return 0", function() {
    checkout.scan("");

    checkout.total().should.equal(0);
  });

  it("scan A should return 50", function() {
    checkout.scan("A");
    pricingRules.withArgs("A", 1).returns(50);
    checkout.total().should.equal(50);
  });

  it("scan A, A should return 100", function() {
    checkout.scan("A");
    checkout.scan("A");

    pricingRules.withArgs("A", 2).returns(100);

    checkout.total().should.equal(100);
  });

  it("scan A, A, A should return 130", function() {
    checkout.scan("A");
    checkout.scan("A");
    checkout.scan("A");

    pricingRules.withArgs("A", 3).returns(130);

    checkout.total().should.equal(130);
  });
});
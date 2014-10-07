var _ = require('lodash');

module.exports = (function() {

  var _pricingRules;
  var basket;

	var Checkout = function(pricingRules) {
    basket = {};
    _pricingRules = pricingRules;
	};

	Checkout.prototype.scan = function(sku) {
    if (sku.length > 0){
      basket[sku] = basket[sku] + 1 || 1;
    }
	};

  Checkout.prototype.total = function() {
    var runningTotal = 0;
    Object.keys(basket).forEach(function(sku){
      runningTotal += _pricingRules(sku, basket[sku]);
    });
    return runningTotal;
  };

	return Checkout;

})();
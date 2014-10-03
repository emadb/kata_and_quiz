var _ = require('lodash');

module.exports = (function() {

  var _pricingRules;
  var basket;

	var Checkout = function(pricingRules) {
    basket = {};
    _pricingRules = pricingRules;
	};

	Checkout.prototype.scan = function(sku) {
    basket[sku] = basket[sku]+1 || 1;
	};

  Checkout.prototype.total = function() {
    var keys = _.without(Object.keys(basket), "");

    var currentTotal = _.reduce(keys, function(acc, k){
      return acc + (applyRules(getRules(k), findRule));
    }, 0);

    return currentTotal;          
  };
   
  var getRules = function(sku) {
    return _.filter(_pricingRules, function(rule) {
        return rule.sku === sku;
      });
  };

  var applyRules = function(rules, findRuleFunction) {
      var rule = findRuleFunction.apply(this, [rules]);

      basket[rule.sku] = basket[rule.sku] - rule.quantity;

      if(basket[rule.sku] > 0)
        return rule.price + applyRules(rules, findRuleFunction);

      return rule.price;
  };

  var findRule = function(rules) {
    var orderedRules = _.sortBy(rules, function(r){
        return -1 * r.quantity;
      });

    return _.find(orderedRules, function(r){
        return r.quantity <= basket[r.sku];
      });
  };

	return Checkout;

})();
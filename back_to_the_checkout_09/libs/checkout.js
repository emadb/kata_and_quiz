var _ = require('lodash');

module.exports = (function() {

  var pricingRules;

	var Checkout = function(pricingRules) {
    this.basket = {};
    this.pricingRules = pricingRules;
	};

	Checkout.prototype.scan = function(sku) {
    this.basket[sku] = this.basket[sku]+1 || 1;
	};

  Checkout.prototype.total = function() {
    var self = this;
    var keys = _.without(Object.keys(this.basket), "");

    var currentTotal = _.reduce(keys, function(acc, k){
      return acc + (self.basket[k] * self.applyRules(self.getRules(k)));
    }, 0);

    return currentTotal;          
  };

  Checkout.prototype.getPrice = function(sku) {
    return _.filter(this.pricingRules, function(rule) {
        return rule.sku === sku;
      }).price;
  };
   
  Checkout.prototype.getRules = function(sku) {
    return _.filter(this.pricingRules, function(rule) {
        return rule.sku === sku;
      });
  };

  Checkout.prototype.applyRules = function(rules) {
      var self = this;
      var orderedRules = _.sortBy(rules, function(r){
        return -1 * r.quantity;
      });

      var rule = _.find(orderedRules, function(r){
        return r.quantity <= self.basket[r.sku];
      });

      self.basket[rule.sku] = self.basket[rule.sku] - rule.quantity;

      return rule.price;
  };

	return Checkout;

})();
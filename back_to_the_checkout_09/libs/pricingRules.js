
var warehouse = {
  "A": function (qty){
    return Math.floor(qty / 3) * 130  + (qty % 3) * 50;
  },
  "B": function(qty){
    return Math.floor(qty / 2) * 45 + (qty % 2) * 30;
  },
  "C": function(qty){
    return qty * 20;
  },
  "D": function(qty){
    return qty * 15;
  }
};

module.exports = function(sku, qty){
  if (qty === 0)
    return 0;
  return warehouse[sku](qty);
};
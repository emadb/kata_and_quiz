

function CoffeeMachine(){
  this.credit = 0
  this.coins = []
}

CoffeeMachine.prototype.switchOn = function() { }

CoffeeMachine.prototype.insertCoin = function(coin){
  this.coins.push(coin)
  this.credit += coin
}

CoffeeMachine.prototype.makeCoffee = function(){
  if (this.credit >= 30)
    return {}
  return {text: '30cents for a coffee'}
}

CoffeeMachine.prototype.insertKey = function(obj){
  this.credit = obj.credit
}

CoffeeMachine.prototype.cancel = function() {
  return this.coins
}

module.exports = CoffeeMachine
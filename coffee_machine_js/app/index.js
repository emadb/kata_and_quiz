function Machine(){
  this.beverages = [new Coffee(), new Tea(), new Chocolate()]
  this.cash = 0
}

Machine.prototype.insertCoin = function(coin){
  this.cash = coin
}

Machine.prototype.prepare = function(cmd){
  let beverage = {type:'ND', sugar: 0, stick: false}
  const parts = cmd.split(':')
  
  beverage = this.beverages.reduce((acc, curr) => {
    const bev = curr.prepare(parts[0], this.cash)
    return bev || acc
  }, beverage)
  
  if (beverage.type === 'ND'){
    beverage.message = 'Not enough money'
  }

  if (parts[1]) {
    beverage.sugar = parseInt(parts[1])
    beverage.stick = true
  }
  
  return beverage
}

function Coffee(){
  this.price = 60
  this.type = 'Coffee'
}

Coffee.prototype.prepare = function(bevType, cash){
  const beverage = {type:'ND', sugar: 0, stick: false}
  if (bevType === 'C' && cash >= this.price) {
    beverage.type = 'Coffee'
    return beverage
  }  
}

function Tea(){
  this.price = 40
  this.type = 'Tea'
}

Tea.prototype.prepare = function(bevType, cash){
  const beverage = {type:'ND', sugar: 0, stick: false}
  if (bevType === 'T' && cash >= this.price) {
    beverage.type = 'Tea'
    return beverage
  }
}


function Chocolate(){
  this.price = 40
  this.type = 'Tea'
}

Chocolate.prototype.prepare = function(bevType, cash){
  const beverage = {type:'ND', sugar: 0, stick: false}
  if (bevType === 'H' && cash >= this.price) {
    beverage.type = 'Chocolate'
    return beverage
  }
}



module.exports = Machine
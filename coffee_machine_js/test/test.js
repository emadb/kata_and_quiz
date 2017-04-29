const assert = require('chai').assert
const CoffeeMachine = require('../app')

describe('Coffee Machine', function(){
  it('As a user I can switch on the coffee machine and it should became ready displaying the credit amount to zero', function(){
    const cf = new CoffeeMachine()
    cf.switchOn()
    assert.equal(cf.credit, 0)
  })

  it('As a user I can insert coins (5, 10, 20 cents) and the displayed credit should grow accordingly', function(){
    const cf = new CoffeeMachine()
    cf.insertCoin(5)
    cf.insertCoin(10)
    cf.insertCoin(20)

    assert.equal(cf.credit, 35)
  })

  it('Credit is enough for a coffee', function(){
    const cf = new CoffeeMachine()
    cf.insertCoin(10)
    cf.insertCoin(20)
    const coffee = cf.makeCoffee()
    assert.isDefined(coffee)
  })

  it('Credit is not enough for a coffee, should return a message', function(){
    const cf = new CoffeeMachine()
    cf.insertCoin(10)
    const message = cf.makeCoffee()
    assert.equal(message.text, '30cents for a coffee')
  })

  it('Use a prepayed system', function(){
    const cf = new CoffeeMachine()
    cf.insertKey({ credit: 10 })
    const message = cf.makeCoffee()
    assert.equal(message.text, '30cents for a coffee')
  })

  it('Use a prepayed system for makeing a cofee', function(){
    const cf = new CoffeeMachine()
    cf.insertKey({ credit: 30 })
    const coffee = cf.makeCoffee()
    assert.isDefined(coffee)
  })

  it('User can cancel the operation', function(){
    const cf = new CoffeeMachine()
    cf.insertCoin(10)
    cf.insertCoin(20)
    const [c1, c2] = cf.cancel()
    assert.equal(c1, 10)
    assert.equal(c2, 20)
  })

})
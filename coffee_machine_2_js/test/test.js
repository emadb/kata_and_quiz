const assert = require('chai').assert
const CoffeeMachine = require('../app')

describe('Coffee Machine', function(){
  it('As a user I can switch on the coffee machine and it should became ready displaying the credit amount to zero', function(){
    const cf = new CoffeeMachine()
    cf.switchOn()
    assert.equal(cf.credit, 0)
  })
})
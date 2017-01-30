const assert = require('chai').assert
const Machine = require('../app')

describe('Coffee machine', function() {
  it('should be able to prepare a Tea', function() {
    const machine = new Machine()
    machine.insertCoin(40)
    const beverage = machine.prepare('T:1:0')
    assert.equal(beverage.type, 'Tea')
  })

  it('should be able to prepare a Coffee', function() {
    const machine = new Machine()
    machine.insertCoin(60)
    const beverage = machine.prepare('C:1:0')
    assert.equal(beverage.type, 'Coffee')
  })

  it('should be able to prepare a Chocolate', function() {
    const machine = new Machine()
    machine.insertCoin(50)
    const beverage = machine.prepare('H:1:0')
    assert.equal(beverage.type, 'Chocolate')
  })

  it('should be able to prepare a Coffee with sugar', function() {
    const machine = new Machine()
    machine.insertCoin(60)
    const beverage = machine.prepare('C:1')
    assert.equal(beverage.type, 'Coffee')
    assert.equal(beverage.sugar, 1)
  })

  it('should be able to prepare a Coffee with two sugar', function() {
    const machine = new Machine()
    machine.insertCoin(60)
    const beverage = machine.prepare('C:2')
    assert.equal(beverage.type, 'Coffee')
    assert.equal(beverage.sugar, 2)
  })

  it('when sugar is present should add the stick', function() {
    const machine = new Machine()
    machine.insertCoin(60)
    const beverage = machine.prepare('C:1')
    assert.equal(beverage.type, 'Coffee')
    assert.equal(beverage.sugar, 1)
    assert.isTrue(beverage.stick)
  })

  it('when sugar is NOT present should NOT add the stick', function() {
    const machine = new Machine()
    machine.insertCoin(60)
    const beverage = machine.prepare('C::')
    assert.equal(beverage.type, 'Coffee')
    assert.equal(beverage.sugar, 0)
    assert.isFalse(beverage.stick)
  })

  it('amount is not enough should return an error message', function() {
    const machine = new Machine()
    machine.insertCoin(30)
    const beverage = machine.prepare('C::')
    assert.equal(beverage.type, 'ND')
    assert.equal(beverage.sugar, 0)
    assert.isFalse(beverage.stick)
    assert.equal('Not enough money', beverage.message)
  })

})
const { assert } = require('chai');
const Checkout = require('../lib/checkout')

describe('Back to the checkout', () => {
  it('Should be true', () => {
    assert.isTrue(true)
  });

  it('A single A should cost 50$', () => {

    const checkout = new Checkout()

    checkout.scan('A')
    assert.equal(checkout.total, 50)
  
  })

  it('Two A should cost 100$', () => {

    const checkout = new Checkout()

    checkout.scan('A')
    checkout.scan('A')
    assert.equal(checkout.total, 100)
  
  })
});
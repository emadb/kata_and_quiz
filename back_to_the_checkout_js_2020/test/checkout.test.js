const { assert } = require('chai');
const Checkout = require('../lib/checkout')

describe('Back to the checkout', () => {
  it('Should be true', () => {
    assert.isTrue(true)
  });

  it('An empty cart should return 0', () => {
    const checkout = new Checkout()
    assert.equal(checkout.getTotal(), 0)
  })

  it('A single A should cost 50$', () => {

    const checkout = new Checkout()

    checkout.scan('A')
    assert.equal(checkout.getTotal(), 50)
  
  })

  it('A single B should cost 30$', () => {

    const checkout = new Checkout()

    checkout.scan('B')
    assert.equal(checkout.getTotal(), 30)
  
  })

  it('A single C should cost 20$', () => {

    const checkout = new Checkout()

    checkout.scan('C')
    assert.equal(checkout.getTotal(), 20)
  
  })


  it('Two B should cost 60$', () => {

    const checkout = new Checkout()

    checkout.scan('B')
    checkout.scan('B')
    assert.equal(checkout.getTotal(), 60)
  
  })

  it('A and B should cost 80$', () => {

    const checkout = new Checkout()

    checkout.scan('A')
    checkout.scan('B')
    assert.equal(checkout.getTotal(), 80)
  
  })


  it('Two A should cost 100$', () => {

    const checkout = new Checkout()

    checkout.scan('A')
    checkout.scan('A')
    assert.equal(checkout.getTotal(), 100)
  
  })
 
  it('Three A should cost 130$', () => {

    const checkout = new Checkout()

    checkout.scan('A')
    checkout.scan('A')
    checkout.scan('A')
    assert.equal(checkout.getTotal(), 130)
  
  })
});
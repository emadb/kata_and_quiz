const assert = require('chai').assert
const score = require('../app')

describe('Tennis score', function(){

  it('At the beginning players are `love-love`', function(){
    const res = score()
    assert.equal(res, 'love-love')
  })

  it('player1 vs player2: 15-0', function(){
    const res = score(1, 0)
    assert.equal(res, '15-love')
  })

  it('player1 vs player2: 0-15', function(){
    const res = score(0, 1)
    assert.equal(res, 'love-15')
  })

  it('player1 vs player2: 30-0', function(){
    const res = score(2, 0)
    assert.equal(res, '30-love')
  })

  it('player1 vs player2: 40-0', function(){
    const res = score(3, 0)
    assert.equal(res, '40-love')
  })
  

})
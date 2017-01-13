const assert = require('chai').assert
const rover = require('../app')

describe('Mars rover', function(){
  it('should initialize the rover', function(){
    const pos = rover(1, 2, 'N')
    assert.equal(pos.x, 1)
    assert.equal(pos.y, 2)
    assert.equal(pos.direction, 'N')
  })

  describe('Forward and Back', function(){

    it('should execute a single `f` command', function(){
      const pos = rover(1, 2, 'N', ['f'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 3)
      assert.equal(pos.direction, 'N')
    })

    it('should execute two `f` commands ', function(){
      const pos = rover(1, 2, 'N', ['f', 'f'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 4)
      assert.equal(pos.direction, 'N')
    })

    it('should execute three `f` commands ', function(){
      const pos = rover(1, 2, 'N', ['f', 'f', 'f'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 5)
      assert.equal(pos.direction, 'N')
    })

    it('should execute a single `b` command', function(){
      const pos = rover(1, 2, 'N', ['b'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 1)
      assert.equal(pos.direction, 'N')
    })

    it('should execute two `b` commands', function(){
      const pos = rover(1, 2, 'N', ['b', 'b'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 0)
      assert.equal(pos.direction, 'N')
    })

    it('should execute `b` and `f` commands', function(){
      const pos = rover(1, 2, 'N', ['b', 'f'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 2)
      assert.equal(pos.direction, 'N')
    })

    // it('should move on x', function(){
    //   const pos = rover(5, 7, 'E', ['f'])
    //   assert.equal(pos.x, 4)
    //   assert.equal(pos.y, 7)
    //   assert.equal(pos.direction, 'E')
    // })
  })

  describe('Change direction', function(){
    it('should execute `l` command', function(){
      const pos = rover(1, 2, 'N', ['l'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 2)
      assert.equal(pos.direction, 'E')
    })

    it('should execute two `l` commands', function(){
      const pos = rover(1, 2, 'N', ['l', 'l'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 2)
      assert.equal(pos.direction, 'S')
    })

    it('should execute four `l` commands', function(){
      const pos = rover(1, 2, 'N', ['l', 'l', 'l', 'l'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 2)
      assert.equal(pos.direction, 'N')
    })

    it('should execute `r` command', function(){
      const pos = rover(1, 2, 'N', ['r'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 2)
      assert.equal(pos.direction, 'W')
    })

    it('should execute two `r` commands', function(){
      const pos = rover(1, 2, 'N', ['r', 'r'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 2)
      assert.equal(pos.direction, 'S')
    })

    it('should execute four `r` commands', function(){
      const pos = rover(1, 2, 'N', ['r', 'r', 'r', 'r'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 2)
      assert.equal(pos.direction, 'N')
    })

    it('should execute two `r` and `l` commands', function(){
      const pos = rover(1, 2, 'N', ['r', 'l'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 2)
      assert.equal(pos.direction, 'N')
    })

    it('should execute two `r`, `l`, `r` commands', function(){
      const pos = rover(1, 2, 'N', ['r', 'l', 'r'])
      assert.equal(pos.x, 1)
      assert.equal(pos.y, 2)
      assert.equal(pos.direction, 'W')
    })
  })

  describe('Mixed commands', function(){
    
  })
})
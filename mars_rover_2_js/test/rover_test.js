const assert = require('chai').assert
const rover = require('../app')

function assertSamePos(pos1, pos2){
  assert.equal(pos1.x, pos2.x)
  assert.equal(pos1.y, pos2.y)
  assert.equal(pos1.direction, pos2.direction)
}

describe('Mars rover', function(){
  it('should initialize the rover', function(){
    const pos = rover(1, 2, 'N')
    assertSamePos(pos, {x: 1, y: 2, direction: 'N'})
  })

  describe('Forward and Back', function(){

    it('should execute a single `f` command', function(){
      const pos = rover(1, 2, 'N', ['f'])
      assertSamePos(pos, {x: 1, y: 3, direction: 'N'})
    })

    it('should execute two `f` commands ', function(){
      const pos = rover(1, 2, 'N', ['f', 'f'])
      assertSamePos(pos, {x: 1, y: 4, direction: 'N'})
    })

    it('should execute three `f` commands ', function(){
      const pos = rover(1, 2, 'N', ['f', 'f', 'f'])
      assertSamePos(pos, {x: 1, y: 5, direction: 'N'})
    })

    it('should execute a single `b` command', function(){
      const pos = rover(1, 2, 'N', ['b'])
      assertSamePos(pos, {x: 1, y: 1, direction: 'N'})
    })

    it('should execute two `b` commands', function(){
      const pos = rover(1, 2, 'N', ['b', 'b'])
      assertSamePos(pos, {x: 1, y: 0, direction: 'N'})
    })

    it('should execute `b` and `f` commands', function(){
      const pos = rover(1, 2, 'N', ['b', 'f'])
      assertSamePos(pos, {x: 1, y: 2, direction: 'N'})
    })

    it('should move forward on x', function(){
      const pos = rover(5, 7, 'E', ['f'])
      assertSamePos(pos, {x: 4, y: 7, direction: 'E'})
    })

    it('should move backwards on x', function(){
      const pos = rover(5, 7, 'E', ['b'])
      assertSamePos(pos, {x: 6, y: 7, direction: 'E'})
    })

    it('should move forward on y', function(){
      const pos = rover(5, 7, 'S', ['f'])
      assertSamePos(pos, {x: 5, y: 6, direction: 'S'})
    })
  })

  describe('Change direction', function(){
    it('should execute `l` command', function(){
      const pos = rover(1, 2, 'N', ['l'])
      assertSamePos(pos, {x: 1, y: 2, direction: 'E'})
    })

    it('should execute two `l` commands', function(){
      const pos = rover(1, 2, 'N', ['l', 'l'])
      assertSamePos(pos, {x: 1, y: 2, direction: 'S'})
    })

    it('should execute four `l` commands', function(){
      const pos = rover(1, 2, 'N', ['l', 'l', 'l', 'l'])
      assertSamePos(pos, {x: 1, y: 2, direction: 'N'})
    })

    it('should execute `r` command', function(){
      const pos = rover(1, 2, 'N', ['r'])
      assertSamePos(pos, {x: 1, y: 2, direction: 'W'})
    })

    it('should execute two `r` commands', function(){
      const pos = rover(1, 2, 'N', ['r', 'r'])
      assertSamePos(pos, {x: 1, y: 2, direction: 'S'})
    })

    it('should execute four `r` commands', function(){
      const pos = rover(1, 2, 'N', ['r', 'r', 'r', 'r'])
      assertSamePos(pos, {x: 1, y: 2, direction: 'N'})
    })

    it('should execute two `r` and `l` commands', function(){
      const pos = rover(1, 2, 'N', ['r', 'l'])
      assertSamePos(pos, {x: 1, y: 2, direction: 'N'})
    })

    it('should execute two `r`, `l`, `r` commands', function(){
      const pos = rover(1, 2, 'N', ['r', 'l', 'r'])
      assertSamePos(pos, {x: 1, y: 2, direction: 'W'})
    })
  })

  describe('Mixed commands', function(){
    it('should execute complex commands', function(){
      const pos = rover(5, 5, 'N', ['f', 'f', 'r', 'f', 'f'])
      assert.equal(pos.x, 7)
      assert.equal(pos.y, 7)
      assert.equal(pos.direction, 'W')
    })

    it('should execute complex commands', function(){
      const pos = rover(5, 5, 'N', ['f', 'b', 'r', 'f', 'f'])
       assertSamePos(pos, {x: 7, y: 5, direction: 'W'})
    })

    it('should execute complex commands', function(){
      const pos = rover(5, 5, 'N', ['f', 'b', 'f', 'r', 'f', 'f', 'f', 'r'])
       assertSamePos(pos, {x: 8, y: 6, direction: 'S'})
    })
  })
})
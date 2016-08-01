var sinon = require('sinon');
var bowling = require('../libs/bowling');
var assert = require('chai').assert

assert.bowling = function(input, expected){
  var score = bowling.score(input)
  assert.equal(expected, score)
}


describe('Bowling', function() {

  describe('Single slot', function(){
    it('-- => 0', function(){
      assert.bowling('--', 0)
    })
    it('4- => 4', function(){
      assert.bowling('4-', 4)
    })
    it('-6 => 4', function(){
      assert.bowling('-6', 6)
    })
    it('36 => 4', function(){
      assert.bowling('36', 9)
    })
    it('31 => 4', function(){
      assert.bowling('31', 4)
    })
  })

  describe('Double slot', function(){
    it('4-32 => 9', function(){
      assert.bowling('4-32', 9)
    })
    it('4132 => 10', function(){
      assert.bowling('4132', 10)
    })
    it('413- => 8', function(){
      assert.bowling('413-', 8)
    })
    it('41-- => 5', function(){
      assert.bowling('41--', 5)
    })
    it('4--- => 4', function(){
      assert.bowling('4---', 4)
    })
    it('---- => 0', function(){
      assert.bowling('----', 0)
    })
  })


  
  it('9-9-9-9-9-9-9-9-9-9- should return 90', function() {
   assert.bowling('9-9-9-9-9-9-9-9-9-9-', 90)
  });

  describe('spare', function(){
    describe('If in two tries he knocks them all down the score for the frame is ten plus the number of pins knocked down on his next throw (in his next turn).', function(){
      it('5/34 => 20', function(){
        assert.bowling(5534, 20)
      })
      // it('3/34 => 20', function(){
    //     assert.bowling('3/34', 20)
    //   })
    //   it('3/15 => 17', function(){
    //     assert.bowling('3/15', 17)
    //   })
    })
  })
});

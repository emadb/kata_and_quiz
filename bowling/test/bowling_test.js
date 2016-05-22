var sinon = require("sinon");
var bowling = require("../libs/bowling");
var assert = require('chai').assert

describe("Bowling", function() {
  
  it("9-9-9-9-9-9-9-9-9-9- should return 90", function() {
   var score = bowling.score('9-9-9-9-9-9-9-9-9-9-')
   assert.equal(90, score)
  });


});

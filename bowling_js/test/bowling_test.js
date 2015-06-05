var sinon = require("sinon");
var should = require("should");
var Bowling = require("../libs/bowling");

describe("Bowling", function() {
  var bowling;

  it("with 10 empty frame score is zero ", function() {
    bowling = new Bowling();
    for(var i=0;i<20;i++) {
      bowling.roll(0);
    }
    bowling.score().should.be.equal(0);
  });
});

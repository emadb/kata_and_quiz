var sinon = require("sinon");
var should = require("should");
var Bowling = require("../libs/bowling");

describe("Bowling", function() {
  var bowling;
  beforeEach(function(){
    bowling = new Bowling();
  });

  it("with 10 empty frame score is zero ", function() {    
    for(var i=0;i<20;i++) {
      bowling.roll(0);
    }
    bowling.score().should.be.equal(0);
  });

  it("1 frame with 1 pin, score is 1", function() {
    bowling.roll(1);
    bowling.roll(0);
    
    bowling.score().should.be.equal(1);
  });

  it("1/2 frame with 3 pin, score is 3", function() {
    bowling.roll(3);
    
    bowling.score().should.be.equal(3);
  });

  it("2 frame with 3 and 4 pins, score is 7", function() {
    bowling.roll(1);
    bowling.roll(2);

    bowling.roll(3);
    bowling.roll(1);
    
    bowling.score().should.be.equal(7);
  });

  it("spare 6+4 and then 8+1, score is 27", function() {
    bowling.roll(6);
    bowling.roll(4);

    bowling.roll(8);
    bowling.roll(1);
    
    bowling.score().should.be.equal(27);
  });

  it("spare 3+7 and then 4+3, score is 21", function() {
    bowling.roll(3);
    bowling.roll(7);

    bowling.roll(4);
    bowling.roll(3);
    
    bowling.score().should.be.equal(21);
  });

  it("strike 10 and then 7+1, score is 26", function() {
    bowling.roll(10);
    
    bowling.roll(7);
    bowling.roll(1);
    
    bowling.score().should.be.equal(26);
  });

  it("9 and miss for 10 times, score is 90", function(){
    for(var i=0;i<10;i++){
      bowling.roll(9);
    }
    bowling.score().should.be.equal(90);
  });

  it("10 spares with 5, score is 150", function(){
    for(var i=0;i<10;i++){
      bowling.roll(5);
      bowling.roll(5);
    } 
    bowling.roll(5);

    bowling.inspectFrames();

    bowling.score().should.be.equal(150);
  });

  // it("prefect game is 300", function() {
  //   for(var i=0;i<12;i++) {
  //     bowling.roll(10);
  //   }

  //   bowling.score().should.be.equal(300);
  // });
});

var sinon = require("sinon")
var MarsRover = require("../libs/marsRover");
var should = require("should")

describe("MarsRover", function() {
  describe("move forward", function() {
    it("to north", function() {
      this.marsRover = new MarsRover(10,5, 'N');
      this.marsRover.moveForward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(10);
      pos.y.should.equal(6);
    });

    it("move forward to south", function() {      
      this.marsRover = new MarsRover(10,5, 'S');
      this.marsRover.moveForward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(10);
      pos.y.should.equal(4);
    });

    it("move forward to east", function() {
      this.marsRover = new MarsRover(10,5, 'E');
      this.marsRover.moveForward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(11);
      pos.y.should.equal(5);
    });

    it("move forward to west", function() {
      this.marsRover = new MarsRover(10,5, 'W');
      this.marsRover.moveForward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(9);
      pos.y.should.equal(5);
    });
  });

  describe("move backward", function() {
    it("move backward to north", function() {
      this.marsRover = new MarsRover(10,5, 'N');
      this.marsRover.moveBackward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(10);
      pos.y.should.equal(4);
    });

    it("move backward to south", function() {
      this.marsRover = new MarsRover(10,5, 'S');
      this.marsRover.moveBackward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(10);
      pos.y.should.equal(6);
    });

    it("move backward to east", function() {
      this.marsRover = new MarsRover(10,5, 'E');
      this.marsRover.moveBackward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(9);
      pos.y.should.equal(5);
    });

    it("move backward to west", function() {
      this.marsRover = new MarsRover(10,5, 'W');
      this.marsRover.moveBackward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(11);
      pos.y.should.equal(5);
    });
  });    
});
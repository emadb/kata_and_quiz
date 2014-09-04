var sinon = require("sinon")
var MarsRover = require("../libs/marsRover");
var should = require("should")

describe("MarsRover", function() {
  describe("move forward", function() {
    it("faced north", function() {
      this.marsRover = new MarsRover(10,5, 'N');
      this.marsRover.moveForward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(10);
      pos.y.should.equal(6);
    });

    it("faced south", function() {      
      this.marsRover = new MarsRover(10,5, 'S');
      this.marsRover.moveForward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(10);
      pos.y.should.equal(4);
    });

    it("faced east", function() {
      this.marsRover = new MarsRover(10,5, 'E');
      this.marsRover.moveForward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(11);
      pos.y.should.equal(5);
    });

    it("faced west", function() {
      this.marsRover = new MarsRover(10,5, 'W');
      this.marsRover.moveForward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(9);
      pos.y.should.equal(5);
    });
  });

  describe("move backward", function() {
    it("faced north", function() {
      this.marsRover = new MarsRover(10,5, 'N');
      this.marsRover.moveBackward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(10);
      pos.y.should.equal(4);
    });

    it("faced south", function() {
      this.marsRover = new MarsRover(10,5, 'S');
      this.marsRover.moveBackward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(10);
      pos.y.should.equal(6);
    });

    it("faced east", function() {
      this.marsRover = new MarsRover(10,5, 'E');
      this.marsRover.moveBackward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(9);
      pos.y.should.equal(5);
    });

    it("faced west", function() {
      this.marsRover = new MarsRover(10,5, 'W');
      this.marsRover.moveBackward();

      var pos = this.marsRover.getPosition();
      pos.x.should.equal(11);
      pos.y.should.equal(5);
    });
  });    

  describe("turn left", function() {
    it("faced north, should face west", function() {
      this.marsRover = new MarsRover(10,5, 'N');
      this.marsRover.turnLeft();

      var dir = this.marsRover.getDirection();
      dir.should.equal('W');
    });

    it("faced west, should face south", function() {
      this.marsRover = new MarsRover(10,5, 'W');
      this.marsRover.turnLeft();

      var dir = this.marsRover.getDirection();
      dir.should.equal('S');
    });

    it("faced south, should face east", function() {
      this.marsRover = new MarsRover(10,5, 'S');
      this.marsRover.turnLeft();

      var dir = this.marsRover.getDirection();
      dir.should.equal('E');
    });

    it("faced east, should face north", function() {
      this.marsRover = new MarsRover(10,5, 'E');
      this.marsRover.turnLeft();

      var dir = this.marsRover.getDirection();
      dir.should.equal('N');
    });
  });
});
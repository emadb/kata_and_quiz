var sinon = require("sinon");
var should = require("should");
var Minesweeper = require("../libs/minesweeper");

describe("Minesweeper", function() {
  var ms;

  it("process should display this string", function() {
    ms = new Minesweeper(4,4);
    var result = ms.process("*...\n....\n.*..\n....");
    result.should.be.equal("*100\n2210\n1*10\n1110");
  });

  it("process 1 char * should return *", function() {
    ms = new Minesweeper(1,1);
    var result = ms.process("*");
    result.should.be.equal("*");
  });

  it("process 2 chars *. should return *1", function() {
    ms = new Minesweeper(1,2);
    var result = ms.process("*.");
    result.should.be.equal("*1");
  });

  it("process 2 chars .* should return 1*", function() {
    ms = new Minesweeper(1,2);
    var result = ms.process(".*");
    result.should.be.equal("1*");
  });

  it("process 3 chars .*. should return 1*1", function() {
    ms = new Minesweeper(1,3);
    var result = ms.process(".*.");
    result.should.be.equal("1*1");
  });

  it("process 4 chars *.*. should return *2*1", function() {
    ms = new Minesweeper(1,4);
    var result = ms.process("*.*.");
    result.should.be.equal("*2*1");
  });

  it("two rows of 2 chars *. .. should return *1 11", function() {
    ms = new Minesweeper(2,2);
    var result = ms.process("*.\n..");
    result.should.be.equal("*1\n11");
  });


});

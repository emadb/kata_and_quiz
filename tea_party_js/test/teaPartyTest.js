var sinon = require("sinon");
var should = require("should");
var TeaParty = require("../libs/teaParty");

describe("TeaParty", function() {
  var tp;

  beforeEach(function(){
    tp = new TeaParty();
  });

  it("Jane Austen is a woman, so say Hello Ms. Austen", function() {
    var greetings = tp.greet("Jane", "Austen", 'woman');
    greetings.should.be.equal("Hello Ms. Austen");
  });

  it("George Orwell is a man, so say Hello Mr. Orwell", function() {
    var greetings = tp.greet("George", "Orwell", 'man');
    greetings.should.be.equal("Hello Mr. Orwell");
  });
  
  it("Isaac Newton was knighted, so say Hello Sir Newton", function() {
    var greetings = tp.greet("Isaac", "Newton", 'knight');
    greetings.should.be.equal("Hello Sir Newton");
  });
});
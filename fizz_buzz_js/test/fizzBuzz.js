var	sinon = require("sinon")
var FizzBuzz = require("../libs/fizzBuzz");
var should = require("should")

describe("FizzBuzz", function() {

	beforeEach(function() {
		this.fizzBuzz = new FizzBuzz();
	});

	it("1 should return 1", function() {
		var result = this.fizzBuzz.process(1);
		result.should.eql(1);
	});

	it("2 should return 2", function() {
		var result = this.fizzBuzz.process(2);
		result.should.eql(2);
	});

	it("3 should return fizz", function() {
		var result = this.fizzBuzz.process(3);
		result.should.eql('fizz');
	});

	it("6 should return fizz", function() {
		var result = this.fizzBuzz.process(6);
		result.should.eql('fizz');
	});

	it("5 should return buzz", function() {
		var result = this.fizzBuzz.process(5);
		result.should.eql('buzz');
	});

	it("15 should return fizzbuzz", function() {
		var result = this.fizzBuzz.process(15);
		result.should.eql('fizzbuzz');
	});

	it("zeroTo100 should process all numbers", function() {
		var result = this.fizzBuzz.oneTo100(function(res){
			console.log(res);
		});
		
	});

});
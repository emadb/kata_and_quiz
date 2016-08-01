var	sinon = require("sinon")
var greed = require("../libs/greed");
var assert = require("chai").assert

describe("greed", () => {
	it("should pass", () => {
		assert.isOk(greed)
	})

	it ('[1] should be 100', () => {
		const result = greed([1])
		assert.equal(100, result)
	})

	it ('[5] should be 50', () => {
		const result = greed([5])
		assert.equal(50, result)
	})

	it ('[1,1,1] should be 1000', () => {
		const result = greed([1,1,1])
		assert.equal(1000, result)
	})

	it ('[2,2,2] should be 200', () => {
		const result = greed([2,2,2])
		assert.equal(200, result)
	})

	it ('[3,3,3] should be 300', () => {
		const result = greed([3,3,3])
		assert.equal(300, result)
	})
	
	it ('[1,1,1,5,1] should be 1150', () => {
		const result = greed([1,1,1,5,1])
		assert.equal(1150, result)
	})

	it ('[2,3,4,6,2] should be 1150', () => {
		const result = greed([2,3,4,6,2])
		assert.equal(0, result)
	})

	it ('[3,4,5,3,3] should be 1150', () => {
		const result = greed([3,4,5,3,3])
		assert.equal(350, result)
	})
	
	it ('[1,5,1,2,4] should be 1150', () => {
		const result = greed([1,5,1,2,4])
		assert.equal(250, result)
	})

	it ('[5,5,5,5,5] should be 1150', () => {
		const result = greed([5,5,5,5,5])
		assert.equal(600, result)
	})
})
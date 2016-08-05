var	sinon = require("sinon")
var anagrams = require("../libs/anagrams");
var assert = require("chai").assert

describe("anagrams", () => {
	it("should pass", () => {
		assert.isOk(anagrams)
	})

	it("anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']", () => {
		var result = anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) 
		assert.include(result, 'aabb')
		assert.include(result, 'bbaa')
	})

	it("anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']", () => {
		var result = anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer'])
		assert.include(result, 'carer')
		assert.include(result, 'racer')
	})

	it("anagrams('laser', ['lazing', 'lazy',  'lacer']) => []", () => {
		var result = anagrams('laser', ['lazing', 'lazy',  'lacer'])
		assert.equal(0, result.length)
	})
})
var R = require('ramda')

var processors = [
	processBuilderN('1', 1000, 100),
	processBuilderN('2', 200, 0),
	processBuilderN('3', 300, 0),
	processBuilderN('4', 400, 0),
	processBuilderN('5', 500, 50),
]

function processBuilderN(n, q, m){
	return function(occMap){
		var mod = occMap[n] % 3 || 0
		var quo = Math.floor(occMap[n] / 3) || 0
		return quo * q + (mod * m)
	}
}

module.exports = function(rolls){
	var occurrenceMap = R.countBy(R.identity)(rolls)
	return processors.reduce((acc, cur) => acc + cur(occurrenceMap), 0)
}
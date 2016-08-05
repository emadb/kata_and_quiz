var R = require('ramda')

// 'abba', ['aabb', 'abcd', 'bbaa', 'dada']
function getChars(word){
  return R.sort(R.id, R.uniq(Array.from(word)))
}

module.exports = function(word, candidates){
	var chars = getChars(word)
  var compararer = c => R.equals(chars, getChars(c))
  return R.filter(compararer, candidates)
  
}
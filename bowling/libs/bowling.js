Array.prototype.eachSlice = function (size=2, callback = () => {}){
  this.arr = []
  for (var i = 0, l = this.length; i < l; i += size){
    callback.call(this, this.slice(i, i + size))
    this.arr.push(this.slice(i, i + size))
  }
  return this.arr
};


function getPoints(c){
  if (c == '-')
    return 0
  if (c == '/')
    return 0
  return parseInt(c) || 0
}

module.exports = {

  score: (input) => {
    var frames = input.split('')
    var result = frames.eachSlice().reduce((acc, f) => {
      var frameScore = getPoints(f[0]) * acc.spare + getPoints(f[1])
      var spare = 1
      if (frameScore == 10){
        spare = 2
      } 
      return {score: acc.score + frameScore, spare: spare}
    }, {score: 0, spare: 1})
    return result.score
  }
}
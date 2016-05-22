module.exports = {

  score: (input) => {
    var frames = input.split('')
    return frames.reduce((acc, f) => {
      return acc + (parseInt(f) || 0)
    }, 0)
  }
}
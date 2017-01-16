
function getScore(p){
  const scores = {
    '0': 'love',
    '1': '15',
    '2': '30',
    '3': '40'
  }
  return scores[p.toString()]
}

function score(p1=0, p2=0){
  return `${getScore(p1)}-${getScore(p2)}`
}

module.exports = score

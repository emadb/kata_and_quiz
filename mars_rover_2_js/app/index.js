//* with fold
// function rover(x, y, d, cmds = []){
//   const current = { x, y: y, direction: d }
//   const final = cmds.reduce((acc, c)  => applyCommand(acc, c), current)
//   return final
// }

//* with recursion
function rover(x, y, d, cmds = []){
  const current = { x, y: y, direction: d }
  return internalRover(current, cmds)
}

function internalRover(current, [head, ...tail]){
  if (!head) {
    return current
  }
  const next = applyCommand(current, head)
  return internalRover(next, tail)
}

const roverN = {
  'f': current => ({ y: current.y + 1 }),
  'b': current => ({ y: current.y - 1 }),
  'l': current => ({ direction: 'E'}),
  'r': current => ({ direction: 'W'})
}

const roverE = {
  'f': current => ({ x: current.x - 1 }),
  'b': current => ({ x: current.x + 1 }),
  'l': current => ({ direction: 'S'}),
  'r': current => ({ direction: 'N'})
}

const roverS = {
  'f': current => ({ y: current.y - 1 }),
  'b': current => ({ y: current.y + 1 }),
  'l': current => ({ direction: 'W'}),
  'r': current => ({ direction: 'E'})
}

const roverW = {
  'f': current => ({ x: current.x + 1 }),
  'b': current => ({ x: current.x - 1 }),
  'l': current => ({ direction: 'N'}),
  'r': current => ({ direction: 'S'})
}

const rovers = {
  'N': roverN,
  'E': roverE,
  'S': roverS,
  'W': roverW
}

function applyCommand(current, cmd){
  const delta = rovers[current.direction][cmd](current)
  return Object.assign({}, current, delta)
}

module.exports = rover

function rover(x, y, d, cmds = []){
  const current = { x, y, direction: directions.indexOf(d) }
  const next = cmds.reduce((acc, cmd) => executeCommand(acc, cmd), current)
  next.direction = directions.slice(next.direction % 4)[0]
  return next
}

function setter(prop, obj){
  return function(fn) {
    obj[prop] = fn(obj)
  }
}

const directions = ['N', 'W', 'S', 'E']

const commands = {
  'f': state => setter('y', state)(s => s.y + 1),
  'b': state => setter('y', state)(s => s.y - 1),
  'l': state => setter('direction', state)(s => s.direction - 1),
  'r': state => setter('direction', state)(s => s.direction + 1),
}

function executeCommand(current, cmd){
  return Object.assign({}, current, commands[cmd](current))
}

module.exports = rover

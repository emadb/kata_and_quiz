function rover(x, y, d, cmds = []){
  const current = { x, y, direction: d }
  const next = cmds.reduce((acc, cmd) => executeCommand(acc, cmd), current)
  return next
}

function setter(prop, obj){
  return function(fn) {
    obj[prop] = fn(obj)
  }
}

const commands = {
  'f': state => setter('y', state)(s => s.y + 1),
  'b': state => setter('y', state)(s => s.y - 1),
  'l': state => setter('direction', state)(s => {
    if (s.direction == 'N') { return 'E' }
    if (s.direction == 'E') { return 'S' }
    if (s.direction == 'S') { return 'W' }
    if (s.direction == 'W') { return 'N' }
  }),
}

function executeCommand(current, cmd){
  return Object.assign({}, current, commands[cmd](current))
}

module.exports = rover

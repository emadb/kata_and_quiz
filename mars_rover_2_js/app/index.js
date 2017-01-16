/* 
TODO
 - Try to define inc and dec function to increment/decrement the positions
 - Try to use lens to get x and y value (used with inc and dec functions above)
 - Different approach. Create a different insance based on direction
 */

function rover(x, y, d, cmds = []){
  const current = { x, y, direction: directions.indexOf(d) }
  const next = cmds.reduce((acc, cmd) => executeCommand(acc, cmd), current)
  return prepareForOutput(next)
}

function prepareForOutput(state){
  return Object.assign({}, state, { direction: directions.slice(state.direction % 4)[0] })
}

function setterLens(prop) {
  return function (obj) {
    return function(fn) {
      return Object.assign({}, obj, {[prop]: fn(obj)})
    }
  }
}

const setY = setterLens('y')
const setX = setterLens('x')
const setDirection = setterLens('direction')

const directions = ['N', 'W', 'S', 'E']

const forwards = [
  s => s.y + 1,
  s => s.x + 1,
  s => s.y - 1,
  s => s.x - 1
]

const backwards = [
  s => s.y - 1,
  s => s.x - 1,
  s => s.y + 1,
  s => s.x + 1
]

const setter = [
  setY,
  setX,
  setY,
  setX
]

const commands = {
  'f': state => setter[state.direction](state)(forwards[state.direction]),
  'b': state => setter[state.direction](state)(backwards[state.direction]),
  'l': state => setDirection(state)(s => s.direction - 1),
  'r': state => setDirection(state)(s => s.direction + 1),
}

function executeCommand(current, cmd) {
  return Object.assign({}, current, commands[cmd](current))
}

module.exports = rover

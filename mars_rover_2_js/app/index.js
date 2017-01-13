// TODO
// - Try to define inc and dec function to increment/decrement the positions
// - Try to use lens to get x and y value (used with inc and dec functions above)

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
      obj[prop] = fn(obj)
    }
  }
}

function getterLens(prop) {
  return function (obj) {
    return obj[prop]
  }
}

function inc(getValue){
  return function(state){
    return getValue(state) + 1
  }
}

function dec(getValue){
  return function(state){
    return getValue(state) - 1
  }
}

const setY = setterLens('y')
const setX = setterLens('x')
const setDirection = setterLens('direction')

const incY = s => inc(getterLens('y'))(s)
const incX = s => inc(getterLens('x'))(s)
const decY = s => dec(getterLens('y'))(s)
const decX = s => dec(getterLens('x'))(s)

const directions = ['N', 'W', 'S', 'E']

const forwards = [
  s => incY(s),
  s => incX(s),
  s => decY(s),
  s => decX(s),
]

const backwards = [
  s => decY(s),
  s => decX(s),
  s => incY(s),
  s => incX(s),
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

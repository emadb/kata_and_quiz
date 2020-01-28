const Employee = require('./employee')

class EmployeeRepository {

  constructor(reader) {
    this._reader = reader
  }

  async loadAll(){ 
    const content = await this._reader.read()
    const lines = content.split('\n')

    const employees = lines.slice(1).map(l => {
      return Employee.parse(l.split(',').map(r => r.trim()))
    })
    return employees
  }
}


module.exports = EmployeeRepository
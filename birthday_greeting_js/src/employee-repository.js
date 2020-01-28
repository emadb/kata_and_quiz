const fs = require('fs')
const Employee = require('./employee')

class EmployeeRepository {

  constructor(reader) {
    this._reader = reader
  }

  async loadAll(fileName){ 
    const content = await this._reader.read(fileName)
    const lines = content.split('\n')

    

    const employees = lines.slice(1).map(l => {
      return Employee.parse(l.split(',').map(r => r.trim()))
    })
    return employees
  }
}


module.exports = EmployeeRepository
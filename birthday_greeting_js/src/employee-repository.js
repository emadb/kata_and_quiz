const fs = require('fs')
const Employee = require('./employee')


const fsReader = {
  read(fileName) {
    return new Promise((resolve, reject) => {
      fs.readFile(fileName, 'utf8', (err, data) => {
        if (err){
          return reject(err)
        }
        resolve(data)
      })
    })
  }
}

class EmployeeRepository {

  constructor(reader) {
    if (!reader){
      this._reader = fsReader
    } else {
      this._reader = reader
    }
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
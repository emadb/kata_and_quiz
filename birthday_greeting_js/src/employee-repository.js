class EmployeeRepository {

  constructor(reader) {
    this._reader = reader
  }

  loadAll(){ 
    const lines = this._reader.read()
    const employees = lines.slice(1).map(l => {
      return employee.parse(l)
    })
    return employees
  }
}


const employee = {
  parse(arr) {
    return {
      last_name: arr[0],
      first_name: arr[1], 
      date_of_birth: new Date(`${arr[2]}T00:00:00.000Z`),
      email: arr[3]
    }
  }
}

module.exports = EmployeeRepository
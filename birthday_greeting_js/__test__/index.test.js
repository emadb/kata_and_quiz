const EmployeeRepository = require('../src/employee-repository')
const Employee = require('../src/employee')

describe('Birthday greeting', () => {
  test('it is true', () => {
    expect(true).toBe(true)
  })

  test('Should return the employee list', async () => {

    const reader = {
      read: (_fileName) => Promise.resolve(`last_name, first_name, date_of_birth, email\nDoe, John, 1982-10-08, john.doe@foobar.com`)
    }

    const repo = new EmployeeRepository(reader)
    const employees = await repo.loadAll()

    expect(employees.length).toBe(1)
    expect(employees[0].first_name).toBe('John')
    expect(employees[0].date_of_birth).toMatchObject(new Date('1982-10-08'))

  })

  test("Employee birthday is true", () => {

    const employee = new Employee('Doe', 'John', new Date('1982-10-08T00:00:00.000Z'), 'john.doe@foobar.com')
    const isBirthDay = employee.isBirthday(new Date('2020-10-08T00:00:00.000Z'))

    expect(isBirthDay).toBeTruthy()
  })

  test("Employee birthday is false", () => {

    const employee = new Employee('Doe', 'John', new Date('1982-10-08T00:00:00.000Z'), 'john.doe@foobar.com')
    const isBirthDay = employee.isBirthday(new Date('2020-11-08T00:00:00.000Z'))

    expect(isBirthDay).toBeFalsy()
  })


  test("Employee birthday is false", () => {

    const employee = new Employee('Doe', 'John', new Date('1982-10-08T00:00:00.000Z'), 'john.doe@foobar.com')
    const isBirthDay = employee.isBirthday(new Date('2020-11-01T00:00:00.000Z'))

    expect(isBirthDay).toBeFalsy()
  })

})
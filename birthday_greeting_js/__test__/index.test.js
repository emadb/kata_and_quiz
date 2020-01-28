const EmployeeRepository = require('../src/employee-repository')

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
})
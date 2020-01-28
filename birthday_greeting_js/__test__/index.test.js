const EmployeeRepository = require('../src/employee-repository')
const Employee = require('../src/employee')
const GreetingMailer = require('../src/greeting-mailer')
const main = require('../src/main')

describe('Birthday greeting', () => {
  test('it is true', () => {
    expect(true).toBe(true)
  })

  test('Should return the employee list', async () => {

    const reader = {
      read: (_fileName) => Promise.resolve(
        `last_name, first_name, date_of_birth, email
         Doe, John, 1982-10-08, john.doe@foobar.com`)
    }

    const repo = new EmployeeRepository(reader)
    const employees = await repo.loadAll()

    expect(employees.length).toBe(1)
    expect(employees[0].first_name).toBe('John')
    expect(employees[0].date_of_birth).toMatchObject(new Date('1982-10-08'))

  })

  test('Employee birthday is true', () => {

    const employee = new Employee('Doe', 'John', new Date('1982-10-08T00:00:00.000Z'), 'john.doe@foobar.com')
    const isBirthDay = employee.isBirthday(new Date('2020-10-08T00:00:00.000Z'))

    expect(isBirthDay).toBeTruthy()
  })

  test('Employee birthday is false', () => {

    const employee = new Employee('Doe', 'John', new Date('1982-10-08T00:00:00.000Z'), 'john.doe@foobar.com')
    const isBirthDay = employee.isBirthday(new Date('2020-11-08T00:00:00.000Z'))

    expect(isBirthDay).toBeFalsy()
  })

  test('Employee birthday is false', () => {

    const employee = new Employee('Doe', 'John', new Date('1982-10-08T00:00:00.000Z'), 'john.doe@foobar.com')
    const isBirthDay = employee.isBirthday(new Date('2020-11-01T00:00:00.000Z'))

    expect(isBirthDay).toBeFalsy()
  })

  test('Send greetings', () => {

    let isCalled = false
    let mailTo = ''
    let mailSubject = ''
    let mailBody = ''
    const smtpFn = jest.fn().mockImplementation((to, subject, body) => {
      mailTo = to
      mailSubject = subject
      mailBody = body
      isCalled = true
    })
    
    const greet = new GreetingMailer({send: smtpFn})
    greet.send(new Employee('Doe', 'John', new Date('1982-10-08T00:00:00.000Z'), 'john.doe@foobar.com'))

    expect(isCalled).toBeTruthy()
    expect(mailTo).toBe('john.doe@foobar.com')
    expect(mailSubject).toBe('Happy birthday!')
    expect(mailBody).toBe('Happy birthday, dear John!')

  })

  test('Acceptance test', (done) => {
    const reader = {
      read: (_fileName) => Promise.resolve(
        `last_name, first_name, date_of_birth, email
        Doe, John, 1982-04-09, john.doe@foobar.com
        Ann, Mary, 1975-09-11, mary.ann@foobar.com
        Ema, Db, 1973-04-09, ema@codiceplastico.com`)
    }

    let callCount = 0
    const smtpFn = jest.fn().mockImplementation((to, subject, body) => {
      callCount++
    })

    main('data.csv', new Date('2020-04-09T00:00:00.000Z'), new EmployeeRepository(reader), new GreetingMailer({send: smtpFn}))

    setTimeout(() => {
      expect(callCount).toBe(2)
      done()
    })
    
  })

})
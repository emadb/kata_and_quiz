const Employee = require('./employee')

class GreetingMailer {

  constructor(smtp) {
    this.smtp = smtp
  }

  async send(employee) {  
    const body = `Happy birthday, dear ${employee.first_name}!`
    return this.smtp.send(employee.email, 'Happy birthday!', body)
  }
}


module.exports = GreetingMailer
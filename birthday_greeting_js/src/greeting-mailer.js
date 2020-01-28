const Employee = require('./employee')

class GreetingMailer {

  constructor(smtp) {
    this.smtp = smtp
  }

  send(employee) {  
    const body = `Happy birthday, dear ${employee.first_name}!`
    this.smtp.send(employee.email, 'Happy birthday!', body)
  }
}


module.exports = GreetingMailer
const fs = require('fs')
const runner = require('./src/runner')
const EmployeeRepository = require('./src/employee-repository')
const GreetingMailer = require('./src/greeting-mailer')
const {promisify} = require('util')

const readFile = promisify(fs.readFile)


const fsReader = {
  read(fileName) {
    return readFile(fileName, 'utf8').then(resolve)
  }
}

nodemailer.createTransport({
  host: "smtp.example.com",
  port: 587,
  secure: false,
  auth: {
    user: "username",
    pass: "password"
  }
});

const smtp = {
  send(to, subject, body) {
    const message = {
      from: "sender@server.com",
      to: to,
      subject: subject,
      text: body
    };

    transporter.sendMail(message)
  }
}

runner('./data.csv', new Date('2020-04-09T00:00:00.000Z'), new EmployeeRepository(fsReader), new GreetingMailer(smtp))
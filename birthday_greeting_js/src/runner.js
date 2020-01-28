
const main = async (fileName, today, repository, mailer) => {

  const employees = await repository.loadAll(fileName)
  return Promise.all(employees.filter(e => e.isBirthday(today)).map(e => mailer.send(e)))
      
}

module.exports = main

const main = async (fileName, today, repository, mailer) => {

  const employees = await repository.loadAll(fileName)
  
  employees.forEach(e => {
    if (e.isBirthday(today)) {
      mailer.send(e)
    }
  });

}

module.exports = main
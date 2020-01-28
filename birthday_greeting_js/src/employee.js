class Employee{

  constructor(last_name, first_name, date_of_birth, email) {
    this.last_name = last_name
    this.first_name = first_name
    this.date_of_birth = date_of_birth
    this.email = email
  }

  isBirthday(date) {
    return date.getMonth() === this.date_of_birth.getMonth() && date.getDate() === this.date_of_birth.getDate()
  }

  static parse(arr) {
    return {
      last_name: arr[0],
      first_name: arr[1], 
      date_of_birth: new Date(`${arr[2]}T00:00:00.000Z`),
      email: arr[3]
    }
  }
}

module.exports = Employee
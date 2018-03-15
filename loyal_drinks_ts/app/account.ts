export default {
  ping: "pong",
  createAccount(initialStars: number = 0) {
    return new Account(initialStars)
  }
}

// type AccounType = {
//   stars: number,
//   type: AccountType
// }

// type AccountType = "Green" | "Gold"

class Account {
  stars: number;
  constructor(initialStars: number){
    this.stars = initialStars
  }

  order(what: string) {
    this.stars = this.stars + 1
  }

  getFreeDrink(what: string) {
    if (this.stars >= 15){
      this.stars = this.stars - 15
    } else {
      throw new Error("not enough stars")
    }
  }

}

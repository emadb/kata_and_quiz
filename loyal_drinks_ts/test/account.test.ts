import app from "../app/account";
import {assert} from "chai"



describe("For every placed order customer get a star", () => {
  it("a new account has zero stars", () => {    
    const account = app.createAccount()
    assert.equal(account.stars, 0)
  })

  it("when order a drink a new star is earned", () => {    
    const account = app.createAccount()
    account.order("coffee")
    assert.equal(account.stars, 1)
  })

  it("when order a drink a new star is earned", () => {    
    const account = app.createAccount()
    account.order("coffee")
    account.order("coffee")
    account.order("coffee")
    assert.equal(account.stars, 3)
  })
})

describe("When the customer reach 15 stars can claim a free drink", () => {
  it("15 stars should go to 0", () => {
    const account = app.createAccount(15)
    account.getFreeDrink("coffee")
    assert.equal(account.stars, 0)
  })

  it("not enough stars should fail", () => {
    const account = app.createAccount(10)
    try{
      account.getFreeDrink("coffee")
    } catch {}
    assert.equal(account.stars, 10)
  })

  it("20 stars should go to 5", () => {
    const account = app.createAccount(20)
    account.getFreeDrink("coffee")
    assert.equal(account.stars, 5)
  })

})
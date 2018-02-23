import sm from '../app/social-media'
import User from '../app/user'

test("Posting: Alice can publish messages to a personal timeline", () => {

  const alice: User = sm.getUserProfile("alice")
  alice.post("hello world")

  const timeline = alice.getTimeline()

  expect(timeline.length).toBe(1)
  expect(timeline[0].text).toBe("hello world")
  
  sm.logout("alice")
})

test("Reading: Bob can view Alice’s timeline", () => {
  const alice: User = sm.getUserProfile("alice")
  alice.post("hello world")

  const bob: User = sm.getUserProfile("bob")
  bob.subscribe("alice")
  
  const timeline = sm.getTimeline(bob)

  expect(timeline.length).toBe(1)
  expect(timeline[0].text).toBe("hello world")

  sm.logout("alice")
  sm.logout("bob")
})

test("Following: Charlie can subscribe to Alice’s and Bob’s timelines, and view an aggregated list of all subscriptions", () => {
  const alice: User = sm.getUserProfile("alice")
  const bob: User = sm.getUserProfile("bob")
  const charlie: User = sm.getUserProfile("charlie")

  alice.post("hello world from alice")
  bob.post("hello world from bob")

  charlie.subscribe("alice")
  charlie.subscribe("bob")

  const timeline = sm.getTimeline(charlie)
  
  expect(timeline.length).toBe(2)
  expect(timeline[0].text).toBe("hello world from alice")
  expect(timeline[1].text).toBe("hello world from bob")




})
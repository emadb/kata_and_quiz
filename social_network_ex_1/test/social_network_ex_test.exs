defmodule SocialNetworkExTest do
  use ExUnit.Case


  test "Posting: Alice can publish messages to a personal timeline" do
    SessionManager.login("alice")

    User.post("alice", "Hello world")
    {:ok, [message]} = User.get_timeline("alice")
    
    %Message{text: text, author: author, date: _} = message
    assert text == "Hello world"
    assert author == "alice"

    SessionManager.logout("alice")
  end

  test "Reading: Bob can view Alice’s timeline" do
    SessionManager.login("alice")    
    User.post("alice", "Hello world")

    SessionManager.login("bob")
    {:ok, [message]} = User.read_timeline("bob", "alice")

    %Message{text: text, author: author, date: _} = message
    assert text == "Hello world"
    assert author == "alice"

    SessionManager.logout("bob")
    SessionManager.logout("alice")
  end

  test "Following: Charlie can subscribe to Alice’s and Bob’s timelines, and view an aggregated list of all subscriptions" do
    SessionManager.login("alice")
    SessionManager.login("bob")    

    User.post("alice", "Hello world")
    User.post("bob", "My favorite number is 42")

    SessionManager.login("charlie")

    {:ok } = User.subscribe_to("charlie", ["alice", "bob"])
    {:ok, messages} = User.get_feed("charlie")
    
    assert Enum.count(messages) == 2
    
    SessionManager.logout("charlie")
    SessionManager.logout("alice")
    SessionManager.logout("bob")
  end

  test "Mentions: Bob can link to Charlie in a message using “@”" do
    SessionManager.login("bob")    
    SessionManager.login("charlie")

    User.post("bob", "Hello @charlie")

    {:ok, notifications} = User.get_timeline("charlie")

    assert Enum.count(notifications) == 1

    SessionManager.logout("charlie")
    SessionManager.logout("bob")
  end

  test "Direct Messages: Mallory can send a private message to Alice" do
    SessionManager.login("alice")    
    SessionManager.login("mallory")

    User.send_direct("mallory", "alice", "Hello!")
    {:ok, messages} = User.get_private_messages("alice")
    assert Enum.count(messages) == 1

    SessionManager.logout("alice")
    SessionManager.logout("mallory")
  end

end

defmodule SocialNetworkExTest do
  use ExUnit.Case


  test "Posting: Alice can publish messages to a personal timeline" do

    SessionManager.login("alice")

    User.post("alice", "Hello world")
    {:ok, [message]} = User.get_timeline("alice")
    
    assert message == "Hello world"
  end
end

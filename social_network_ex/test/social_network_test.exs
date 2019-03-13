defmodule SocialNetworkTest do
  use ExUnit.Case
  doctest SocialNetwork

  setup do
    {:ok, pid} = SocialNetwork.login("Alice")

    on_exit fn ->
      SocialNetwork.logout("Alice")
    end

    {:ok, pid: pid}
  end


  test "post a message" do
    SocialNetwork.post("Alice", "The weather is lovely today")
    {:ok, [%Post{message: "The weather is lovely today"}]} = SocialNetwork.timeline("Alice")
  end

  test "post two messages" do
    SocialNetwork.post("Alice", "The weather is lovely today")
    SocialNetwork.post("Alice", "I am very happy")
    {:ok, posts} = SocialNetwork.timeline("Alice")
    posts == [
      %Post{message: "The weather is lovely today"},
      %Post{message: "I am very happy"}
    ]
  end

end

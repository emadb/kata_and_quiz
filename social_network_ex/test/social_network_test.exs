defmodule SocialNetworkTest do
  use ExUnit.Case
  doctest SocialNetwork

  setup do
    {:ok, alice} = SocialNetwork.login("Alice")
    {:ok, bob} = SocialNetwork.login("Bob")

    on_exit fn ->
      SocialNetwork.logout("Alice")
      SocialNetwork.logout("Bob")
    end

    {:ok, alice: alice, bob: bob}
  end


  test "post a message" do
    SocialNetwork.post("Alice", "The weather is lovely today")
    {:ok, [%Post{message: "The weather is lovely today"}]} = SocialNetwork.timeline("Alice")
  end

  test "post two messages" do
    SocialNetwork.post("Alice", "The weather is lovely today")
    SocialNetwork.post("Alice", "I am very happy")
    {:ok, posts} = SocialNetwork.timeline("Alice")
    assert project_messages(posts) == [ "The weather is lovely today", "I am very happy"]
  end

  test "post two messages for different users" do
    SocialNetwork.post("Alice", "The weather is lovely today")
    SocialNetwork.post("Bob", "I am very happy")
    {:ok, [ %Post{message: "The weather is lovely today"}]} = SocialNetwork.timeline("Alice")
    {:ok, [ %Post{message: "I am very happy"}]} = SocialNetwork.timeline("Bob")
  end

  test "alice can follow bob" do
    SocialNetwork.follow("Alice", "Bob")
    {:ok, ["Bob"]} = SocialNetwork.following("Alice")
  end

  test "if alice follow bob, alice is a bob's follower" do
    SocialNetwork.follow("Alice", "Bob")
    {:ok, ["Alice"]} = SocialNetwork.followers("Bob")
  end

  test "if alice follow bob, alice timeline contains bob's posts" do
    SocialNetwork.follow("Alice", "Bob")
    SocialNetwork.post("Alice", "The weather is lovely today")
    SocialNetwork.post("Bob", "I am very happy")

    {:ok, posts} = SocialNetwork.timeline("Alice")
    assert project_messages(posts) == [ "The weather is lovely today", "I am very happy" ]
  end

  defp project_messages(posts), do: Enum.map(posts, fn p -> p.message end)
end

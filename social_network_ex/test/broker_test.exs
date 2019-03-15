defmodule BrokerTest do
  use ExUnit.Case

  test "subscriber receive a message" do

    task = Task.async(fn -> receive do message -> message end end)

    Broker.subscribe(task.pid, "topic1")

    Broker.publish("hello!", "topic1")

    res = Task.await(task)
    assert res == "hello!"
  end

  test "two subscribers receive a message" do
    task1 = Task.async(&echo/0)
    task2 = Task.async(&echo/0)

    Broker.subscribe(task1.pid, "topic1")
    Broker.subscribe(task2.pid, "topic1")

    Broker.publish("hello!", "topic1")

    res1 = Task.await(task1)
    res2 = Task.await(task2)

    assert res1 == "hello!"
    assert res2 == "hello!"
  end

  test "two subscribers on different topics only one receive a message" do
    task1 = Task.async(&echo/0)
    task2 = Task.async(&echo/0)

    Broker.subscribe(task1.pid, "topic1")
    Broker.subscribe(task2.pid, "topic2")

    Broker.publish("hello!", "topic1")
    Broker.publish("world!", "topic2")

    res1 = Task.await(task1)
    res2 = Task.await(task2)

    assert res1 == "hello!"
    assert res2 == "world!"
  end

  defp echo() do
    receive do
      message -> message
    end
  end

end

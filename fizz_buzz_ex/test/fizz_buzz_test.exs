defmodule FizzBuzzTest do
  use ExUnit.Case

  test "On 1 should return 1" do
  	s = FizzBuzz.process(1)
    assert s == "1"
  end

  test "On 3 should return fizz" do
    s = FizzBuzz.process(3)
    assert s == "fizz"
  end

  test "On 6 should return fizz" do
    s = FizzBuzz.process(6)
    assert s == "fizz"
  end

  test "On 5 should return buzz" do
    s = FizzBuzz.process(5)
    assert s == "buzz"
  end

  test "On 10 should return buzz" do
    s = FizzBuzz.process(10)
    assert s == "buzz"
  end

  test "On 15 should return fizzbuzz" do
    s = FizzBuzz.process(15)
    assert s == "fizzbuzz"
  end
  
end

defmodule FizzBuzz do
  def process (input) do
    post_process(Fizz.process(input) <> Buzz.process(input), input)
  end
  defp post_process("", input) do
    to_string(input)
  end
  defp post_process(fizzbuzz, _) do
    fizzbuzz
  end
end

defmodule Fizz do
  def process(input) when rem(input,3) == 0 do
    "fizz"
  end

  def process (_) do
    ""
  end  
end

defmodule Buzz do
  def process(input) when rem(input,5) == 0 do
    "buzz"
  end

  def process (_) do
    ""
  end  
end
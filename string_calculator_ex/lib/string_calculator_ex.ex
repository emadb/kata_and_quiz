defmodule StringCalculatorEx do

  @separators [",", "\n"]
  @rx_matcher ~r/\/\/(?<delimiter>.)\n(?<numbers>.*)/

  @spec add(<<>>)::number
  def add("") do
    0
  end

  @spec add(String.t)::number
  def add(input) do
    {new_input, delimiters} = get_input(input)
    to_array(new_input, delimiters)
      |> Enum.map(&interal_parse/1) 
      |> internal_add(0)
  end

  @spec add(String.t)::{String.t, [String.t]}
  def get_input(input) do
    case String.starts_with?(input, "//") do
      true -> 
        %{"delimiter" => delimiter, "numbers" => numbers} = Regex.named_captures(@rx_matcher, input)
        {numbers, [@separators, delimiter]}
      false -> 
        {input, @separators}
    end
  end

  @spec add(String.t)::[String.t]
  def to_array(input, delimiters) do
    Enum.reduce(delimiters, [input], fn (sep, acc) -> 
      Enum.flat_map(acc, fn s -> String.split(s, sep) end) 
    end)
  end
  
  @spec add(String.t)::number
  def interal_parse(str) do
    {n, ""} = Integer.parse(str)
    n
  end
  
  @spec add([])::number
  def internal_add([], acc), do: acc      
  
  @spec add([number])::number
  def internal_add([h|t], acc), do: internal_add(t, acc + h)
  
  
end

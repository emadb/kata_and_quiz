defmodule HarryPotter do
  @spec hello() :: String.t
  def hello do
    :world
  end

  # def buy([b1, b2]) when b1 != b2, do: 15.2
  # def buy([b1, b2, b3]) when b1 != b2 and b2 != b3, do: 21.6
  # def buy([b1, b2, b3, b4]) when b1 != b2 and b2 != b3 and b3 != b4, do: 25.6
  # def buy([b1, b2, b3, b4, b5]) when b1 != b2 and b2 != b3 and b3 != b4 and b4 != b5, do: 30

  # def buy(books), do: length(books) * 8 
  @spec buy([String.t]) :: float
  def buy(books) do
    calculate_price(books)
  end


  def calculate_price(books) do
    groups = books 
      |> Enum.reduce(%{}, fn(x, acc) -> 
        count_one(acc[x], acc, x)
      end)
    
    discount = Map.keys(groups) |> Enum.count |> get_discount
    
    total = groups
      |> Map.keys
      |> Enum.reduce(0, fn(x, acc) -> 
        book_price(groups, acc, x, discount)        
      end)

    round(total * 10) / 10      
  end

  defp get_discount(items) do
    case items do
      1 ->  1
      2 ->  0.95
      3 ->  0.90
      4 ->  0.80
      5 ->  0.75
    end
  end

  defp book_price(groups, acc, x, discount) do
    # IO.inspect groups, label: "groups"
    # IO.inspect acc, label: "acc"
    # IO.inspect x, label: "x"
    if groups[x] == 1 do
      acc + (8 * discount)
    else 
      acc + ( 8 * discount) + ((groups[x] - 1) * 8)
    end 
  end

  defp count_one(nil, map, key) do
    Map.put(map, key, 1)
  end

  defp count_one(_, map, key) do
    %{map | key => map[key] + 1}
  end

end

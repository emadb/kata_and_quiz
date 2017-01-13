defmodule World do
  def tick cells do
    process_cell cells, cells
  end

  defp process_cell([cell | tail], cells) do
    n = neighbors(cell, cells) - 1
    new_cells = next_cell(cell, n, cells)
    process_cell tail, new_cells
  end

  defp process_cell([], cells) do
    cells
  end

  defp next_cell(cell, n, cells) when n <= 1 do
    List.delete(cells, cell)
  end

  defp next_cell(cell, n, cells) when n >= 2 do
    cells
  end

  defp neighbors([x, y], cells) do
    Enum.filter(cells, fn [r, c] -> 
      (r == x + 1 or r == x - 1 or r == x) and (c == y + 1 or c == y - 1 or c == y)
    end) |> Enum.count
  end
end


# 012345678
# 1
# 2   o 
# 3   Xo
# 4   o  
# 5
# 6
# 7
# 8
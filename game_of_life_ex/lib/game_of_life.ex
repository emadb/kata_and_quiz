defmodule GameOfLife do
  def create_cell(x \\ 0, y \\ 0) do
    %{alive: true, x: x, y: y}
  end

  def next_era([cell | _]) do
     [%{alive: false, x: cell[:x], y: cell[:y]}]
  end
end

defmodule Cell do
  def create(x \\ 0, y \\ 0) do
    receive do
      {sender, :where_are_you} ->
        send sender, {:position, %{x: x , y: y}}
    end
  end
end 
defmodule Cell do
  def create(my_x \\ 0, my_y \\ 0, parent) do
    send parent, {:position, %{x: my_x , y: my_y}}
    listen(my_x, my_y, [])
  end
  
  def listen(my_x, my_y, neighbours) do
    receive do
      {:alive, position} ->
        if(abs(position[:x] - my_x) < 2 && abs(position[:y] - my_y) < 2) do  
          listen(my_x, my_y, Enum.concat(neighbours, [position]))
        else
          listen(my_x, my_y, neighbours)
        end

      {:tick} ->
        IO.inspect Enum.count(neighbours)
        if (Enum.count(neighbours) < 2) do
          Process.exit(self(), :kill)
        end
        listen(my_x, my_y,[])
    end
  end

end

defmodule World do
  def create do
    receive do
      {sender,:position, position} ->
        create      

      {sender,:initialize, number_of_cells} ->
        cells = Enum.map(1..number_of_cells, 
          fn n -> 
            spawn(Cell, :create, [n, n, self()])
            end
          )
        send sender, {:initialized, cells}
        create
    
    end
  end
end

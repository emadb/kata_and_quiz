defmodule Cell do
  def create(my_x \\ 0, my_y \\ 0, parent) do
    neighbour = 0
    IO.puts "caricato#{my_x} #{my_y}" 
    send parent, {:position, %{x: my_x , y: my_y}}

    receive do
      {sender, :where_are_you} ->
        send sender, {:position, %{x: my_x , y: my_y}}
      
      {sender, :tick} ->
        if(neighbour != 2) do
          exit(:kill)
        end

      {sender, :cell_position, %{x: x , y: y}} ->
        
        if(abs(x-my_x) < 2 && abs(y-my_y) < 2) do
          
          neighbour = neighbour + 1
        end
    end
  end
  
end 
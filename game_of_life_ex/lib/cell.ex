defmodule GameOfLife.Cell do
  use GenServer

  defp via_tuple(id) do
    {:via, Registry, {:cell_registry, id}}
  end

  def start_link(id, x, y) do
    name = via_tuple(id)
    GenServer.start_link(__MODULE__, %{x: x, y: y, id: id}, name: name)
  end

  def get_position(id) do
    name = via_tuple(id)    
    GenServer.call(name, {:get_position})
  end

  def handle_call({:get_position}, _from, state) do
    {:reply, state, state}
  end
end
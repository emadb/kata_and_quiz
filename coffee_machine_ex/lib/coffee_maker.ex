defmodule CoffeeMaker do
  use GenServer

  def start_link do
    name = via_tuple()
    GenServer.start_link(__MODULE__, [], name: name)
  end
  
  defp via_tuple() do
    {:via, Registry, {:makers_registry, "coffee_maker"}}
  end

  def get_coffee(coins) do
    GenServer.call(via_tuple(), {:get_coffee, coins})
  end

  def handle_call({:get_coffee, coins}, _from, _state) do
    if coins >= 30 do
      {:reply, {:coffee, 30}, _state}
    else
      {:reply, {:nothing, coins}, _state}
    end
  end
end

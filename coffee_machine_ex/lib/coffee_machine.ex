defmodule CoffeeMachine do
  use GenServer
  @name COFFEE_MACHINE

  def start_link(credit \\ 0) do
    GenServer.start_link(__MODULE__, credit, name: @name)
  end

  def switch_on do
    GenServer.call(@name, {:switch_on})
  end

  def insert_coin(coin) do
    GenServer.call(@name, {:insert_coin, coin})
  end

  def get_coffee() do
    GenServer.call(Registry.lookup(:makers_registry, "coffee_maker"), {:get_coffee})
  end

  def cancel() do
    GenServer.call(@name, {:cancel})
  end

  # Callbacks

  def handle_call({:switch_on}, _from, credit) do
    {:reply, credit, credit}
  end

  def handle_call({:insert_coin, coin}, _from, credit) do
    case coin do
      c when c in [5,10,20] -> {:reply, credit + coin, credit + coin}
      _ -> {:reply, credit, credit}
    end
  end

  def handle_call({:get_coffee}, _from, credit) do
    if credit >= 30 do
      {:reply, {:coffee, credit - 30}, credit - 30}
    else
      {:reply, {:nothing, credit}, credit}
    end
  end

  def handle_call({:cancel}, _from, credit) do
    {:reply, {:nothing, credit, 0}, 0}
  end


end

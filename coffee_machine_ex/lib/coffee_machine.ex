defmodule Key do
  defstruct credit: 0, inserted: false
end

defmodule CoffeeMachine do
  use GenServer

  defstruct credit: 0, key_credit: 0, has_key: false

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    {:ok, %CoffeeMachine{}}
  end

  def get_credit do
    GenServer.call(__MODULE__, {:get_credit})
  end

  def insert_coin(coin) do
    GenServer.call(__MODULE__, {:insert_coin, coin})
  end

  def insert_key(key) do
    GenServer.call(__MODULE__, {:insert_key, key})
  end

  def cancel do
    GenServer.call(__MODULE__, {:cancel})
  end

  def handle_call({:get_credit}, _from, state) do
    {:reply, state.credit + state.key_credit, state}
  end

  def handle_call({:insert_coin, coin}, _from, state) do
    {:reply, :ok, %CoffeeMachine{credit: state.credit + coin}}
  end

  def handle_call({:insert_key, key}, _from, state) do
    {:reply, :ok, %CoffeeMachine{state | has_key: true, key_credit: key}}
  end

  def handle_call({:cancel}, _from, state) do
    {:reply, {:ok, state.credit}, %CoffeeMachine{}}
  end
  
  
  
end
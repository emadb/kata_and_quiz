defmodule GameOfLife.World do
  use GenServer
  @name WORLD

  def start_link do
    GenServer.start_link(__MODULE__, %{cells: []}, name: @name)
  end

  def create_cell(x, y) do
    GenServer.call(@name, {:create_cell, x, y})
  end

  def get_status(x, y) do
    GenServer.call(@name, {:get_status, x, y})
  end

  def get_live_cells do
    GenServer.call(@name, {:get_live_cells})
  end

  def tick do
    GenServer.call(@name, {:tick})    
  end

  def handle_call({:create_cell, x, y}, _from, state) do
    case GameOfLife.Cell.start_link("#{x}_#{y}", x, y) do
      {:ok, pid} -> 
        {:reply, "#{x}_#{y}", %{cells: state[:cells] ++ [pid]}}
      {:error, {:already_started, pid}} -> 
        {:reply, {:already_alive, pid}, state}
    end
  end

  def handle_call({:get_status, x, y}, _from, state) do
    case Registry.lookup(:cell_registry, "#{x}_#{y}") do
      [{pid, nil}] -> {:reply, {:alive, pid}, state}
      _ -> {:reply, {:dead, nil}, state}
    end
  end

  def handle_call({:tick}, _from, state) do
    {:reply, {}, state}
  end

  def handle_call({:get_live_cells}, _from, state) do
    {:reply, state[:cells], state}
  end
end
defmodule FooServer do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: FooServer)
  end

  def init(args) do
    IO.inspect args, label: "Init"

    {:ok, %{counter: 1}}
  end

  def add(count) do
    GenServer.call(__MODULE__, {:add, count})
  end

  def handle_call({:add, count}, from, state) do
    IO.inspect from, label: "From"
    {:reply, state.counter + count, %{counter: state.counter + count}}
  end

end

defmodule Broker do
  use GenServer

  def init([]) do
    {:ok, []}
  end

  def start_link(_args \\ []) do
    GenServer.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

  def subscribe(pid, topic) do
    GenServer.call(__MODULE__, {:subscribe, pid, topic})
  end

  def publish(message, topic) do
    GenServer.call(__MODULE__, {:publish, message, topic})
  end

  def handle_call({:subscribe, pid, topic}, _from, state) do
    {:reply, :ok, state ++ [{pid, topic}]}
  end

  def handle_call({:publish, message, topic}, _from, state) do

    state
      |> Enum.filter(fn {_p, t} -> t == topic end)
      |> Enum.map(fn {p, _t} -> send(p, message) end)

    {:reply, :ok, state}
  end
end


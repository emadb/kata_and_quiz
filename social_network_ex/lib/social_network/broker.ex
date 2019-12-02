defmodule Broker do
  use GenServer

  def init([]) do
    {:ok, []}
  end

  def start_link(_args \\ []) do
    GenServer.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

  def subscribe(pid, topic) do
    GenServer.cast(__MODULE__, {:subscribe, pid, topic})
  end

  def publish(message, topic) do
    GenServer.cast(__MODULE__, {:publish, message, topic})
  end

  def handle_cast({:subscribe, pid, topic},  state) do
    {:noreply, state ++ [{pid, topic}]}
  end

  def handle_cast({:publish, message, topic}, state) do

    state
      |> Enum.filter(fn {_p, t} -> t == topic end)
      |> Enum.map(fn {p, _t} -> send(p, message) end)

    {:noreply, state}
  end
end


defmodule SessionSupervisor do
  use DynamicSupervisor

  def start_link(arg) do
    DynamicSupervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_session(name) do
    DynamicSupervisor.start_child(__MODULE__, {UserSession, {name}})
  end

  def end_session(name) do
    pid = RegistryHelper.get_pid(name)
    DynamicSupervisor.terminate_child(__MODULE__, pid)
  end

end

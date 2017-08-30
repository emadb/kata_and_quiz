defmodule Machine.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end
  
  def init(_) do
    children = [
      worker(Registry, [:unique, :makers_registry]),
      worker(CoffeeMaker, []),
      worker(CoffeeMachine,  [])
    ]
    supervise(children, strategy: :one_for_one)
  end
end
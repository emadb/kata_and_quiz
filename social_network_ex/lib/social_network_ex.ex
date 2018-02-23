defmodule SocialNetworkEx do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Registry, [:unique, SocialNetworkEx.Registry]),
      worker(SessionManager, [])
    ]

    opts = [strategy: :one_for_one, name: SocialNetworkEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def get_session(name), do: {:via, Registry, {SocialNetworkEx.Registry, name}}
  def register(name), do: Registry.register(SocialNetworkEx.Registry, get_session(name), [])

  def get_pid(name) do
    [{pid, _}] = Registry.lookup(SocialNetworkEx.Registry, get_session(name))
    pid
  end
end

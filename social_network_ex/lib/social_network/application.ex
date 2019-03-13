defmodule SocialNetwork.Application do
  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Registry, [keys: :unique, name: SessionRegistry]},
      {SessionSupervisor, []}
    ]

    opts = [strategy: :one_for_one, name: SocialNetwork.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

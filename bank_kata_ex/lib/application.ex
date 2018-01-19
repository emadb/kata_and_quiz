defmodule Bank.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    IO.puts("STARTING")

    children = [
      supervisor(Registry, [:unique, Bank.Registry]),
      worker(BankSupervisor, [])
    ]

    Supervisor.start_link(children, strategy: :rest_for_one)
  end

  def account_name(account_id), do: {:via, Registry, {Bank.Registry, account_id}}
  def register(key), do: Registry.register(Bank.Registry, key, [])
end

defmodule RegistryHelper do

  def create_key(name), do: {:via, Registry, {SessionRegistry, name}}

  def register(name), do: Registry.register(SessionRegistry, create_key(name), [])

  def get_pid(name) do
    case Registry.lookup(SessionRegistry, name) do
      [{pid, _}] -> pid
      [] -> :none
    end
  end
end

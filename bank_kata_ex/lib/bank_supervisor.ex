defmodule BankSupervisor do
  use DynamicSupervisor

  def start_link() do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def create_new_account(user) do
    DynamicSupervisor.start_child(__MODULE__, {BankAccount, [user]})
  end
end

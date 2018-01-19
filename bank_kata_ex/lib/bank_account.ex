defmodule BankAccount do
  use GenServer

  def start_link([user] = state) do
    GenServer.start_link(__MODULE__, state, name: Bank.Application.account_name(user))
  end

  def init(user) do
    {:ok, %{user: user, balance: 0, operations: []}}
  end

  def deposit(user, amount) do
    pid = Bank.Application.account_name(user)
    GenServer.call(pid, {:deposit, user, amount})
  end

  def withdraw(user, amount) do
    pid = Bank.Application.account_name(user)
    GenServer.call(pid, {:withdraw, user, amount})
  end

  def list_operations(user) do
    pid = Bank.Application.account_name(user)
    GenServer.call(pid, {:list_operations})
  end

  def handle_call({:deposit, _user, amount}, _from, state) do
    %{balance: balance, operations: operations} = state

    {:reply, {:ok, balance + amount},
     %{
       state
       | balance: balance + amount,
         operations: operations ++ [{"+", amount, balance + amount}]
     }}
  end

  def handle_call({:withdraw, _user, amount}, _from, state) do
    %{balance: balance, operations: operations} = state

    {:reply, {:ok, balance - amount},
     %{
       state
       | balance: balance - amount,
         operations: operations ++ [{"-", amount, balance - amount}]
     }}
  end

  def handle_call({:list_operations}, _from, state) do
    %{operations: operations} = state
    {:reply, {:ok, operations}, state}
  end
end

defmodule BankTest do
  use ExUnit.Case
  doctest Bank

  test "greets the world" do
    assert Bank.hello() == :world
  end

  test "create an account" do
    {:ok, _} = BankSupervisor.create_new_account("ema")
  end

  test "can create multiple accounts" do
    {:ok, _} = BankSupervisor.create_new_account("tessa")
    {:ok, _} = BankSupervisor.create_new_account("lory")
  end

  test "can deposit money" do
    {:ok, _} = BankSupervisor.create_new_account("test_user_1")
    {:ok, balance} = BankAccount.deposit("test_user_1", 1000)
    assert balance == 1000
  end

  test "can deposit money multiple time" do
    {:ok, _} = BankSupervisor.create_new_account("test_user_2")
    BankAccount.deposit("test_user_2", 1000)
    BankAccount.deposit("test_user_2", 100)
    {:ok, balance} = BankAccount.deposit("test_user_2", 500)
    assert balance == 1600
  end

  test "can deposit and withdraw money " do
    {:ok, _} = BankSupervisor.create_new_account("test_user_3")
    BankAccount.deposit("test_user_3", 1000)
    {:ok, balance} = BankAccount.withdraw("test_user_3", 100)
    assert balance == 900
  end

  test "can deposit and withdraw money multiple times" do
    {:ok, _} = BankSupervisor.create_new_account("test_user_4")
    BankAccount.deposit("test_user_4", 1000)
    BankAccount.withdraw("test_user_4", 300)
    {:ok, balance} = BankAccount.withdraw("test_user_4", 100)
    assert balance == 600
  end

  test "can get operation list" do
    {:ok, _} = BankSupervisor.create_new_account("test_user_5")
    BankAccount.deposit("test_user_5", 1000)
    BankAccount.withdraw("test_user_5", 300)
    {:ok, operations} = BankAccount.list_operations("test_user_5")

    assert Enum.count(operations) == 2

    {op, amount, balance} = Enum.at(operations, 0)
    assert op == "+"
    assert amount == 1000
    assert balance == 1000

    {op, amount, balance} = Enum.at(operations, 1)
    assert op == "-"
    assert amount == 300
    assert balance == 700
  end
end

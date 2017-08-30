defmodule CoffeeMachineTest do
  use ExUnit.Case
  doctest CoffeeMachine

  setup do 
    Registry.start_link(:unique, :makers_registry)
    CoffeeMaker.start_link
    CoffeeMachine.start_link
    # Machine.Supervisor.start_link
    []
  end

  test "swtich_on" do
    credit = CoffeeMachine.switch_on
    assert credit == 0
  end

  test "insert_coin 20c" do
    credit = CoffeeMachine.insert_coin(20)
    assert credit == 20
  end

  test "insert_coin 10c" do
    credit = CoffeeMachine.insert_coin(10)
    assert credit == 10
  end

  test "insert_coin 10c + 20c" do
    _ = CoffeeMachine.insert_coin(10)
    credit = CoffeeMachine.insert_coin(20)
    assert credit == 30
  end

  test "insert_coin 50c" do
    credit = CoffeeMachine.insert_coin(50)
    assert credit == 0
  end

  test "get_coffee" do
    CoffeeMachine.insert_coin(10)
    CoffeeMachine.insert_coin(20)
    {:coffee, credit} = CoffeeMachine.get_coffee
    assert credit == 0
  end

  test "get_coffee (no credit)" do
    CoffeeMachine.insert_coin(10)
    {:nothing, credit} = CoffeeMachine.get_coffee
    assert credit == 10
  end

  test "can get money back" do
    CoffeeMachine.insert_coin(10)
    {:nothing, coins, credit} = CoffeeMachine.cancel
    assert coins == 10
    assert credit == 0
  end

end

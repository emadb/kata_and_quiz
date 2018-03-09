defmodule CoffeeMachineExTest do
  use ExUnit.Case

  describe "When the coffee machine starts it is ready to operate and the credit is zero." do
    test "" do
      credit = CoffeeMachine.get_credit()
      assert credit == 0
    end
  end

  describe "get_credit/0" do
    test "get_credit whit credit 0 should return 0c" do
      {:reply, _, state} = CoffeeMachine.handle_call({:get_credit}, nil, %CoffeeMachine{})
      assert state.credit == 0
    end    

    test "get_credit whit credit 10c should return 10c" do
      {:reply, _, state} = CoffeeMachine.handle_call({:get_credit}, nil, %CoffeeMachine{credit: 10})
      assert state.credit == 10
    end    
  end

  describe "As a user I can insert coins of different format (5, 10, 20 cents) and the displayed credit should grow accordingly." do
    test "Insert 20cent with credit 0 should return 20c" do
      {:reply, _, state} = CoffeeMachine.handle_call({:insert_coin, 20}, nil, %CoffeeMachine{credit: 0})
      assert state.credit == 20
    end
  
    test "Insert 10cent with credit 20c should return 30c" do
      {:reply, _, state} = CoffeeMachine.handle_call({:insert_coin, 10}, nil, %CoffeeMachine{credit: 20})
      assert state.credit == 30
    end

    test "Insert multiple coins (10, 20) with credit 0c should return 30c" do
      {:reply, _, state} = CoffeeMachine.handle_call({:insert_coin, 10}, nil, %CoffeeMachine{credit: 0})
      {:reply, _, state} = CoffeeMachine.handle_call({:insert_coin, 20}, nil, state)
      assert state.credit == 30
    end  
  end

  describe "As a user I can use a prepaied key. The key can have some credit loaded and it will be displayed. The user can recharge the key using the coins." do
    
    test "Insert key should change the state" do
      {:reply, _, state} = CoffeeMachine.handle_call({:insert_key, 0}, nil, %CoffeeMachine{key_credit: 0, has_key: false})
      assert state.has_key == true
      assert state.credit == 0
    end
    
    test "Insert empty key, no credit, credit should not change" do
      {:reply, credit, _} = CoffeeMachine.handle_call({:get_credit}, nil, %CoffeeMachine{key_credit: 0})
      assert credit == 0
    end

    test "Insert key, with credit, credit should be added" do
      {:reply, credit, _} = CoffeeMachine.handle_call({:get_credit}, nil, %CoffeeMachine{credit: 10, key_credit: 20})
      assert credit == 30
    end
  end

  describe "As a user I can cancel the operation and have the money back." do
    test "cancel with credit should return coins and set credit to zero" do
      {:reply, {:ok, credit}, state} = CoffeeMachine.handle_call({:cancel}, nil, %CoffeeMachine{credit: 10})
      assert credit == 10
      assert state.credit == 0
    end
  end

  describe " When the credit as reached 30cents I can make a coffee. If the credit is not enough the machine should display a message with the price of the coffee (30cents)" do
    test "enough credit to buy a coffee" do
      {:reply, {:ok, %Coffee{}}, state} = CoffeeMachine.handle_call({:get_coffee}, nil, %CoffeeMachine{credit: 30})
    end
  end
end

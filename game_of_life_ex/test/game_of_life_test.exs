defmodule GameOfLifeTest do
  import :timer
  use ExUnit.Case

  test "create a new cell. It should send its position to the world" do
    world_pid = spawn(World, :create, [[]])
    send world_pid, {self(), :initialize, 10 }

    receive do
      {:initialized,positions} ->
        IO.inspect positions
    end
    
  end 

  test "A cell with one neighbour should die" do
    cell = spawn(Cell, :create, [3,4, self()])
    send cell, {:alive, %{x: 4, y: 4}}
    send cell, {:tick}

    sleep 20
  
    isAlive = Process.alive?(cell)
    assert  isAlive == false
  end

  test "A cell with two neighbours should live" do
    cell = spawn(Cell, :create, [3,4, self()])
    send cell, {:alive, %{x: 4, y: 4}}
    send cell, {:alive, %{x: 3, y: 3}}
    send cell, {:tick}
    
    sleep 20

    isAlive = Process.alive?(cell)
    assert  isAlive == true
  end

  test "A cell with three neighbours should live" do
    cell = spawn(Cell, :create, [3,4, self()])
    send cell, {:alive, %{x: 4, y: 4}}
    send cell, {:alive, %{x: 3, y: 3}}
    send cell, {:alive, %{x: 2, y: 3}}
    send cell, {:tick}
    
    sleep 20

    isAlive = Process.alive?(cell)
    assert  isAlive == true
  end

  test "A cell with four neighbours should die" do
    cell = spawn(Cell, :create, [3,4, self()])
    send cell, {:alive, %{x: 4, y: 4}}
    send cell, {:alive, %{x: 3, y: 3}}
    send cell, {:alive, %{x: 2, y: 3}}
    send cell, {:alive, %{x: 3, y: 5}}
    send cell, {:tick}
    
    sleep 20

    isAlive = Process.alive?(cell)
    assert  isAlive == false
  end
end

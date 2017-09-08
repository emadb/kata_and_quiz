defmodule GameOfLifeTest do
  use ExUnit.Case
  doctest GameOfLife

  setup do
    Registry.start_link(keys: :unique, name: :cell_registry)
    GameOfLife.World.start_link
    []
  end

  test "create cell" do
    cell = GameOfLife.World.create_cell(4,5)
    assert cell == "4_5"
  end

  test "create 2 cells" do
    c1 = GameOfLife.World.create_cell(4,5)
    c2 = GameOfLife.World.create_cell(2,8)

    assert c1 == "4_5"
    assert c2 == "2_8"
  end

  test "create 2 cells in the same position should fail" do
    c1 = GameOfLife.World.create_cell(4,5)
    {:already_alive, _} = GameOfLife.World.create_cell(4,5)

    assert c1 == "4_5"
  end

  test "get_status of an alive cell" do 
    GameOfLife.World.create_cell(4,5)
    {:alive, _} = GameOfLife.World.get_status(4,5)
  end

  test "get_status of a dead cell" do 
    {:dead, _} = GameOfLife.World.get_status(9,1)
  end

  test "get_live_cells" do
    GameOfLife.World.create_cell(4,5)
    GameOfLife.World.create_cell(2,8)
    cells = GameOfLife.World.get_live_cells
    assert Enum.count(cells) == 2
  end

  # test "tick: a single cell should die" do
  #   GameOfLife.World.create_cell(4,5)
  #   GameOfLife.World.tick
  #   {:dead, _} = GameOfLife.World.get_status(4,5)
  # end

end

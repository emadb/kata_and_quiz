defmodule GolExTest do
  use ExUnit.Case

  test "Any live cell with 0 live neighbours dies, as if caused by underpopulation" do
    cell = [1, 1]
    new_world = World.tick [cell]
    assert Enum.empty? new_world
  end

  test "Any live cell with 1 live neighbours dies, as if caused by underpopulation" do
    c1 = [1, 1]
    c2 = [1, 2]
    new_world = World.tick [c1, c2]
    assert Enum.empty? new_world
  end

  test "Any live cell with two live neighbours lives on to the next generation." do
    c1 = [3, 4]
    c2 = [4, 4]
    c3 = [2, 4]
    new_world = World.tick [c1, c2, c3]
    [new_c1 | _] = new_world
  end

  test "Any live cell with three live neighbours lives on to the next generation." do
    c1 = [3, 4]
    c2 = [4, 4]
    c3 = [2, 4]
    c4 = [3, 5]
    new_world = World.tick [c1, c2, c3, c4]
    [new_c1 | _] = new_world
  end

  test "Any live cell with more than three live neighbours dies" do
    c1 = [3, 4]
    c2 = [4, 4]
    c3 = [2, 4]
    c4 = [3, 5]
    c4 = [3, 5]
    c4 = [2, 5]
    new_world = World.tick [c1, c2, c3, c4, c5]
    [new_c1 | _] = new_world
    IO.inspect new_c1
  end
end

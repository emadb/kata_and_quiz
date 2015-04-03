defmodule GameOfLifeTest do
  use ExUnit.Case

  test 'create cell should return a live cell in positio 0,0' do
    cell = GameOfLife.create_cell
    assert cell[:alive] == true
    assert cell[:x] == 0
    assert cell[:y] == 0
  end

  test 'create cell with coordinates should return a live cell in a predefined positions' do
    cell = GameOfLife.create_cell(1,2)
    assert cell[:alive] == true
    assert cell[:x] == 1
    assert cell[:y] == 2
  end

  test 'Any live cell with 0 live neighbours dies, as if caused by underpopulation' do
    cell = GameOfLife.create_cell
    [next_cell | _] = GameOfLife.next_era [cell]
    assert next_cell[:alive] == false
  end

  test 'Any live cell with 1 live neighbours dies, as if caused by underpopulation' do
     cell1 = GameOfLife.create_cell(1,1)
     cell2 = GameOfLife.create_cell(1,2)
    
     next_world = GameOfLife.next_era [cell1, cell2]

     cell1_next = Enum.find(next_world, fn(c) -> c[:x] == cell1[:x] and c[:y] == cell1[:y]  end)
     cell2_next = Enum.find(next_world, fn(c) -> c[:x] == cell2[:x] and c[:y] == cell2[:y]  end)
     
     assert cell1_next[:alive] == false
     assert cell2_next[:alive] == false
   end


end

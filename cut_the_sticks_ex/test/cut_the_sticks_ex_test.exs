defmodule CutTheSticksExTest do
  use ExUnit.Case

  test "[5, 4, 4, 2, 2, 8]" do
    output = CutTheSticks.cut([5, 4, 4, 2, 2, 8])
    assert output == [6,4,2,1]
  end

  test "[1, 2, 3, 4, 3, 3, 2, 1]" do
    output = CutTheSticks.cut([1, 2, 3, 4, 3, 3, 2, 1])
    assert output == [8,6,4,1]
  end
end

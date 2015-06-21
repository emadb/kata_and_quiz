defmodule CompTest do
  use ExUnit.Case

  test "Lists match" do
    a = [121, 144, 19, 161, 19, 144, 19, 11]  
    b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
    
    result = Comp.check(a, b)
    
    assert result == true
  end

  test "Lists don't match" do
    a = [121, 144, 19, 161, 19, 144, 19, 11]  
    b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
    
    result = Comp.check(a, b)
    
    assert result == false
  end

    test "List don't match" do
    a = [121, 144, 19, 161, 19, 144, 19, 11]  
    b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
    
    result = Comp.check(a, b)
    
    assert result == false
  end

end

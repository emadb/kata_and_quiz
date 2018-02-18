defmodule StringCalculatorExTest do
  use ExUnit.Case
  doctest StringCalculatorEx

  test "empty string should return zero" do
    assert StringCalculatorEx.add("") == 0
  end

  test "`1` should return 1" do
    assert StringCalculatorEx.add("1") == 1
  end

  test "`2` should return 2" do
    assert StringCalculatorEx.add("2") == 2
  end

  test "`1,2` should return 3" do
    assert StringCalculatorEx.add("1,2") == 3
  end

  test "`1,2,3` should return 6" do
    assert StringCalculatorEx.add("1,2,3") == 6
  end

  test "`11,34,21,4` should return 70" do
    assert StringCalculatorEx.add("11,34,21,4") == 70
  end

  test "`1\n2,3` should return 6" do
    assert StringCalculatorEx.add("1\n2,3") == 6
  end

  test "set delimiter" do
    assert StringCalculatorEx.add("//;\n1;2") == 3
  end
end

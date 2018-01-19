defmodule HarryPotterTest do
  use ExUnit.Case
  doctest HarryPotter

  test "greets the world" do
    assert HarryPotter.hello() == :world
  end

  test "One copy of any of the five books costs 8 EUR." do
    assert HarryPotter.buy([:book_one]) == 8
  end

  test "two same books" do
    assert HarryPotter.buy([:book_one, :book_one]) == 16
  end

  test "two different books, you get a 5% discount on those two books." do
    assert HarryPotter.buy([:book_one, :book_two]) == 15.2
  end

  test "If you buy 3 different books, you get a 10% discount" do
    assert HarryPotter.buy([:book_one, :book_two, :book_three]) == 21.6
  end

  test "If you buy 3 same books" do
    assert HarryPotter.buy([:book_one, :book_one, :book_one]) == 24
  end

  test "If you buy 4 different books, you get a 20% discount." do
    assert HarryPotter.buy([:book_one, :book_two, :book_three, :book_four]) == 25.6
  end
  
  test "buy all 5, you get a huge 25% discount." do
    assert HarryPotter.buy([:book_one, :book_two, :book_three, :book_four, :book_five]) == 30
  end

  test "if you buy four books, of which 3 are different titles, you get a 10% discount on the 3 that form part of a set, but the fourth book still costs 8 EUR" do
    assert HarryPotter.buy([:book_one, :book_two, :book_three, :book_three]) == 29.6
  end

  test "kata example case" do
    assert HarryPotter.buy([
      :book_one, 
      :book_two, 
      :book_three, # 24 * 0.9

      :book_one, 
      :book_two, 
      :book_three, 
      :book_four, 
      :book_five  #  30
    ]) == 51.60
  end
end

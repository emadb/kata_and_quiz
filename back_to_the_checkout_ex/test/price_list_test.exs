defmodule PriceListTest do
  use ExUnit.Case

  test "A cost 50cent" do
    PriceList.start_link
    assert PriceList.get_price(:a) == 50
  end
end

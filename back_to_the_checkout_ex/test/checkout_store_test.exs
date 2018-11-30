defmodule CheckoutStoreTest do
  use ExUnit.Case

  test "A cost 50cent" do
    PriceList.start_link
    CheckoutStore.start_link
    CheckoutStore.scan(:a)

    assert CheckoutStore.total() == 50
  end

  test "A & B cost 80cent" do
    PriceList.start_link
    CheckoutStore.start_link
    CheckoutStore.scan(:a)
    CheckoutStore.scan(:b)

    assert CheckoutStore.total() == 80
  end

  test "A & B & C cost 100cent" do
    PriceList.start_link
    CheckoutStore.start_link
    CheckoutStore.scan(:a)
    CheckoutStore.scan(:b)
    CheckoutStore.scan(:c)

    assert CheckoutStore.total() == 100
  end

  test "Two A cost 100cent" do
    PriceList.start_link
    CheckoutStore.start_link
    CheckoutStore.scan(:a)
    CheckoutStore.scan(:a)

    assert CheckoutStore.total() == 100
  end

  test "Three A cost 130cent" do
    PriceList.start_link
    CheckoutStore.start_link
    CheckoutStore.scan(:a)
    CheckoutStore.scan(:a)
    CheckoutStore.scan(:a)

    assert CheckoutStore.total() == 130
  end


end

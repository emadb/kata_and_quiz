defmodule CheckoutStoreUnitTest do
  use ExUnit.Case

  test "A cost 50cent" do
    state = %CheckoutStore{skus: []}
    {:reply, _, new_state} = CheckoutStore.handle_call({:scan, :a}, nil, state)

    assert %CheckoutStore{skus: [%Item{count: 1, sku: :a}]} = new_state

  end

end

defmodule PriceList do
  use Agent

  @state %{
    :a => 50,
    :b => 30,
    :c => 20,
    :d => 15
  }

  def start_link do
    Agent.start_link(fn -> @state end, name: __MODULE__)
  end

  def get_price(sku) do
    Agent.get(__MODULE__, (fn state -> state[sku] end))
  end


end

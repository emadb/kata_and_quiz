defmodule Item do
  @type t :: %Item{sku: atom, count: integer}
  defstruct sku: :na, count: 0
end

defmodule CheckoutStore do
  use GenServer

  @type t :: %CheckoutStore{skus: [Item.t]}
  defstruct skus: []

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    {:ok, %CheckoutStore{}}
  end

  @spec scan(atom) :: CheckoutStore.t
  def scan(sku) do
    GenServer.call(__MODULE__, {:scan, sku})
  end

  @spec total() :: integer
  def total() do
    GenServer.call(__MODULE__, {:total})
  end

  def handle_call({:scan, sku}, _from, state) do
    new_state = case Enum.find(state.skus, fn(s) -> s.sku == sku end) do
      nil -> %CheckoutStore{skus: [ %Item{sku: sku, count: 1} | state.skus] }
      item ->
        new_list = Enum.reject(state.skus, fn(s) -> s.sku == sku end )
        %CheckoutStore{skus: [ %Item{sku: sku, count: item.count + 1} | new_list] }
    end
    {:reply, new_state, new_state}
  end

  def handle_call({:total}, _from, state) do
    total = state.skus
      |> Enum.reduce(0, fn (s, acc) -> acc + PriceList.get_price(s.sku) * s.count end)

    {:reply, total, state}
  end


end

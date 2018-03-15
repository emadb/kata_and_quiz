defmodule Account do
  defstruct stars: 0, type: :green, date: nil, yearly_stars: 0

  def order(:free_coffee, %Account{stars: 15, type: :green} = state) do
    {:ok, %Account{state | stars: 0}}
  end

  def order(:free_coffee, %Account{stars: 10, type: :gold} = state) do
    {:ok, %Account{state | stars: 0}}
  end

  def order(bev, %Account{type: :green, yearly_stars: 49} = state) do
    order(bev, %Account{stars: state.stars, date: state.date, type: :gold, yearly_stars: 50})
  end

  def order(_, %Account{stars: 0} = state) do
    {:ok, %Account{state | stars: 1, date: Date.utc_today}}
  end

  def order(_, state ) do
    %Account{stars: stars} = state
    {:ok, %Account{state | stars: stars + 1}}
  end

  def create_account do
    %Account{stars: 0}
  end

end

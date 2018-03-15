defmodule AccountTest do
  use ExUnit.Case

  test "new account has zero stars" do
    %Account{stars: stars} = Account.create_account()
    assert stars == 0
  end

  test "first order should set the date" do
    state = %Account{stars: 0}
    { :ok, new_state } = Account.order(:coffee, state)
    assert new_state.date == Date.utc_today
  end


  test "place an order and get a star" do
    state = %Account{stars: 0}
    { :ok, new_state } = Account.order(:coffee, state)
    assert new_state.stars == 1
  end

  test "place two orders and get two stars" do
    state = %Account{stars: 0}
    { :ok, next_state } = Account.order(:coffee, state)
    { :ok, new_state } = Account.order(:coffee, next_state)
    assert new_state.stars == 2
  end

  test "Accounts with 15 stars, can claim free drink" do
    state = %Account{stars: 15}
    { :ok, _ } = Account.order(:free_coffee, state)
  end

  test "Accounts with 15 stars, can claim free drink and stars were reset" do
    state = %Account{stars: 15}
    { :ok, new_state } = Account.order(:free_coffee, state)
    assert new_state.stars == 0
  end

  test "place an order with 49 stars in a year you get a gold account" do
    state = %Account{stars: 1, type: :green, yearly_stars: 49}
    { :ok, new_state } = Account.order(:coffee, state)
    assert new_state.type == :gold
  end

  test "Accounts with 15 stars, can claim free drink, yearly stars should not reset" do
    state = %Account{stars: 15, yearly_stars: 15}
    { :ok, new_state } = Account.order(:free_coffee, state)
    assert new_state.yearly_stars == 15
  end

  test "Gold accounts only need 10 stars to get a free drink" do
    state = %Account{stars: 10, type: :gold}
    { :ok, new_state } = Account.order(:free_coffee, state)
    assert new_state.stars == 0
    assert new_state.type == :gold
  end

  test "You need to earn 50 stars in a year to keep your Gold account" do
    today = Date.utc_today
    year_ago = Date.from_iso8601("#{today.year - 1}-#{today.month}-#{today.day}")
    state = %Account{stars: 10, type: :gold, date: ~D[2018-03-11]}

  end

end

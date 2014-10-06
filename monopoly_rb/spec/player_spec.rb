require 'spec_helper'
require_relative '../lib/player'

describe Player do
  it "is on beginning location, rolls 7, ends up on location 7" do
    player = Player.new('horse')
    player.advance(7)
    expect(player.position).to eq(7)
  end

  it "is on location numbered 39, rolls 6, ends up on location 5" do
    player = Player.new('horse', starting_position:39)
    player.advance(6)
    expect(player.position).to eq(5)
  end

  it "add_money should add value to the balance" do
    player = Player.new('horse', starting_position:39)
    player.add_money(10)
    expect(player.balance).to eq(10)
  end

  it "goto_next_space should advance of 1 space" do
    player = Player.new('horse')
    player.goto_next_space
    expect(player.position).to eq(1)
  end
end
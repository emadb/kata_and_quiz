require 'spec_helper'
require_relative '../lib/go_space'

describe GoSpace do
  
  it "player enters go_space earns 200$" do
    go_space = GoSpace.new
    horse = Player.new('horse')
    go_space.landed_by horse

    expect(horse.balance).to eq(200)
  end

end

describe NormalSpace do
  
  it "player enters normal_space balance should not change" do
    go_space = NormalSpace.new
    horse = Player.new('horse')
    go_space.landed_by horse

    expect(horse.balance).to eq(0)
  end

end


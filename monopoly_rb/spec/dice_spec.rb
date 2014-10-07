require 'spec_helper'
require_relative '../lib/dice'

describe Die do
  
  it "with one dice should return a number from 1 to 6" do
    die = Die.new(6)
    100.times do 
      result = die.roll
      expect(result).to be_between(1, 6)
    end
  end

  it "with two dice should return a number from 2 to 12" do
    dice = Dice.new(Die.new(6), Die.new(6))

    100.times do 
      result = dice.roll
      expect(result).to be_between(2, 12)
    end
  end


end



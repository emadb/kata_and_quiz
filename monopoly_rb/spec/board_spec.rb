require 'spec_helper'
require_relative '../lib/board'

describe Board do
  before :each do
    @space = double('go_space')
    @board = [nil, @space, nil]
  end

  it "player enters a space" do
    horse = Player.new('horse', starting_position:1)
    board = Board.new(@board)
    expect(@space).to receive(:landed_by).with(horse)
    
    board.landed_by(horse)
  end

end


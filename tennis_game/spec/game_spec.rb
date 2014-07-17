require './lib/game'

describe Game do
  before do
    @game = Game.new
  end

  it 'When player one wins one point, the score is fifteen-love. ' do
    @game.win_player_1
    expect(@game.score).to eq('15-0')
  end

  it 'When player one wins one point and player two wins one point, the score is fifteen-all. ' do
    @game.win_player_1
    @game.win_player_2
    @game.win_player_2
    expect(@game.score).to eq('15-30')
  end

end
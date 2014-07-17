require './lib/game'

describe Game do
  before do
    @game = Game.new
  end

  context 'Winning Points Increases Score' do

    it 'When player one wins one point, the score is fifteen-love. ' do
      @game.score_player_1(1)
      expect(@game.score).to eq('fifteen-love')
    end

    it 'When player one wins one point and player two wins one point, the score is fifteen-all. ' do
      @game.score_player_1(1)
      @game.score_player_2(1)
      expect(@game.score).to eq('fifteen-all')
    end

    it 'When player one wins two points and player two wins three points, the score is thirty-forty.' do
      @game.score_player_1(2)
      @game.score_player_2(3)
      expect(@game.score).to eq('thirty-forty')
    end

    it 'When player one wins no points and player two wins three points, the score is love-forty.' do
      @game.score_player_2(3)
      expect(@game.score).to eq('love-forty')
    end
  end

  context 'Deuce and Advantage are Scored Correctly' do
    it 'When player one wins three points and player two wins three points, the score is deuce' do
      @game.score_player_1(3)
      @game.score_player_2(3)
      expect(@game.score).to eq('deuce')
    end

    # it 'When player one wins four points and player two wins three points, the score is advantage player one. ' do
    #   @game.win_player_1
    #   @game.win_player_1
    #   @game.win_player_1
    #   @game.win_player_1
    #   @game.win_player_2
    #   @game.win_player_2
    #   @game.win_player_2
    #   expect(@game.score).to eq('advantage player one')
    # end

    
  end

end
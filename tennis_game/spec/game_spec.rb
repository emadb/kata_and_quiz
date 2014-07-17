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

    it 'When player one wins four points and player two wins three points, the score is advantage player one. ' do
      @game.score_player_1(4)
      @game.score_player_2(3)
      expect(@game.score).to eq('advantage player one')
    end

    it 'When player one wins four points and player two wins five points, the score is advantage player two' do
      @game.score_player_1(4)
      @game.score_player_2(5)
      expect(@game.score).to eq('advantage player two')
    end
    # it is a state machine??
    
  end

  context 'Player Can Win a Match' do
    it "When player one wins four points, the score is 'player one wins'" do
      @game.score_player_1(4)
      @game.score_player_2(0)
      expect(@game.score).to eq('player one wins')
    end

    it "When player one wins five points and player two wins three points, the score is 'player one wins'" do
       @game.score_player_1(5)
      @game.score_player_2(3)
      expect(@game.score).to eq('player one wins')
    end

    it "When player one wins six points and player two wins eight points, the score is 'player two wins'" do
      @game.score_player_1(6)
      @game.score_player_2(8)
      expect(@game.score).to eq('player two wins')
    end
  end

end
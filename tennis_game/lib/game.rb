class ZeroZero

end

class Game

  def initialize
    @players = [0,0]

    @score_map = {
      '1-0' => 'fifteen-love',
      '1-1' => 'fifteen-all',
      '2-3' => 'thirty-forty',
      '0-3' => 'love-forty',
      '3-3' => 'deuce',
      '4-3' => 'advantage player one',
      '4-5' => 'advantage player two',
      '4-0' => 'player one wins',
      '5-3' => 'player one wins',
      '6-8' => 'player two wins'
    }

  end

  def score_player_1(s)
    @players[0] = s
  end

  def score_player_2(s)
    @players[1] = s
  end

  def score
    key = "#{@players[0]}-#{@players[1]}"
    @score_map[key]
  end
end
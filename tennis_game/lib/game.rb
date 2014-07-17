class Game

  def initialize
    @scores = ['love', 'fifteen', 'thirty', 'forty']
    @players = [0,0]
  end

  def score_player_1(s)
    @players[0] = s
  end

  def score_player_2(s)
    @players[1] = s
  end

  def score
    p1 = @scores[@players[0]]
    p2 = @scores[@players[1]]
    if p1 == p2 && p1 == 'forty'
      return 'deuce'
    end
    if p1 == p2
      return "#{p1}-all"
    end
    "#{p1}-#{p2}"
  end
end
class Game

  def initialize
    @scores = [0, 15, 30, 40]
    @players = [0,0]
  end

  def win_player_1
    add_point_to(0)
  end

  def win_player_2
    add_point_to(1)
  end

  def add_point_to(p)
    @players[p] = @players[p] + 1
  end
  def score
    p1 = @scores[@players[0]]
    p2 = @scores[@players[1]]
    "#{p1}-#{p2}"
  end
end
PLAYER_1 = 'Player 1'
PLAYER_2 = 'Player 2'
DRAW = 'Draw'

class Rock
  def against_scissors
    PLAYER_1
  end

  def against_paper
    PLAYER_2
  end

  def against_rock
    DRAW
  end
end

class Scissors
  def against_rock
    PLAYER_2
  end
  def against_paper
    PLAYER_1
  end
  def against_scissors
    DRAW
  end
end

class Paper
  def against_rock
    PLAYER_1
  end

  def against_scissors
    PLAYER_2
  end

  def against_paper
    DRAW
  end
end





class RockScissorsPaper
  def play(p1, p2)
    if p1.against(p2) == p1
      'player 1'
    else
      'player 2'
    end
  end
end

class Rock
  def against(other)
    if other.class == Scissors
      self
    else
      other
    end
  end
end

class Scissors
  def against(other)
    if other.class == Paper
      self
    else
      other
    end
  end
end

class Paper
  def against(other)
    if other.class == Rock
      self
    else
      other
    end
  end

end





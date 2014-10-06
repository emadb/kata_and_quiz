class Die
  def initialize(faces)
    @faces = faces
  end
  def roll
    rand(1..@faces)
  end
end

class Dice
  def initialize(*dice)
    @dice = dice
  end

  def roll
    @dice.reduce(0){|a,i| a + i.roll }
  end
end
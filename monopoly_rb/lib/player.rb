class Player
  attr_reader :position, :balance
  
  def initialize(name, starting_position: 0)
    @position = starting_position
    @balance = 0
  end

  def advance(dice)
    @position = (@position + dice) % 40
  end

  def goto_next_space
    advance 1
  end


  def add_money (value)
    @balance += value
  end
end
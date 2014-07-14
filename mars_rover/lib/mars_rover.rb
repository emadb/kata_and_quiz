class MarsRover
  def initialize(x, y, direction)
    @position = Position.new(x, y)
    @rotator = Rotator.new(direction)
  end

  def position
    @position
  end

  def direction
    @rotator.direction
  end

  def send_commands(commands)
    commands.each do |c|
      if @rotator.direction == 'N' 
        @position.decrease_y if c == 'f'
        @position.increase_y if c == 'b'  
        
        @rotator.left if c == 'l'
        @rotator.right if c == 'r'
      end
    end
  end
end

class Position
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def decrease_y
    @y = @y - 1
  end

  def increase_y
    @y = @y + 1
  end
end
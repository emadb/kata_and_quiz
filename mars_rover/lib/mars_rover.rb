class MarsRover
  def initialize(x, y, direction)
    @position = Position.new(x, y)
    @direction = direction
  end

  def position
    @position
  end

  def direction
    @direction
  end

  def send_commands(commands)
    commands.each do |c|
      if @direction == 'N' 
        @position.decrease_y if c == 'f'
        @position.increase_y if c == 'b'  
        @direction = 'W' if c == 'l'
        @direction = 'E' if c == 'r'
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
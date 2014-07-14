class Rotator


  def initialize(initial_direction = 'N')
    @directions = ['N', 'E', 'S', 'W']
    @direction = @directions.find_index(initial_direction)
  end

  def direction
    @directions[@direction]
  end

  def left
    @direction = @direction - 1
  end

  def right
    @direction = (@direction + 1) % 4
  end
end
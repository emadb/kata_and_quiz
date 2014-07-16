require 'engine'
require 'rotator'

class MarsRover
  def initialize(x, y, direction)
    @engine = Engine.new(x, y)
    @rotator = Rotator.new(direction)
  end

  def x
    @engine.x
  end

  def y
    @engine.y
  end

  def direction
    @rotator.direction
  end

  def send_commands(commands)
    commands.each do |c|
      @rotator.process c      
      @engine.process c, @rotator.angle
    end
  end
end

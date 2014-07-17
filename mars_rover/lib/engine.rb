class Engine
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @directions = Hash.new(0)
    @directions['f'] = 1
    @directions['b'] = -1
  end
  
  def process(c, angle)
    coeff = @directions[c]
    @x = @x + coeff * Math.cos(angle)
    @y = @y + coeff * Math.sin(angle)
  end
end
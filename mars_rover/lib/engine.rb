class Engine
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @directions = {'f' => 1, 'b' => -1}
  end
  
  def process(c, angle)
    coeff = @directions[c]
    if !coeff.nil?
      @x = @x + coeff * Math.cos(angle)
      @y = @y + coeff * Math.sin(angle)
    end
  end
end
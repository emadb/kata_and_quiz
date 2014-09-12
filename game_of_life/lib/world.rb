ALIVE = true
DEAD = false

class World

  def initialize
    @cells = []
  end

  def set_alive (x,y)
    @cells << LiveCell.new(x,y)
  end

  def is_alive?(x,y)
    @cells.any?{|c| c.x == x && c.y == y}
  end

  def neighbours_count(x,y)
    count = 0
    (x-1..x+1).each do |r|
      (y-1..y+1).each do |c|
        if r != x || c != y
          count +=1 if is_alive?(r,c)
        end
      end
    end
    count
  end

  def tick
    @new_world = []
    @cells.each do |c| 
      if neighbours_count(c.x, c.y) == 2 || neighbours_count(c.x, c.y) == 3
        @new_world << c
      end
    end
    @cells = @new_world
  end

end

class LiveCell < Struct.new(:x, :y)

end
  

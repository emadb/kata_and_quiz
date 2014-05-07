class BerlinClock
  def initialize(h,m,s)
    @h = h
    @m = m
    @s = s
  end

  def seconds_blinker
    if @s % 2 != 0
      "O" 
    else
      "Y"
    end
  end

  def format(part, op, lamp_color="R", lamp_number=4)
    (lamp_color * (part.public_send(op, 5))).ljust(lamp_number, 'O') 
  end

  def hours_fives
    format(@h, :/)
  end

  def hours_ones
    format(@h, :%)
  end

  def minutes_ones
    format(@m, :%, "Y")
  end

  def minutes_fives
    quartes = [2,5,8]
    minutes = format(@m, :/, "Y", 11)  
    quartes.each do |q|
      minutes[q] = "R" if minutes[q] == "Y"
    end
    
    minutes
  end

  def to_s
    "#{seconds_blinker}\n#{hours_fives}\n#{hours_ones}\n#{minutes_fives}\n#{minutes_ones}"
  end 
end



class BerlinClock
  SECONDS  = "Y"
  HOURS_FIVES = "RRRR"
  HOURS_ONES = "RRRR"
  MINUTES_FIVES = "YYRYYRYYRYY"
  MINUTES_ONES = "YYYY"

  def initialize(h,m,s)
    @h, @m, @s = h, m, s
  end

  def seconds
    format(SECONDS, @s + 1, :%, 2)
  end

  def format(line, part, op, mod=5)
    on_count = part.public_send(op, mod)
    off_count = line.length - on_count
    line[0, on_count] + "O" * off_count
  end

  def hours_fives
    format(HOURS_FIVES, @h, :/)
  end

  def hours_ones
    format(HOURS_ONES, @h, :%)
  end

  def minutes_ones
    format(MINUTES_ONES, @m, :%)
  end

  def minutes_fives
    format(MINUTES_FIVES, @m, :/)  
  end

  def to_s
    "#{seconds}\n#{hours_fives}\n#{hours_ones}\n#{minutes_fives}\n#{minutes_ones}"
  end 
end



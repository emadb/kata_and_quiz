import Integer, only: :macros

defmodule BerlinClock do
  def parse (time) do

    [s, m, h] = parse_time(time, [])

    seconds = get_seconds(s)
    single_minutes = build_part("Y", rem(m, 5), 4)
    fives_minutes = build_part(create_fives_minutes(div(m, 5)), 11)
    single_hours = build_part("R", rem(h, 5), 4)
    fives_hours = build_part("R", div(h, 5), 4)

    [seconds, fives_hours, single_hours, fives_minutes, single_minutes]
  end

  def parse_time("", acc) do
    acc
  end

  def parse_time(":" <> s, acc) do 
    parse_time(s, acc)
  end

  def parse_time(s, acc) do
      {num, s} = Integer.parse(s)
      parse_time(s, [num | acc])
  end

  def build_part(pattern, repeat \\ 1, field_length) do
    String.ljust(String.duplicate(pattern, repeat), field_length, ?O)
  end

  def create_fives_minutes(m) when m >= 0 do
    create_fives_minutes(m, "")
  end
    
  def create_fives_minutes(0, acc) do 
    acc
  end

  def create_fives_minutes(m, acc) when rem(m,3) == 0 do
    create_fives_minutes(m-1, "R" <> acc)
  end

  def create_fives_minutes(m, acc) do
    create_fives_minutes(m-1, "Y" <> acc)
  end
  
  def get_seconds(s) when even?(s), do: "Y"
  def get_seconds(_), do: "O"
end

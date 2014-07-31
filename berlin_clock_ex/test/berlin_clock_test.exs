defmodule BerlinClockTest do
  use ExUnit.Case

  test "On an even second, Y is returned for the top row" do
  	[s, _,_,_,_] = BerlinClock.parse("00:00:02")
    assert s == "Y"
  end

  test "On an odd second, O is returned for the top row" do
  	[s, _,_,_,_] = BerlinClock.parse("00:00:03")
    assert s == "O"
  end

  test "When it is 1 minute past the hour, YOOO is returned" do
  	[_,_,_,_,sm] = BerlinClock.parse("00:01:00")
    assert sm == "YOOO"
  end

  test "When it is 2 minutes past the hour, YYOO is returned" do
    [_,_,_,_,sm] = BerlinClock.parse("00:02:00")
    assert sm == "YYOO"
  end
  
  test "When it is 5 minutes past the hour, OOOO is returned" do
    [_,_,_,_,sm] = BerlinClock.parse("00:05:00")
    assert sm == "OOOO"
  end

    test "At 5 past the hour, YOOOOOOOOOO is returned." do
    [_,_,_,m,_] = BerlinClock.parse("00:05:00")
    assert m == "YOOOOOOOOOO"
  end


end

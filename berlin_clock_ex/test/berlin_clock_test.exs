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

  test "At 15 past the hour, YYROOOOOOOO is returned." do
    [_,_,_,m,_] = BerlinClock.parse("00:15:00")
    assert m == "YYROOOOOOOO"
  end

  test "At 55 past the hour, YYRYYRYYRYY is returned." do
    [_,_,_,m,_] = BerlinClock.parse("00:55:00")
    assert m == "YYRYYRYYRYY"
  end

  test "When it is 1 hour past, ROOO is returned" do
    [_,_,h,_,_] = BerlinClock.parse("01:00:00")
    assert h == "ROOO"
  end

  test "When it is 2 hours past, RROO is returned" do
    [_,_,h,_,_] = BerlinClock.parse("02:00:00")
    assert h == "RROO"
  end  

  test "When it is 5 hours past, OOOO is returned." do
    [_,_,h,_,_] = BerlinClock.parse("05:00:00")
    assert h == "OOOO"
  end  

  test "At 5 hours past, ROOO is returned" do
    [_,h,_,_,_] = BerlinClock.parse("05:00:00")
    assert h == "ROOO"
  end    

  test "At 15 hours past, RRRO is returned. " do
    [_,h,_,_,_] = BerlinClock.parse("15:00:00")
    assert h == "RRRO"
  end    

  test "At 23 hour past, RRRR is returned." do
    [_,h,_,_,_] = BerlinClock.parse("23:00:00")
    assert h == "RRRR"
  end    
end

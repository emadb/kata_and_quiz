defmodule BirthdayTest do
  use ExUnit.Case
  import Mox



  test "greets the world" do
    assert Birthday.hello() == :world
  end

  test "should read input file" do
    CsvReaderMock
    |> expect(:read, fn _ -> [
      "last_name, first_name, date_of_birth, email",
      "Doe, John, 1982/10/08, john.doe@foobar.com",
      "Ann, Mary, 1975/09/11, mary.ann@foobar.com"
    ] end)

    people = Birthday.get_people()
    assert Enum.count(people) == 2
  end

  test "should parse a row" do
    person = Birthday.parse_row("Doe, John, 1982/10/08, john.doe@foobar.com")
    assert person.first_name == "John"
    assert person.last_name == "Doe"
    assert person.date_of_birth.day == 8
    assert person.date_of_birth.month == 10
    assert person.date_of_birth.year == 1982
    assert person.email == "john.doe@foobar.com"
  end

  test "is_birthday should return true" do
    date = Timex.parse!("1982/10/08", "{YYYY}/{0M}/{0D}")
    assert Birthday.is_birthday(Timex.local, date) == false
  end

end

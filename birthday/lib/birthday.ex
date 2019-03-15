
defmodule Person do
  defstruct [:last_name, :first_name, :date_of_birth, :email]
end

defmodule Birthday do

  @csv_reader Application.get_env(:birthday, :csv_reader)

  def hello do
    :world
  end

  def get_people do
    @csv_reader.read("input.csv")
      |> Enum.drop(1)
      |> Enum.map(&parse_row/1)
  end

  def parse_row(row) do
    [last_name, first_name, date_of_birth, email] = String.split(row, ",")
    %Person{
      last_name: String.trim(last_name),
      first_name: String.trim(first_name),
      date_of_birth: date_of_birth |> String.trim |> Timex.parse!("{YYYY}/{0M}/{0D}"),
      email: String.trim(email)}
  end
end



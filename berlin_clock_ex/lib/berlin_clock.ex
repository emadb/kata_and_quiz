import Integer, only: :macros

defmodule BerlinClock do
	def parse (time) do

		[h, m, s] = String.split(time, ":") 
			|> Enum.map fn n -> Integer.parse(n) 
			|> elem(0) end 

		seconds = get_seconds(s)
		single_minutes = get_single_minutes(m)
		fives_minutes = get_fives_minutes(m)
		single_hours = get_single_hours(h)
		fives_hours = get_fives_hours(h)

		[seconds, fives_hours, single_hours, fives_minutes, single_minutes]
	end

	def get_fives_hours(h) do
		number_of_r = div(h, 5)
		String.ljust(String.duplicate("R", number_of_r), 4, ?O)
	end

	def get_single_hours(h) do
		number_of_r = rem(h, 5)
		String.ljust(String.duplicate("R", number_of_r), 4, ?O)
	end

	def get_fives_minutes(m) do
		number_of_y = div(m, 5)
		String.ljust(create_fives_minutes(number_of_y), 11, ?O)
	end

	def create_fives_minutes(1) do
		"Y"
	end

	def create_fives_minutes(n) when n < 1 do
		""
	end

	def create_fives_minutes(n) when n > 1 do
		if rem(n,3) == 0 do
			light = "R"
		else
			light = "Y"
		end
		[create_fives_minutes(n-1), light ] |> Enum.join
	end

	def get_single_minutes(m) do
		number_of_y = rem(m, 5)
		String.ljust(String.duplicate("Y", number_of_y), 4, ?O)
	end

	def get_seconds(s) do
		cond do
			s |> even? -> "Y"
			s |> odd?  -> "O"
		end
	end
end

import Integer, only: :macros

defmodule BerlinClock do
	def parse (time) do

		[h, m, s] = String.split(time, ":") 
			|> Enum.map fn n -> Integer.parse(n) 
			|> elem(0) end 

		seconds = get_seconds(s)
		single_minutes = get_single_minutes(m)

		[seconds, "", "", "", single_minutes]
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

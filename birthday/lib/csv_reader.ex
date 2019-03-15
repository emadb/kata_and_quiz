defmodule CsvReaderBehaviour do
  @callback read(String.t()) :: [String.t()]
end

defmodule CsvReader do
  @behaviour CsvReaderBehaviour

  def read(filename) do
    {:ok, content} = File.read(filename)
    content |> String.split("\n")
  end

end

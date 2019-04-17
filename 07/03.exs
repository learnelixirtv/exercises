defmodule StreamExample do
  def read(filename) do
    filename
    |> File.stream!
    |> Stream.filter(&String.starts_with?(&1, "d"))
    |> Stream.take_every(2)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.capitalize(&1))
    |> Enum.sort(&(String.length(&1) > String.length(&2)))
    |> Enum.into([])
  end
end

results = StreamExample.read("sample.txt")
IO.inspect(results)
# => ["database", "diamond", "drill", "drum"]

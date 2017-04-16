defmodule StreamExample do
  def read(filename) do
    filename
    |> File.stream!
    |> Stream.filter(&String.starts_with?(&1, "d"))
    |> Stream.map(&String.trim/1)
    |> Enum.into([])
    |> Enum.sort_by(&byte_size/1)
    |> Enum.take_every(2)
    |> Enum.map(&String.capitalize/1)
  end
end

results = StreamExample.read("sample.txt")
IO.inspect(results)
# => ["Desk", "Dung", "Drill", "Diamond"]

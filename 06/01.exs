# Example usage:
# Sum.sum([1,2,3]) # => 6
defmodule Sum do
  def sum(list, total \\ 0)
  def sum([], total) do
    total
  end
  def sum([h|t], total) when is_number(h) do
    sum(t, h + total)
  end
end

# Example usage:
# Reduce.reduce([1,2,3], 0, &+/2) # => 6
defmodule Reduce do
  def reduce([], acc, _fun) do
    acc
  end

  def reduce([h|t], acc, fun) do
    acc = fun.(acc, h)
    reduce(t, acc, fun)
  end
end

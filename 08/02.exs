defmodule Even do
  def even(upto) do
    for i <- 1..(upto - 1), rem(i, 2) == 0, do: i
  end
end

IO.inspect(Even.even(10))
# => [2, 4, 6, 8]

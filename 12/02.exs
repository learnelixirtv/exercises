defmodule Math do
  @doc """
  Adds two numbers together.

  ## Example

      iex> Math.add(2, 2)
      4
      iex> Math.add(4, 5)
      9
  """
  def add(a, b), do: a + b
end

defmodule MathTest do
  use ExUnit.Case

  doctest Math
end

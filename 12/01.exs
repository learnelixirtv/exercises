defmodule Math do
  def add(a, b), do: a + b
end

defmodule MathTest do
  use ExUnit.Case

  describe ".add" do
    test "adds two numbers together" do
      assert Math.add(2, 2) == 4
    end
  end
end

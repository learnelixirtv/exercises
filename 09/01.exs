defmodule MySigil do
  def sigil_u(content, _opts) do
    content
    |> String.split
    |> Enum.map(&String.upcase/1)
  end
end

defmodule OtherModule do
  import MySigil

  def test_sigil do
    ~u[hello world]
  end
end

IO.inspect(OtherModule.test_sigil)
# => ["Hello", "World"]

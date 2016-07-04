defmodule Join do
  def join(list, separator) do
    for string <- list, into: "", do: "#{separator}#{string}"
  end
end

IO.inspect Join.join(["about", "us"], "/")
# => "/about/us"

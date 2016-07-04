defmodule ListType do
  defstruct list: []
end

defimpl Enumberable, for: ListType do
  def count(enumerable) do
    # ...
  end

  def member?(enumerable, value) do
    # ...
  end

  def reduce(enumerable, acc, _fun) do
    # ...
  end
end

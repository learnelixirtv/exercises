# See 14/01.exs for the GenServer version
defmodule TodoList do
  def start_link(items \\ []) do
    Agent.start_link(fn -> items end)
  end

  def add(list, item) do
    Agent.update list, fn(items) ->
      [item|items]
    end
  end

  def remove(list, item) do
    Agent.update list, fn(items) ->
      Enum.reject(items, fn(i) -> i == item end)
    end
  end

  def all(list) do
    Agent.get(list, fn(items) -> items end)
  end
end

{:ok, list} = TodoList.start_link
TodoList.add(list, "get milk")
TodoList.add(list, "take out trash")
IO.inspect(TodoList.all(list))
# => ["take out trash", "get milk"]

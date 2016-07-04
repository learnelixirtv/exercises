defmodule TodoList do
  use GenServer

  def add(list, item) do
    GenServer.call(list, {:add, item})
  end

  def remove(list, item) do
    GenServer.call(list, {:remove, item})
  end

  def all(list) do
    GenServer.call(list, :all)
  end

  ##
  # GenServer API
  ##

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def handle_call({:add, item}, _from, list) do
    list = [item|list]
    {:reply, list, list}
  end

  def handle_call({:remove, item}, _from, list) do
    list = Enum.reject(list, &(&1 == item))
    {:reply, list, list}
  end

  def handle_call(:all, _from, list) do
    {:reply, list, list}
  end
end

{:ok, list} = TodoList.start_link
TodoList.add(list, "get milk")
TodoList.add(list, "take out trash")
IO.inspect(TodoList.all(list))
# => ["take out trash", "get milk"]

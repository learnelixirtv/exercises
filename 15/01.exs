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

  def start_link(items \\ []) do
    GenServer.start_link(__MODULE__, items)
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

defmodule TodoListServer do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(TodoList, ["take out trash"], id: :home),
      worker(TodoList, ["get milk"], id: :work)
    ]

    supervise(children, strategy: :one_for_one)
  end
end

{:ok, supervisor} = TodoListServer.start_link

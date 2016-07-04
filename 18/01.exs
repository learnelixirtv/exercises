# To do this exercise, you will need to start two Erlang nodes in two separate
# terminal tabs, like this:

# In first terminal tab:
iex --sname first
Task.Supervisor.start_link(name: BackgroundJob)

# In second terminal tab:
iex --sname second
Node.connect(:first@computer) # replace @computer with your computer name
Task.Supervisor.async {BackgroundJob, :first@computer}, fn ->
  IO.inspect("hello world")
end

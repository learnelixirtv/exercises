{:ok, supervisor} = Task.Supervisor.start_link

Task.Supervisor.async supervisor, fn ->
  IO.puts "Linked to current process"
end

Task.Supervisor.start_child supervisor, fn ->
  IO.puts "Not linked to current process"
end

# If you're in a mix project, you could add the following
# line to your application supervisor:

children = [
  worker(Task.Supervisor, name: BackgroundJob)
]

# And then reference the task supervisor by name:
Task.Supervisor.start_child BackgroundJob, fn ->
  IO.puts "Hello world!"
end

defmodule MyModule do
  import Kernel, except: [sigil_r: 2]

  def sigil_r(content, opts) do
    "Hello World"
  end

  def use_sigil do
    ~r/hello/
  end
end

IO.inspect(MyModule.use_sigil)
# => "Hello World"

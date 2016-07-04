defmodule Math.Opposite do
  defmacro opposite({:+, _, [a, b]}) do
    quote do
      unquote(a) - unquote(b)
    end
  end

  defmacro opposite({:-, _, [a, b]}) do
    quote do
      unquote(a) + unquote(b)
    end
  end

  defmacro opposite({:*, _, [a, b]}) do
    quote do
      unquote(a) / unquote(b)
    end
  end

  defmacro opposite({:/, _, [a, b]}) do
    quote do
      unquote(a) * unquote(b)
    end
  end
end

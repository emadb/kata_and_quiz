defmodule Comp do
  def check([h|t], b) do
    new_b = List.delete(b, h*h)
    check(t, new_b)
  end
  def check(_,[]), do: true
  def check([], b), do: false
end

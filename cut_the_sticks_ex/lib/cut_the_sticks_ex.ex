defmodule CutTheSticks do
  def cut(elements) do
    internal_cut(Enum.sort(elements), [])
  end

  defp internal_cut([], result) do
    result
  end

  defp internal_cut([e | t], result) do
    
    element2 = Enum.map([e | t], fn x -> x - e end) 
    element3 = Enum.reject(element2, fn x -> x == 0 end)
      
    internal_cut(element3, result++[Enum.count(element2)])
  end

end

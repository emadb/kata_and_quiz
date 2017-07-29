defmodule Robot do
  def create(x, y, d) do
    %{x: x, y: y, direction: d}
  end

  def send(robot, commands) do
    Enum.reduce(commands, robot, fn(c, acc) -> apply_command(acc, c) end)
  end


  defp apply_command(robot = %{direction: :N}, :F) do
    %{x: robot.x, y: robot.y + 1, direction: robot.direction}
  end
  defp apply_command(robot = %{direction: :E}, :F) do
    %{x: robot.x + 1, y: robot.y, direction: robot.direction}
  end
  defp apply_command(robot = %{direction: :S}, :F) do
    %{x: robot.x, y: robot.y - 1, direction: robot.direction}
  end
  defp apply_command(robot = %{direction: :W}, :F) do
    %{x: robot.x - 1, y: robot.y, direction: robot.direction}
  end

   defp apply_command(robot = %{direction: :N}, :B) do
    %{x: robot.x, y: robot.y - 1, direction: robot.direction}
  end
  defp apply_command(robot = %{direction: :E}, :B) do
    %{x: robot.x - 1, y: robot.y, direction: robot.direction}
  end
  defp apply_command(robot = %{direction: :S}, :B) do
    %{x: robot.x, y: robot.y + 1, direction: robot.direction}
  end
  defp apply_command(robot = %{direction: :W}, :B) do
    %{x: robot.x + 1, y: robot.y, direction: robot.direction}
  end

  defp apply_command(robot = %{direction: :N}, :R) do
    %{x: robot.x, y: robot.y, direction: :W}
  end
  defp apply_command(robot = %{direction: :W}, :R) do
    %{x: robot.x, y: robot.y, direction: :S}
  end
  defp apply_command(robot = %{direction: :S}, :R) do
    %{x: robot.x, y: robot.y, direction: :E}
  end
  defp apply_command(robot = %{direction: :E}, :R) do
    %{x: robot.x, y: robot.y, direction: :N}
  end

  defp apply_command(robot = %{direction: :N}, :L) do
    %{x: robot.x, y: robot.y, direction: :E}
  end
  defp apply_command(robot = %{direction: :E}, :L) do
    %{x: robot.x, y: robot.y, direction: :S}
  end
  defp apply_command(robot = %{direction: :S}, :L) do
    %{x: robot.x, y: robot.y, direction: :W}
  end
  defp apply_command(robot = %{direction: :W}, :L) do
    %{x: robot.x, y: robot.y, direction: :N}
  end
end

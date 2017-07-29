defmodule MarsRoverTest do
  use ExUnit.Case

  setup do
    Robot.create(1, 2, :N)
  end

  def assert_robot(robot, x, y, d) do
    assert robot.x == x
    assert robot.y == y
    assert robot.direction == d
  end

  test "should create the robot in the world" do
    robot = Robot.create(4,6,:N)
    assert_robot(robot, 4, 6, :N)
  end

  test "F", robot do
    new_robot = Robot.send(robot, [:F])
    assert_robot(new_robot, 1, 3, :N)
  end

  test "F, F", robot do
    new_robot = Robot.send(robot, [:F, :F])
    assert_robot(new_robot, 1, 4, :N)
  end

  test "F, B", robot do
    new_robot = Robot.send(robot, [:F, :B])
    assert_robot(new_robot, 1, 2, :N)
  end

  test "R", robot do
    new_robot = Robot.send(robot, [:R])
    assert_robot(new_robot, 1, 2, :W)
  end

  test "R,R", robot do
    new_robot = Robot.send(robot, [:R, :R])
    assert_robot(new_robot, 1, 2, :S)
  end

  test "R,R,R", robot do
    new_robot = Robot.send(robot, [:R, :R, :R])
    assert_robot(new_robot, 1, 2, :E)
  end

  test "R,R,R,R", robot do
    new_robot = Robot.send(robot, [:R, :R, :R, :R])
    assert_robot(new_robot, 1, 2, :N)
  end

  test "L", robot do
    new_robot = Robot.send(robot, [:L])
    assert_robot(new_robot, 1, 2, :E)
  end

  test "L, L", robot do
    new_robot = Robot.send(robot, [:L, :L])
    assert_robot(new_robot, 1, 2, :S)
  end

  test "L, L, L", robot do
    new_robot = Robot.send(robot, [:L, :L, :L])
    assert_robot(new_robot, 1, 2, :W)
  end

  test "L, L, L, L", robot do
    new_robot = Robot.send(robot, [:L, :L, :L, :L])
    assert_robot(new_robot, 1, 2, :N)
  end

  test "F, L, L, B", robot do
    new_robot = Robot.send(robot, [:F, :L, :L, :F])
    assert_robot(new_robot, 1, 2, :S)
  end
end

# defmodule GameOfLife.CellSupervisor do
#   use Supervisor

#   def start_link  do
#     Supervisor.start_link(__MODULE__, [], name: __MODULE__)
#   end

#   def cell_ids do
#     Supervisor.which_children(__MODULE__)
#       |> Enum.map(fn {_, cell_pid, _, _} -> Registry.keys(:cell_registry, cell_pid) |> List.first end)
#       |> Enum.sort
#   end

#   def add_cell(x, y) do
#     w_spec = worker(GameOfLife.Cell, ["#{x}_#{y}", x, y])
#     Supervisor.start_child(self(), w_spec)
#     #{:ok, cell_pid} = GameOfLife.Cell.start_link("#{x}_#{y}", x, y)
#     #Supervisor.start_child(cell_pid, [[]])
#     #
#   end

#   def init(_) do
#     children = [
#       supervisor(Registry, [:unique, :cell_registry]),
#     ]

#     # strategy set to `:simple_one_for_one` to handle dynamic child processes.
#     supervise(children, strategy: :simple_one_for_one)
#   end

# end